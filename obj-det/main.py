import cv2
import time
import requests

# Function to send POST request with detected fruit data
def send_post_request(fruit_id, fruit_name):
    url = "http://localhost:3000/product"
    data = {
        "id": fruit_id,
        "name": fruit_name
    }
    try:
        response = requests.post(url, json=data)
        if response.status_code == 200:
            print("POST request sent successfully:", response.json())
        else:
            print("Failed to send POST request:", response.status_code)
    except Exception as e:
        print("Error:", e)

# Function to check if a product exists in the API
def product_exists_in_api(product_name):
    url = "http://localhost:3000/product"
    try:
        response = requests.get(url)
        if response.status_code == 200:
            products = response.json()
            for product in products:
                if product["name"] == product_name:
                    return True
        else:
            print("Failed to fetch existing products:", response.status_code)
    except Exception as e:
        print("Error:", e)
    return False

# Function to filter detected objects and print only specific fruits
def filter_and_print_fruits(classNames, classIds, confs, bbox, fruits):
    for classId, confidence, box in zip(classIds.flatten(), confs.flatten(), bbox):
        if classId >= 0 and confidence > 0.5:
            className = classNames[classId - 1]
            fruit_id = fruits.get(className.lower())
            if fruit_id is None:
                return  # Return if the detected object is not one of the specified fruits
            if not product_exists_in_api(className):  # Check if the product already exists in the API
                print(className)
                send_post_request(fruit_id, className)  # Send POST request with fruit data



# Initialize set to store printed labels
printed_labels = set()

cam = cv2.VideoCapture(0)
cam.set(3, 740)
cam.set(4, 580)

classNames = []
classFile = 'coco.names'

with open(classFile, 'rt') as f:
    classNames = f.read().rstrip('\n').split('\n')

configPath = 'ssd_mobilenet_v3_large_coco_2020_01_14.pbtxt'
weightpath = 'frozen_inference_graph.pb'

net = cv2.dnn_DetectionModel(weightpath, configPath)
net.setInputSize(320, 230)
net.setInputScale(1.0 / 127.5)
net.setInputMean((127.5, 127.5, 127.5))
net.setInputSwapRB(True)

fruits = {'apple': 1, 'orange': 2, 'banana': 3}

last_print_time = time.time() - 1  # Initialize to ensure first print happens immediately
while True:
    success, img = cam.read()
    classIds, confs, bbox = net.detect(img, confThreshold=0.5)
    if len(classIds) != 0:
        current_time = time.time()
        if current_time - last_print_time >= 1:  # Check if 1 second has passed
            filter_and_print_fruits(classNames, classIds, confs, bbox, fruits)
            last_print_time = current_time
    cv2.imshow('Output', img)
    if cv2.waitKey(1) & 0xFF == ord('q'):
        break

cam.release()
cv2.destroyAllWindows()

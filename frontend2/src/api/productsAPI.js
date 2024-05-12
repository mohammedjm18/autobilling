import axios from "axios";
const productsApi = axios.create({
    baseURL: "http://localhost:3000/products"
})

export const getProducts = async () => {
    try {
        const response = await productsApi.get("/");
        return response.data;
    } catch (err) {
        throw err.response.data;
    }
};

export const getSingleProduct = async (id) => {
    try {
        const response = await productsApi.get(`/${id}`);
        return response.data;
    } catch (err) {
        throw err.response.data;
    }
};

export const updateProduct = async (product) => {
    try {
        const response = await productsApi.patch('/', product);
        return response.data;
    } catch (err) {
        throw err.response.data;
    }
}

export default productsApi;
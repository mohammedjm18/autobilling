import axios from "axios";
const ordersApi = axios.create({
    baseURL: `http://localhost:3000/order`
})

export const getOrders = async (from,to) => {
    try {
        const response = await ordersApi.get(`/?from=${from}&&to=${to}`);
        return response.data;
    } catch (err) {
        throw err.response.data;
    }
};


export default ordersApi;
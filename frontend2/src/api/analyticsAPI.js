import axios from "axios";
const analyticsApi = axios.create({
    baseURL: `http://localhost:3000/analytics`
});

export const getAnalytics = async () => {
    try {
        const response = await analyticsApi.get('/');
        return response.data;
    } catch (err) {
        throw err.response.data;
    }
};


export default analyticsApi;
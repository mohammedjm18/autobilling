import './Settings.css';
import axios from 'axios';
import { useState } from 'react';

const Settings = () => {
    const [success, setSuccess] = useState(false);
    const [deleteError, setDeleteError] = useState(null);
    const handleDeleteOrders = async () => {
        setSuccess(false);
        setDeleteError(null);
        try {
            await axios.delete('http://localhost:3000/order');
            setSuccess(true);
            setTimeout(() => {
                setSuccess(false);
            }, 3000);
        } catch (err) {
            setDeleteError(err.response.data.msg);
        }
    }
    return (
        <div className='settings'>
            <h1>Settings</h1>
            <button className='delete_orders' type='button' onClick={handleDeleteOrders}>Delete All Orders</button>
            {success && <h4 className='success'>All orders are deleted successfully</h4>}
            {deleteError && <h4 className='errord'>{deleteError}</h4>}
        </div>
    )
}

export default Settings;
import { CircularProgress } from '@mui/material';
import './Loading.css';

const Loading = () => {
    return (
        <div className='loading'>
            <CircularProgress />
        </div>
    )
}

export default Loading;
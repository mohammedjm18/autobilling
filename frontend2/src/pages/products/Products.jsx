import './Products.css';
import EditIcon from '@mui/icons-material/Edit';
import { useQuery } from 'react-query';
import { Link } from 'react-router-dom';

import { getProducts } from '../../api/productsAPI';
import Loading from '../../components/loading/Loading';
import Error from '../../components/Error/Error';

const Products = () => {
    const { isLoading, isError, error, data } = useQuery('products', getProducts, { retry: false,cacheTime: 0 });
    if (isLoading) return <Loading />
    else if (isError) return <Error msg={error.msg} />
    else return (
        <div className='products'>
            {data.products.map(product => (
                <div className="product" key={product.id}>
                    <Link className='edit' to={`/products/edit/${product.id}`}><EditIcon /></Link>
                    <div className="img">
                        <img src={`/${product.img}`} alt="" />
                    </div>
                    <div className="info">
                        <h2>{product.name}</h2>
                        <h3>{(product.price_kg * 1000).toLocaleString()} IQD</h3>
                    </div>
                </div>
            ))}
        </div >
    )
}

export default Products;
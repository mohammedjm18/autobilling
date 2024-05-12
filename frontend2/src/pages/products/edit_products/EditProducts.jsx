import { Link, useParams } from 'react-router-dom';
import './EditProducts.css';
import { getSingleProduct, updateProduct } from '../../../api/productsAPI';
import { useMutation, useQuery } from 'react-query';
import Loading from '../../../components/loading/Loading';
import Error from '../../../components/Error/Error';
import { useEffect, useState } from 'react';

const EditProducts = () => {
    const { id } = useParams();
    const [name, setName] = useState("");
    const [price, setPrice] = useState("");
    const [img, setImg] = useState(null);
    const [success, setSuccess] = useState(false);
    const [submitError, setSubmitError] = useState(null);
    const { isLoading, isError, error, data } = useQuery('product' + id, () => getSingleProduct(id), { retry: false, staleTime: Infinity, cacheTime: 0 });
    useEffect(() => {
        if (data) {
            setName(data.product.name);
            setPrice(data.product.price_kg * 1000);
            setImg(data.product.img);
        }
    }, [data])

    const handleChangeName = (e) => {
        setName(e.target.value);
    }

    const handleChangePrice = (e) => {
        setPrice(e.target.value);
    }

    const EditMutate = useMutation(updateProduct, {
        onSuccess: () => {
            setSuccess(true);
            setTimeout(() => {
                setSuccess(false);
            }, 3000)
        },
        onError: (error) => {
            setSubmitError(error.msg);
        }
    });

    const handleSubmitForm = (e) => {
        e.preventDefault();
        setSubmitError(null);
        setSuccess(false);
        if (!name || !price) return setSubmitError("please fill all fields.");
        if (isNaN(+price)) return setSubmitError("price must be number.");
        if (name.length < 3) return setSubmitError("name must have at least 3 characters.");
        if (Number(price) <= 0) return setSubmitError("price must be greater than 0.");
        EditMutate.mutate({ id, name, price });
    }

    if (isLoading) return <Loading />
    else if (isError) return <Error msg={error.msg} />
    else return (
        <div className='edit_products'>
            <div className="container">
                <h1>Edit Product</h1>
                <div className="form">
                    <form onSubmit={handleSubmitForm}>
                        <label>
                            Name
                            <input type="text" placeholder='ex: Apple, Orange, Banana ...' value={name} onChange={handleChangeName} />
                        </label>
                        <label>
                            Price (IQD)
                            <input type="text" placeholder='ex: 1,500' value={price} onChange={handleChangePrice} />
                        </label>
                        <div className="img">
                            {img && <img src={`/${img}`} alt="" />}
                        </div>

                        <div className="buttons">
                            <button type='submit'>Save</button>
                            <Link to={'/products'}>Cancel</Link>
                        </div>
                    </form>
                </div>
                {submitError && <div className="error">{submitError}</div>}
                {success && <div className="success">Product Updated Successfully</div>}
            </div>
        </div>
    )
}

export default EditProducts;
let products = [];

const productsDOM = () => {
    document.getElementById('cart').innerHTML = '';
    products.forEach((product, i) => {
        const x = `
        <div class="item">
            <button class="delete" type="button" onclick="deleteProduct(${product.id})">delete</button>
            <div class="img back">
                <img src="http://localhost:3000/images/${product.img}" class="album">
            </div>

            <div class="info">
                <div class="heads">
                    <h3>Name</h3>
                    <h3>Amount (Kg)</h3>
                    <h3>Price/Kg (IQD)</h3>
                    <h3>Total (IQD)</h3>
                </div>
                <div class="ibody">
                    <div class="name">
                        <span>${product.name}</span>
                    </div>

                    <div class="amount">
                        <input class="back" type="number" value="${product.amount}" onchange="changeAmount(${product.id},this.value)"/>
                    </div>

                    <div class="price">
                        <span>${(+product.price * 1000).toLocaleString()}</span>
                    </div>

                    <div class="total">
                        <span>${((Number(product.amount) || 0) * product.price * 1000).toLocaleString()}</span>
                    </div>
                </div>
                </div>

        </div>
            `
        document.getElementById('cart').innerHTML = document.getElementById('cart').innerHTML + x;
    });
}
const loadProducts = async () => {
    url = 'http://localhost:3000/cart';

    let res = await axios.get(url);
    responseText = await res.data;
    if (JSON.stringify(products) !== JSON.stringify(responseText)) {
        products = responseText;
        console.log(products);
        const total = (products.reduce((a, b) => a + (+b.price) * (+b.amount), 0) * 1000).toLocaleString();
        document.getElementById('total').querySelector('span').innerText = total + " IQD";
        amountChanged = false;
        if (products.length === 0) {
            document.getElementById('1').style = "display: grid;";
            document.getElementById('final').style = "display: none;";
            document.getElementById('cart').style = "display: none;";
            document.getElementById('total').style = "display:none;";
        } else {
            document.getElementById('1').style = "display: none;";
            document.getElementById('final').style = "display: flex;";
            document.getElementById('cart').style = "display: flex;";
            document.getElementById('total').style = 'display:block;'
            productsDOM();
        }
    }
}


const changeAmount = async (productId, amount) => {
    if (+amount <= 0) {
        productsDOM();
        return;
    };
    try {
        const res = await axios.put('http://localhost:3000/cart', { id: productId, amount });
    } catch (err) {
        console.log(err);
    }
}

const deleteProduct = async (productId) => {
    await axios.delete('http://localhost:3000/cart/' + productId);
}

window.onload = () => {
    setInterval(function () {
        loadProducts();
    }, 500);
}

var checkout = async () => {
    try {
        const res = await axios.post('http://localhost:3000/order', {});
        if (res.status === 200) {
            document.getElementById('dialog').style = "display: flex;color:cornflowerblue";
            document.getElementById('dialog').querySelector('.container').innerText = 'Order has been created successfully!';
            setTimeout(async () => {
                window.location.reload();
            }, 3000)
            return;
        }
        document.getElementById('dialog').style = "display: flex;color:firebrick";
        document.getElementById('dialog').querySelector('.container').innerText = "Error, can't make order!";
        setTimeout(async () => {
            window.location.reload();
        }, 3000)
    } catch {
        document.getElementById('dialog').style = "display: flex;color:firebrick";
        document.getElementById('dialog').querySelector('.container').innerText = "Error, can't make order!";
        setTimeout(async () => {
            window.location.reload();
        }, 3000)
    }
}
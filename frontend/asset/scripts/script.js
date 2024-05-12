let products = [];
let amountChanged = false;

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
                    <h3>name</h3>
                    <h3>amount (Kg)</h3>
                    <h3>price (IQD)</h3>
                    <h3>total (IQD)</h3>
                </div>
                <div class="ibody">
                    <div class="name">
                        <span>${product.name}</span>
                    </div>

                    <div class="amount">
                        <input class="back" value="${product.amount}" onchange="changeAmount(${product.id},this.value)"/>
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
    responseText.map(respr => {
        const product = products.find(product => product.id === respr.id);
        if (!product) respr.amount = '1';
        else respr.amount = product.amount;
    })
    if (JSON.stringify(products) !== JSON.stringify(responseText) || amountChanged) {
        products = responseText;
        const total = (products.reduce((a,b)=>a+(+b.price_kg)*(+b.amount),0)*1000).toLocaleString();
        document.getElementById('total').querySelector('span').innerText = total;
        amountChanged = false;
        if (products.length === 0) {
            document.getElementById('1').style = "display: grid;";
            document.getElementById('2').style = "display: none;";
            document.getElementById('cart').style = "display: none;";
            document.getElementById('total').style = "display:none;";
        } else {
            document.getElementById('1').style = "display: none;";
            document.getElementById('2').style = "display: grid;";
            document.getElementById('cart').style = "display: flex;";
            document.getElementById('total').style = 'display:block;'
            productsDOM();
        }
    }
}


const changeAmount = (productId, amount) => {
    const product = products.find(product => product.id === productId);
    product.amount = amount;
    amountChanged = true;
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
    try{
        const orderItems = products.map(product=>({product_id:product.id,amount:+product.amount}));
        console.log(orderItems);
    }catch(err){

    }
    // document.getElementById('successAdd').style = "display: flex;"
    // setTimeout(async () => {
    //     await axios.delete('http://localhost:3000/');
    //     window.location.reload();
    // }, 3000)
}
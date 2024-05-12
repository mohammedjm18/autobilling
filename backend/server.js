const express = require('express')
const bodyParser = require('body-parser');
const cors = require('cors');
const { format } = require('date-fns');
const path = require('path');
const axios = require('axios');

//script for testing, adding orders to database
async function postOrder(orderItems, createdAt) {
    try {
        const response = await axios.post('http://localhost:3000/order', { orderItems, createdAt });
        console.log('Order created:', response.data.msg);
    } catch (error) {
        console.error('Error creating order:', error.response ? error.response.data.msg : error.message);
    }
}

async function createOrders() {
    try {
        // Define products and their IDs
        const products = [1, 2, 3];

        // Generate 500 orders for September 2024
        for (let i = 1; i <= 30; i++) {
            // Generate random day and hour of the day
            const randomDay = Math.floor(Math.random() * 30) + 1; // Random day between 1 and 30
            const randomHour = Math.floor(Math.random() * 24); // Random hour between 0 and 23
            const day = randomDay.toString().padStart(2, '0'); // Pad day with leading zero if needed
            const hour = randomHour.toString().padStart(2, '0'); // Pad hour with leading zero if needed
            const createdAt = `2024-02-${day} ${hour}:00:00`; // Set createdAt to random day and hour

            // Generate random order items for each order
            const orderItems = [];
            const usedProducts = new Set(); // Track used products
            for (let j = 0; j < Math.min(3, products.length); j++) { // Limit to a maximum of 3 products
                let productId;
                do {
                    productId = products[Math.floor(Math.random() * products.length)]; // Random product ID
                } while (usedProducts.has(productId)); // Ensure product is not already used
                usedProducts.add(productId); // Add product to used products set
                const amount = Math.random() * 10; // Random amount (0-10)
                orderItems.push({ product_id: productId, amount });
            }

            // Post the order
            await postOrder(orderItems, createdAt);
        }
        console.log("Orders created successfully.");
    } catch (error) {
        console.error("Error creating orders:", error);
    }
}

// Run the script
// createOrders();


const getWeeks = (startOfWeek = 'saturday', numberOfPreviousWeeks = 4) => {
    let weeks = [];
    const arr = [0, 1, 2, 3, 4, 5, 6];
    const obj = { 'saturday': 6, 'sunday': 0, 'monday': 1, 'tuesday': 2, 'wednesday': 3, 'thursday': 4, 'friday': 5 };
    const arrReadableElement = (element) => {
        const index = element >= 0 ? element : arr.length + element;
        return arr[index];
    }

    const today = new Date();
    today.setUTCHours(today.getUTCHours() + 3);
    let startOfThisWeek = new Date(today);
    startOfThisWeek.setUTCDate(today.getUTCDate() - arrReadableElement(today.getUTCDay() - obj[startOfWeek]));
    startOfThisWeek.setUTCHours(0, 0, 0, 0);
    let endOfThisWeek = new Date(startOfThisWeek);
    endOfThisWeek.setUTCDate(startOfThisWeek.getUTCDate() + 6);
    endOfThisWeek.setUTCHours(23, 59, 59, 999);
    weeks.push({ start: format(startOfThisWeek, "yyyy-MM-dd"), end: format(endOfThisWeek, "yyyy-MM-dd") });
    for (let i = 1; i < numberOfPreviousWeeks; i++) {
        let start = new Date(startOfThisWeek);
        start.setUTCDate(startOfThisWeek.getUTCDate() - (i * 7));
        let end = new Date(endOfThisWeek);
        end.setUTCDate(endOfThisWeek.getUTCDate() - (i * 7));
        weeks.push({ start: format(start, "yyyy-MM-dd"), end: format(end, "yyyy-MM-dd") });
    }

    return weeks;
}

const app = express();
app.use('/images',express.static(path.join(__dirname,'assets','images')));

const db = require('mysql2/promise').createPool({
    host: 'localhost',
    user: 'root',
    database: 'objdet',
    password: 'mo123098',
    connectionLimit: 10
});

var port = process.env.PORT || 3000;

let cart = [];
app.use(cors());

app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

app.get('/', (req, res) => {
    res.send("API deployment successful");
});

app.post('/cart', async (req, res) => {
    const { id } = req.body
    if (!cart.some(p => p.id === id)) {
        let connection;
        try {
            connection = await db.getConnection();
            const [row] = await connection.query('SELECT * FROM products WHERE id = ?', [id]);
            if (row.length === 0) throw new Error('Product not exists in database!');
            cart.push({
                ...row[0],
                price:+row[0].price_kg
            });
            res.status(200).json({ msg:'Product added to products array.' });
        } catch (error) {
            if (error.sqlState) return res.status(400).json({ msg: 'error with MySQL database' });
            res.status(400).json({ msg: error.message });
        } finally {
            connection && connection.release();
        }
    } else {
        res.status(400).json({ msg: 'Product Already Exists!' });
    }
});

app.get('/cart', (req, res) => {
    res.status(200).json(cart);
});

app.delete('/cart/:id', (req, res) => {
    const id = req.params.id;
    cart = cart.filter(product => product.id !== Number(id));
    res.send('Product is deleted from cart');
});

app.get('/analytics', async (req, res) => {
    let connection;
    try {
        connection = await db.getConnection();
        const [productsCount] = await connection.query('SELECT COUNT(*) AS count FROM products;');
        const [ordersCount] = await connection.query('SELECT COUNT(*) AS count FROM orders;');
        const [totalPrice] = await connection.query(`
            SELECT SUM(oi.price * oi.amount) AS total_price
            FROM orders o
            JOIN order_items oi ON o.id = oi.order_id;`
        );
        const weeks = getWeeks();
        const totalofWeeks = await Promise.all(weeks.map(async (week) => {
            const [row] = await connection.query(`
                SELECT 
                    SUM(oi.price * oi.amount) AS total
                FROM 
                    orders o
                JOIN 
                    order_items oi ON o.id = oi.order_id
                WHERE 
                    o.created_at BETWEEN ? AND ?;
            `, [week.start, week.end]);
            return (row?.[0]?.total || 0);
        }));
        res.status(200).json({
            productsCount: productsCount[0].count,
            ordersCount: ordersCount[0].count,
            totalIncome: (+totalPrice[0].total_price * 1000).toLocaleString(),
            totalofWeeks
        });
    } catch (error) {
        if (error.sqlState) return res.status(400).json({ msg: 'error with MySQL database' });
        res.status(400).json({ msg: error.message });
    } finally {
        connection && connection.release();
    }
});

//products routes
app.get('/products', async (req, res) => {
    let connection;
    try {
        connection = await db.getConnection();
        const [productsRow] = await connection.query('SELECT * FROM products');
        res.status(200).json({ products: productsRow });
    } catch (error) {
        if (error.sqlState) return res.status(400).json({ msg: 'error with MySQL database' });
        res.status(400).json({ msg: error.message });
    } finally {
        connection && connection.release();
    }
});

app.get('/products/:id', async (req, res) => {
    let connection;
    try {
        connection = await db.getConnection();
        const [productsRow] = await connection.query('SELECT * FROM products where id = ?', [req.params.id]);
        res.status(200).json({ product: productsRow[0] });
    } catch (error) {
        if (error.sqlState) return res.status(400).json({ msg: 'error with MySQL database' });
        res.status(400).json({ msg: error.message });
    } finally {
        connection && connection.release();
    }
})

app.patch('/products', async (req, res) => {
    let connection;
    const { id, name, price } = req.body;
    try {
        connection = await db.getConnection();
        await connection.query('UPDATE products SET name = ?, price_kg = ? WHERE id = ?', [name, price / 1000, id]);
        res.status(200).json({ msg: 'Product Updated Successfully.' });
    } catch (error) {
        if (error.sqlState) return res.status(400).json({ msg: 'error with MySQL database' });
        await connection.rollback();
        res.status(400).json({ msg: error.message });
    } finally {
        connection && connection.release();
    }
})



//orders routes
app.post('/order', async (req, res) => {
    const { orderItems, createdAt } = req.body; // Extract datetime from req.body
    let connection;
    try {
        connection = await db.getConnection();
        await connection.beginTransaction();
        if (orderItems.length === 0) {
            throw new Error("Please add some items");
        }
        const [orderResult] = await connection.query('INSERT INTO orders (created_at) VALUES (?)', [createdAt || format(new Date(), 'yyyy-MM-dd HH:mm:ss')]); // Use provided datetime or default one
        const orderId = orderResult.insertId;
        const orderItemIds = orderItems.map(orderItem => orderItem.product_id);
        const [productsData] = await connection.query(
            'SELECT id, price_kg FROM products WHERE id IN (?)',
            [orderItemIds]
        );
        const productPrices = {};
        productsData.forEach(product => {
            productPrices[product.id] = product.price_kg;
        });
        const orderItemsData = [];
        for (const orderItem of orderItems) {
            if (!orderItem.product_id || !orderItem.amount) {
                throw new Error("Order item error: product_id and amount are required");
            }
            const price = productPrices[orderItem.product_id];
            if (!price) {
                throw new Error(`Product with id ${orderItem.product_id} not found or price is missing`);
            }
            orderItemsData.push([orderId, orderItem.product_id, orderItem.amount, price]);
        }
        await connection.query('INSERT INTO order_items (order_id, product_id, amount, price) VALUES ?', [orderItemsData]);
        await connection.commit();
        cart = [];
        res.status(200).json({ msg: 'Order created successfully' });
    } catch (error) {
        console.log(error);
        await connection.rollback();
        if (error.sqlState) {
            return res.status(400).json({ msg: 'Error with MySQL database' });
        }
        res.status(400).json({ msg: error.message });
    } finally {
        connection && connection.release();
    }
});


app.get('/order', async (req, res) => {
    let connection;
    const { from, to } = req.query;
    const fromDate = format(from, "yyyy-MM-dd");
    const toDate = format(to, "yyyy-MM-dd");
    let total = { count: 0, price: 0 }
    try {
        connection = await db.getConnection();

        // Fetch orders
        const [ordersRows] = await connection.query(`
        SELECT * FROM orders WHERE created_at BETWEEN ? AND DATE_ADD(?, INTERVAL 1 DAY)
        ORDER BY created_at DESC;`, [fromDate, toDate]);

        // Fetch order items for each order with specified date range
        const ordersWithItems = await Promise.all(ordersRows.map(async (order) => {
            total.count += 1;
            const [itemsRows] = await connection.query(`
                SELECT oi.*, p.name AS product_name 
                FROM order_items oi 
                JOIN products p ON oi.product_id = p.id 
                WHERE oi.order_id = ?;`,
                [order.id]);
            return {
                id: order.id,
                createdAt: format(order.created_at, "yyyy-MM-dd HH:mm:ss"),
                items: itemsRows.map(item => {
                    total.price += Number(item.price) * Number(item.amount) * 1000;
                    return {
                        productId: item.product_id,
                        productName: item.product_name,
                        price: Number(item.price),
                        amount: Number(item.amount)
                    }
                })
            };
        }));
        res.status(200).json({ orders: ordersWithItems, total });
    } catch (error) {
        if (error.sqlState) return res.status(400).json({ msg: 'error with MySQL database' });
        res.status(400).json({ msg: error.message });
    } finally {
        connection && connection.release();
    }
});

app.delete('/order', async (req, res) => {
    let connection;
    try {
        connection = await db.getConnection();
        await connection.beginTransaction();
        await connection.query('DELETE FROM order_items');
        await connection.query('DELETE FROM orders');
        await connection.query('ALTER TABLE orders AUTO_INCREMENT = 1');
        await connection.commit();
        res.status(200).json({ msg: 'all orders are deleted successfully!' });
    } catch (error) {
        if (error.sqlState) return res.status(400).json({ msg: 'error with MySQL database' });
        res.status(400).json({ msg: error.message });
    } finally {
        connection && connection.release();
    }
});



app.listen(port, () => console.log(`Server listening on port ${port}!`));

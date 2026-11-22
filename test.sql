設問1.
SELECT * FROM users;
設問2.
SELECT * FROM users WHERE created_at >= '2024-01-01' AND created_at < '2025-01-01';
設問3.
SELECT * FROM users WHERE age < 30 AND gender = 'female';
設問4.
SELECT product_name, price FROM products;
設問5.
SELECT users.name, orders.order_date FROM orders INNER JOIN users ON orders.user_id = users.id;
設問6.
SELECT products.product_name, order_items.quantity, products.price, products.price * order_items.quantity AS amount FROM order_items INNER JOIN products ON order_items.product_id = products.id;
設問7.
SELECT users.name, COUNT(orders.id) AS order_count FROM users LEFT JOIN orders ON users.id = orders.user_id GROUP BY users.id, users.name;
設問8.
SELECT
    users.name,
    COALESCE(SUM(products.price * order_items.quantity), 0)
    AS total_amount
FROM users
LEFT JOIN orders
ON users.id = orders.user_id
LEFT JOIN order_items
ON orders.id = order_items.order_id
LEFT JOIN products
ON order_items.product_id = products.id
GROUP BY users.id, users.name;
設問9.
SELECT
    users.name,
    SUM(products.price * order_items.quantity) AS total_amount
FROM users
INNER JOIN orders
ON users.id = orders.user_id
INNER JOIN order_items
ON orders.id = order_items.order_id
INNER JOIN products
ON order_items.product_id = products.id
GROUP BY users.id, users.name
ORDER BY total_amount DESC
LIMIT 1;
設問10.
SELECT
    products.product_name,
    SUM(order_items.quantity) AS total_quantity
FROM products
INNER JOIN order_items
ON products.id = order_items.product_id
GROUP BY products.id, products.product_name;
設問11.
SELECT *
FROM users
WHERE id NOT IN (
    SELECT user_id
    FROM orders
);
設問12.
SELECT order_id
FROM order_items
GROUP BY order_id
HAVING COUNT(DISTINCT product_id) >= 2;
設問13.
SELECT DISTINCT users.name
FROM users
INNER JOIN orders
ON users.id = orders.user_id
INNER JOIN order_items
ON orders.id = order_items.order_id
INNER JOIN products
ON order_items.product_id = products.id
WHERE products.product_name = 'テレビ';
設問14.
SELECT
    orders.order_date,
    users.name,
    products.product_name,
    order_items.quantity,
    products.price * order_items.quantity AS total_amount
FROM orders
INNER JOIN users
ON orders.user_id = users.id
INNER JOIN order_items
ON orders.id = order_items.order_id
INNER JOIN products
ON order_items.product_id = products.id;
設問15.
SELECT
    products.product_name,
    SUM(order_items.quantity) AS total_quantity
FROM products
INNER JOIN order_items
ON products.id = order_items.product_id
GROUP BY products.id, products.product_name
ORDER BY total_quantity DESC
LIMIT 1;
設問16.
SELECT
    DATE_FORMAT(order_date, '%Y-%m') AS order_month,
    COUNT(*) AS order_count
FROM orders
GROUP BY DATE_FORMAT(order_date, '%Y-%m')
ORDER BY order_month;
設問17.
SELECT *
FROM products
WHERE id NOT IN (
    SELECT product_id
    FROM order_items
);
設問18.
CREATE INDEX idx_product_id
ON order_items(product_id);
設問19.
SELECT
    users.name,
    AVG(order_totals.total_amount) AS average_amount
FROM users
INNER JOIN (
    SELECT
        orders.id,
        orders.user_id,
        SUM(products.price * order_items.quantity) AS total_amount
    FROM orders
    INNER JOIN order_items
    ON orders.id = order_items.order_id
    INNER JOIN products
    ON order_items.product_id = products.id
    GROUP BY orders.id, orders.user_id
) AS order_totals
ON users.id = order_totals.user_id
GROUP BY users.id, users.name;
設問20.
SELECT
    users.name,
    MAX(orders.order_date) AS latest_order_date
FROM users
LEFT JOIN orders
ON users.id = orders.user_id
GROUP BY users.id, users.name;
設問21.
INSERT INTO users
(name, age, gender, created_at)
VALUES
('中村愛', 25, 'female', '2025-06-01');
設問22.
INSERT INTO products
(product_name, price)
VALUES
('エアコン', 60000);
設問23.
INSERT INTO orders
(id, user_id, order_date)
VALUES
(10, 1, '2025-06-10');
設問24.
INSERT INTO order_items
(order_id, product_id, quantity)
VALUES
(10, 6, 1);
設問25.
UPDATE users
SET age = 24
WHERE name = '田中美咲'
AND age = 23;
設問26.UPDATE products
SET price = price * 1.10;
設問27.
UPDATE orders
SET order_date = '2024-05-01'
WHERE order_date < '2024-05-01';
設問28.
DELETE FROM users
WHERE name = '高橋健一';
設問29.
DELETE FROM order_items
WHERE order_id = 5;
設問30.
DELETE FROM products
WHERE id NOT IN (
    SELECT product_id
    FROM order_items
);
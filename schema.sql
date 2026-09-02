CREATE TABLE orders (
    order_id VARCHAR(10) PRIMARY KEY,
    order_date DATE,
    customer_id VARCHAR(10),
    region VARCHAR(20),
    product_id VARCHAR(10),
    product_name VARCHAR(100),
    category VARCHAR(50),
    unit_price DECIMAL(10,2),
    quantity INT,
    discount DECIMAL(5,2),
    revenue DECIMAL(12,2)
);

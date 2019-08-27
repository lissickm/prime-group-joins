1. Get all customers and their addresses.
SELECT "customers".first_name, "customers".last_name, "addresses".street, "addresses".city, "addresses".state, "addresses".zip
FROM "customers"
JOIN "addresses" ON "addresses".customer_id = "customers".id;

2. Get all orders and their line items (orders, quantity and product).
SELECT "line_items".quantity, "products".description, "orders".order_date
FROM "line_items"
JOIN "orders" ON orders.id = line_items.order_id
JOIN products ON products.id = line_items.product_id;

3. Which warehouses have cheetos?
SELECT "warehouse_product".warehouse_id, "warehouse".warehouse
FROM "warehouse_product"
JOIN "products" ON "warehouse_product".product_id = "products".id
JOIN "warehouse" ON "warehouse_product".warehouse_id = "warehouse".id
WHERE "products".description = 'cheetos';

4. Which warehouses have diet pepsi?
SELECT "warehouse_product".warehouse_id, "warehouse".warehouse
FROM "warehouse_product"
JOIN "products" ON "warehouse_product".product_id = "products".id
JOIN "warehouse" ON "warehouse_product".warehouse_id = "warehouse".id
WHERE "products".description = 'diet pepsi';

5. Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.
SELECT "customers".id, COUNT("orders".order_date)
FROM "addresses"
JOIN "orders" ON "addresses".id = "orders".address_id
JOIN "customers" ON "customers".id = "addresses".customer_id
GROUP BY "customers".id;

6. How many customers do we have?
SELECT COUNT (id)
FROM "customers";

7. How many products do we carry?
SELECT COUNT (products)
FROM "products";

8. What is the total available on-hand quantity of diet pepsi?
SELECT warehouse_product.on_hand, products.description
FROM warehouse_product
JOIN products ON products.id = warehouse_product.product_id
WHERE "products".description = 'diet pepsi';

-- 1.Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине.
SELECT * FROM users;

INSERT INTO orders (user_id) VALUES (1),(2),(3),(4),(5);

INSERT INTO orders_products
  (order_id, product_id, total)
VALUES
  (1, 2, 4),
  (1, 4, 8),
  (2, 3, 7),
  (2, 1, 1),
  (3, 6, 10),
  (3, 4, 4),
  (4, 2, 8),
  (4, 1, 12),
  (4, 5, 9),
  (5, 1, 3),
  (5, 5, 5);
 
SELECT users.name, orders.id AS 'Order id' FROM users JOIN orders ON users.id = orders.user_id;

-- 2.Выведите список товаров products и разделов catalogs, который соответствует товару.

SELECT
  products.name AS 'Product name',
  catalogs.name AS 'Catalog name'
FROM catalogs JOIN products ON catalogs.id = products.catalog_id;

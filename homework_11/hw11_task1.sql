-- Практическое задание по теме “Оптимизация запросов”
--  1. Создайте таблицу logs типа Archive. Пусть при каждом создании записи в таблицах users, 
-- catalogs и products в таблицу logs помещается время и дата создания записи, название таблицы, идентификатор первичного ключа и содержимое поля name.

DROP TABLE IF EXISTS logs;
CREATE TABLE logs (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки",
  created_at DATETIME NOT NULL COMMENT 'Время и дата создания записи',
  table_name VARCHAR(100) COMMENT 'Название таблицы',
  id_key INT COMMENT 'Идентификатор первичного ключа',
  name VARCHAR(255) COMMENT 'Содержимое поля name'
) ENGINE=Archive;


DELIMITER //
DROP TRIGGER IF EXISTS log_users//
CREATE TRIGGER log_users AFTER INSERT ON users
FOR EACH ROW
BEGIN
	INSERT INTO logs (created_at, table_name, id_key, name) VALUES (NOW(), 'users', NEW.id, NEW.name);
END//

DROP TRIGGER IF EXISTS log_catalogs//
CREATE TRIGGER log_catalogs AFTER INSERT ON catalogs
FOR EACH ROW
BEGIN
	INSERT INTO logs (created_at, table_name, id_key, name) VALUES (NOW(), 'catalogs', NEW.id, NEW.name);
END//

DROP TRIGGER IF EXISTS log_products//
CREATE TRIGGER log_products AFTER INSERT ON products
FOR EACH ROW
BEGIN
	INSERT INTO logs (created_at, table_name, id_key, name) VALUES (NOW(), 'products', NEW.id, NEW.name);
END//
DELIMITER ;

-- 2. (по желанию) Создайте SQL-запрос, который помещает в таблицу users миллион записей.


-- Практическое задание по теме “NoSQL”
--  1. В базе данных Redis подберите коллекцию для подсчета посещений с определенных IP-адресов.
SADD ip_address '192.168.0.1' '192.168.0.2' '192.168.0.3' '127.0.0.1'
SMEMBERS ip_address

-- 2. При помощи базы данных Redis решите задачу поиска имени пользователя по электронному адресу и наоборот, поиск электронного адреса пользователя по его имени
-- 3. Организуйте хранение категорий и товарных позиций учебной базы данных shop в СУБД MongoDB.
use catalogs
db.catalogs.insertMany(
  [{"name": "Процессоры"}, {"name": "Материнские платы"}, {"name": "Видеокарты"}, {"name": "Жесткие диски"}, {"name": "Оперативная память"}]
)
db.catalogs.find()


use products
db.products.insertMany([
  {"name": "Intel Core i3-8100", "description": "Процессор для настольных ПК Intel", "price": "7890.00", "catalog_id": "Процессоры", "created_at": new Date(), "updated_at": new Date()},
  {"name": "Intel Core i5-7400", "description": "Процессор для настольных ПК Intel", "price": "12700.00", "catalog_id": "Процессоры", "created_at": new Date(), "updated_at": new Date()},
  {"name": "AMD FX-8320E", "description": "Процессор для настольных ПК AMD", "price": "4780.00", "catalog_id": "Процессоры", "created_at": new Date(), "updated_at": new Date()},
  {"name": "AMD FX-8320", "description": "Процессор для настольных ПК AMD", "price": "7120.00", "catalog_id": "Процессоры", "created_at": new Date(), "updated_at": new Date()}
])
db.products.find().pretty()
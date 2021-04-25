-- Необходимо проанализировать данные каждой таблицы и исправить 
-- ошибки и несоответствия, в том числе по столбцам связи,
-- используя команды CRUD

USE vk;
SHOW TABLES;



-- Анализируем данные пользователей
SELECT * FROM users LIMIT 10;

-- Приводим в порядок временные метки
SELECT * FROM users WHERE updated_at < created_at;
UPDATE users SET updated_at = NOW() WHERE updated_at < created_at; 

-- Смотрим структуру таблицы пользователей
DESC users;




-- Анализируем данные профилей
SELECT * FROM profiles LIMIT 10;

-- Генерация значения страна
-- Создаём временную таблицу стран
CREATE TEMPORARY TABLE countries(country VARCHAR(100));

-- Добавим значения
INSERT INTO countries VALUES
('Colombia'), ('Panama'), ('Uganda'), ('Lao People\'s Democratic Republic'),
('Madagascar'), ('Guatemala'), ('Equatorial Guinea'), ('Belgium'), ('Cyprus');
  
-- Вставляем случайное значение страны в столбец country  
UPDATE profiles SET country = (SELECT country FROM countries ORDER BY RAND() LIMIT 1);  

-- Приводим в порядок временные метки
SELECT * FROM profiles WHERE birthday > created_at;
UPDATE profiles SET birthday = NOW() - INTERVAL 30 DAY WHERE birthday > created_at; 
UPDATE profiles SET created_at = NOW() - INTERVAL 15 DAY WHERE birthday > created_at; 

SELECT * FROM profiles WHERE updated_at < created_at;
UPDATE profiles SET updated_at = NOW() WHERE updated_at < created_at; 

-- Смотрим структуру таблицы профилей
DESC profiles;



-- Анализируем данные сообщений
SELECT * FROM messages LIMIT 10;

-- Смотрим структуру таблицы сообщений
DESC messages;


-- Анализируем данные медиаконтента
SELECT * FROM media LIMIT 10;

-- Создаём временную таблицу форматов медиафайлов
CREATE TEMPORARY TABLE extensions (name VARCHAR(10));

-- Заполняем значениями
INSERT INTO extensions VALUES ('jpeg'), ('mp4'), ('mp3'), ('avi'), ('png');

-- Проверяем
SELECT * FROM extensions;

-- Обновляем ссылку на файл
UPDATE media SET filename = CONCAT(
  'http://dropbox.net/vk/',
  filename,
  '.',
  (SELECT name FROM extensions ORDER BY RAND() LIMIT 1)
);

-- Обновляем размер файлов
UPDATE media SET size = FLOOR(10000 + (RAND() * 1000000)) WHERE size < 1000;

-- Заполняем метаданные
UPDATE media SET metadata = CONCAT('{"owner":"', 
  (SELECT CONCAT(first_name, ' ', last_name) FROM users WHERE id = user_id),
  '"}');
 
-- Смотрим структуру таблицы медиаконтента
DESC media;

-- Возвращаем столбцу метеданных правильный тип, если нужно
ALTER TABLE media MODIFY COLUMN metadata JSON;

-- Анализируем типы медиаконтента
SELECT * FROM media_types;

-- Анализируем данные
SELECT * FROM media LIMIT 10;



-- Смотрим структуру таблицы дружбы
DESC friendship;

-- Анализируем данные
SELECT * FROM friendship LIMIT 10;

-- Анализируем данные когда user_id = friend_id
SELECT * FROM friendship WHERE user_id = friend_id;

-- Приводим в порядок временные метки
SELECT * FROM friendship WHERE updated_at < created_at;
UPDATE friendship SET updated_at = NOW() WHERE updated_at < created_at; 

SELECT * FROM friendship WHERE confirmed_at < created_at;
UPDATE friendship SET confirmed_at = created_at WHERE confirmed_at < created_at; 

SELECT * FROM friendship WHERE confirmed_at > updated_at;
UPDATE friendship SET confirmed_at = updated_at WHERE confirmed_at > updated_at;

-- Анализируем данные 
SELECT * FROM friendship_statuses;

-- Очищаем таблицу
TRUNCATE friendship_statuses;

-- Вставляем значения статусов дружбы
INSERT INTO friendship_statuses (name) VALUES
  ('Requested'),
  ('Confirmed'),
  ('Rejected');
 

 
 -- Смотрим структуру таблицы групп
DESC communities;

-- Анализируем данные
SELECT * FROM communities;
 
 -- Удаляем часть групп
DELETE FROM communities WHERE id > 30;


 -- Смотрим структуру таблицы групп
DESC communities_users;

-- Анализируем таблицу связи пользователей и групп
SELECT * FROM communities_users;

-- Очищаем таблицу
TRUNCATE communities_users;
 
-- Заполняем новыми значениями
UPDATE communities_users SET 
community_id = FLOOR(1 + RAND() * 30),
user_id = FLOOR(1 + RAND() * 100);



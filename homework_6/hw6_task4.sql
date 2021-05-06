-- 4.Вывести для каждого пользователя количество созданных сообщений, постов, загруженных медиафайлов и поставленных лайков.
SELECT 
  id,
  CONCAT(first_name, ' ', last_name),
  (SELECT  COUNT(p.user_id) FROM posts as p WHERE p.user_id = u.id GROUP BY p.user_id) AS 'Posts count',
  (SELECT COUNT(m.from_user_id) FROM messages as m WHERE m.from_user_id = u.id GROUP BY m.from_user_id) AS 'Message count',
  (SELECT COUNT(d.user_id) FROM media as d WHERE d.user_id = u.id GROUP BY d.user_id) AS 'Media count',
  (SELECT COUNT(l.user_id) FROM likes as l WHERE l.user_id = u.id GROUP BY l.user_id) AS 'Likes count'
 FROM users as u;


-- количество созданных постов для каждого пользователя
SELECT 
  (SELECT CONCAT(first_name, ' ', last_name) FROM users WHERE users.id = posts.user_id) AS user,
  COUNT(user_id) AS 'Posts count'
  FROM posts GROUP BY user_id ORDER BY COUNT(*);
  
-- количество созданных сообщений для каждого пользователя
SELECT
 (SELECT CONCAT(first_name, ' ', last_name) FROM users WHERE users.id = messages.from_user_id) AS user,
 COUNT(from_user_id) AS 'Message count' FROM messages GROUP BY from_user_id ORDER BY COUNT(*);

-- количество загруженных медиафайлов для каждого пользователя
SELECT 
 (SELECT CONCAT(first_name, ' ', last_name) FROM users WHERE users.id = media.user_id) AS user,
 COUNT(user_id) AS 'Media count' FROM media GROUP BY user_id ORDER BY COUNT(*);

-- количество поставленных лайков для каждого пользователя
SELECT 
 (SELECT CONCAT(first_name, ' ', last_name) FROM users WHERE users.id = likes.user_id) AS user,
 COUNT(user_id) AS 'Likes count' FROM likes GROUP BY user_id ORDER BY COUNT(*);

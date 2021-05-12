-- 4.Вывести для каждого пользователя количество созданных сообщений, постов, загруженных медиафайлов и поставленных лайков.

SELECT 
  users.id,
  CONCAT(users.first_name, ' ', users.last_name) AS user,
  posts_count AS 'Posts count',
  messages_count AS 'Message count',
  media_count AS 'Media count',
  likes_count AS 'Likes count'
  FROM users
    LEFT JOIN (
      SELECT user_id, COUNT(*) AS posts_count
      FROM posts GROUP BY user_id
    ) posts_counts
      ON posts_counts.user_id = users.id
    LEFT JOIN (
      SELECT from_user_id, COUNT(*) AS messages_count
      FROM messages GROUP BY from_user_id
    ) messages_counts
      ON messages_counts.from_user_id = users.id
    LEFT JOIN (
      SELECT user_id, COUNT(*) AS media_count
      FROM media GROUP BY user_id
    ) media_counts
      ON media_counts.user_id = users.id
    LEFT JOIN (
      SELECT user_id, COUNT(*) AS likes_count
      FROM likes GROUP BY user_id
    ) likes_counts 
      ON likes_counts.user_id = users.id;


SELECT 
  id,
  CONCAT(first_name, ' ', last_name) AS user,
  (SELECT COUNT(*) FROM posts WHERE posts.user_id = users.id) AS 'Posts count',
  (SELECT COUNT(*) FROM messages WHERE messages.from_user_id = users.id) AS 'Message count',
  (SELECT COUNT(*) FROM media WHERE media.user_id = users.id) AS 'Media count',
  (SELECT COUNT(*) FROM likes WHERE likes.user_id = users.id) AS 'Likes count'
 FROM users;

-- 4.������� ��� ������� ������������ ���������� ��������� ���������, ������, ����������� ����������� � ������������ ������.

-- ���������� ��������� ������ ��� ������� ������������
SELECT 
  (SELECT CONCAT(first_name, ' ', last_name) FROM users WHERE users.id = posts.user_id) AS user,
  COUNT(user_id) AS 'Posts count'
  FROM posts GROUP BY user_id ORDER BY COUNT(*);
  
-- ���������� ��������� ��������� ��� ������� ������������
SELECT
 (SELECT CONCAT(first_name, ' ', last_name) FROM users WHERE users.id = messages.from_user_id) AS user,
 COUNT(from_user_id) AS 'Message count' FROM messages GROUP BY from_user_id ORDER BY COUNT(*);

-- ���������� ����������� ����������� ��� ������� ������������
SELECT 
 (SELECT CONCAT(first_name, ' ', last_name) FROM users WHERE users.id = media.user_id) AS user,
 COUNT(user_id) AS 'Media count' FROM media GROUP BY user_id ORDER BY COUNT(*);

-- ���������� ������������ ������ ��� ������� ������������
SELECT 
 (SELECT CONCAT(first_name, ' ', last_name) FROM users WHERE users.id = likes.user_id) AS user,
 COUNT(user_id) AS 'Likes count' FROM likes GROUP BY user_id ORDER BY COUNT(*);

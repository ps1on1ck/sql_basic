-- ���������� ���������������� ������ ������ ������� � ��������� 
-- ������ � ��������������, � ��� ����� �� �������� �����,
-- ��������� ������� CRUD

USE vk;
SHOW TABLES;



-- ����������� ������ �������������
SELECT * FROM users LIMIT 10;

-- �������� � ������� ��������� �����
SELECT * FROM users WHERE updated_at < created_at;
UPDATE users SET updated_at = NOW() WHERE updated_at < created_at; 

-- ������� ��������� ������� �������������
DESC users;




-- ����������� ������ ��������
SELECT * FROM profiles LIMIT 10;

-- ��������� �������� ������
-- ������ ��������� ������� �����
CREATE TEMPORARY TABLE countries(country VARCHAR(100));

-- ������� ��������
INSERT INTO countries VALUES
('Colombia'), ('Panama'), ('Uganda'), ('Lao People\'s Democratic Republic'),
('Madagascar'), ('Guatemala'), ('Equatorial Guinea'), ('Belgium'), ('Cyprus');
  
-- ��������� ��������� �������� ������ � ������� country  
UPDATE profiles SET country = (SELECT country FROM countries ORDER BY RAND() LIMIT 1);  

-- �������� � ������� ��������� �����
SELECT * FROM profiles WHERE birthday > created_at;
UPDATE profiles SET birthday = NOW() - INTERVAL 30 DAY WHERE birthday > created_at; 
UPDATE profiles SET created_at = NOW() - INTERVAL 15 DAY WHERE birthday > created_at; 

SELECT * FROM profiles WHERE updated_at < created_at;
UPDATE profiles SET updated_at = NOW() WHERE updated_at < created_at; 

-- ������� ��������� ������� ��������
DESC profiles;



-- ����������� ������ ���������
SELECT * FROM messages LIMIT 10;

-- ������� ��������� ������� ���������
DESC messages;


-- ����������� ������ �������������
SELECT * FROM media LIMIT 10;

-- ������ ��������� ������� �������� �����������
CREATE TEMPORARY TABLE extensions (name VARCHAR(10));

-- ��������� ����������
INSERT INTO extensions VALUES ('jpeg'), ('mp4'), ('mp3'), ('avi'), ('png');

-- ���������
SELECT * FROM extensions;

-- ��������� ������ �� ����
UPDATE media SET filename = CONCAT(
  'http://dropbox.net/vk/',
  filename,
  '.',
  (SELECT name FROM extensions ORDER BY RAND() LIMIT 1)
);

-- ��������� ������ ������
UPDATE media SET size = FLOOR(10000 + (RAND() * 1000000)) WHERE size < 1000;

-- ��������� ����������
UPDATE media SET metadata = CONCAT('{"owner":"', 
  (SELECT CONCAT(first_name, ' ', last_name) FROM users WHERE id = user_id),
  '"}');
 
-- ������� ��������� ������� �������������
DESC media;

-- ���������� ������� ���������� ���������� ���, ���� �����
ALTER TABLE media MODIFY COLUMN metadata JSON;

-- ����������� ���� �������������
SELECT * FROM media_types;

-- ����������� ������
SELECT * FROM media LIMIT 10;



-- ������� ��������� ������� ������
DESC friendship;

-- ����������� ������
SELECT * FROM friendship LIMIT 10;

-- ����������� ������ ����� user_id = friend_id
SELECT * FROM friendship WHERE user_id = friend_id;

-- �������� � ������� ��������� �����
SELECT * FROM friendship WHERE updated_at < created_at;
UPDATE friendship SET updated_at = NOW() WHERE updated_at < created_at; 

SELECT * FROM friendship WHERE confirmed_at < created_at;
UPDATE friendship SET confirmed_at = created_at WHERE confirmed_at < created_at; 

SELECT * FROM friendship WHERE confirmed_at > updated_at;
UPDATE friendship SET confirmed_at = updated_at WHERE confirmed_at > updated_at;

-- ����������� ������ 
SELECT * FROM friendship_statuses;

-- ������� �������
TRUNCATE friendship_statuses;

-- ��������� �������� �������� ������
INSERT INTO friendship_statuses (name) VALUES
  ('Requested'),
  ('Confirmed'),
  ('Rejected');
 

 
 -- ������� ��������� ������� �����
DESC communities;

-- ����������� ������
SELECT * FROM communities;
 
 -- ������� ����� �����
DELETE FROM communities WHERE id > 30;


 -- ������� ��������� ������� �����
DESC communities_users;

-- ����������� ������� ����� ������������� � �����
SELECT * FROM communities_users;

-- ������� �������
TRUNCATE communities_users;
 
-- ��������� ������ ����������
UPDATE communities_users SET 
community_id = FLOOR(1 + RAND() * 30),
user_id = FLOOR(1 + RAND() * 100);



-- 2.Создать все необходимые внешние ключи и диаграмму отношений.


-- Смотрим структуру таблицы
DESC profiles;

-- Добавляем внешние ключи
ALTER TABLE profiles
  ADD CONSTRAINT profiles_user_id_fk 
    FOREIGN KEY (user_id) REFERENCES users(id)
      ON DELETE CASCADE;
     
-- Для таблицы сообщений
-- Смотрим структуру таблицы
DESC messages;

-- Добавляем внешние ключи
ALTER TABLE messages
  ADD CONSTRAINT messages_from_user_id_fk 
    FOREIGN KEY (from_user_id) REFERENCES users(id),
  ADD CONSTRAINT messages_to_user_id_fk 
    FOREIGN KEY (to_user_id) REFERENCES users(id);
     

-- Для таблицы медиа
-- Смотрим структуру таблицы
DESC media;

-- Добавляем внешние ключи
ALTER TABLE media
  ADD CONSTRAINT media_user_id_fk 
    FOREIGN KEY (user_id) REFERENCES users(id)
    	ON DELETE CASCADE,
  ADD CONSTRAINT media_media_type_id_fk 
    FOREIGN KEY (media_type_id) REFERENCES media_types(id);
   
-- Для таблицы communities users
-- Смотрим структуру таблицы
DESC communities_users;

-- Добавляем внешние ключи
ALTER TABLE communities_users
  ADD CONSTRAINT communities_users_user_id_fk 
    FOREIGN KEY (user_id) REFERENCES users(id),
  ADD CONSTRAINT communities_users_community_id_fk 
    FOREIGN KEY (community_id) REFERENCES communities(id);
   
-- Для таблицы friendship
-- Смотрим структуру таблицы
DESC friendship; 
   
ALTER TABLE friendship
  ADD CONSTRAINT friendship_user_id_fk 
    FOREIGN KEY (user_id) REFERENCES users(id)
	  ON DELETE CASCADE,
  ADD CONSTRAINT friendship_friend_id_fk 
    FOREIGN KEY (friend_id) REFERENCES users(id)
	  ON DELETE CASCADE,
  ADD CONSTRAINT friendship_status_id_fk 
    FOREIGN KEY (friendship_status_id) REFERENCES friendship_statuses(id)
      ON DELETE CASCADE;
      

-- Для таблицы posts
-- Смотрим структуру таблицы
DESC posts; 
   
ALTER TABLE posts
  ADD CONSTRAINT posts_user_id_fk 
    FOREIGN KEY (user_id) REFERENCES users(id),
  ADD CONSTRAINT posts_community_id_fk 
    FOREIGN KEY (community_id) REFERENCES communities(id)
	  ON DELETE CASCADE,
  ADD CONSTRAINT posts_media_id_fk 
    FOREIGN KEY (media_id) REFERENCES media(id)
	  ON DELETE SET NULL;

	 
-- Для таблицы likes
-- Смотрим структуру таблицы
DESC likes; 

ALTER TABLE likes
  ADD CONSTRAINT likes_user_id_fk 
    FOREIGN KEY (user_id) REFERENCES users(id),
  ADD CONSTRAINT likes_target_id_fk 
    FOREIGN KEY (target_id) REFERENCES users(id)
	  ON DELETE CASCADE;
--Задания на БД vk:
-- 1. Проанализировать какие запросы могут выполняться наиболее часто в процессе работы приложения и добавить необходимые индексы.
CREATE UNIQUE INDEX users_email_uq ON users(email);
CREATE INDEX users_name_surname_idx ON users(first_name, last_name);
CREATE INDEX profiles_birthday_idx ON profiles(birthday);
CREATE INDEX messages_from_user_id_to_user_id_idx ON messages(from_user_id, to_user_id);


-- 2.Задание на оконные функции
-- Построить запрос, который будет выводить следующие столбцы:
-- имя группы
-- среднее количество пользователей в группах (сумма количестива пользователей во всех группах делённая на количество групп)
-- самый молодой пользователь в группе (желательно вывести имя и фамилию)
-- самый старший пользователь в группе (желательно вывести имя и фамилию)
-- количество пользователей в группе
-- всего пользователей в системе (количество пользователей в таблице users)
-- отношение в процентах для последних двух значений (общее количество пользователей в группе / всего пользователей в системе) * 100


SELECT DISTINCT c.name, 
  COUNT(*) OVER() / (SELECT COUNT(*) FROM communities) AS 'среднее количество пользователей в группах',
  MAX(p.birthday) OVER w AS 'самый молодой пользователь в группе',
  MIN(p.birthday) OVER w AS 'самый старший пользователь в группе',
  COUNT(*) OVER w AS 'количество пользователей в группе',
  (SELECT COUNT(*) FROM profiles) AS 'всего пользователей в системе',
  COUNT(*) OVER w / (SELECT COUNT(*) FROM profiles) * 100 AS "%%"
    FROM communities AS c
     JOIN communities_users AS cu
       ON c.id = cu.community_id
     JOIN profiles AS p
       ON cu.user_id = p.user_id
       WINDOW w AS (PARTITION BY cu.community_id); 
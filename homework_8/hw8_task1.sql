-- 3.Определить кто больше поставил лайков (всего) - мужчины или женщины?

SELECT profiles.gender, COUNT(likes.user_id) AS total
  FROM likes
    LEFT JOIN profiles
      ON profiles.user_id = likes.user_id
  GROUP BY profiles.gender
  ORDER BY total DESC
  LIMIT 1;
 
 
SELECT 
  (SELECT gender from profiles WHERE user_id = likes.user_id) AS gender,
  COUNT(*) AS total
  FROM likes 
  GROUP BY gender
  ORDER BY total DESC
  LIMIT 1;

 
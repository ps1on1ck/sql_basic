-- 3.���������� ��� ������ �������� ������ (�����) - ������� ��� �������?

SELECT 
  (SELECT gender from profiles WHERE profiles.user_id = likes.user_id) AS gender,
  COUNT(*) AS 'Likes count'
    FROM likes 
    GROUP BY gender
    ORDER BY COUNT(*) DESC LIMIT 1;


/* 
Повысить итоговые баллы абитуриентов в таблице applicant на значения
дополнительных баллов (использовать запрос из предыдущего урока).
*/

UPDATE applicant
       INNER JOIN (
                    SELECT enrollee_id, IF(SUM(bonus) IS NULL, 0, SUM(bonus)) AS sum_bonus
                      FROM enrollee_achievement
                           INNER JOIN achievement USING(achievement_id)
                           INNER JOIN enrollee USING(enrollee_id)
                     WHERE bonus > 0 
                     GROUP BY enrollee_id
                   ) AS b USING(enrollee_id) 
   SET itog = itog + sum_bonus;


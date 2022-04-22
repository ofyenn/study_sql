/* 
Если студент совершал несколько попыток по одной и той же дисциплине, то вывести разницу в днях между первой и последней попыткой. В результат включить фамилию и имя студента, название дисциплины и вычисляемый столбец Интервал. Информацию вывести по возрастанию разницы. Студентов, сделавших одну попытку по дисциплине, не учитывать. 
*/

SELECT name_student, name_subject, DATEDIFF(date_attempt_max, date_attempt_min) AS Интервал
  FROM (
        SELECT 
               student_id,
               subject_id,
               MIN(date_attempt) AS date_attempt_min,
               MAX(date_attempt) AS date_attempt_max
          FROM attempt
         GROUP BY student_id, subject_id
        HAVING date_attempt_min <> date_attempt_max
        ) a
       INNER JOIN student USING (student_id)
       INNER JOIN subject USING (subject_id)
  ORDER BY Интервал

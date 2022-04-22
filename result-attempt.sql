/* 
Студент прошел тестирование (то есть все его ответы занесены в таблицу testing), далее необходимо вычислить результат и занести его в таблицу attempt для соответствующей попытки.  Результат попытки вычислить как количество правильных ответов, деленное на 3 (количество вопросов в каждой попытке) и умноженное на 100. Результат округлить до целого.
*/

UPDATE attempt 
       INNER JOIN (
                   SELECT attempt_id, ROUND(AVG(is_correct) * 100) AS result
                     FROM testing
                          INNER JOIN answer USING(answer_id)
                    WHERE attempt_id = 8
                    GROUP BY attempt_id
                   ) AS r
                    USING(attempt_id)
   SET attempt.result = r.result;

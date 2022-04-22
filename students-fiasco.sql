/* 
Вывести название образовательной программы и фамилию тех абитуриентов, которые подавали документы на эту образовательную программу, но не могут быть зачислены на нее. Эти абитуриенты имеют результат по одному или нескольким предметам ЕГЭ, необходимым для поступления на эту образовательную программу, меньше минимального балла. Информацию вывести в отсортированном сначала по программам, а потом по фамилиям абитуриентов виде.

Например, Баранов Павел по «Физике» набрал 41 балл, а  для образовательной программы «Прикладная механика» минимальный балл по этому предмету определен в 45 баллов. Следовательно, абитуриент на данную программу не может поступить.
*/

SELECT DISTINCT name_program, name_enrollee
  FROM enrollee
       INNER JOIN program_enrollee USING(enrollee_id)
       INNER JOIN program USING(program_id)
       INNER JOIN program_subject USING(program_id)
       INNER JOIN subject USING(subject_id)
       INNER JOIN enrollee_subject
           ON subject.subject_id = enrollee_subject.subject_id 
               AND enrollee_subject.enrollee_id = enrollee.enrollee_id
 WHERE program_subject.min_result > enrollee_subject.result
 ORDER BY name_program, name_enrollee

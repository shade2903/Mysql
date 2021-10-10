-- выборка данных
use test_db;

select name, bday
from users;

-- выборка всех столбцов
select * from users;
  
select name as username, id as user_id from users;

select * from users where id=2 or id=3;

select * from users where id between 2 and 4 order by bday desc; -- сортировка по убыванию

select name from users group by name;

-- добавление данных

insert into users(bday, name) 
values ('1994-11-05', 'Lera'), ('1994-05-15', 'Roma');

-- редактирование данных
update  users set name = 'Artsem', bday = '1998-05-06'
where id = 3;

-- удаление данных
delete from users where DATE_SUB(NOW(), INTERVAL 18 YEAR) <= bday; 


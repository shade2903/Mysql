use test2_db;

-- функции работы со строками
select length('hello');

select upper (first_name) from owners; 

-- оператор LIKE '%', '_'
-- % - строка любой длинны
-- _ - один символ
-- Example: LIKE 'a%s_'
-- ananas1 => true
-- ananan2 => false
-- anans33 => false

select * from cars where  model like 'm%';
select * from owners where last_name like '_a%';

-- функции работы с данными
select year (bday), month (bday), day(bday),
hour ('2023-12-02 12:53:55'),
minute ('2023-12-02 12:53:55'),
second ('2023-12-02 12:53:55')
from owners;

select car_id , owner_id , DATEDIFF (ifnull(owned_to, now()) , owned_form) from cars_owners;

select coalesce (null, owned_to , 'not defined')
from cars_owners;

select * from cars_owners where owned_to is not null;
select * from cars_owners co where owned_to is null 
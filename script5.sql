create procedure myProcedure(year int)
begin
end;

Delimiter $$

create function myFunc(year int)
returns varchar(50)
begin
end
$$


Select id, name, color
From users INNER JOIN cars ON users.id = cars.user_id
where name Lake 'Vasya';

declare name varchar(16);

SELECT user_name INTO name;


-- агригирующие функции 
select AVG(cost) FROM cars;


---
select name as userName

-- процедура

-- создание курсора
CREATE PROCEDURE test2_db.getOnersNames(inout `names` varchar(512))
begin
	declare firstName varchar(20);
    declare lastName varchar(20);
    declare flag int default 0;
	
	declare cur cursor for select first_name, last_name from owners; -- создание курсора
	
	declare continue handler for not found set flag = 1;   
	
	
	
	open cur; -- открываем курсор
	
	myloop: loop       -- цикл 
	
	fetch cur into firstName, lastName;    -- fetch вычитывает одну строку из 
	                                      -- временной таблицы и автоматически переходит 
	                                      -- к следующей
	if flag = 1 then 
	  leave myloop; -- аналог break
	end if; -- окончание исключения
	
	set `names` = concat(`names`, firstName, ' ', lastName, ';');
	
	end loop myloop; -- закрытие цикла
	
	close cur; -- закрытие курсора


END

-- объединение таблиц

use test2_db;

select cars.model, owned_form, owned_to
from cars left join cars_owners on cars.id = cars_owners.car_id;

select cars.model, owned_form, owned_to
from cars right join cars_owners on cars.id = cars_owners.car_id;


select cars.model, owned_form, owned_to
from cars inner join cars_owners on cars.id = cars_owners.car_id;

select cars.id, model, color, owned_form, 
owned_to, first_name, last_name 
from cars inner join cars_owners on 
cars.id = cars_owners.car_id 
inner join owners on owners.id = cars_owners.owner_id;

-- car.id, relise_date, gender 
-- для всех машин произведенных после 2015 года которыми сейчас кто-то владеет

select cars.id, relis_date, gender
from cars inner join cars_owners on cars.id = cars_owners.car_id
inner join owners on cars_owners.car_id =owners.id where year(relis_date) >= 2015 and owned_to is null;


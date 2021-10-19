-- транзакции 1
use test2_db;

start transaction;

insert into cars(model,relis_date,color)
values ('toyota', '1998-05-23', 'black');

set @last_id = last_insert_id(); 

insert into cars_owners(car_id, owner_id, owned_form)
values (@last_id,4,DATE(NOW()));

commit;

-- транзакции 2
use test2_db;
set autocommit = 0;

start transaction;

insert into cars(model,relis_date,color)
values ('reno', '2008-07-21', 'black');

set @last_id = last_insert_id(); 

insert into cars_owners(car_id, owner_id, owned_form)
values (@last_id,3,'DATE(NOW())');

rollback;

 -------

use test2_db;

select color, model, relis_date
from cars 
group by model, color
having year(max(relis_date)) < 2005;


use test2_db;

Delimiter $$

-- создание процедуры
create procedure getCarsReleased(yearFrom int, yearTo int)
begin
	select * from cars where year (relis_date) between yearFrom and yearTo;
end
$$

-- создание фукции
 create function calcByGender(gender varchar(20))
 returns int
 DETERMINISTIC
 begin 
	 declare num int default 0; 	 
	 select count(*) into num
	 
	from owners  where owners.gender like gender;
return num;
 end

 $$



 -------------------
 CREATE PROCEDURE test2_db.test(
color varchar(36), out `count` int)
begin
	select count(*) into `count`
    from cars where cars.color like `color`;
END
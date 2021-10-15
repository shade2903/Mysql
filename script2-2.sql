use test2_db;

-- вызов процедуры

call getCarsReleased(2005,2015);

-- вызов функции

select calcByGender('female');

---------------------
set @n=0;



call test('gold',@n);

select @n;

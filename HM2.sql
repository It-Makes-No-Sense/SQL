USE test_db;

DROP FUNCTION IF EXISTS StrNumbers;
DELIMITER //
create function StrNumbers(max_i int)
returns varchar(1000)
no sql
begin
	declare i int default 1;
    declare result varchar(1000) default '';
    while i <= max_i do
		if i%2 = 0 then
			set result = CONCAT(result,' ',i);
		end if;
        set i = i + 1;
	end while;
    return result;
end; //
DELIMITER ;

select StrNumbers(77)
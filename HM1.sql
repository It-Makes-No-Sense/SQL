USE test_db;

DROP FUNCTION IF EXISTS SecToTimes; 
DELIMITER // 
CREATE FUNCTION SecToTimes( seconds_input BIGINT) 
RETURNS VARCHAR(200) 
no sql
BEGIN 
  DECLARE Days INT; 
  DECLARE Minutes tinyint; 
  DECLARE Hours INT; 
  DECLARE Seconds tinyint; 

  SET Hours = HOUR(SEC_TO_TIME(seconds_input))%24; 
  SET Minutes = MINUTE(SEC_TO_TIME(seconds_input)); 
  SET Seconds = SECOND(SEC_TO_TIME(seconds_input)); 
  SET Days = FLOOR(HOUR(SEC_TO_TIME(seconds_input))/24); 

  RETURN (select CONCAT(Days,' days ',Hours,' hours ',Minutes,' minutes ',Seconds,' seconds'));

END //
DELIMITER ; 

select SecToTimes(1000000)
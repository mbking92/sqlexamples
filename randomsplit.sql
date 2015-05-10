DROP PROCEDURE IF EXISTS SP_SPLIT;

CREATE PROCEDURE sp_split (In seedsize double)
BEGIN
 
 DECLARE done INT DEFAULT FALSE;
 DECLARE F_Name Varchar(40);
 DECLARE L_Name Varchar(20);
 DECLARE rnd double;
 DECLARE cur1 CURSOR FOR SELECT FirstName, LastName FROM chinook.customer;
 DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

Drop Table IF Exists temp_training,temp_test;
Create TEMPORARY Table temp_training(F_Name Varchar(40), L_Name Varchar(20), rnd double);
Drop Table IF Exists temp_table;
Create TEMPORARY Table temp_test(F_Name Varchar(40), L_Name Varchar(20), rnd double);

OPEN cur1;
r_loop: LOOP
Set rnd=rand();

FETCH cur1 INTO F_name, L_name;
  If Done Then
    Leave r_loop;
  End if;
  If rnd < seedsize Then
  Insert Into temp_training Values(F_Name,L_Name,rnd);
  Else
  Insert Into temp_test Values(F_name,L_Name,rnd);
  End if;
END LOOP;

CLOSE cur1;
	
END;

DROP trigger if exists tr_ins_id_manage_emp;
DROP trigger if exists tr_up_id_manage_emp;


 DELIMITER $$

     CREATE trigger tr_ins_id_manage_emp
     after insert on employees
     for each row
     BEGIN
         if (JOB = 'Manager') THEN
             update branchs SET MANAGER_ID = ID WHERE ID = BARNCH_ID;
         END if;
         END$$


     CREATE trigger tr_up_id_manage_emp
     after insert on employees
     for each row
     BEGIN
         if (JOB = 'Manager') THEN
             update branchs SET MANAGER_ID = ID WHERE ID = BARNCH_ID;
         END if;
         END$$



 DELIMITER;

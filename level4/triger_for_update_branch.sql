DROP trigger if exists tr_ins_id_manage1;
DROP trigger if exists tr_up_id_manage1;


 DELIMITER $$

     CREATE trigger tr_ins_id_manage1
     after insert on branchs
     for each row
     BEGIN
        update employees SET ID = MANAGER_ID WHERE ID = BARNCH_ID;
     END$$


     CREATE trigger tr_ins_up_manage1
     after insert on branchs
     for each row
     BEGIN
         update employees SET ID = MANAGER_ID WHERE ID = BARNCH_ID;
     END$$

 DELIMITER;

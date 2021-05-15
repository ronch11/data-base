DROP trigger if exists tr_ins_stock;
DROP trigger if exists tr_up_stock;


 DELIMITER $$

     CREATE trigger tr_ins_stock
     before insert on shareholder
     for each row
        BEGIN
             if(COUNT(STOCK) < 2*max(STOCK) ) THEN
                 set NEW.ID=ID, NEW.STOCK=STOCK, NEW.NAME=NAME, NEW.EMAIL=EMAIL;
             END if;
        END$$

    CREATE trigger tr_up_stock
    before update on shareholder
    for each row
        BEGIN
             if(COUNT(STOCK) < 2*max(STOCK) ) THEN
                 set NEW.ID=ID, NEW.STOCK=STOCK, NEW.NAME=NAME, NEW.EMAIL=EMAIL;
             END if;
        END$$




 DELIMITER;

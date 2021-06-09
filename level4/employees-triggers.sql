DROP trigger if exists tr_ins_employee;
DROP trigger if exists tr_up_employee;

DELIMITER $$

CREATE trigger tr_ins_employee
    before insert
    on employees
    for each row
BEGIN
    if NEW.EMAIL NOT REGEXP '.*@.*\..{1,6}' then
        SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Email not in format';
    end if;
END$$


CREATE trigger tr_up_employee
    before update
    on employees
    for each row
BEGIN
    if NEW.EMAIL NOT REGEXP '.*@.*\..{1,6}' then
        SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Email not in format';
    end if;
END$$

DELIMITER;

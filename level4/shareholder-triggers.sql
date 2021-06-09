DROP trigger if exists tr_ins_shareholder;
DROP trigger if exists tr_up_shareholder;

DELIMITER $$

CREATE trigger tr_ins_shareholder
    before insert
    on shareholder
    for each row
BEGIN
    if NEW.EMAIL NOT REGEXP '.*@.*\..{1,6}' then
        SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Email not in format';
    end if;
END$$


CREATE trigger tr_up_shareholder
    before update
    on shareholder
    for each row
BEGIN
    if NEW.EMAIL NOT REGEXP '.*@.*\..{1,6}' then
        SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Email not in format';
    end if;
END$$

DELIMITER;

CREATE procedure buyProductFromBranch(barcode varchar(25), amount float, branchId int)
# Apply customer product buying.
BEGIN
    DECLARE current_amount float;
    DECLARE price float;

    set current_amount := (select amount_in_stock
                           from product_in_branch pib
                           where pib.product_barcode = barcode
                             and pib.branch_id = branch_id);

    if current_amount < amount then
        SIGNAL SQLSTATE '01000'
            set MESSAGE_TEXT = 'There are not enough amount';
    else
        # Reduce amount bought
        update product_in_branch pib
        set pib.amount_in_stock=pib.amount_in_stock - amount
        where pib.product_barcode = barcode
          and pib.branch_id = branchId;

        set price := (select price from product p where p.barcode = barcode);
        # Increase income of branch
        update branchs b
        set b.REVENUE=b.REVENUE + price * amount
        where b.ID = branchId;
    end if;

END;

DELIMITER ;
create procedure addProductsToBranch(IN barcode varchar(25), IN amount float,
                                                                 IN price float, IN branchId int, IN datee date)
BEGIN
    # Insert new product amount, or if exist -> add amount.
    insert into product_in_branch(product_barcode, branch_id, amount_in_stock)
    values (barcode, branchId, amount)
    on duplicate key update amount_in_stock=amount_in_stock + amount;

    # Insert new outcome.
    insert into manufacturer_expenses(manufacturer_id, date_of_expenses, expenses)
    values ((select manufacturld from product p where p.barcode = barcode), datee, price);
    commit;
END;

CREATE procedure addProductsToBranch(barcode varchar(25), amount float, price float, branchId int, datee DATE)
# Add product amount that bought to the branch and add new outcome to manufacturer_expenses.
BEGIN
    # Insert new product amount, or if exist -> add amount.
    insert into product_in_branch(product_barcode, branch_id, amount_in_stock)
    values (barcode, branchId, amount)
    on duplicate key update amount_in_stock=amount_in_stock + amount;

    # Insert new outcome.
    insert into manufacturer_expenses(manufacturer_id, date_of_expenses, expenses)
    values ((select manufacturer_id from product p where p.barcode = barcode), datee, price);
END;

DELIMITER ;
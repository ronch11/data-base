# All products that almost out of stock.
select product_in_branch.product_barcode,
       product.name,
       product_in_branch.branch_id,
       M.name as manufaurer_name,
       C.country_name,
       product_in_branch
from product join product_in_branch
join  Manufacturer M on product.manufacturld = M.id
join Country C on M.countryid = C.id
where product_in_branch.amount_in_stock <= :min_amount;




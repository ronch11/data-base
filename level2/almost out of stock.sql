# All products that almost out of stock.
select product.barcode,
       product.name,
       M.name as manufaurer_name,
       C.country_name,
       product.AmountInStock
from product
join  Manufacturer M on product.manufacturld = M.id
join Country C on M.countryid = C.id
where AmountInStock <= :min_amount;



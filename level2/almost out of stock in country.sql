# All products that almost out of stock from a specific country.
select product.barcode,
       product.name,
       M.name as manufaurer_name,
       M.country_name,
       product.AmountInStock
from product
         join (select Manufacturer.id, Manufacturer.name, C.country_name
               from Manufacturer
                        join Country C on Manufacturer.countryid = C.id
               where country_name = :country_name) M on product.manufacturld = M.id
where AmountInStock <= :min_amount;



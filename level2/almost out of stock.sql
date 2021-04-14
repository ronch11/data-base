# All products that almost out of stock from a specific country.
set @country_name := 'GB';
set @min_amount := 2;
select product.*
from product
         join (select Manufacturer.id
               from Manufacturer
                        join Country C on Manufacturer.countryid = C.id
               where country_name = @country_name) M on product.manufacturld = M.id
where AmountInStock <= @min_amount;
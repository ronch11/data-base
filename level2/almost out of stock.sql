# All products that almost out of stock from a specific country.
set @country_name := 'GB';
select product.*
from product
         join (select Manufacturer.id
               from Manufacturer
                        join Country C on Manufacturer.countryid = C.id
               where country_name = @country_name) M on product.manufacturld = M.id
where AmountInStock <= 2;
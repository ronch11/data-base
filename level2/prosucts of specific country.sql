select product.name,
       description
from product
         join Manufacturer M on product.manufacturld = M.id
         join (select * from Country where country_name = :country_name) C on M.countryid = C.id;


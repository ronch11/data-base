select name, max(Cmanu) as count_of_product
from (select Manufacturer.name as name, count(Manufacturer.id) as Cmanu
      from product join Manufacturer on product.manufacturld = Manufacturer.id
      group by Manufacturer.id) manu



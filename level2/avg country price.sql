# Average product price for each country
select C.country_name, round(avg(product.ItemPrice), 2) as average_price
from product
         join Manufacturer M on product.manufacturld = M.id
         join Country C on M.countryid = C.id
group by C.id, C.country_name;
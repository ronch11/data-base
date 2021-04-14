select Country.id as id, Country.country_name, count(Country.id) as product_cnt
from product
         join Manufacturer on product.manufacturld = Manufacturer.id
         join Country
         join Country C on Manufacturer.countryid = C.id
group by Manufacturer.id
order by product_cnt desc
limit 1



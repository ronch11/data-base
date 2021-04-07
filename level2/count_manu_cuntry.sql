select country_name, max(count) as count_of_product
from (select country_name, count(Country.id) as count
     from product join Manufacturer on product.manufacturld = Manufacturer.id
     join Country  on Country.id = Manufacturer.countryid
     group by countryid desc) cx


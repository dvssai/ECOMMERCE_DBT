with src_sellers as (
   Select * from {{ref('stg_sellers')}}
)

Select 
    seller_id,
    zipcode,
    seller_city,
    seller_state
from src_sellers
where seller_id is not null and zipcode is not null
qualify row_number() over (partition by seller_id,zipcode order by seller_id) = 1
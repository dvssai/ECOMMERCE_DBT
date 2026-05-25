with src_geolocation as (
    SELECT * FROM {{source('Ecommerce', 'r_geolocation')}}
)

Select TRIM(REPLACE(zip_code,'"',' ')) as zip_code,
geolocation_lat as geolocation_lat,
geolocation_lng as geolocation_lng,
city ,state
from src_geolocation
with snap_customers as (
    select * from {{ ref('snap_customers') }}
)
select surrogate_key Customer_sk,
customerid,
customeruniqueid,
zipcode,
city,Dbt_Valid_From as  valid_from
,Dbt_Valid_To as valid_upto, 
CASE
    When valid_upto IS NULL then 'YES'
    else 'NO'
end as is_current
from snap_customers
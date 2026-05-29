with dim_products as (
    Select * from {{ref('Int_products')}}
)

Select Product_id,product_category_name_english,product_category_name,product_weight,
CASE
      WHEN product_weight < 250 THEN 'Very Light'
      WHEN product_weight < 1000 THEN 'Light'
      WHEN product_weight < 5000 THEN 'Medium'
      ELSE 'Heavy'
    END AS weight_category
from dim_products
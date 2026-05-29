with dim_sellers as (
    Select * from {{ref('Int_sellers')}}
)

Select * from  dim_sellers
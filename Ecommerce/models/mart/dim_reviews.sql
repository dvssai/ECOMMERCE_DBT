with dim_reviews as (
    Select * from {{ref('Int_reviews')}}
)

Select review_id,order_id,review_score,title,
comment,review_date,response_date,
CASE
    WHEN review_score >= 4 THEN 'Positive'
    WHEN review_score = 3 THEN 'Neutral'
    ELSE 'Negative'
END AS review_sentiment,
Datediff(day,review_date,response_date) as response_time_days
from dim_reviews
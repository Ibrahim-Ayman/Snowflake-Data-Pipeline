WITH needed_dates
AS 
(
    SELECT DISTINCT(order_date) AS date
    FROM {{ ref('stg_orders')}}
)

SELECT  TO_CHAR(date , 'YYYYMMDD') AS date_id , 
        date , 
        YEAR(date) AS year , 
        MONTH(date) AS month , 
        MONTHNAME(date) AS month_name , 
        DAY(date) AS day , 
        DAYNAME(date) AS day_name , 
        QUARTER(date) AS quarter , 
        WEEK(date) AS week , 
        DAYOFMONTH(date) as day_of_month ,
        DAYOFWEEK(date) AS day_of_week , 
        DAYOFYEAR(date) AS day_of_year 
FROM needed_dates
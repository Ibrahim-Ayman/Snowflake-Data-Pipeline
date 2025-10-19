SELECT  customer_id , 
        cust_name , 
        cust_email , 
        country
FROM {{ ref('stg_customer')}}
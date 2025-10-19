SELECT  ID AS customer_id , 
        NAME AS cust_name , 
        EMAIL AS cust_email , 
        country
FROM {{ source('raw_data' , 'customers')}}

{% if var('is_test_run', default=true) %}

limit 20

{% endif %}
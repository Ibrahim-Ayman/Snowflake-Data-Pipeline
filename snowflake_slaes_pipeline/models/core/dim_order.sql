SELECT  order_id , 
        total_amount , 
        customer_id ,
        order_date ,
        status as order_status
FROM {{ ref('stg_orders')}} 
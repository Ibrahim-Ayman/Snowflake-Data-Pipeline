SELECT  ordItem_id AS transaction_id , 
        order_id , 
        product_id ,
        quantity , 
        unit_price ,
        quantity * unit_price AS total_amount 
FROM {{ ref('stg_order_items' )}}
WITH 
order_items AS
(
SELECT  transaction_id , 
        order_id , 
        product_id ,
        quantity , 
        unit_price ,
        quantity * unit_price AS total_amount 
FROM {{ ref('dim_order_transactions') }}
) ,
orders AS
(
    SELECT  order_id ,
            customer_id , 
            order_date
    FROM {{ ref('dim_order') }}
) ,
customer AS 
(
    SELECT  customer_id 
    FROM {{ ref('dim_customer')}}
) , 
product AS 
(
    SELECT  product_id 
    FROM {{ ref('dim_product') }}
) ,
date AS 
(
    SELECT  date_id , 
            date
    FROM {{ ref('dim_date') }}
)

SELECT  ot.transaction_id ,
        o.order_id ,
        p.product_id , 
        c.customer_id , 
        d.date_id , 
        ot.quantity , 
        ot.unit_price , 
        ot.total_amount
FROM order_items ot
INNER JOIN orders o
ON ot.order_id = o.order_id 
INNER JOIN customer c
ON o.customer_id = c.customer_id
INNER JOIN product p 
ON ot.product_id = p.product_id
INNER JOIN date d 
ON d.date = o.order_date
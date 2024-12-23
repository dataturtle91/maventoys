-- Maven Toys: Total income per store city

WITH sales_total AS
(
SELECT
    sa.Sale_ID
    ,sa.Date
    ,st.Store_City
    ,sa.Product_ID
    ,prod.Product_Name
    ,prod.Product_Price * Units AS income

FROM 
    sales AS sa
    
LEFT JOIN vw_products AS prod

ON sa.Product_ID = prod.Product_ID

LEFT JOIN stores AS st

ON sa.Store_ID = st.Store_ID
)

SELECT
    store_city
    ,ROUND(sum(income)) AS income
FROM
    sales_total
GROUP BY
    store_city
ORDER BY
    income DESC;

with 
emp_ord as (select e.employee_id ,e.first_name , e.last_name , o.order_id from employees e ,orders o where e.employee_id=o.salesman_id),
ordit_pro as (select oi.order_id , oi.product_id from order_items oi where exists (select * from products p where oi.product_id =p.product_id)),
wh_inv as (select w.warehouse_id , w.warehouse_name , i.product_id from warehouses w , inventories i where w.warehouse_id=i.warehouse_id),
emp_pro as (select emp_ord.employee_id, emp_ord.first_name ,emp_ord.last_name ,ordit_pro.product_id from emp_ord , ordit_pro where emp_ord.order_id=ordit_pro.order_id)
select emp_pro.employee_id, emp_pro.first_name, emp_pro.last_name , wh_inv.warehouse_id , wh_inv.warehouse_name ,count(wh_inv.product_id) 
from emp_pro,wh_inv 
where emp_pro.product_id=wh_inv.product_id 
group by emp_pro.employee_id, emp_pro.first_name, emp_pro.last_name , wh_inv.warehouse_id , wh_inv.warehouse_name;
select * from employees e ,orders o where  e.employee_id=o.salesman_id;
select * from order_items oi,products p where oi.order_id=p.product_id;
SELECT
    employee_id,
    first_name,
    last_name
FROM
    employees
WHERE
    employee_id IN(
        SELECT
            salesman_id
        FROM
            orders
        INNER JOIN order_items
                USING(order_id)
        WHERE
            status = 'Shipped'
        GROUP BY
            salesman_id,
            EXTRACT(
                YEAR
            FROM
                order_date
            )
        HAVING
            SUM( quantity * unit_price )  >= 1000000  
            AND EXTRACT(
                YEAR
            FROM
                order_date) = 2017
            AND salesman_id IS NOT NULL
    )
ORDER BY
    first_name,
    last_name;

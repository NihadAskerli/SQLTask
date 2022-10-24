select e.ename,e.job,e.mgr ,n.ename,n.job,n.mgr from emp e inner join emp n on n.sal<e.sal where n.empno=e.mgr; 
--hansi isci oz menegerinden cox maas alir
select i.warehouse_id, sum(quantity * (select list_price from products p where i.product_id=p.product_id)) 
from inventories i group by i.warehouse_id  ;
--her anbara ne qeder pul gelir

select inventories.warehouse_id,sum(quantity*list_price) cem from inventories inner join products using (product_id) 
group  by inventories.warehouse_id order by inventories.warehouse_id;  

with k as (select inventories.warehouse_id,sum(quantity*list_price) cem from inventories inner join products using (product_id) 
group  by inventories.warehouse_id order by inventories.warehouse_id)
select warehouse_name,cem from k inner join warehouses  using (warehouse_id);
-- adlari ile

select employees.first_name,inventories.warehouse_id,inventories.quantity FROM employees 
inner join orders on employees.employee_id=orders.salesman_id  
inner join order_items on orders.order_id=order_items.order_id 
inner join inventories on order_items.product_id = inventories.product_id 
group by employees.first_name, inventories.warehouse_id , inventories.quantity order by inventories.warehouse_id;
select * from order_items;
select * from products;
select * from orders;
select * from inventories;
select * from warehouses;
select * from employees;














select employees.first_name,products.product_name FROM employees 
inner join orders on employees.employee_id=orders.salesman_id  
inner join order_items on orders.order_id=order_items.order_id 
inner join products on order_items.product_id=products.product_id;

select  next_day(to_date('24-09-22','DD-MM-YYYY')+(level*6+1), 'saturday') as Monday  from dual connect by level<5;












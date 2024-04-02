DROP DATABASE ankush;


create database ankush;
show databases;

use ankush;
create table agentcommission (
	agent_code varchar(10) primary key,
	f_name varchar(25),
	l_name varchar(25),
	city varchar(25),
	commission int,
	mobile_no varchar(25)
);



create table customer_details (
Customer_ID int primary key,
Customer_Name varchar(25),
Customer_City varchar(25),
Agent_code varchar(25),
order_date date
);


insert into agentcommission (agent_code, f_name, l_name, city, commission, mobile_no)
values
	(1, 'MANTHAN', 'KOLI', 'DELHI', 12000, '9898454545'),
    (2, 'VIRAT', 'DIXIT', 'JAIPUR', 12150, '9696123240'),
    (3, 'AKSHAY', 'DESHMUKH', 'MUMBAI', 1500, '8787987810'),
    (4, 'SANKET', 'KUMAR', 'CHANDIGARH', 120, '8789878980'),
    (5, 'GAURAV' ,'DESAI' ,'CHENAI' , 13020, '9698989560'),
    (6, 'SAI', 'JAIN', 'SHIMLA', 65650, '7875747971');
    
    insert into customer_details(Customer_ID, Customer_Name, Customer_City, Agent_code, order_date)
    values
		(101, 'NICK RIMANDO', 'NEW YORK', 2, '2009-01-13'),
        (102, 'BRAD DAVIS', 'NEW YORK', 1, '2010-03-05'),
        (103, 'GRAHAM ZUSI', 'CALIFORNIA', 5, '2010-07-20'),
        (104, 'JULIAN GREEN', 'LONDON', 8, '2010-04-10'),
        (105, 'FABIAN JOHNSON', 'PARIS', 9, '2010-08-28'),
        (106, 'GEOFF CAMERON', 'BERLIN', 5, '2010-05-15');
        
select * from agentcommission
where city = 'DELHI';

select * from agentcommission;


select * from agentcommission 
where commission > 15000;

select * from agentcommission 
where city = 'MUMBAI';

select * from agentcommission
where agent_code = 4;

select city from agentcommission
order by f_name;

select * from agentcommission 
limit 3;

select count('city') as numberofcities from agentcommission;

select min(commission) as minimumcommission from agentcommission;

select sum(commission) as total_commission from agentcommission;

select avg(commission) as avg_commission from agentcommission;

select city, count(agent_code) as agentcount from agentcommission
group by city;

select * from customer_details;

select * from customer_details
where order_date > '2010-01-01';

select concat(f_name, ' ', l_name) as FullName from agentcommission;

update agentcommission
set city = 'HARYANA'
WHERE agent_code = '4' and city = 'CHANDIGARH';

create table orders (
	orderid int primary key,
    ordernumber varchar(25),
    personalid int 
);
drop table orders;


select 
AC.agent_code,
AC.f_name,
AC.l_name,
AC.city as agent_city,
AC.commission,
AC.mobile_no,
CD.Customer_ID,
CD.Customer_Name,
CD.Customer_City AS customer_city,
CD.Agent_code,
CD.order_date
from
	agentcommission AC
LEFT JOIN 
	customer_details CD on AC.agent_code = CD.Agent_code;
    
    select 
AC.agent_code,
AC.f_name,
AC.l_name,
AC.city as agent_city,
AC.commission,
AC.mobile_no,
CD.Customer_ID,
CD.Customer_Name,
CD.Customer_City AS customer_city,
CD.Agent_code,
CD.order_date
from
	agentcommission AC
RIGHT JOIN 
	customer_details CD on AC.agent_code = CD.Agent_code;
    
    select 
AC.agent_code,
AC.f_name,
AC.l_name,
AC.city as agent_city,
AC.commission,
AC.mobile_no,
CD.Customer_ID,
CD.Customer_Name,
CD.Customer_City AS customer_city,
CD.Agent_code,
CD.order_date
from
	agentcommission AC
INNER JOIN 
	customer_details CD on AC.agent_code = CD.Agent_code;
    
    
SELECT 
    agent_code,
    f_name,
    l_name,
    city,
    commission,
    mobile_no,
    NULL AS Customer_ID,  -- Add NULL placeholders for columns not present in the agentcommission table
    NULL AS Customer_Name,
    NULL AS Customer_City,
    NULL AS order_date
FROM 
    agentcommission

UNION

SELECT 
    NULL AS agent_code,  -- Add NULL placeholders for columns not present in the customer_details table
    NULL AS f_name,
    NULL AS l_name,
    NULL AS city,
    NULL AS commission,
    NULL AS mobile_no,
    Customer_ID,
    Customer_Name,
    Customer_City,
    order_date
FROM 
    customer_details;
    
SELECT 
    commission
FROM 
    agentcommission
GROUP BY 
    commission
HAVING 
    COUNT(*) = 1;
    
    SELECT 
    agent_code,
    f_name,
    l_name,
    city,
    commission,
    mobile_no,
    ROW_NUMBER() OVER (PARTITION BY city ORDER BY commission DESC) AS row_num
FROM 
    agentcommission;

select 
	agent_code,
    f_name,
    l_name,
    city,
    commission,
    mobile_no,
	case 
		when commission > 12000 and agent_code = '1' then 'commission > 12000 and agent_code = 1'
		else 'not applicable'
        end as commission_details
	from agentcommission
    where commission > 12000 and agent_code = '1';
    
    select f_name,commission, commission*100/sum(commission) over() as pctcommission from agentcommission;
    
    use ankush;
    select 
		agent_code, 
        f_name,
        commission,
        Rank() over(order by commission desc) as rank_by_commission 
	from 
		agentcommission;
        
select * from agentcommission;

SELECT *
FROM agentcommission
WHERE city LIKE 'DEL%';

SELECT *
FROM agentcommission
WHERE f_name LIKE 'GAU%'; 

SELECT *
FROM agentcommission
WHERE city IN ('DELHI', 'JAIPUR', 'MUMBAI');

CREATE TEMPORARY TABLE sales_sum (
    product_name VARCHAR(50),
    total_sales DECIMAL(10, 2),
    avg_unit_price DECIMAL(10, 2),
    total_units_sold INT
);


INSERT INTO sales_sum (product_name, total_sales, avg_unit_price, total_units_sold)
VALUES
    ('Product A', 1500.00, 50.00, 30),
    ('Product B', 2500.00, 100.00, 25),
    ('Product C', 3000.00, 75.00, 40),
    ('Product D', 2000.00, 80.00, 25);
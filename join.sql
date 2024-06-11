SELECT *
FROM orders

select *
from accounts

select *
from web_events

select *
from sales_reps


SELECT orders.*
FROM orders
JOIN accounts
ON orders.account_id = accounts.id;

SELECT accounts.name, orders.occurred_at
FROM orders
JOIN accounts
ON orders.account_id = accounts.id;

SELECT *
FROM orders
JOIN accounts
ON orders.account_id = accounts.id;

SELECT orders.*, accounts.*
FROM accounts
JOIN orders
ON accounts.id = orders.account_id;

SELECT orders.standard_qty, orders.gloss_qty, 
          orders.poster_qty,  accounts.website, 
          accounts.primary_poc
FROM orders
JOIN accounts
ON orders.account_id = accounts.id

SELECT web_events.channel, accounts.name, orders.total
FROM web_events
JOIN accounts
ON web_events.account_id = accounts.id
JOIN orders
ON accounts.id = orders.account_id


select a.primary_poc , w.occurred_at, w.channel , a."name" 
from web_events w
join accounts a 
on w.account_id = a.id 
where a."name" = 'Walmart'

select r."name" region , sr."name" sales_name, sr.id, a."name" account_name 
from accounts a 
join sales_reps sr 
on a.sales_rep_id  = sr.id
join region r 
on sr.region_id = r.id 
order by sr.id 

SELECT r.name region, s.name rep, s.id, a.name account
FROM sales_reps s
JOIN region r
ON s.region_id = r.id
JOIN accounts a
ON a.sales_rep_id = s.id
ORDER BY s.id;

SELECT r.name region , a.name account, 
           o.total_amt_usd/(o.total + 0.01) unit_price
FROM region r
JOIN sales_reps s
ON s.region_id = r.id
JOIN accounts a
ON a.sales_rep_id = s.id
JOIN orders o
ON o.account_id = a.id;

select r."name" region , a."name" account , o.total_amt_usd /(o.total + 0.01) unit_price
from orders o 
join accounts a 
on a.id = o.account_id
join sales_reps sr 
on a.sales_rep_id = sr.id
join region r 
on sr.region_id = r.id 

select a.id, a."name", o.total 
from orders o 
left join accounts a 
on o.account_id  = a.id 

select a.id, a."name", o.total 
from orders o 
right join accounts a 
on o.account_id  = a.id 

select *
from country

select *
from state


SELECT c.countryid, c.countryName, s.stateName
FROM Country c
left JOIN State s
ON c.countryid = s.countryid;

--Provide a table that provides the region for each sales_rep along with their associated accounts. 
--This time only for the Midwest region. Your final table should include three columns: the region name, 
--the sales rep name, and the account name. Sort the accounts alphabetically (A-Z) according to account name.
SELECT r.name region, s.name rep, a.name account
FROM sales_reps s
JOIN region r
ON s.region_id = r.id
JOIN accounts a
ON a.sales_rep_id = s.id
WHERE r.name = 'Midwest'
ORDER BY a.name;

select r.name region_name, sr.name sales_name, a.name account_name
from accounts a 
join sales_reps sr 
on sr.id = a.sales_rep_id 
join region r 
on r.id = sr.region_id 
where r.name = 'Midwest'
order BY a.name;

--Provide a table that provides the region for each sales_rep along with their associated accounts.
--This time only for accounts where the sales rep has a first name starting with S and in the Midwest region.
--Your final table should include three columns: the region name, the sales rep name, and the account name.
--Sort the accounts alphabetically (A-Z) according to account name
SELECT r.name region, s.name rep, a.name account
FROM sales_reps s
JOIN region r
ON s.region_id = r.id
JOIN accounts a
ON a.sales_rep_id = s.id
WHERE r.name = 'Midwest' AND s.name LIKE 'S%'
ORDER BY a.name;

select r.name region_name, sr.name sales_name, a.name account_name
from accounts a 
join sales_reps sr 
on sr.id = a.sales_rep_id 
join region r 
on r.id = sr.region_id 
WHERE r.name = 'Midwest' AND sr.name LIKE 'S%'
order BY a.name;

--Provide a table that provides the region for each sales_rep along with their associated accounts.
--This time only for accounts where the sales rep has a last name starting with K and in the Midwest region.
--Your final table should include three columns: the region name, the sales rep name, and the account name.
--Sort the accounts alphabetically (A-Z) according to account name.
SELECT r.name region, s.name rep, a.name account
FROM sales_reps s
JOIN region r
ON s.region_id = r.id
JOIN accounts a
ON a.sales_rep_id = s.id
WHERE r.name = 'Midwest' AND s.name LIKE '% K%'
ORDER BY a.name;

select r.name region_name, sr.name sales_name, a.name account_name
from accounts a 
join sales_reps sr 
on sr.id = a.sales_rep_id 
join region r 
on r.id = sr.region_id 
WHERE r.name = 'Midwest' AND sr.name LIKE '% K%'
order BY a.name;

--Provide the name for each region for every order, as well as the account name and the unit price they paid (total_amt_usd/total) for the order. 
--However, you should only provide the results if the standard order quantity exceeds 100.
--Your final table should have 3 columns: region name, account name, and unit price.
SELECT r.name region, a.name account, o.total_amt_usd/(o.total + 0.01) unit_price, o.total_amt_usd, o.total 
FROM region r
JOIN sales_reps s
ON s.region_id = r.id
JOIN accounts a
ON a.sales_rep_id = s.id
JOIN orders o
ON o.account_id = a.id
WHERE o.standard_qty > 100;

select r.name region, a.name account, o.total_amt_usd/(o.total + 0.01) unit_price
from orders o 
join accounts a 
on o.account_id = a.id 
join sales_reps sr 
on a.sales_rep_id = sr.id 
join region r 
on sr.region_id = r.id 
WHERE o.standard_qty > 100;

--Provide the name for each region for every order, as well as the account name and the unit price they paid (total_amt_usd/total) for the order.
--However, you should only provide the results if the standard order quantity exceeds 100 and the poster order quantity exceeds 50.
--Your final table should have 3 columns: region name, account name, and unit price. Sort for the smallest unit price first.
SELECT r.name region, a.name account, o.total_amt_usd/(o.total + 0.01) unit_price
FROM region r
JOIN sales_reps s
ON s.region_id = r.id
JOIN accounts a
ON a.sales_rep_id = s.id
JOIN orders o
ON o.account_id = a.id
WHERE o.standard_qty > 100 AND o.poster_qty > 50
ORDER BY unit_price;

select r.name region, a.name account, o.total_amt_usd/(o.total + 0.01) unit_price
from orders o 
join accounts a 
on o.account_id = a.id 
join sales_reps sr 
on a.sales_rep_id = sr.id 
join region r 
on sr.region_id = r.id 
WHERE o.standard_qty > 100 AND o.poster_qty > 50
ORDER BY unit_price;

--Provide the name for each region for every order, as well as the account name and the unit price they paid (total_amt_usd/total) for the order. -
--However, you should only provide the results if the standard order quantity exceeds 100 and the poster order quantity exceeds 50.
--Your final table should have 3 columns: region name, account name, and unit price. Sort for the largest unit price first.
SELECT r.name region, a.name account, o.total_amt_usd/(o.total + 0.01) unit_price
FROM region r
JOIN sales_reps s
ON s.region_id = r.id
JOIN accounts a
ON a.sales_rep_id = s.id
JOIN orders o
ON o.account_id = a.id
WHERE o.standard_qty > 100 AND o.poster_qty > 50
ORDER BY unit_price DESC;

--What are the different channels used by account id 1001? Your final table should have only 2 columns: account name and the different channels.
--You can try SELECT DISTINCT to narrow down the results to only the unique values.
SELECT DISTINCT a.name, w.channel
FROM accounts a
JOIN web_events w
ON a.id = w.account_id
WHERE a.id = '1001';

--Find all the orders that occurred in 2015.
--Your final table should have 4 columns: occurred_at, account name, order total, and order total_amt_usd.
SELECT o.occurred_at, a.name, o.total, o.total_amt_usd
FROM accounts a
JOIN orders o
ON o.account_id = a.id
WHERE o.occurred_at BETWEEN '01-01-2015' AND '01-01-2016'
ORDER BY o.occurred_at DESC;

SELECT o.occurred_at, a.name, o.total, o.total_amt_usd
FROM orders o
JOIN accounts a 
ON o.account_id = a.id
WHERE o.occurred_at BETWEEN '01-01-2015' AND '01-01-2016'
ORDER BY o.occurred_at DESC;

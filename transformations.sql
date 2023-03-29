/****************** Extract and Stage *********************/
-- Get data from public DB
SELECT *
FROM public.sales_data_mod;

-- Last data in sales core DWH
SELECT MAX(transaction_id)
FROM sales.sales_data;

-- Get new data
SELECT *
FROM staging.sales_data
WHERE transaction_id > ${last_data};
/* ${last_data} is defined in Pentaho Data Integration*/

/******************* Transform and Load *******************/
-- Payment option
SELECT DISTINCT payment_option
FROM staging.sales_data;

-- Customers
SELECT DISTINCT customer,
	customer_age,
	customer_gender,
	state
FROM staging.sales_data;

-- Products
SELECT DISTINCT Product_category, 
	Sub_Category
FROM staging.sales_data;

-- Sales person
SELECT DISTINCT sales_person
FROM staging.sales_data;

-- Facts data
SELECT sd.transaction_id,
	sd.date,
	sp.id AS sales_person_id,
	pr.id AS product_id,
	p.id AS payment_id,
	c.id AS customer_id,
	sd.quantity,
	sd.unit_cost,
	sd.unit_price,
FROM staging.sales_data AS sd
LEFT JOIN sales.sales_person AS sp
ON sp.name = sd.sales_person
LEFT JOIN sales.products AS pr
ON (pr.category = sd.product_category) AND (pr.sub_category = sd.sub_category)
LEFT JOIN sales.payment AS p
ON p.mode = sd.payment_option
LEFT JOIN sales.customers AS c
ON (c.customer = sd.customer) AND (c.age = sd.customer_age) AND (c.gender = sd.customer_gender) AND (c.state = sd.state);
--calculations for total cost, total price and profit were done using the PDI calculator


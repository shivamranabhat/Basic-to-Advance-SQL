 CREATE DATABASE CASE_STUDY_1

 CREATE TABLE sales (
  "customer_id" VARCHAR(1),
  "order_date" DATE,
  "product_id" INTEGER
);

INSERT INTO sales
  ("customer_id", "order_date", "product_id")
VALUES
  ('A', '2021-01-01', '1'),
  ('A', '2021-01-01', '2'),
  ('A', '2021-01-07', '2'),
  ('A', '2021-01-10', '3'),
  ('A', '2021-01-11', '3'),
  ('A', '2021-01-11', '3'),
  ('B', '2021-01-01', '2'),
  ('B', '2021-01-02', '2'),
  ('B', '2021-01-04', '1'),
  ('B', '2021-01-11', '1'),
  ('B', '2021-01-16', '3'),
  ('B', '2021-02-01', '3'),
  ('C', '2021-01-01', '3'),
  ('C', '2021-01-01', '3'),
  ('C', '2021-01-07', '3');
 

CREATE TABLE menu (
  "product_id" INTEGER,
  "product_name" VARCHAR(5),
  "price" INTEGER
);

INSERT INTO menu
  ("product_id", "product_name", "price")
VALUES
  ('1', 'sushi', '10'),
  ('2', 'curry', '15'),
  ('3', 'ramen', '12');
  

CREATE TABLE members (
  "customer_id" VARCHAR(1),
  "join_date" DATE
);

INSERT INTO members
  ("customer_id", "join_date")
VALUES
  ('A', '2021-01-07'),
  ('A', '2021-01-10'),
  ('A', '2021-01-17'),
  ('A', '2021-01-27'),
  ('B', '2021-01-07'),
  ('A', '2021-01-17'),
  ('B', '2021-01-09');
  



--Each of the following case study questions can be answered using a single SQL statement:

-- 1) What is the total amount each customer spent at the restaurant?

SELECT s.customer_id, SUM(m.price) AS TOTAL_AMOUNT from sales s inner join menu m on s.product_id = m.product_id group by s.customer_id

-- 2) How many days has each customer visited the restaurant?
SELECT customer_id, COUNT(join_date) AS NO_OF_DAYS_VISITED FROM members group by  customer_id
-- OR
SELECT s.customer_id, COUNT(s.order_date) AS DAYS_VISITED, m.product_name from sales s inner join menu m ON s.product_id = m.product_id group by s.customer_id, m.product_name

-- 3) What was the first item from the menu purchased by each customer?



  WITH first_order_product AS 
  (SELECT s.customer_id, m.product_name,
  ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY order_date) AS row_num
  FROM sales s
  inner join menu m on s.product_id = m.product_id
  )
  SELECT customer_id, product_name from first_order_product  WHERE row_num = 1

  -- 4) What is the most purchased item on the menu and how many times was it purchased by all customers?
  SELECT TOP 1 m.product_name, count(s.product_id) AS PUCHASE_COUNT from sales s inner join menu m on s.product_id = m.product_id GROUP BY m.product_name ORDER BY PUCHASE_COUNT DESC

  -- 5) Which item was the most popular for each customer?

  SELECT TOP 1 m.product_name from sales s inner join menu m on s.product_id = m.product_id group by m.product_name ORDER BY COUNT(m.product_id) DESC


  SELECT * FROM menu
  SELECT * FROM sales
  SELECT * FROM members

  -- 6) Which item was purchased first by the customer after they became a member?
WITH FIRST_PURCHASE AS(
SELECT m.customer_id, me.product_name, ROW_NUMBER() OVER (PARTITION BY m.customer_id ORDER BY m.join_date) AS num_rows from members m
INNER JOIN sales s on m.customer_id = s.customer_id
INNER JOIN menu me on s.product_id = me.product_id
WHERE s.order_date = m.join_date
)
SELECT customer_id, product_name FROM FIRST_PURCHASE where num_rows = 1



	--7) Which item was purchased just before the customer became a member?

	WITH ITEM AS 
	(
	SELECT m.customer_id, s.order_date, me.product_name, ROW_NUMBER() OVER (PARTITION BY m.customer_id ORDER BY m.join_date) as num_rows
	FROM members m 
	inner join sales s on m.customer_id = s.customer_id
	inner join menu me on s.product_id = me.product_id
	WHERE m.join_date > s.order_date
	)
    SELECT customer_id, product_name, order_date FROM ITEM where num_rows = 1
	
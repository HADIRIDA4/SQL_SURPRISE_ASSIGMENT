--CREATING DIMENSION TABLE
-- CREATE TABLE REPORTING_SCHEMA.Customer_Dimension (
--     customer_id SERIAL PRIMARY KEY,
--     first_name VARCHAR(50),
--     last_name VARCHAR(50)
-- );
-- INSERTING DATA INTO THIS CUSTOMER_DIMENSION TABLE
-- INSERT INTO REPORTING_SCHEMA.Customer_Dimension (customer_id, first_name, last_name)
-- SELECT customer_id, first_name, last_name
-- FROM public.customer;
SELECT * FROM REPORTING_SCHEMA.Customer_Dimension;
----------------------------------------------CREATING FACT TABLE----------------------------------------------
---------------------------------------------- RENTAL TRANSACTION FACT TABLE----------------------------
-- CREATE TABLE REPORTING_SCHEMA.RENTAL_DETAILS (
--     rental_id INT,
--     customer_id INT,
--     rental_date TIMESTAMP WITHOUT TIME ZONE,
--     return_date TIMESTAMP WITHOUT TIME ZONE,
--     rental_fee DECIMAL(10, 2)
-- );
--INSERTING THE DATA 
-- INSERT INTO REPORTING_SCHEMA.RENTAL_DETAILS(RENTAL_ID,CUSTOMER_ID,RENTAL_DATE,RETURN_DATE,RENTAL_FEE)
-- SELECT
-- 	RENTAL_DETAIL.RENTAL_ID,
-- 	CUSTOMER_INFO.CUSTOMER_ID,
-- 	RENTAL_DETAIL.RENTAL_DATE,
-- 	RENTAL_DETAIL.RETURN_DATE,
-- 	PAYMENT_DETAIL.AMOUNT AS RENTAL_FEE
-- FROM 
-- 	PUBLIC.RENTAL AS RENTAL_DETAIL
-- INNER JOIN 
-- REPORTING_SCHEMA.Customer_Dimension	 AS CUSTOMER_INFO
-- ON
-- 	CUSTOMER_INFO.CUSTOMER_ID=RENTAL_DETAIL.CUSTOMER_ID
-- INNER JOIN 
-- 	PAYMENT AS PAYMENT_DETAIL
-- ON 
-- 	PAYMENT_DETAIL.CUSTOMER_ID=CUSTOMER_INFO.CUSTOMER_ID	
-- ORDER BY RENTAL_DETAIL.RENTAL_ID  ;
SELECT * FROM REPORTING_SCHEMA.RENTAL_DETAILS;


----------------------------------------------CREATING AGGREGATE  TABLE----------------------------------------------
---------------------------------------------- AGGREGATE BY CUSTOMER-------------------------------------------------
-- CREATE TABLE REPORTING_SCHEMA.AGG_CUSTOMER AS
-- SELECT
--     CUSTOMER_INFO.customer_id,
--     COUNT(RENTAL_DETAILS.rental_id) AS total_movies_rented,
--     SUM(RENTAL_DETAILS.rental_fee) AS total_paid,
--     ROUND(AVG(EXTRACT(DAY FROM (RENTAL_DETAILS.return_date - RENTAL_DETAILS.rental_date))), 2) AS average_rental_duration
-- FROM
--     REPORTING_SCHEMA.Customer_Dimension AS CUSTOMER_INFO
-- INNER JOIN
--     REPORTING_SCHEMA.RENTAL_DETAILS AS RENTAL_DETAILS
-- ON
--     CUSTOMER_INFO.customer_id = RENTAL_DETAILS.customer_id
-- GROUP BY
--     CUSTOMER_INFO.customer_id;

SELECT * FROM REPORTING_SCHEMA.AGG_CUSTOMER
ORDER BY CUSTOMER_ID




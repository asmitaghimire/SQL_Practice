--4. Select all products with brand “Cacti Plus
select * from product where brand = 'Cacti Plus'

--5. Count of total products with product category=”Skin Care”
select COUNT (*) from product where category = 'Skin Care'

--6. Count of total products with MRP more than 100
select COUNT (*) from product where mrp > 100

--7. Count of total products with product category=”Skin Care” and MRP more than 100
select COUNT (*) from product where category = 'Skin Care' and mrp > 100

--8. Brandwise product count
SELECT product.brand, count (product.product_id) 
FROM product	
GROUP BY brand

--9. Brandwise as well as Active/Inactive Status wise product count
select product.brand, product.active, COUNT (product.product_id)
from product
group by brand, active

--10. Display all columns with Product category in Skin Care or Hair Care
select * from product where category = 'Skin Care' or category = 'Hair Care'

--11. Display all columns with Product category in Skin Care or Hair Care, and MRP more than 100
select * from product where (category = 'Skin Care' or category = 'Hair Care') and mrp > 100

--12. Display   all   columns   with   Product   category=”Skin   Care”   and Brand=”Pondy”, and MRP more than 100
select * from product where (category = 'Skin Care' and brand = 'Pondy') and mrp > 100

--13. Display   all   columns   with   Product   category   =”Skin   Care”   or Brand=”Pondy”, and more than 100
select * from product where (category = 'Skin Care' or brand = 'Pondy') and mrp > 100

--14. Display all product names only with names starting from letter P
select * from product where product_name like 'P%'

--15. Display  all product  names only with names Having letters “Bar”  in Between
select * from product where product_name like '%Bar%'

--16. Sales of those products which have been sold in more than two quantity in a bill
select * from sales where qty > 2

--17. Sales of those products which have been sold in more than two quantity throughout the bill
select product_id, sum(qty) from sales group by product_id having sum(qty) > 2

--18. Create a new table with columns username and birthday, and dump data from dates file
create table individual (
username varchar(50), birthday date)

BULK INSERT dbo.individual
FROM 'E:\Leapfrog_Internship\week5\internship\dates.xlsx'
WITH (
  FIRSTROW = 2,
  FIELDTERMINATOR = ',',
  ROWTERMINATOR ='\n'
)
select * from individual

SELECT COUNT(username) 
FROM individual 
WHERE birthday 
    IN (
     SELECT birthday
     FROM individual
     GROUP BY birthday
     HAVING COUNT(birthday) > 1
    )


SELECT * ,
    DATENAME(weekday, GETDATE()) as WEEKDAY
FROM individual

--19 Find the current age of all people
SELECT   *, DATEDIFF(year, birthday, GETDATE()) Age
FROM individual
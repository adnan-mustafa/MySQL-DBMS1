# Question 1:
# 1) Create a Database Bank.
create database bank;

# Question 2:
# 2) Create a table with the name “Bank_Inventory” with the following columns
-- Product  with string data type and size 10 --
-- Quantity with numerical data type --
-- Price with data type that can handle all real numbers
-- purcahase_cost with data type which always shows two decimal values --
-- estimated_sale_price with data type float --
use bank;
create table Bank_Inventory(
Product char(10),
Quantity int,
Price real,
Purchase_cost decimal (6,2),
Estimated_sale_price float
);

# Question 3:
# 3) Display all column names and their datatype and size in Bank_Inventory.
desc Bank_Inventory;

# Question 4:
# 4) Insert the below two records into Bank_Inventory table .
-- 1st record with values --
			-- Product : PayCard
			-- Quantity: 2 
			-- price : 300.45 
			-- Puchase_cost : 8000.87
			-- estimated_sale_price: 9000.56 --
-- 2nd record with values --
			-- Product : PayPoints
			-- Quantity: 4
			-- price : 200.89 
			-- Puchase_cost : 7000.67
			-- estimated_sale_price: 6700.56
insert into Bank_Inventory
values
	('PayCard', 2, 300.45, 8000.87, 9000.56),
    ('PayPoints', 4, 200.89, 7000.67, 6700.56);
    
select * from Bank_Inventory;
	
# Question 5:
# 5) Add a column : Geo_Location to the existing Bank_Inventory table with data type varchar and size 20 .
alter table Bank_Inventory add Geo_Location varchar(20);

# Question 6:
# 6) What is the value of Geo_Location for product : ‘PayCard’?
select Geo_Location from Bank_Inventory where product='PayCard';

# Question 7:
# 7) How many characters does the  Product : ‘PayCard’ store in the Bank_Inventory table.
select char_length(product) from Bank_Inventory where Product='PayCard';

# Question 8:
# a) Update the Geo_Location field from NULL to ‘Delhi-City’ 
# b) How many characters does the  Geo_Location field value ‘Delhi-City’ stores in the Bank_Inventory table
update Bank_Inventory set Geo_Location='Delhi-City' where Geo_Location IS NULL;
select char_length(Geo_Location) from Bank_Inventory where Geo_Location='Delhi-City';

# Question 9:
# 9) update the Product field from CHAR to VARCHAR size 10 in Bank_Inventory 
alter table Bank_Inventory change product product varchar(10);

# Question 10:
# 10) Reduce the size of the Product field from 10 to 6 and check if it is possible. 
alter table Bank_Inventory change Product Product varchar(6);
-- not possible as existing data will be truncated

# Question 11:
# 11) Bank_inventory table consists of ‘PayCard’ product details .
-- For ‘PayCard’ product, Update the quantity from 2 to 10  
update Bank_Inventory set Quantity=10 where product='PayCard';

 # Question 12:
# 12) Create a table named as Bank_Holidays with below fields 
-- a) Holiday field which displays or accepts only date 
-- b) Start_time field which also displays or accepts date and time both.  
-- c) End_time field which also displays or accepts date and time along with the timezone also. 
create table Bank_Holidays(
	Holiday date,
    Start_time datetime,
    End_time timestamp);

 # Question 13:
# 13) Step 1: Insert today’s date details in all fields of Bank_Holidays 
-- Step 2: After step1, perform the below 
-- Postpone Holiday to next day by updating the Holiday field 
Insert into Bank_Holidays values(
	current_date,
    current_date,
    current_date);
    
update Bank_Holidays set Holiday = date_add(Holiday, interval 1 day);

select * from Bank_Holidays;

# Question 14:
# 14) Modify  the Start_time data with today's datetime in the Bank_Holidays table 
update	Bank_Holidays set Start_time = current_timestamp();

# Question 15:
# 15) Update the End_time with UTC time(GMT Time) in the Bank_Holidays table. 
update Bank_Holidays set End_time = utc_time();

# Question 16:
# 16) Select all columns from Bank_Inventory without mentioning any column name
select * from Bank_Inventory;

# Question 17:
# 17)  Display output of PRODUCT field as NEW_PRODUCT in  Bank_Inventory table 
select product as 'NEW_PRODUCT' from Bank_Inventory;

# Question 18:
# 18)  Display only one record from bank_Inventory 
select * from Bank_Inventory limit 1;

# Question 19:
# 19) Modify  the End_time data with today's datetime in the Bank_Holidays table 
update Bank_Holidays set End_time = current_timestamp();

# Question 20:
# 20) Display the first five rowss of the Geo_location field of Bank_Inventory.
select Geo_location from Bank_Inventory limit 5;
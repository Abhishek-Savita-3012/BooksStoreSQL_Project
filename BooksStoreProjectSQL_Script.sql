-- Create Database
CREATE DATABASE OnlineBookstore;

-- Use Database
USE OnlineBookstore;

-- Drop Tables
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Customers;
DROP TABLE IF EXISTS Books;

-- Create Books Table
CREATE TABLE Books (
    Book_ID INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(100),
    Author VARCHAR(100),
    Genre VARCHAR(50),
    Published_Year INT,
    Price DECIMAL(10,2),
    Stock INT
);

-- Create Customers Table
CREATE TABLE Customers (
    Customer_ID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    City VARCHAR(50),
    Country VARCHAR(150)
);

-- Create Orders Table
CREATE TABLE Orders (
    Order_ID INT AUTO_INCREMENT PRIMARY KEY,
    Customer_ID INT,
    Book_ID INT,
    Order_Date DATE,
    Quantity INT,
    Total_Amount DECIMAL(10,2),
    FOREIGN KEY (Customer_ID) REFERENCES Customers(Customer_ID),
    FOREIGN KEY (Book_ID) REFERENCES Books(Book_ID)
);

SELECT * FROM Books;
SELECT * FROM Customers;
SELECT * FROM Orders;

-- Import Data into Books Table
LOAD DATA INFILE 'C:\Users\Abhishek\Desktop\SQL_Books_Project\Books.csv'
INTO TABLE Books
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(Book_ID, Title, Author, Genre, Published_Year, Price, Stock);

-- Import Data into Customers Table
LOAD DATA INFILE 'C:\Users\Abhishek\Desktop\SQL_Books_Project\Customers.csv'
INTO TABLE Customers
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(Customer_ID, Name, Email, Phone, City, Country);

-- Import Data into Orders Table
LOAD DATA INFILE 'C:\Users\Abhishek\Desktop\SQL_Books_Project\Orders.csv'
INTO TABLE Orders
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(Order_ID, Customer_ID, Book_ID, Order_Date, Quantity, Total_Amount);


-- Beginner Questions : 
-- 1) Retrieve all books in the "Fiction" genre
SELECT * FROM Books
WHERE Genre = 'Fiction';
-- Insight: This query helps identify all books that belong to the Fiction category.


-- 2) Find books published after the year 1950
SELECT * FROM Books
WHERE Published_Year > 1950;
-- Insight: This query shows modern books published after 1950.


-- 3) List all customers from Canada
SELECT Name FROM Customers
WHERE Country = 'Canada';
-- Insight: This query helps find customers located in Canada.


-- 4) Show orders placed in November 2023
SELECT * FROM Orders
WHERE Order_Date BETWEEN '2023-11-01' AND '2023-11-30';
-- Insight: This query helps analyze monthly order activity for November 2023.


-- 5) Retrieve the total stock of books available
SELECT SUM(Stock) AS Total_Stock
FROM Books;
-- Insight: This query gives the total number of books currently available in inventory.


-- 6) Find the details of the most expensive book
SELECT * FROM Books
ORDER BY Price DESC
LIMIT 1;
-- Insight: This query identifies the highest-priced book in the bookstore.


-- 7) Show all customers who ordered more than 1 quantity of a book
SELECT Customers.Name, Orders.Quantity
FROM Customers
JOIN Orders
ON Customers.Customer_ID = Orders.Customer_ID
WHERE Orders.Quantity > 1;
-- Insight: This query shows customers who purchased more than one copy of a book in a single order.


-- 8) Retrieve all orders where the total amount exceeds $20
SELECT * FROM Orders
WHERE Total_Amount > 20;
-- Insight: This query helps identify higher-value orders above $20.


-- 9) List all genres available in the Books table
SELECT DISTINCT Genre
FROM Books;
-- Insight: This query displays all unique book genres available in the bookstore.


-- 10) Find the book with the lowest stock
SELECT * FROM Books
ORDER BY Stock ASC
LIMIT 1;
-- Insight: This query identifies the book with the least available stock, useful for restocking decisions.


-- 11) Calculate the total revenue generated from all orders
SELECT SUM(Total_Amount) AS Revenue
FROM Orders;
-- Insight: This query calculates the overall revenue generated from book sales.


-- Advanced Questions : 
-- 1) Retrieve the total number of books sold for each genre
SELECT Books.Genre, SUM(Orders.Quantity) AS Total_Books_Sold
FROM Books
JOIN Orders
ON Books.Book_ID = Orders.Book_ID
GROUP BY Books.Genre;
-- Insight: This query shows which genres are selling the most based on total quantity sold.


-- 2) Find the average price of books in the "Fantasy" genre
SELECT AVG(Price) AS Average_Price
FROM Books
WHERE Genre = 'Fantasy';
-- Insight: This query calculates the average price of Fantasy books.


-- 3) List customers who have placed at least 2 orders
SELECT Customers.Customer_ID, Customers.Name, COUNT(Orders.Order_ID) AS Order_Count
FROM Customers
JOIN Orders
ON Customers.Customer_ID = Orders.Customer_ID
GROUP BY Customers.Customer_ID, Customers.Name
HAVING COUNT(Orders.Order_ID) >= 2;
-- Insight: This query identifies repeat customers who have placed two or more orders.


-- 4) Find the most frequently ordered book
SELECT Books.Book_ID, Books.Title, SUM(Orders.Quantity) AS Total_Quantity_Ordered
FROM Books
JOIN Orders
ON Books.Book_ID = Orders.Book_ID
GROUP BY Books.Book_ID, Books.Title
ORDER BY Total_Quantity_Ordered DESC
LIMIT 1;
-- Insight: This query finds the most popular book based on total quantity ordered.


-- 5) Show the top 3 most expensive books of Fantasy genre
SELECT * FROM Books
WHERE Genre = 'Fantasy'
ORDER BY Price DESC
LIMIT 3;
-- Insight: This query highlights the top 3 highest-priced Fantasy books.


-- 6) Retrieve the total quantity of books sold by each author
SELECT Books.Author, SUM(Orders.Quantity) AS Total_Quantity_Sold
FROM Books
JOIN Orders
ON Books.Book_ID = Orders.Book_ID
GROUP BY Books.Author;
-- Insight: This query shows author-wise sales performance based on total books sold.


-- 7) List the cities where customers who spent over $30 are located
SELECT Customers.Name, Customers.City, SUM(Orders.Total_Amount) AS Total_Spent
FROM Customers
JOIN Orders
ON Customers.Customer_ID = Orders.Customer_ID
GROUP BY Customers.Customer_ID, Customers.Name, Customers.City
HAVING SUM(Orders.Total_Amount) > 30;
-- Insight: This query identifies customers and cities where total spending is more than $30.


-- 8) Find the customer who spent the most on orders
SELECT Customers.Name, SUM(Orders.Total_Amount) AS Total_Spent
FROM Customers
JOIN Orders
ON Customers.Customer_ID = Orders.Customer_ID
GROUP BY Customers.Customer_ID, Customers.Name
ORDER BY Total_Spent DESC
LIMIT 1;
-- Insight: This query finds the highest-spending customer of the bookstore.


-- 9) Calculate the stock remaining after fulfilling all orders
SELECT 
    Books.Book_ID,
    Books.Title,
    Books.Stock,
    COALESCE(SUM(Orders.Quantity), 0) AS Order_Quantity,
    Books.Stock - COALESCE(SUM(Orders.Quantity), 0) AS Remaining_Quantity
FROM Books
LEFT JOIN Orders 
ON Books.Book_ID = Orders.Book_ID
GROUP BY Books.Book_ID, Books.Title, Books.Stock
ORDER BY Books.Book_ID;
-- Insight: This query calculates remaining stock for each book after subtracting sold quantities.
-- It also includes books with no orders because LEFT JOIN is used.
# 📚 Online Bookstore SQL Project

## 📌 Project Overview

The **Online Bookstore SQL Project** is a MySQL-based database analysis project.  
This project focuses on creating and analyzing an online bookstore database using SQL queries.

The database contains information about:

- Books
- Customers
- Orders

The main goal of this project is to extract meaningful business insights related to book sales, customer behavior, revenue, genre performance, author-wise sales, and stock availability.

---

## 🛠️ Tools & Technologies Used

- MySQL
- MySQL Workbench
- SQL
- CSV Files
- Database Management System

---

## 🗂️ Dataset Used

The project uses the following CSV files:

- `Books.csv`
- `Customers.csv`
- `Orders.csv`

---

## 🏗️ Database Name

```sql
OnlineBookstore
```

---

## 📋 Tables Used

### 1. Books Table

The `Books` table stores information about books available in the bookstore.

| Column Name | Description |
|---|---|
| Book_ID | Unique ID of each book |
| Title | Name of the book |
| Author | Author of the book |
| Genre | Genre/category of the book |
| Published_Year | Year in which the book was published |
| Price | Price of the book |
| Stock | Available stock of the book |

---

### 2. Customers Table

The `Customers` table stores customer details.

| Column Name | Description |
|---|---|
| Customer_ID | Unique ID of each customer |
| Name | Name of the customer |
| Email | Email address of the customer |
| Phone | Phone number of the customer |
| City | City of the customer |
| Country | Country of the customer |

---

### 3. Orders Table

The `Orders` table stores order details.

| Column Name | Description |
|---|---|
| Order_ID | Unique ID of each order |
| Customer_ID | ID of the customer who placed the order |
| Book_ID | ID of the book ordered |
| Order_Date | Date on which the order was placed |
| Quantity | Number of books ordered |
| Total_Amount | Total amount of the order |

---

## 🔗 Table Relationships

- One customer can place multiple orders.
- One book can be ordered multiple times.
- The `Orders` table connects the `Books` and `Customers` tables using foreign keys.

---

## 📥 Data Import

The data was imported from CSV files into MySQL tables using `LOAD DATA INFILE`.

```sql
LOAD DATA INFILE 'file_path'
INTO TABLE table_name
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
```

---

## 🔍 Beginner SQL Questions & Insights

### 1. Retrieve all books in the "Fiction" genre

**Insight:**  
This query helps identify all books that belong to the Fiction category.

---

### 2. Find books published after the year 1950

**Insight:**  
This query shows modern books published after 1950.

---

### 3. List all customers from Canada

**Insight:**  
This query helps find customers located in Canada.

---

### 4. Show orders placed in November 2023

**Insight:**  
This query helps analyze monthly order activity for November 2023.

---

### 5. Retrieve the total stock of books available

**Insight:**  
This query gives the total number of books currently available in inventory.

---

### 6. Find the details of the most expensive book

**Insight:**  
This query identifies the highest-priced book in the bookstore.

---

### 7. Show all customers who ordered more than 1 quantity of a book

**Insight:**  
This query shows customers who purchased more than one copy of a book in a single order.

---

### 8. Retrieve all orders where the total amount exceeds $20

**Insight:**  
This query helps identify higher-value orders above $20.

---

### 9. List all genres available in the Books table

**Insight:**  
This query displays all unique book genres available in the bookstore.

---

### 10. Find the book with the lowest stock

**Insight:**  
This query identifies the book with the least available stock, which is useful for restocking decisions.

---

### 11. Calculate the total revenue generated from all orders

**Insight:**  
This query calculates the overall revenue generated from book sales.

---

## 🚀 Advanced SQL Questions & Insights

### 1. Retrieve the total number of books sold for each genre

**Insight:**  
This query shows which genres are selling the most based on total quantity sold.

---

### 2. Find the average price of books in the "Fantasy" genre

**Insight:**  
This query calculates the average price of Fantasy books.

---

### 3. List customers who have placed at least 2 orders

**Insight:**  
This query identifies repeat customers who have placed two or more orders.

---

### 4. Find the most frequently ordered book

**Insight:**  
This query finds the most popular book based on total quantity ordered.

---

### 5. Show the top 3 most expensive books of Fantasy genre

**Insight:**  
This query highlights the top 3 highest-priced Fantasy books.

---

### 6. Retrieve the total quantity of books sold by each author

**Insight:**  
This query shows author-wise sales performance based on total books sold.

---

### 7. List the cities where customers who spent over $30 are located

**Insight:**  
This query identifies customers and cities where total spending is more than $30.

---

### 8. Find the customer who spent the most on orders

**Insight:**  
This query finds the highest-spending customer of the bookstore.

---

### 9. Calculate the stock remaining after fulfilling all orders

**Insight:**  
This query calculates remaining stock for each book after subtracting sold quantities.  
It also includes books with no orders because `LEFT JOIN` is used.

---

## 📊 Key Business Insights

- Fiction and Fantasy genre analysis helps understand customer reading preferences.
- Revenue analysis helps measure the bookstore’s overall sales performance.
- Customer analysis helps identify repeat and high-value customers.
- Author-wise sales analysis helps find authors with strong sales performance.
- Stock analysis helps in inventory planning and restocking decisions.
- Order analysis helps understand customer purchasing patterns.

---

## 📌 SQL Concepts Used

- Database Creation
- Table Creation
- Primary Key
- Foreign Key
- Joins
- Left Join
- Aggregate Functions
- `SUM()`
- `AVG()`
- `COUNT()`
- `GROUP BY`
- `HAVING`
- `ORDER BY`
- `LIMIT`
- `DISTINCT`
- Date Filtering
- CSV Data Import

---

## 📁 Project Structure

```text
Online-Bookstore-SQL-Project/
│
├── Books.csv
├── Customers.csv
├── Orders.csv
├── BooksStoreProjectSQL_Script.sql
├── Books Store Project Analysis and Insights.pptx
└── README.md
```

---

## 🎯 Project Objective

The objective of this project is to use SQL for analyzing an online bookstore database and generating useful insights that can help understand:

- Sales trends
- Revenue generation
- Customer purchasing behavior
- Popular book genres
- Best-selling books
- Author-wise sales performance
- Inventory and stock status

---

## ✅ Conclusion

This **Online Bookstore SQL Project** helped in understanding how SQL can be used for real-world database analysis and business decision-making.

By using SQL queries such as joins, aggregations, grouping, filtering, and sorting, important insights were extracted from bookstore data.

The analysis provides useful information about book sales, customer behavior, revenue, genre performance, author performance, and stock management.

---

## 👨‍💻 Author

**Abhishek Savita**

GitHub: [Abhishek-Savita-3012](https://github.com/Abhishek-Savita-3012)

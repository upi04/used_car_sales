# used_car_sales
Relational Database &amp; SQL Project
Used Car Sales Database Project
Project Description
This project aims to analyze used car sales data using PostgreSQL. The database includes information about cars, bid history, and user data. The analysis results can help understand bidding patterns and the popularity of car models in the market.

Database Structure
Main Tables:
products: Stores car data (brand, model, year, and price).
bids: Stores the bid history made by users for cars.
users: Stores information about users who place bids.
ERD:
The Entity-Relationship Diagram (ERD) can be found in the docs/ folder under the file name ERD.png.

Project Steps
1. Database Creation:
Created tables using DDL commands.
The table structures are available in the queries.sql file in the docs/ folder.
2. Data Insertion:
A dummy dataset was created to populate the main tables.
The dataset is provided in the used_car_sales_backup.sql file.
3. Transactional Queries:
Includes adding, updating, and deleting data.
Example queries are included in the queries.sql file.
4. Analytical Queries:
Comparison of average car prices with bid prices in the last 6 months.
Identification of the most popular car models based on the number of bids.
5. Backup and Restore:
The project includes instructions on how to back up and restore the database using the pg_dump and pg_restore commands.
Analysis Results
Most Popular Car Model: Toyota Yaris received the highest number of bids.
Price and Bid Difference: The average price difference for Toyota Yaris in the last 6 months is 3.46%.
Price Trends Over Time: Bid prices show an upward trend over the past 6 months.
Conclusion
This project successfully built a structured database for managing used car sales data and conducted data analysis to provide insights into the used car market. The database is ready for further analysis or new feature development.

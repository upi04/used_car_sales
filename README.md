Used Car Sales Database Project
Project Description
This project analyzes used car sales data using PostgreSQL, focusing on understanding bidding patterns, identifying popular car models, and analyzing price trends. The database includes tables for car details, bidding history, user information, locations, and advertisements. Microsoft Excel was used for additional data analysis and visualization.

Database Structure
Main Tables:

products: Stores car details, including brand, model, year, and price.
bids: Records the bidding history for cars, with details like bid amounts and timestamps.
users: Contains user information, such as names and contact details.
location: Stores information about where cars are sold, including city, state, and region details.
ads: Tracks advertisements for cars, including ad posting dates, platforms used, and car references.
Entity-Relationship Diagram (ERD):

The ERD shows the relationships between tables (products, bids, users, location, and ads) and is stored in the docs/ERD.png file.
Project Steps
Database Creation:

Designed the database structure using DDL commands.
Defined table schemas for all main tables in the queries.sql file located in the docs/ folder.
Data Insertion:

Populated tables with a dummy dataset provided in the used_car_sales_backup.sql file.
Data includes cars listed in various locations and their associated advertisement details.
Transactional Queries:

Added, updated, and deleted records across tables for maintaining data integrity.
Examples include updating car prices, deleting outdated ads, and adding new bid records.
Analytical Queries:

Location Analysis: Identified regions with the highest car sales and bidding activity.
Advertisement Effectiveness: Analyzed the performance of ads by platform and region.
Price Trends: Compared bid prices across different locations.
Backup and Restore:

Implemented database backup and restoration using pg_dump and pg_restore commands to ensure data safety.
Analysis Results
Most Popular Car Model:

Toyota Yaris received the highest number of bids, indicating high demand.
Regional Performance:

The Jakarta region reported the highest number of car sales and bids, likely due to its dense population and high vehicle demand.
Ad Performance:

Ads posted on social media platforms generated the most bids, while newspaper ads had minimal impact.
Price and Location Trends:

Bid prices in urban locations, like Jakarta, were on average 10% higher than in rural areas.
Tools Used
PostgreSQL:
For database creation, data storage, and query execution.
Microsoft Excel:
For data visualization, regional performance analysis, and ad effectiveness tracking.
Conclusion
This project successfully incorporated additional insights through the integration of location and ads data into the analysis of used car sales. Understanding regional patterns and advertisement performance provided actionable insights for optimizing sales strategies and targeting high-performing areas or platforms. The database is ready for future enhancements and more advanced analyses.

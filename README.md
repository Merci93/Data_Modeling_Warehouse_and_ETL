# Description
A data darehousing, data modeling and an ETL pipeline orchestrated using PostgreSQL and Pentaho Data Integration (PDI), a Hitachi Data Integration tool. The project entails using the Pentaho Data Integration tool with PostgreSQL to model a data warehouse/database, and develop an ETL pipeline to extract data from publicly available sources, load the data into the staging DB, perform transformations on the data and finally load the transformed data into the core/main database.

## Steps:
- Installation and configuration of PostgreSQL 15 and Pentaho Data Integration tool.
- Setting up the staging data warehouse and core database for the ETL process in PostgreSQL.
- Integrating PDI platform with PostgreSQL pgAdmin.
- Importing datasets from into public DB to serve as source data.
- Data Modeling (Star Schema) which involved:
	1. Creating dimension tables.
	2. Creating fact tables.
	3. Normalizing tables.
	4. Creating indexes for easy read and write operations.
- Creating data extraction pipelines in PDI and integrating into PostgreSQL pgAdmin to extract data from public DB and load into staging DB.
- Developed a transformation and loading pipeline to load data from the staging data warehouse to core/main database which includes the following transformations:
	1. Extracting data for respective dimension and fact tables.
	2. Creating additional columns for data aggregation.
- Loading data into core/main data warehouse/database for analytical purposes using PowerBI, Tableau or Excel.

# Files
Diagrams on the scheduling and modeling can be found in the **Diagrams** section of the repository above. The **workflows** section contains all the transformations and jobs performed in PDI, while the **DWH_ETL.sql** and **transformations.sql** contains the SQL functions used for creating the database schema, tables including facts and dimension tables and all the transformations and extraction queries used in PDI.


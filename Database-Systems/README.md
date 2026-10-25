# Blood Donation Database Management System

### Overview
This project was developed as part of the Database Systems course at the University of Technology and Applied Sciences (UTAS).

The project focuses on designing and implementing a database for a blood donation system to manage donors, hospitals, nurses, and blood bags. It demonstrates relational database concepts and basic NoSQL operations using Oracle SQL and MongoDB.

### Database Tables

The relational database consists of four tables:

- **DONORS:** Stores donor IDs, names, ages, blood types, donation dates, phone numbers, and hospital IDs.
- **HOSPITALS:** Stores hospital IDs, names, locations, email addresses, and phone numbers.
- **NURSES:** Stores nurse IDs, names, phone numbers, hospital assignments, and hiring dates.
- **BLOOD_BAGS:** Stores blood bag IDs, blood types, donation dates, donor IDs, and expiry dates.

### Database Concepts

### Relational Database
- Creating tables and defining data types.
- Establishing primary keys and foreign key relationships.
- Applying `NOT NULL`, `UNIQUE`, and `CHECK` constraints.
- Inserting, updating, and retrieving records.
- Using SQL functions and nested functions.
- Writing subqueries.
- Creating and querying views.
- Calculating blood bag expiry periods.

### NoSQL Database
Using MongoDB, the project demonstrates:
- Creating a collection.
- Inserting multiple documents.
- Updating donor records.
- Deleting records based on conditions.
- Finding and filtering documents using queries and field projection.

### Technologies
- Oracle SQL
- MongoDB
- SQL Developer or a compatible Oracle SQL environment

## Blood Donation Database

### Overview
This project was developed as part of the Database Programming course at (UTAS).

The project focuses on designing and implementing a blood donation database to manage donors, hospitals, nurses, and blood bags. It demonstrates relational database programming using Oracle SQL and document-oriented database operations using MongoDB.

### Database Tables
The relational database consists of four tables:

- **DONORS:** Stores donor information, including donor ID, name, age, blood type, donation date, phone number, and hospital ID.
- **HOSPITALS:** Stores hospital names, IDs, locations, email addresses, and phone numbers.
- **NURSES:** Stores nurse information, contact details, hospital assignments, and hiring dates.
- **BLOOD_BAGS:** Stores blood bag IDs, blood types, donation dates, donor IDs, and expiry dates.

### Oracle SQL Implementation
The project covers the following database programming concepts:

- Creating tables and defining data types.
- Implementing primary keys, foreign keys, unique constraints, NOT NULL constraints, and CHECK constraints.
- Inserting records into database tables.
- Using nested SQL functions, including `INITCAP`, `CONCAT`, `LOWER`, `REPLACE`, `ROUND`, and `TO_CHAR`.
- Writing subqueries.
- Creating and querying a database view.
- Calculating the remaining days until blood bags expire.

### NoSQL Implementation
The project also explores MongoDB, a document-oriented NoSQL database, using operations to:

- Create a collection.
- Insert multiple donor documents.
- Update donor information.
- Delete records based on conditions.
- Retrieve records using filtering and field projection.

### Technologies
- Oracle SQL
- MongoDB
- SQL Developer or an Oracle SQL execution environment

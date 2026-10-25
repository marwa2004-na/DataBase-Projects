## Patient Appointment Behaviour Analysis

### Overview

This project was developed as part of the Data Warehouse Design course at (UTAS).

The project focuses on building a healthcare data warehouse to analyse patient appointment behaviour, service utilization, and consultation fees. It combines dimensional modelling, ETL processing, multidimensional analysis, and reporting to support data-driven healthcare management decisions.

### Project Objectives

Design and implement a dimensional data warehouse.

Integrate and transform patient data using ETL processes.

Analyse appointment patterns using multidimensional data analysis.

Develop KPIs to evaluate consultation fees and appointment activity.

Create reports and visualizations to identify trends in patient demographics and healthcare service utilization.

### Data Warehouse Design

The warehouse uses a fact table and dimension tables to support analytical queries.

### Fact Table

Fact_Patient_App: Stores appointment measures and related patient, doctor, appointment, and date information.

### Dimension Tables

Patient_TB: Patient demographics and age groups.

Doctor_TB: Doctor details, specializations, and years of experience.

Appointment_TB: Reasons for visits and appointment statuses.

Date_TB: Calendar information, including dates, months, years, and weekdays.

The project also includes a source patient table used in the ETL process.

### Technologies and Tools

### SQL Server

Created the data warehouse database and tables.

Defined primary and foreign key relationships.

Inserted and queried sample data.

Generated a date dimension and populated the fact table.

### SQL Server Integration Services (SSIS)

Implemented an ETL workflow using OLE DB connections.

Extracted patient data from the source table.

Filtered patients based on date of birth.

Calculated patient age using a Derived Column transformation.

Categorized patients into age groups.

Loaded the transformed data into the warehouse patient table.

### SQL Server Analysis Services (SSAS)

Integrated the fact table and associated dimensions into a multidimensional cube.

Analysed appointment trends by patient demographics and reasons for visits.

Examined January and December appointment patterns across 2023–2025.

Compared scheduled and cancelled appointments across available years.

Analysed consultation fees by gender, age group, weekday, and reason for visit.

Developed a KPI to evaluate average consultation fees per appointment against a target.

### SQL Server Reporting Services (SSRS)

Developed a Patient Analysis Report.

Grouped patient information by age group and reason for visit.

Presented patient names, doctor names, consultation fees, and total consultation fees.

Created a bar chart comparing average consultation fees across patient groups.

### Key Analytical Areas

Patient demographics and age-group distribution.

Appointment patterns at the beginning and end of the year.

Scheduled and cancelled appointment analysis.

Consultation fee variations across demographic groups and visit reasons.

Average consultation fee KPI analysis.

Healthcare service utilization and revenue distribution.

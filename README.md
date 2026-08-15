# Biobank & Biospecimen Management System

## Project Overview

This project is a relational database system developed using MySQL for managing biobank and biospecimen information.

The database manages donors, consent records, collection events, biological samples, sample types, storage locations, aliquots, researchers, sample requests, sample usage, and laboratory test requests.

The database was designed and normalized up to Third Normal Form (3NF) to reduce data redundancy and maintain data integrity.

## Main Features

- Donor and consent management
- Sample collection and tracking
- Sample type management
- Storage location and aliquot tracking
- Researcher and sample request management
- Sample usage tracking
- Laboratory test request management
- SQL queries for data retrieval and analysis
- Database views for simplified data access
- Trigger for enforcing sample usage volume rules

## Database Structure

The database contains 11 main tables:

1. Donor
2. Consent
3. Collection_Event
4. Sample_Type
5. Sample
6. Storage_Location
7. Aliquot
8. Researcher
9. Sample_Request
10. Sample_Usage
11. Test_Request

## SQL Files

- `create_tables.sql` — Creates the database tables, keys, relationships, and constraints.
- `load_data.sql` — Inserts the sample data.
- `queries.sql` — Contains SELECT, JOIN, aggregation, subquery, INSERT, UPDATE, and DELETE queries.
- `views.sql` — Creates the database views.
- `triggers_procedures.sql` — Contains the database trigger and other advanced SQL objects.

## Views

Two views are included:

- `sample_inventory` — Provides sample and storage-related information.
- `research_activity` — Provides researcher and sample request/activity information.

## Trigger

The project includes the `check_usage_volume` trigger.

The trigger runs before inserting a new record into `Sample_Usage` and prevents a user from recording a usage volume greater than the available aliquot volume.

## Technologies

- MySQL
- MySQL Workbench
- SQL

## Project Files

The repository contains the SQL scripts, ER diagram, project report, presentation, and demonstration video.

## Authors

Mohamed Rateb  
Student ID: 231002599
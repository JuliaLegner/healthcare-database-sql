# 🗄️ Project Findings — Healthcare Database Management System

## 🎯 Overview

This project designed and implemented a **relational healthcare database in MySQL** for a fictional healthcare organisation.

The system was designed to manage interconnected healthcare information including:

- 👤 Patients
- 👨‍⚕️ Doctors
- 🏥 Departments
- 📅 Appointments
- 📋 Medical Records
- 💊 Prescriptions
- 👥 Staff

The project covered the complete database-development process from **requirements analysis and ER modelling to normalisation, SQL implementation, analytics and access control**.

---

# 🏗️ Finding 1 — Healthcare Data Requires a Relational Structure

Healthcare information is naturally interconnected.

For example:

```text
Patient
   │
   ├── Appointments
   │       │
   │       └── Doctor
   │              │
   │              └── Department
   │
   ├── Medical Records
   │
   └── Prescriptions
```

Storing these entities independently would make it difficult to maintain consistent relationships between records.

### 💡 Key Takeaway

A relational database provides a structured way to connect healthcare entities while avoiding unnecessary duplication of information.

Primary and foreign keys allow relationships between records to be explicitly defined and maintained.

---

# 🧩 Finding 2 — Requirements Analysis Should Come Before Implementation

The database was not created by immediately writing SQL tables.

The development process followed:

```text
Business Requirements
        ↓
Entity Identification
        ↓
Relationship Identification
        ↓
Conceptual Model
        ↓
Logical Model
        ↓
Normalisation
        ↓
Physical Database Design
        ↓
MySQL Implementation
```

### 💡 Key Takeaway

Database development begins with understanding **what information the organisation needs to store and how that information relates**.

This reduces the risk of building a database structure that cannot properly support the required operations.

---

# 🗺️ Finding 3 — ER Modelling Translates Business Requirements Into Database Structure

Entity Relationship modelling was used to represent the healthcare system before physical implementation.

The modelling process identified the main entities, their attributes and the relationships between them.

The project progressed through:

```text
Conceptual ER Model
        ↓
Logical ER Model
        ↓
Physical Database Model
```

### 💡 Interpretation

Each modelling stage serves a different purpose.

The conceptual model focuses on the business entities and their relationships.

The logical model introduces a more detailed relational structure.

The physical model translates this design into a structure that can be implemented in MySQL.

This creates a clear connection between:

> **Business requirements → data model → implemented database**

---

# 🔗 Finding 4 — Primary and Foreign Keys Maintain Relationships

Primary and foreign key constraints were used to establish relationships between tables.

Conceptually:

```text
Primary Key
     ↓
Uniquely Identifies a Record

Foreign Key
     ↓
References a Related Record
```

These constraints help ensure that related records remain connected correctly.

### 💡 Key Takeaway

Database relationships should be enforced by the database itself rather than relying only on application logic or manual data entry.

This improves **referential integrity** and reduces the likelihood of inconsistent records.

---

# 🧹 Finding 5 — Normalisation Reduces Data Redundancy

The database design was normalised to **Third Normal Form (3NF)**.

The objective was to organise information so that individual facts are stored in appropriate tables rather than repeatedly duplicated across the database.

The general progression was:

```text
Unstructured / Repeated Data
            ↓
          1NF
            ↓
          2NF
            ↓
          3NF
            ↓
Structured Relational Database
```

### 💡 Why This Matters

Without appropriate normalisation, databases can suffer from:

- duplicated information
- inconsistent updates
- insertion anomalies
- deletion anomalies
- unnecessary storage
- difficult maintenance

### 💡 Key Takeaway

Normalisation helped create a cleaner and more maintainable database structure while improving data consistency.

---

# 🔍 Finding 6 — JOINs Turn Separate Tables Into Useful Information

Normalisation separates information into related tables.

However, business questions often require information from several tables simultaneously.

Multi-table `JOIN` queries were therefore used to reconnect related information during analysis.

Conceptually:

```text
Patients
    +
Appointments
    +
Doctors
    +
Departments
        ↓
Combined Query Result
```

### 💡 Key Takeaway

Normalisation and JOINs work together:

```text
Normalisation
→ separates data efficiently

JOINs
→ reconnect data when required
```

This allows the database to remain structured without sacrificing analytical usefulness.

---

# 📊 Finding 7 — SQL Can Support Analytical Questions, Not Just Data Storage

The database was also used for analytical querying.

Techniques included:

```sql
JOIN
GROUP BY
CASE
Subqueries
Window Functions
```

These techniques allow raw database records to be transformed into structured summaries and analytical outputs.

### 💡 Key Takeaway

SQL is not limited to retrieving individual records.

A relational database can also support:

```text
Operational Data
       ↓
SQL Queries
       ↓
Aggregation
       ↓
Comparison
       ↓
Business Information
```

This makes SQL valuable for both **database management and data analytics**.

---

# 📈 Finding 8 — Aggregation Converts Records Into Management Information

`GROUP BY` and aggregate functions allow individual database records to be summarised.

For example, the same principles could support analysis by:

```text
Department
Doctor
Patient
Appointment
Prescription
```

### 💡 Key Takeaway

Transactional databases contain detailed individual records, but decision-makers often require aggregated information.

SQL provides a direct way to move between these two levels.

---

# 🪟 Finding 9 — Window Functions Enable More Advanced SQL Analysis

SQL window functions were incorporated into the project to perform calculations across groups of related rows while retaining individual records.

This provides analytical capabilities beyond basic aggregation.

Conceptually:

```text
Individual Records
        +
Group-Level Calculation
        ↓
Detailed Analytical Result
```

### 💡 Key Takeaway

Window functions are particularly useful when an analysis requires both:

- individual record detail
- comparative or aggregated information

within the same query result.

---

# 👁️ Finding 10 — Views Can Simplify Access to Complex Data

Database views were used to create reusable representations of database information.

A view can present the result of a query as a virtual table.

```text
Multiple Tables
      ↓
Complex SQL Query
      ↓
Database View
      ↓
Simplified Access
```

### 💡 Key Takeaway

Views can make frequently required information easier to access while hiding some of the complexity of the underlying relational structure.

They can also support more controlled access to database information.

---

# ✏️ Finding 11 — CRUD Operations Form the Basis of Database Management

The system supports the core database operations:

```text
CREATE
READ
UPDATE
DELETE
```

These operations allow information to be added, retrieved, modified and removed.

### 💡 Key Takeaway

A functional database needs to support the complete lifecycle of its records rather than simply storing a static dataset.

---

# 🔐 Finding 12 — Access Control Is an Important Part of Database Design

The project incorporated **Role-Based Access Control (RBAC)**.

Rather than assuming every database user should have the same permissions, access can be controlled according to user responsibilities.

Conceptually:

```text
Database User
      ↓
Assigned Role
      ↓
Permissions
      ↓
Permitted Database Actions
```

### 💡 Why This Matters

Healthcare-style databases can contain information with different levels of sensitivity and operational relevance.

Database design therefore involves not only:

```text
How should data be stored?
```

but also:

```text
Who should be able to access or modify it?
```

### 💡 Key Takeaway

Security and access management should be considered as part of the database architecture rather than added only after implementation.

---

# 🛡️ Finding 13 — Data Integrity Is a Core Database Requirement

Several aspects of the project contribute to maintaining data integrity:

- primary keys
- foreign keys
- relational constraints
- normalisation
- structured data types
- controlled CRUD operations
- role-based permissions

Together, these create a more controlled environment for managing interconnected records.

```text
Database Design
      +
Constraints
      +
Normalisation
      +
Access Control
      ↓
More Reliable Data Management
```

---

# 💼 Business Value

The project demonstrates how a centralised relational database can provide the foundation for both **operational systems and analytics**.

A structured healthcare database could support areas such as:

```text
Healthcare Database
        │
        ├── Patient Management
        ├── Appointment Management
        ├── Doctor & Department Records
        ├── Medical Records
        ├── Prescription Management
        ├── Operational Reporting
        └── Analytical Queries
```

The same relational database principles are transferable to many industries including:

- finance
- retail
- technology
- sales
- logistics
- e-commerce

---

# 🧠 Overall Technical Findings

The project demonstrates several important database-development principles.

### 🗺️ Model Before Building

Requirements and relationships should be understood before tables are implemented.

### 🧹 Normalise Data

Appropriate normalisation reduces redundancy and improves consistency.

### 🔗 Enforce Relationships

Primary and foreign keys help maintain referential integrity.

### 📊 Design for Analysis

A well-designed relational database can support both operational transactions and analytical queries.

### 🔐 Include Security

Access control is part of database architecture, particularly when different users require different permissions.

### 🧩 Separate Storage From Presentation

Views and analytical queries can provide simplified outputs without changing the underlying database structure.

---

# ⚠️ Limitations

This project represents a **fictional healthcare database developed for academic purposes**.

It should not be interpreted as a production healthcare information system.

A real healthcare database would require substantially more consideration around areas such as:

- privacy
- regulatory compliance
- encryption
- authentication
- audit logging
- backup and recovery
- high availability
- scalability
- production security
- integration with external systems

The role-based access model implemented in this project demonstrates database permission concepts but should not be considered a complete healthcare security architecture.

---

# 🚀 Future Development

The database could be extended through:

- 📊 Power BI integration
- 📈 operational healthcare dashboards
- 🧾 stored procedures
- ⚡ triggers
- 🔍 additional analytical queries
- 📝 audit logging
- 🔐 expanded security controls
- 💾 automated backups
- 🐍 Python database integration
- 🌐 application/API integration

A future analytics architecture could follow:

```text
MySQL Healthcare Database
          ↓
       SQL Views
          ↓
   Analytical Queries
          ↓
       Power BI
          ↓
Interactive Management Dashboard
```

This would extend the project from database management into a complete **database-to-business-intelligence workflow**.

---

# 🎯 Overall Conclusion

This project demonstrates the complete process of designing and implementing a **relational database from business requirements to SQL analysis**.

The workflow covered:

```text
Requirements Analysis
        ↓
ER Modelling
        ↓
Normalisation to 3NF
        ↓
MySQL Implementation
        ↓
Constraints & Relationships
        ↓
SQL Queries
        ↓
Views & CRUD Operations
        ↓
Role-Based Access Control
```

The project strengthened my understanding of how relational databases can be designed to maintain structured, connected and queryable information.

It also demonstrates SQL skills beyond basic queries, including **multi-table JOINs, aggregation, CASE statements, subqueries, window functions, views and access control**.

From a portfolio perspective, the project provides evidence of both **database design and analytical SQL**, complementing my Python, machine-learning, Excel and visualisation projects.

---

# 👩🏼‍💻 Author

**Julia Legner**  
MSc Data Science and Its Applications  
University of Greenwich

**Portfolio Focus:** SQL • Data Analytics • Database Design • Business Intelligence • Data Science

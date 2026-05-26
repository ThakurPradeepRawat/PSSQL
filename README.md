# 🙏 Prashad Database Architecture

A production-ready **SQL Server database architecture** for the **Prashad** platform.

This repository contains a modular and enterprise-level database design built for:

* Temple marketplace systems
* Prasad ordering platforms
* Razorpay payment integration
* Shipment tracking
* Notification systems
* Admin management
* Azure SQL deployments

---

# 🚀 Tech Stack

* Microsoft SQL Server
* Azure SQL Database
* T-SQL
* Stored Procedures
* SQL Indexing
* Transactions
* Foreign Keys
* Check Constraints
* GitHub Version Control

---

# 📁 Repository Structure

```text
Prashad/
│
├── Schema.sql
│
├── auth/
│   ├── tables/
│   ├── procedures/
│   ├── indexes/
│   └── constraints/
│
├── temple/
│   ├── tables/
│   ├── procedures/
│   ├── indexes/
│   └── constraints/
│
├── catalog/
│   ├── tables/
│   ├── procedures/
│   ├── indexes/
│   └── constraints/
│
├── orders/
│   ├── tables/
│   ├── procedures/
│   ├── indexes/
│   └── constraints/
│
├── payment/
│   ├── tables/
│   ├── procedures/
│   ├── indexes/
│   └── constraints/
│
├── delivery/
│   ├── tables/
│   ├── procedures/
│   ├── indexes/
│   └── constraints/
│
├── notification/
│   ├── tables/
│   ├── procedures/
│   ├── indexes/
│   └── constraints/
│
├── admin/
│   ├── tables/
│   ├── procedures/
│   ├── indexes/
│   └── constraints/
│
├── seed-data/
│
├── migrations/
│
└── full-backup/
    └── Prashad_FullDatabase.sql
```

---

# 🏗 Database Architecture

The database is divided into multiple schemas for better scalability, maintainability, and modularity.

---

# 🔐 Auth Module

Handles complete authentication and user management.

## Tables

* Users
* UserAddresses
* UserRoles
* RefreshTokens

## Features

* User registration
* Login management
* Role management
* Refresh token handling
* OTP verification
* Address management

---

# 🛕 Temple Module

Handles temple-related information.

## Tables

* Temples
* TempleImages
* TempleReviews
* TempleTimings

## Features

* Temple listings
* Temple reviews
* Temple timings
* Temple galleries
* Ratings & reviews

---

# 🍱 Catalog Module

Handles prasad catalog and inventory management.

## Tables

* Prasad
* PrasadCategories
* PrasadImages
* PrasadInventory
* Wishlists

## Features

* Product catalog
* Categories
* Inventory tracking
* Product reviews
* Wishlist support

---

# 🛒 Orders Module

Handles shopping cart and order management.

## Tables

* CartSessions
* CartItems
* Orders
* OrderItems
* Coupons

## Features

* Cart management
* Order placement
* Coupon support
* Payment tracking
* Delivery type handling

---

# 💳 Payment Module

Handles payment processing and refunds.

## Tables

* Payments
* PaymentAttempts
* Refunds

## Features

* Razorpay integration
* Payment logging
* Retry attempts
* Refund processing
* Failure tracking

---

# 🚚 Delivery Module

Handles shipment and delivery tracking.

## Tables

* DeliveryPartners
* Shipments
* ShipmentEvents

## Features

* Shipment tracking
* Delivery status updates
* Partner integrations
* AWB management

---

# 🔔 Notification Module

Handles notification templates and logs.

## Tables

* NotificationTemplates
* NotificationLogs

## Features

* Email notifications
* SMS notifications
* Push notification support
* Notification history

---

# 🛡 Admin Module

Handles admin operations and system monitoring.

## Tables

* AdminUsers
* AuditLogs
* SystemConfigs

## Features

* Audit tracking
* System configuration
* Admin permissions
* Activity logging

---

# ✨ Key Features

✅ Multi-schema architecture
✅ Production-ready database design
✅ Foreign key relationships
✅ Index optimization
✅ Check constraints
✅ Stored procedures
✅ Transaction handling
✅ TRY/CATCH error handling
✅ Azure SQL compatible
✅ Modular SQL organization
✅ Enterprise naming conventions

---

# 🧠 Database Design Principles

The database follows:

* Normalized relational design
* Modular architecture
* Separation of concerns
* Reusable stored procedures
* Constraint-based validation
* Optimized indexing strategy

---

# ⚡ Performance Optimizations

Implemented optimizations include:

* Non-clustered indexes
* Unique indexes
* Indexed foreign keys
* Optimized query filtering
* Minimal redundant data

---

# 🔒 Security Features

* Password hash storage
* Refresh token management
* Audit logging
* Role-based access support
* Constraint-based validation

---

# 🛠 Setup Instructions

## 1. Clone Repository

```bash
git clone "https://github.com/ThakurPradeepRawat/PSSQL"
```

---

## 2. Open SQL Server Management Studio

Supported tools:

* SSMS
* Azure Data Studio
* Visual Studio SQL Project

---

## 3. Execute Schema File

Run:

```sql
Schema.sql
```

This creates:

* Database
* Schemas

---

## 4. Execute Module Scripts

Recommended execution order:

```text
1. Tables
2. Constraints
3. Indexes
4. Procedures
5. Seed Data
```

---

# 📌 Naming Conventions

## Tables

```text
Users.sql
Orders.sql
Payments.sql
Temples.sql
```

## Stored Procedures

```text
auth_sp_CreateUser.sql
orders_sp_CreateOrder.sql
payment_sp_CreatePayment.sql
```

## Indexes

```text
Users_Indexes.sql
Orders_Indexes.sql
```

---

# 🧾 Stored Procedure Standards

All procedures follow:

* CREATE OR ALTER
* TRY/CATCH blocks
* Transaction handling
* Proper validation
* Parameterized queries
* Enterprise naming conventions

---

# 🌍 Azure Ready

The project is fully compatible with:

* Azure SQL Database
* Azure App Service
* Azure DevOps
* GitHub Actions CI/CD

---

# 🔄 Recommended CI/CD Flow

```text
GitHub
   ↓
GitHub Actions
   ↓
Azure SQL Deployment
   ↓
Azure App Service
```

---

# 📈 Future Improvements

Planned improvements:

* Soft delete support
* RowVersion concurrency handling
* Automated migrations
* DACPAC deployment
* SQL unit testing
* Advanced analytics procedures

---

# 🧪 Recommended Development Workflow

```text
Feature Development
    ↓
Create SQL Script
    ↓
Commit to Git
    ↓
Migration Script
    ↓
Deployment
```

---

# 👨‍💻 Author

## Pradeep Rawat

Backend Developer | .NET | SQL Server | Azure

---

# 📄 License

This project is intended for:

* Learning
* Portfolio projects
* Production experimentation
* Database architecture practice

Feel free to fork, improve, and extend the project.

---

# ⭐ Support

If you found this project useful:

* Star the repository
* Fork the project
* Contribute improvements
* Share feedback

---

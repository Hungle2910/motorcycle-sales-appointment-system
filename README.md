# MotoSales Appointment System

[![Java 17](https://img.shields.io/badge/Java-17-007396?logo=openjdk&logoColor=white)](https://openjdk.org/)
[![Java Servlet](https://img.shields.io/badge/Java%20Servlet-4.0-ff6f00)](https://javaee.github.io/servlet-spec/)
[![SQL Server](https://img.shields.io/badge/SQL%20Server-2022-cc2927?logo=microsoftsqlserver&logoColor=white)](https://www.microsoft.com/sql-server)
[![Apache Tomcat](https://img.shields.io/badge/Tomcat-10.x-f8dc75?logo=apachetomcat&logoColor=111827)](https://tomcat.apache.org/)

A Java Servlet/JSP MVC web application for managing motorcycle sales, carts, customer appointments, order history, and admin operations. The project is organized like a production-ready class project: backend code, frontend handoff, SQL Server scripts, CI workflows, and clear task ownership.

## Overview

The system simulates an e-commerce process without real payment integration:

1. Customers browse motorcycles, view details, and add selected bikes to a session cart.
2. Customers submit checkout information and schedule a pickup appointment at the showroom.
3. Admins manage brands, motorcycles, orders, users, and appointment statuses.
4. SQL Server stores users, brands, motorcycles, carts, orders, and order items.

## Tech Stack

| Layer | Technology |
| --- | --- |
| Backend | Java Core, Java Servlet 4.0, JSP, JSTL |
| Database | SQL Server |
| Server | Apache Tomcat |
| Build | Maven WAR |
| Frontend | JSP, CSS, Bootstrap-ready static assets |
| DevOps | GitHub Actions, Docker Compose for SQL Server |

## Project Structure

```text
motorcycle-sales-appointment-system/
├─ .github/
│  ├─ CODEOWNERS
│  ├─ ISSUE_TEMPLATE/
│  └─ workflows/
├─ backend/
│  ├─ pom.xml
│  └─ src/main/
│     ├─ java/com/motosales/
│     │  ├─ config/
│     │  ├─ controller/
│     │  ├─ dao/
│     │  ├─ filter/
│     │  ├─ model/
│     │  └─ util/
│     └─ webapp/
│        ├─ admin/
│        ├─ assets/
│        ├─ common/
│        ├─ WEB-INF/
│        └─ *.jsp
├─ database/
│  ├─ schema.sql
│  └─ seed.sql
├─ docs/project-management/
├─ frontend/handoff/
├─ docker-compose.yml
└─ README.md
```

## Run Locally

1. Start SQL Server:

```powershell
docker compose up -d
```

2. Apply database scripts with SQL Server Management Studio or `sqlcmd`:

```powershell
sqlcmd -S localhost,1433 -U sa -P YourStrongPassword123 -i database/schema.sql
sqlcmd -S localhost,1433 -U sa -P YourStrongPassword123 -i database/seed.sql
```

3. Build the WAR:

```powershell
cd backend
mvn clean package
```

4. Deploy `backend/target/motosales.war` to Apache Tomcat.

## Development Workflow

- Create feature branches from `dev`.
- Backend database work goes to `feature/backend-database`.
- Backend servlet/session work goes to `feature/backend-servlets`.
- Frontend JSP/assets work goes to `feature/frontend-ui`.
- Open pull requests into `dev`, then merge `dev` into `main` for stable submission.

## Project Board

Issues are grouped by milestones:

- `M1 - Project Foundation`
- `M2 - Customer Buying Flow`
- `M3 - Admin Operations`
- `M4 - Hardening & Delivery`

See `docs/project-management/task-breakdown.md` for ownership and task structure.

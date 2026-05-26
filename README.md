# TaskFlow v1.0

TaskFlow is a role-based task management web application built using Java Servlets, JSP, Hibernate, PostgreSQL, and Bootstrap.

The application allows users to manage tasks based on role-based access control (RBAC). Regular users can manage only their own tasks, while administrators can view and perform CRUD operations on all tasks.

---

## Features

### Authentication & Authorization
- User registration and login
- Session-based authentication using HttpSession
- Role-based access control implemented using Java Enum (`USER`, `ADMIN`)
- Servlet Filters for protected routes and admin-only access

### Task Management
- Create tasks
- View tasks
- Update tasks
- Delete tasks
- Set task descriptions and deadlines

### User Permissions
- **USER**
  - View only their own tasks
  - Perform CRUD only on tasks assigned to them

- **ADMIN**
  - View all users
  - View all tasks
  - Perform CRUD operations across the system

---

## Tech Stack

### Backend
- Java
- Servlets
- JSP
- Hibernate / JPA
- PostgreSQL

### Frontend
- HTML
- CSS
- Bootstrap

### Build / IDE
- Maven
- Eclipse

---

## Database Design

### Entities

### User
- `user_id`
- `name`
- `username`
- `email`
- `password`
- `role`

### Task
- `task_id`
- `task_name`
- `task_description`
- `deadline`
- `user`

### Relationship
- One User → Many Tasks
- Many Tasks → One User

---

## Core Concepts Implemented

- Object Oriented Programming (OOP)
- DAO Pattern
- Hibernate Entity Mapping
- JPQL Queries
- EntityManager / EntityTransaction
- Session Management with HttpSession
- Servlet Filters
- Request Dispatching & Redirects
- Role-Based Access Control (RBAC)
- MVC-style project structure
- Form handling with JSP + Servlets

---

## Project Structure

src/main/java
- com.tasks.dao
- com.tasks.dto
- com.tasks.servlet
- com.tasks.filter

src/main/webapp
- login.jsp
- register.jsp
- /app/user
- /app/admin

---

## Future Improvements

- Password hashing
- Task search and filtering
- Pagination
- Status tracking (Pending / Completed)
- Dashboard analytics

---

## Author
[Mithil Dhure](https://www.linkedin.com/in/mithil-dhure/)

BEGIN TRANSACTION;
CREATE TABLE departments (
        department_id INTEGER PRIMARY KEY,
        department_name TEXT NOT NULL,
        location TEXT
    );
INSERT INTO "departments" VALUES(1,'Data','London');
INSERT INTO "departments" VALUES(2,'Engineering','Berlin');
INSERT INTO "departments" VALUES(3,'Sales','Milan');
INSERT INTO "departments" VALUES(4,'Finance','Tokyo');
INSERT INTO "departments" VALUES(5,'People',NULL);
INSERT INTO "departments" VALUES(6,'Legal','Paris');
INSERT INTO "departments" VALUES(7,'Operations','Madrid');
INSERT INTO "departments" VALUES(8,'Marketing','London');
CREATE TABLE employee_projects (
        employee_id INTEGER NOT NULL,
        project_id INTEGER NOT NULL,
        hours_allocated INTEGER NOT NULL CHECK (hours_allocated > 0),
        PRIMARY KEY (employee_id, project_id),
        FOREIGN KEY (employee_id) REFERENCES employees(employee_id),
        FOREIGN KEY (project_id) REFERENCES projects(project_id)
    );
INSERT INTO "employee_projects" VALUES(1,1,15);
INSERT INTO "employee_projects" VALUES(2,1,25);
INSERT INTO "employee_projects" VALUES(3,1,20);
INSERT INTO "employee_projects" VALUES(4,2,15);
INSERT INTO "employee_projects" VALUES(5,2,30);
INSERT INTO "employee_projects" VALUES(6,2,20);
INSERT INTO "employee_projects" VALUES(7,3,20);
INSERT INTO "employee_projects" VALUES(8,3,30);
INSERT INTO "employee_projects" VALUES(9,4,20);
INSERT INTO "employee_projects" VALUES(10,4,25);
INSERT INTO "employee_projects" VALUES(1,5,10);
INSERT INTO "employee_projects" VALUES(2,5,20);
INSERT INTO "employee_projects" VALUES(5,5,10);
INSERT INTO "employee_projects" VALUES(11,6,10);
INSERT INTO "employee_projects" VALUES(12,6,25);
INSERT INTO "employee_projects" VALUES(13,7,20);
INSERT INTO "employee_projects" VALUES(14,7,25);
INSERT INTO "employee_projects" VALUES(21,7,5);
INSERT INTO "employee_projects" VALUES(15,8,20);
INSERT INTO "employee_projects" VALUES(16,8,20);
INSERT INTO "employee_projects" VALUES(22,8,20);
INSERT INTO "employee_projects" VALUES(4,10,10);
INSERT INTO "employee_projects" VALUES(18,10,35);
INSERT INTO "employee_projects" VALUES(17,1,15);
INSERT INTO "employee_projects" VALUES(19,3,10);
INSERT INTO "employee_projects" VALUES(20,4,15);
CREATE TABLE employees (
        employee_id INTEGER PRIMARY KEY,
        first_name TEXT NOT NULL,
        last_name TEXT NOT NULL,
        department_id INTEGER NOT NULL,
        manager_id INTEGER,
        hire_date TEXT NOT NULL,
        salary INTEGER NOT NULL CHECK (salary > 0),
        active INTEGER NOT NULL DEFAULT 1 CHECK (active IN (0, 1)),
        FOREIGN KEY (department_id) REFERENCES departments(department_id),
        FOREIGN KEY (manager_id) REFERENCES employees(employee_id)
    );
INSERT INTO "employees" VALUES(1,'Maya','Nakamura',1,NULL,'2020-01-15',120000,1);
INSERT INTO "employees" VALUES(2,'Luca','Ferrari',1,1,'2022-06-01',76000,1);
INSERT INTO "employees" VALUES(3,'Sara','Conti',1,1,'2023-03-12',69000,1);
INSERT INTO "employees" VALUES(4,'Jonas','Weber',2,NULL,'2019-09-09',130000,1);
INSERT INTO "employees" VALUES(5,'Noah','Brown',2,4,'2021-11-22',88000,1);
INSERT INTO "employees" VALUES(6,'Aisha','Rahman',2,4,'2024-02-05',72000,1);
INSERT INTO "employees" VALUES(7,'Clara','Romano',3,NULL,'2018-07-18',115000,1);
INSERT INTO "employees" VALUES(8,'Omar','Haddad',3,7,'2023-10-30',67000,1);
INSERT INTO "employees" VALUES(9,'Yuki','Sato',4,NULL,'2020-05-20',118000,1);
INSERT INTO "employees" VALUES(10,'Emma','Wilson',4,9,'2022-12-14',74000,1);
INSERT INTO "employees" VALUES(11,'Tom','Wilson',5,NULL,'2021-01-10',90000,1);
INSERT INTO "employees" VALUES(12,'Mina','Park',5,11,'2024-04-01',62000,1);
INSERT INTO "employees" VALUES(13,'Carlos','Diaz',7,NULL,'2020-08-08',98000,1);
INSERT INTO "employees" VALUES(14,'Irene','Lopez',7,13,'2023-06-15',65000,1);
INSERT INTO "employees" VALUES(15,'Sofia','Costa',8,NULL,'2022-02-02',97000,1);
INSERT INTO "employees" VALUES(16,'Ethan','Miller',8,15,'2025-01-05',61000,1);
INSERT INTO "employees" VALUES(17,'Nina','Kowalski',1,1,'2025-02-20',69000,1);
INSERT INTO "employees" VALUES(18,'Leo','Schmidt',2,4,'2020-03-03',88000,0);
INSERT INTO "employees" VALUES(19,'Zara','Khan',3,7,'2025-03-03',67000,1);
INSERT INTO "employees" VALUES(20,'Kai','Ito',4,9,'2025-05-01',74000,1);
INSERT INTO "employees" VALUES(21,'Ana','Silva',7,13,'2024-09-09',65000,0);
INSERT INTO "employees" VALUES(22,'Paul','Green',8,15,'2025-05-15',61000,1);
CREATE TABLE projects (
        project_id INTEGER PRIMARY KEY,
        project_name TEXT NOT NULL,
        department_id INTEGER NOT NULL,
        start_date TEXT NOT NULL,
        end_date TEXT,
        budget INTEGER NOT NULL CHECK (budget >= 0),
        FOREIGN KEY (department_id) REFERENCES departments(department_id)
    );
INSERT INTO "projects" VALUES(1,'Churn Prediction',1,'2025-01-01',NULL,180000);
INSERT INTO "projects" VALUES(2,'Data Warehouse',2,'2024-11-15',NULL,350000);
INSERT INTO "projects" VALUES(3,'CRM Expansion',3,'2025-02-01','2025-08-31',140000);
INSERT INTO "projects" VALUES(4,'Risk Dashboard',4,'2025-03-10',NULL,90000);
INSERT INTO "projects" VALUES(5,'Recommendation Engine',1,'2025-04-01',NULL,220000);
INSERT INTO "projects" VALUES(6,'Hiring Portal',5,'2025-01-20',NULL,60000);
INSERT INTO "projects" VALUES(7,'Warehouse Optimization',7,'2025-02-15',NULL,110000);
INSERT INTO "projects" VALUES(8,'Brand Refresh',8,'2025-03-01','2025-09-30',85000);
INSERT INTO "projects" VALUES(9,'Compliance Audit',6,'2025-04-10',NULL,0);
INSERT INTO "projects" VALUES(10,'Legacy Migration',2,'2024-09-01','2025-04-30',250000);
COMMIT;

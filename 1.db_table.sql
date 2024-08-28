
create database DIYcoding;

use DIYcoding;

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    Department NVARCHAR(50),
    Salary DECIMAL(10, 2)
);

INSERT INTO Employees (EmployeeID, FirstName, LastName, Department, Salary) VALUES
(1, 'John', 'Doe', 'HR', 60000.00),
(2, 'Jane', 'Smith', 'Finance', 75000.00),
(3, 'Michael', 'Brown', 'IT', 85000.00),
(4, 'Emily', 'Davis', 'Marketing', 70000.00),
(5, 'William', 'Johnson', 'Sales', 65000.00);


CREATE TABLE Projects (
    ProjectID INT PRIMARY KEY,
    ProjectName NVARCHAR(100),
    StartDate DATE,
    EndDate DATE,
    Budget DECIMAL(12, 2)
);

INSERT INTO Projects (ProjectID, ProjectName, StartDate, EndDate, Budget) VALUES
(1, 'Project Alpha', '2024-01-15', '2024-06-30', 150000.00),
(2, 'Project Beta', '2024-02-01', '2024-07-15', 120000.00),
(3, 'Project Gamma', '2024-03-10', '2024-08-25', 180000.00),
(4, 'Project Delta', '2024-04-20', '2024-09-30', 200000.00),
(5, 'Project Epsilon', '2024-05-05', '2024-10-15', 170000.00),
(6, 'Project Zeta', '2024-06-01', '2024-11-20', 140000.00);



CREATE DATABASE diy;
USE diy;

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(20)
);

INSERT INTO Customers VALUES
(1003, 'John', 'Doe', 'john.doe@example.com', '123-456-7890'),
(3034, 'Jane', 'Smith', 'jane.smith@example.com', '234-567-8901'),
(4096, 'Emily', 'Jones', 'emily.jones@example.com', '345-678-9012');

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO Orders VALUES
(1, 4096, '2024-05-01', 21.98),
(2, 3034, '2024-05-02', 49.99),
(3, 1003, '2024-05-03', 10.99);


CREATE TABLE Suppliers (
    SupplierID INT PRIMARY KEY AUTO_INCREMENT,
    SupplierName VARCHAR(100),
    ContactName VARCHAR(100),
    ContactEmail VARCHAR(100),
    ContactPhone VARCHAR(20)
);

INSERT INTO Suppliers (SupplierName, ContactName, ContactEmail, ContactPhone) VALUES
('ABC Supplies', 'Alice Brown', 'alice.brown@abc.com', '456-789-0123'),
('XYZ Wholesale', 'Bob Green', 'bob.green@xyz.com', '567-890-1234');

CREATE TABLE Products (
    ProductID INT PRIMARY KEY AUTO_INCREMENT,
    ProductName VARCHAR(100),
    SupplierID INT,
    Price DECIMAL(10, 2),
    Stock INT,
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);

INSERT INTO Products (ProductName, SupplierID, Price, Stock) VALUES
('Hammer', 1, 10.99, 100),
('Screwdriver', 1, 5.99, 150),
('Drill', 2, 49.99, 50),
('Wrench', 2, 8.99, 200);

CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY AUTO_INCREMENT,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    Price DECIMAL(10, 2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO OrderDetails (OrderID, ProductID, Quantity, Price) VALUES
(1, 1, 2, 10.99),
(2, 3, 1, 49.99),
(3, 1, 1, 10.99);

SELECT*FROM Customers;






-- Creating a Database for storing tables
CREATE DATABASE ProductInventoryDB;

-- Switching to new database
USE ProductInventoryDB;

-- Creating the Categories table to categorize products
CREATE TABLE Categories (
    CategoryID INT IDENTITY(1,1) PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Description TEXT
);

-- Creating the Suppliers table to store supplier information
CREATE TABLE Suppliers (
    SupplierID INT IDENTITY(1,1) PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    ContactName VARCHAR(255),
    ContactEmail VARCHAR(255),
    ContactPhone VARCHAR(20)
);

-- Creating the Products table to store product information
CREATE TABLE Products (
    ProductID INT IDENTITY(1,1) PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Description TEXT,
    Price DECIMAL(10, 2) NOT NULL,
    Quantity INT NOT NULL,
    CategoryID INT,
    SupplierID INT,
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID),
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);

-- Creating the Transactions table to record product movements
CREATE TABLE Transactions (
    TransactionID INT IDENTITY(1,1) PRIMARY KEY,
    TransactionDate DATE NOT NULL,
    ProductID INT NOT NULL,
    Quantity INT NOT NULL,
    TransactionType VARCHAR(20) NOT NULL, -- e.g., 'In', 'Out', 'Return'
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);


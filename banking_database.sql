-- PHASE I of project begins 

-- Q1. Create a database for a banking application called 'Bank'.
CREATE DATABASE dbBankGM;

-- Use the created database.
USE dbBankGM;

-- Q2 & Q3. Create all the tables and constraints based on the database diagram.

-- Creating table named UserLogins
CREATE TABLE UserLogins (
    UserLoginID SMALLINT AUTO_INCREMENT,
    UserLogin VARCHAR(50) NOT NULL,
    UserPassword VARCHAR(20) NOT NULL,
    PRIMARY KEY (UserLoginID)
);

-- Creating table named UserSecurityQuestions
CREATE TABLE UserSecurityQuestions (
    UserSecurityQuestionID TINYINT AUTO_INCREMENT,
    UserSecurityQuestion VARCHAR(50) NOT NULL,
    PRIMARY KEY (UserSecurityQuestionID)
);

-- Creating table named AccountType
CREATE TABLE AccountType (
    AccountTypeID TINYINT AUTO_INCREMENT,
    AccountTypeDescription VARCHAR(30) NOT NULL,
    PRIMARY KEY (AccountTypeID)
);

-- Creating table named SavingsInterestRates
CREATE TABLE SavingsInterestRates (
    InterestSavingRatesID TINYINT AUTO_INCREMENT,
    InterestRatesValue DECIMAL(9,2) NOT NULL,
    InterestRatesDescription VARCHAR(20) NOT NULL,
    PRIMARY KEY (InterestSavingRatesID)
);

-- Creating table named AccountStatusType
CREATE TABLE AccountStatusType (
    AccountStatusTypeID TINYINT AUTO_INCREMENT,
    AccountStatusTypeDescription VARCHAR(30) NOT NULL,
    PRIMARY KEY (AccountStatusTypeID)
);

-- Creating table named FailedTransactionErrorType
CREATE TABLE FailedTransactionErrorType (
    FailedTransactionErrorTypeID TINYINT AUTO_INCREMENT,
    FailedTransactionErrorTypeDescription VARCHAR(50) NOT NULL,
    PRIMARY KEY (FailedTransactionErrorTypeID)
);

-- Creating table named LoginErrorLog
CREATE TABLE LoginErrorLog (
    ErrorLogID INT AUTO_INCREMENT,
    ErrorTime DATETIME NOT NULL,
    FailedTransactionXML TEXT,
    PRIMARY KEY (ErrorLogID)
);

-- Creating table named Employee
CREATE TABLE Employee (
    EmployeeID INT AUTO_INCREMENT,
    EmployeeFirstName VARCHAR(25) NOT NULL,
    EmployeeMiddleInitial CHAR(1),
    EmployeeLastName VARCHAR(25),
    EmployeeisManager BOOLEAN,
    PRIMARY KEY (EmployeeID)
);

-- Creating table named TransactionType
CREATE TABLE TransactionType (
    TransactionTypeID TINYINT AUTO_INCREMENT,
    TransactionTypeName CHAR(10) NOT NULL,
    TransactionTypeDescription VARCHAR(50),
    TransactionFeeAmount DECIMAL(10,2),
    PRIMARY KEY (TransactionTypeID)
);

-- Creating table named FailedTransactionLog
CREATE TABLE FailedTransactionLog (
    FailedTransactionID INT AUTO_INCREMENT,
    FailedTransactionErrorTypeID TINYINT NOT NULL,
    FailedTransactionErrorTime DATETIME,
    FailedTransactionErrorXML TEXT,
    PRIMARY KEY (FailedTransactionID),
    FOREIGN KEY (FailedTransactionErrorTypeID) REFERENCES FailedTransactionErrorType(FailedTransactionErrorTypeID)
);

-- Creating table named UserSecurityAnswers
CREATE TABLE UserSecurityAnswers (
    UserLoginID SMALLINT,
    UserSecurityAnswers VARCHAR(25) NOT NULL,
    UserSecurityQuestionID TINYINT NOT NULL,
    PRIMARY KEY (UserLoginID, UserSecurityQuestionID),
    FOREIGN KEY (UserLoginID) REFERENCES UserLogins(UserLoginID),
    FOREIGN KEY (UserSecurityQuestionID) REFERENCES UserSecurityQuestions(UserSecurityQuestionID)
);

-- Creating table named Account
CREATE TABLE Account (
    AccountID INT AUTO_INCREMENT,
    CurrentBalance INT NOT NULL,
    AccountTypeID TINYINT NOT NULL,
    AccountStatusTypeID TINYINT NOT NULL,
    InterestSavingRatesID TINYINT NOT NULL,
    PRIMARY KEY (AccountID),
    FOREIGN KEY (AccountTypeID) REFERENCES AccountType(AccountTypeID),
    FOREIGN KEY (AccountStatusTypeID) REFERENCES AccountStatusType(AccountStatusTypeID),
    FOREIGN KEY (InterestSavingRatesID) REFERENCES SavingsInterestRates(InterestSavingRatesID)
);

-- Creating table named LoginAccount
CREATE TABLE LoginAccount (
    UserLoginID SMALLINT NOT NULL,
    AccountID INT NOT NULL,
    PRIMARY KEY (UserLoginID, AccountID),
    FOREIGN KEY (UserLoginID) REFERENCES UserLogins(UserLoginID),
    FOREIGN KEY (AccountID) REFERENCES Account(AccountID)
);

-- Creating table named Customer
CREATE TABLE Customer (
    CustomerID INT AUTO_INCREMENT,
    AccountID INT NOT NULL,
    CustomerAddress1 VARCHAR(30) NOT NULL,
    CustomerAddress2 VARCHAR(30),
    CustomerFirstName VARCHAR(30) NOT NULL,
    CustomerMiddleInitial CHAR(1),
    CustomerLastName VARCHAR(30) NOT NULL,
    City VARCHAR(20) NOT NULL,
    State CHAR(2) NOT NULL,
    ZipCode CHAR(10) NOT NULL,
    EmailAddress VARCHAR(40) NOT NULL,
    HomePhone VARCHAR(10) NOT NULL,
    CellPhone VARCHAR(10) NOT NULL,
    WorkPhone VARCHAR(10) NOT NULL,
    SSN VARCHAR(9),
    UserLoginID SMALLINT NOT NULL,
    PRIMARY KEY (CustomerID),
    FOREIGN KEY (AccountID) REFERENCES Account(AccountID),
    FOREIGN KEY (UserLoginID) REFERENCES UserLogins(UserLoginID)
);

-- Creating table named CustomerAccount
CREATE TABLE CustomerAccount (
    AccountID INT NOT NULL,
    CustomerID INT NOT NULL,
    PRIMARY KEY (AccountID, CustomerID),
    FOREIGN KEY (AccountID) REFERENCES Account(AccountID),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

-- Creating table named TransactionLog
CREATE TABLE TransactionLog (
    TransactionID INT AUTO_INCREMENT,
    TransactionDate DATETIME NOT NULL,
    TransactionTypeID TINYINT NOT NULL,
    TransactionAmount DECIMAL(10,2) NOT NULL,
    NewBalance DECIMAL(10,2) NOT NULL,
    AccountID INT NOT NULL,
    CustomerID INT NOT NULL,
    EmployeeID INT NOT NULL,
    UserLoginID SMALLINT NOT NULL,
    PRIMARY KEY (TransactionID),
    FOREIGN KEY (TransactionTypeID) REFERENCES TransactionType(TransactionTypeID),
    FOREIGN KEY (AccountID) REFERENCES Account(AccountID),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
    FOREIGN KEY (UserLoginID) REFERENCES UserLogins(UserLoginID)
);

-- Creating table named OverDraftLog
CREATE TABLE OverDraftLog (
    AccountID INT NOT NULL,
    OverDraftDate DATETIME NOT NULL,
    OverDraftAmount DECIMAL(10,2) NOT NULL,
    OverDraftTransactionXML TEXT NOT NULL,
    PRIMARY KEY (AccountID),
    FOREIGN KEY (AccountID) REFERENCES Account(AccountID)
);

-- Inserting data into UserLogins
INSERT INTO UserLogins (UserLogin, UserPassword) VALUES
('john_doe', 'password123'),
('jane_smith', 'pass456'),
('alice_wonder', 'wonder789');

-- Inserting data into UserSecurityQuestions
INSERT INTO UserSecurityQuestions (UserSecurityQuestion) VALUES
('What is your mother’s maiden name?'),
('What is the name of your first pet?'),
('What is your favorite book?');

-- Inserting data into AccountType
INSERT INTO AccountType (AccountTypeDescription) VALUES
('Savings'),
('Current'),
('Fixed Deposit'),
('Recurring Deposit');

-- Inserting data into SavingsInterestRates
INSERT INTO SavingsInterestRates (InterestRatesValue, InterestRatesDescription) VALUES
(3.50, 'Low'),
(6.75, 'Medium'),
(5.00, 'Medium');

-- Inserting data into AccountStatusType
INSERT INTO AccountStatusType (AccountStatusTypeDescription) VALUES
('Active'),
('Dormant'),
('Closed'),
('Frozen');

-- Inserting data into FailedTransactionErrorType
INSERT INTO FailedTransactionErrorType (FailedTransactionErrorTypeDescription) VALUES
('Insufficient Funds'),
('Account Not Found'),
('Technical Error'),
('Invalid Account Details');

-- Inserting data into LoginErrorLog
INSERT INTO LoginErrorLog (ErrorTime, FailedTransactionXML) VALUES
(NOW(), '<error>Invalid Password</error>'),
(NOW(), '<error>User Not Found</error>');

-- Inserting data into Employee
INSERT INTO Employee (EmployeeFirstName, EmployeeMiddleInitial, EmployeeLastName, EmployeeisManager) VALUES
('John', 'A', 'Doe', TRUE),
('Jane', NULL, 'Smith', FALSE),
('Alice', 'B', 'Wonder', FALSE);

-- Inserting data into TransactionType
INSERT INTO TransactionType (TransactionTypeName, TransactionTypeDescription, TransactionFeeAmount) VALUES
('Deposit', 'Deposit Money', 0.00),
('Withdraw', 'Withdraw Money', 2.50),
('Transfer', 'Transfer Money to Another Account', 1.00);

-- Inserting data into FailedTransactionLog
INSERT INTO FailedTransactionLog (FailedTransactionErrorTypeID, FailedTransactionErrorTime, FailedTransactionErrorXML) VALUES
(1, NOW(), '<error>Insufficient Funds</error>'),
(2, NOW(), '<error>Account Not Found</error>');

-- Inserting data into UserSecurityAnswers
INSERT INTO UserSecurityAnswers (UserLoginID, UserSecurityAnswers, UserSecurityQuestionID) VALUES
(1, 'Johnson', 1),
(2, 'Fluffy', 2),
(3, 'Alice in Wonderland', 3);

-- Inserting data into Account
INSERT INTO Account (CurrentBalance, AccountTypeID, AccountStatusTypeID, InterestSavingRatesID) VALUES
(5000, 1, 1, 1),
(25000, 2, 1, 2),
(100000, 3, 1, 3);

-- Inserting data into LoginAccount
INSERT INTO LoginAccount (UserLoginID, AccountID) VALUES
(1, 1),
(2, 2),
(3, 3);

-- Inserting data into Customer
INSERT INTO Customer (AccountID, CustomerAddress1, CustomerAddress2, CustomerFirstName, CustomerMiddleInitial, CustomerLastName, City, State, ZipCode, EmailAddress, HomePhone, CellPhone, WorkPhone, SSN, UserLoginID) VALUES
(1, '123 Elm Street', NULL, 'John', 'A', 'Doe', 'New York', 'NY', '10001', 'john.doe@example.com', '1234567890', '0987654321', '1112223333', '123456789', 1),
(2, '456 Oak Avenue', NULL, 'Jane', NULL, 'Smith', 'Los Angeles', 'CA', '90001', 'jane.smith@example.com', '2345678901', '1987654321', '2223334444', '987654321', 2),
(3, '789 Maple Road', NULL, 'Alice', 'B', 'Wonder', 'Chicago', 'IL', '60601', 'alice.wonder@example.com', '3456789012', '2987654321', '3334445555', '567890123', 3);

-- Inserting data into CustomerAccount
INSERT INTO CustomerAccount (AccountID, CustomerID) VALUES
(1, 1),
(2, 2),
(3, 3);

-- Inserting data into TransactionLog
INSERT INTO TransactionLog (TransactionDate, TransactionTypeID, TransactionAmount, NewBalance, AccountID, CustomerID, EmployeeID, UserLoginID) VALUES
(NOW(), 1, 500, 5500, 1, 1, 1, 1),
(NOW(), 2, 1000, 24000, 2, 2, 2, 2),
(NOW(), 3, 2000, 98000, 3, 3, 3, 3);

-- Inserting data into OverDraftLog
INSERT INTO OverDraftLog (AccountID, OverDraftDate, OverDraftAmount, OverDraftTransactionXML) VALUES
(1, NOW(), 100, '<transaction>Overdrafted</transaction>'),
(2, NOW(), 200, '<transaction>Overdrafted</transaction>');

-- PHASE II of project begins

-- Q1. Create a view to get all customers with checking accounts from ON province.

DROP VIEW IF EXISTS VW_Customer_ON;

CREATE VIEW VW_Customer_ON AS
SELECT DISTINCT c.* 
FROM Customer c
JOIN Account a ON c.AccountID = a.AccountID
JOIN AccountType at ON a.AccountTypeID = at.AccountTypeID
WHERE at.AccountTypeDescription = 'Checking' AND c.State = 'ON';

-- Q2. Create a view to get all customers with total account balance (including interest rate) greater than 5000.

DROP VIEW IF EXISTS VW_Customer_AMT;

CREATE VIEW VW_Customer_AMT AS
SELECT 
    c.CustomerFirstName, 
    SUM(a.CurrentBalance) AS Ac_Balance, 
    SUM(a.CurrentBalance + (a.CurrentBalance * s.InterestRatesValue) / 100) AS Total_Ac_Balance
FROM Customer c
JOIN Account a ON c.AccountID = a.AccountID
JOIN SavingsInterestRates s ON a.InterestSavingRatesID = s.InterestSavingRatesID
GROUP BY c.CustomerFirstName
HAVING SUM(a.CurrentBalance + (a.CurrentBalance * s.InterestRatesValue) / 100) > 5000;

-- Q3. Create a view to get counts of checking and savings accounts by customer.

DROP VIEW IF EXISTS VW_Customer_ACC;

CREATE VIEW VW_Customer_ACC AS
SELECT 
    c.CustomerFirstName, 
    at.AccountTypeDescription, 
    COUNT(*) AS Total_AC_Types
FROM Customer c
JOIN Account a ON c.AccountID = a.AccountID
JOIN AccountType at ON a.AccountTypeID = at.AccountTypeID
GROUP BY c.CustomerFirstName, at.AccountTypeDescription;

-- Q4. Create a view to get any particular user’s login and password using AccountID.

DROP VIEW IF EXISTS VW_Account_UL;

CREATE VIEW VW_Account_UL AS
SELECT DISTINCT ul.UserLogin, ul.UserPassword
FROM UserLogins ul
JOIN LoginAccount la ON ul.UserLoginID = la.UserLoginID
WHERE la.AccountID = 1;

-- Q5. Create a view to get all customers’ overdraft amount.

DROP VIEW IF EXISTS VW_Customer_OD;

CREATE VIEW VW_Customer_OD AS
SELECT DISTINCT c.CustomerFirstName, o.OverDraftAmount
FROM OverDraftLog o
JOIN Customer c ON o.AccountID = c.AccountID;



-- Disable safe mode to allow updates
SET SQL_SAFE_UPDATES = 0;

DELIMITER $$

-- Q6. Add "User_" as a prefix to everyone's login
DROP PROCEDURE IF EXISTS sp_Update_Login $$

CREATE PROCEDURE sp_Update_Login()
BEGIN
    UPDATE UserLogins
    SET UserLogin = CONCAT('User_', UserLogin)
    WHERE UserLoginID IS NOT NULL; -- Ensures a WHERE clause for safe mode
END $$

CALL sp_Update_Login(); $$


-- Q7. Get customer's full name by AccountID
DROP PROCEDURE IF EXISTS sp_Customer_Details $$

CREATE PROCEDURE sp_Customer_Details(IN AccountID INT)
BEGIN
    SELECT CONCAT(CustomerFirstName, ' ', IFNULL(CustomerMiddleInitial, ''), ' ', CustomerLastName) AS Customer_Full_Name
    FROM Customer
    WHERE AccountID = AccountID;
END $$

CALL sp_Customer_Details(2); $$


-- Q8. Get error logs from the last 24 hours
DROP PROCEDURE IF EXISTS sp_Errors_24 $$

CREATE PROCEDURE sp_Errors_24()
BEGIN
    SELECT * FROM LoginErrorLog
    WHERE ErrorTime >= NOW() - INTERVAL 24 HOUR;
END $$

CALL sp_Errors_24(); $$


-- Q9. Update balance after deposit
DROP PROCEDURE IF EXISTS sp_Update_cBalance_After_Deposit $$

CREATE PROCEDURE sp_Update_cBalance_After_Deposit(IN AccountID INT, IN Deposit INT)
BEGIN
    UPDATE Account
    SET CurrentBalance = CurrentBalance + Deposit
    WHERE AccountID = AccountID;
END $$

CALL sp_Update_cBalance_After_Deposit(3, 300); $$


-- Q10. Update balance after withdrawal
DROP PROCEDURE IF EXISTS sp_Update_cBalance_After_Withdraw $$

CREATE PROCEDURE sp_Update_cBalance_After_Withdraw(IN AccountID INT, IN Withdraw INT)
BEGIN
    UPDATE Account
    SET CurrentBalance = CurrentBalance - Withdraw
    WHERE AccountID = AccountID;
END $$

CALL sp_Update_cBalance_After_Withdraw(3, 300); $$


-- Q11. Remove security questions for a user
DROP PROCEDURE IF EXISTS sp_Delete_Question $$

CREATE PROCEDURE sp_Delete_Question(IN UserLoginID SMALLINT)
BEGIN
    DELETE FROM UserSecurityQuestions
    WHERE UserSecurityQuestionID IN (
        SELECT UserSecurityQuestionID FROM (
            SELECT uq.UserSecurityQuestionID
            FROM UserSecurityQuestions uq
            JOIN UserSecurityAnswers ua ON uq.UserSecurityQuestionID = ua.UserSecurityQuestionID
            WHERE ua.UserLoginID = UserLoginID
        ) AS temp_table
    );
END $$

CALL sp_Delete_Question(5); $$


-- Q12. Delete error logs created in the last hour
DROP PROCEDURE IF EXISTS sp_Delete_Errors $$

CREATE PROCEDURE sp_Delete_Errors()
BEGIN
    DELETE FROM LoginErrorLog 
    WHERE ErrorLogID IN (
        SELECT ErrorLogID FROM (
            SELECT ErrorLogID FROM LoginErrorLog WHERE ErrorTime >= NOW() - INTERVAL 1 HOUR
        ) AS temp_table
    );
END $$

CALL sp_Delete_Errors(); $$


-- Q13. Remove SSN column from Customer table
ALTER TABLE Customer
DROP COLUMN IF EXISTS SSN;

DELIMITER ;

-- Re-enable safe mode after execution
SET SQL_SAFE_UPDATES = 1;

-- =========================================
-- MYSQL TRIGGERS TASK
-- =========================================

-- 1. CREATE DATABASE

CREATE DATABASE TriggerDB;

USE TriggerDB;


-- =========================================
-- 2. CREATE PRODUCTS TABLE
-- =========================================

CREATE TABLE Products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    price DECIMAL(10,2),
    stock_quantity INT,
    status VARCHAR(20) DEFAULT 'Available'
);


-- =========================================
-- 3. CREATE INVENTORY AUDIT TABLE
-- =========================================

CREATE TABLE Inventory_Audit (
    audit_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    action_type VARCHAR(50),
    old_value VARCHAR(100),
    new_value VARCHAR(100),
    changed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- =========================================
-- TRIGGER 1: PREVENT NEGATIVE STOCK
-- =========================================

DELIMITER //

CREATE TRIGGER prevent_negative_stock
BEFORE UPDATE ON Products
FOR EACH ROW
BEGIN
    IF NEW.stock_quantity < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Stock quantity cannot be negative';
    END IF;
END //

DELIMITER ;


-- =========================================
-- TRIGGER 2: AUDIT PRICE CHANGES
-- =========================================

DELIMITER //

CREATE TRIGGER audit_price_changes
AFTER UPDATE ON Products
FOR EACH ROW
BEGIN
    IF OLD.price <> NEW.price THEN

        INSERT INTO Inventory_Audit
        (product_id, action_type, old_value, new_value)
        VALUES
        (
            OLD.product_id,
            'Price Updated',
            OLD.price,
            NEW.price
        );

    END IF;
END //

DELIMITER ;


-- =========================================
-- TRIGGER 3: AUTO UPDATE STATUS
-- =========================================

DELIMITER //

CREATE TRIGGER update_stock_status
BEFORE UPDATE ON Products
FOR EACH ROW
BEGIN
    IF NEW.stock_quantity = 0 THEN
        SET NEW.status = 'Out of Stock';
    ELSE
        SET NEW.status = 'Available';
    END IF;
END //

DELIMITER ;


-- =========================================
-- TRIGGER 4: ENFORCE UPPERCASE NAMES
-- =========================================

DELIMITER //

CREATE TRIGGER uppercase_product_name
BEFORE INSERT ON Products
FOR EACH ROW
BEGIN
    SET NEW.name = UPPER(NEW.name);
END //

DELIMITER ;


-- =========================================
-- TRIGGER 5: LOG NEW PRODUCT ADDITIONS
-- =========================================

DELIMITER //

CREATE TRIGGER log_new_product
AFTER INSERT ON Products
FOR EACH ROW
BEGIN
    INSERT INTO Inventory_Audit
    (product_id, action_type, old_value, new_value)
    VALUES
    (
        NEW.product_id,
        'New Product Added',
        NULL,
        NEW.name
    );
END //

DELIMITER ;


-- =========================================
-- 4. INSERT SAMPLE DATA
-- =========================================

INSERT INTO Products
(name, price, stock_quantity)
VALUES
('Laptop', 50000, 10),
('Mobile', 20000, 5),
('Headphones', 2000, 0),
('Keyboard', 1500, 15),
('Mouse', 800, 20);


-- =========================================
-- 5. DISPLAY PRODUCTS
-- =========================================

SELECT * FROM Products;


-- =========================================
-- 6. TEST TRIGGER 1
-- PREVENT NEGATIVE STOCK
-- =========================================

-- This will generate an error

UPDATE Products
SET stock_quantity = -5
WHERE product_id = 1;


-- =========================================
-- 7. TEST TRIGGER 2
-- AUDIT PRICE CHANGES
-- =========================================

UPDATE Products
SET price = 55000
WHERE product_id = 1;


-- =========================================
-- 8. TEST TRIGGER 3
-- AUTO UPDATE STATUS
-- =========================================

UPDATE Products
SET stock_quantity = 0
WHERE product_id = 2;


-- =========================================
-- 9. TEST TRIGGER 4
-- UPPERCASE PRODUCT NAMES
-- =========================================

INSERT INTO Products
(name, price, stock_quantity)
VALUES
('smart watch', 3000, 10);


-- =========================================
-- 10. TEST TRIGGER 5
-- LOG NEW PRODUCT ADDITIONS
-- =========================================

INSERT INTO Products
(name, price, stock_quantity)
VALUES
('Tablet', 25000, 8);


-- =========================================
-- 11. DISPLAY FINAL PRODUCTS
-- =========================================

SELECT * FROM Products;


-- =========================================
-- 12. DISPLAY INVENTORY AUDIT
-- =========================================

SELECT * FROM Inventory_Audit;


-- =========================================
-- 13. DISPLAY ALL TRIGGERS
-- =========================================

SHOW TRIGGERS;

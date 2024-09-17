CREATE DATABASE User_Authentication;
USE User_Authentication;
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL
);

CREATE TABLE user_roles (
    id INT AUTO_INCREMENT PRIMARY KEY,
    role_name VARCHAR(255) NOT NULL,
    description TEXT
);

CREATE TABLE login_attempts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255),
    attempt_date DATETIME,
    success BOOLEAN
);

CREATE TABLE user_sessions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    session_start DATETIME,
    session_end DATETIME,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE password_resets (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    reset_date DATETIME,
    reset_token VARCHAR(255),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE DATABASE Product_Information;
USE Product_Information;

CREATE TABLE products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(255),
    description TEXT,
    price DECIMAL(10, 2)
);

CREATE TABLE categories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(255),
    description TEXT
);

CREATE TABLE product_categories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    category_id INT,
    category_type VARCHAR(255),
    FOREIGN KEY (product_id) REFERENCES products(id),
    FOREIGN KEY (category_id) REFERENCES categories(id)
);

CREATE TABLE product_reviews (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    review_date DATETIME,
    rating INT,
    FOREIGN KEY (product_id) REFERENCES products(id)
);

CREATE TABLE product_images (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    image_url VARCHAR(255),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

CREATE DATABASE Employee_Information;
USE Employee_Information;

CREATE TABLE employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    employee_name VARCHAR(255),
    department VARCHAR(255),
    salary DECIMAL(10, 2)
);

CREATE TABLE departments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    department_name VARCHAR(255),
    description TEXT
);

CREATE TABLE employee_roles (
    id INT AUTO_INCREMENT PRIMARY KEY,
    role_name VARCHAR(255),
    description TEXT
);

use  User_Authentication;

INSERT INTO users (id, username, password, email) VALUES 
(1, 'Pratiksha', 'pratiksha123', 'prat@example.com'),
(2, 'renu', 'renu456', 'renu@example.com'),
(3, 'shruti', 'shru789', 'shru@example.com'),
(4, 'Ak', 'ak012', 'ak@example.com'),
(5, 'manu', 'manu345', 'manu@example.com');

INSERT INTO user_roles (id, role_name, description) VALUES 
(1, 'Admin', 'System Administrator'),
(2, 'User', 'Regular User'),
(3, 'Moderator', 'Forum Moderator'),
(4, 'Guest', 'Unregistered User'),
(5, 'Superuser', 'System Superuser');
INSERT INTO login_attempts (id, username, attempt_date, success) VALUES 
(1, 'Pratiksha', '2022-01-01 12:00:00', 1),
(2, 'renu', '2022-01-02 13:00:00', 0),
(3, 'shruti', '2022-01-03 14:00:00', 1),
(4, 'Ak', '2022-01-04 15:00:00', 0),
(5, 'manu', '2022-01-05 16:00:00', 1);

INSERT INTO user_sessions (id, user_id, session_start, session_end) VALUES 
(1, 1, '2022-01-01 12:00:00', '2022-01-01 13:00:00'),
(2, 2, '2022-01-02 13:00:00', '2022-01-02 14:00:00'),
(3, 3, '2022-01-03 14:00:00', '2022-01-03 15:00:00'),
(4, 4, '2022-01-04 15:00:00', '2022-01-04 16:00:00'),
(5, 5, '2022-01-05 16:00:00', '2022-01-05 17:00:00');

INSERT INTO password_resets (id, user_id, reset_date, reset_token) VALUES 
(1, 1, '2022-01-01 12:00:00', 'reset_token_123'),
(2, 2, '2022-01-02 13:00:00', 'reset_token_456'),
(3, 3, '2022-01-03 14:00:00', 'reset_token_789'),
(4, 4, '2022-01-04 15:00:00', 'reset_token_012'),
(5, 5, '2022-01-05 16:00:00', 'reset_token_345');



use Product_Information;
INSERT INTO products (id, product_name, description, price) VALUES 
(1, 'Product 1', 'Description 1', 10.99),
(2, 'Product 2', 'Description 2', 9.99),
(3, 'Product 3', 'Description 3', 12.99),
(4, 'Product 4', 'Description 4', 8.99),
(5, 'Product 5', 'Description 5', 11.99);

INSERT INTO categories (id, category_name, description) VALUES 
(1, 'Category 1', 'Description 1'),
(2, 'Category 2', 'Description 2'),
(3, 'Category 3', 'Description 3'),
(4, 'Category 4', 'Description 4'),
(5, 'Category 5', 'Description 5');
INSERT INTO product_categories (id, product_id, category_id, category_type) VALUES 
(1, 1, 1, 'Primary Category'),
(2, 2, 3, 'Secondary Category'),
(3, 3, 2, 'Primary Category'),
(4, 4, 1, 'Secondary Category');

INSERT INTO product_reviews (id, product_id, review_date, rating) VALUES 
(1, 1, '2022-01-01', 5),
(2, 2, '2022-01-02', 4),
(3, 3, '2022-01-03', 3),
(4, 4, '2022-01-04', 2),
(5, 5, '2022-01-05', 1);
INSERT INTO product_images (id, product_id, image_url) VALUES 
(1, 1, 'http://example.com/images/product1.jpg'),
(2, 2, 'http://example.com/images/product2.jpg'),
(3, 3, 'http://example.com/images/product3.jpg'),
(4, 4, 'http://example.com/images/product4.jpg'),
(5, 5, 'http://example.com/images/product5.jpg');
 
 use Employee_Information;
 INSERT INTO employees (id, employee_name, department, salary) VALUES 
(1, 'John Doe', 'Sales', 50000),
(2, 'Jane Doe', 'Marketing', 60000),
(3, 'Bob Smith', 'IT', 70000);
INSERT INTO departments (id, department_name, description) VALUES 
(1, 'Sales', 'Handles sales and customer relations'),
(2, 'Marketing', 'Handles marketing and promotions'),
(3, 'IT', 'Handles IT infrastructure and support');
INSERT INTO employee_roles (id, role_name, description) VALUES 
(1, 'Manager', 'Oversees department operations'),
(2, 'Senior Staff', 'Experienced staff member'),
(3, 'Junior Staff', 'Entry-level staff member');
use user_authentication;

SELECT * FROM users WHERE username = 'Pratiksha' AND password = 'pratiksha123';
SELECT * FROM users WHERE username = 'Pratiksha' AND password = '' OR '1'='1';
SELECT username, COUNT(*) as failed_attempts 
FROM login_attempts 
WHERE success = 0 
GROUP BY username 
HAVING failed_attempts > 5;
SELECT username, attempt_date, success 
FROM login_attempts 
WHERE success = 0 
ORDER BY attempt_date DESC;







CREATE TABLE Customer (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    address VARCHAR(255),
    phone_number VARCHAR(20)
);

CREATE TABLE Car (
    car_id INT AUTO_INCREMENT PRIMARY KEY,
    registration_number VARCHAR(50) NOT NULL,
    make VARCHAR(100),
    model VARCHAR(100),
    year INT,
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);

CREATE TABLE Accident (
    accident_id INT AUTO_INCREMENT PRIMARY KEY,
    date DATE NOT NULL,
    location VARCHAR(255),
    car_id INT,
    FOREIGN KEY (car_id) REFERENCES Car(car_id)
);

CREATE TABLE Insurance_Policy (
    policy_id INT AUTO_INCREMENT PRIMARY KEY,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);

CREATE TABLE Premium_Payment (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    policy_id INT,
    payment_date DATE NOT NULL,
    due_date DATE NOT NULL,
    amount DECIMAL(10, 2),
    FOREIGN KEY (policy_id) REFERENCES Insurance_Policy(policy_id)
);

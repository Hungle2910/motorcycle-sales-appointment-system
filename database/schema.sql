IF DB_ID('MotoSalesDB') IS NULL
BEGIN
    CREATE DATABASE MotoSalesDB;
END;
GO

USE MotoSalesDB;
GO

CREATE TABLE users (
    id INT IDENTITY(1,1) PRIMARY KEY,
    full_name NVARCHAR(120) NOT NULL,
    email NVARCHAR(160) NOT NULL UNIQUE,
    password_hash NVARCHAR(255) NOT NULL,
    role NVARCHAR(20) NOT NULL DEFAULT 'CUSTOMER',
    is_active BIT NOT NULL DEFAULT 1,
    created_at DATETIME2 NOT NULL DEFAULT SYSUTCDATETIME()
);

CREATE TABLE brands (
    id INT IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(120) NOT NULL UNIQUE,
    country NVARCHAR(80) NULL,
    is_active BIT NOT NULL DEFAULT 1
);

CREATE TABLE motorcycles (
    id INT IDENTITY(1,1) PRIMARY KEY,
    brand_id INT NOT NULL,
    model_name NVARCHAR(160) NOT NULL,
    engine_capacity NVARCHAR(40) NULL,
    color NVARCHAR(80) NULL,
    price DECIMAL(18,2) NOT NULL,
    stock_quantity INT NOT NULL DEFAULT 0,
    description NVARCHAR(MAX) NULL,
    image_url NVARCHAR(500) NULL,
    is_active BIT NOT NULL DEFAULT 1,
    created_at DATETIME2 NOT NULL DEFAULT SYSUTCDATETIME(),
    CONSTRAINT fk_motorcycles_brands FOREIGN KEY (brand_id) REFERENCES brands(id)
);

CREATE TABLE carts (
    id INT IDENTITY(1,1) PRIMARY KEY,
    user_id INT NOT NULL,
    created_at DATETIME2 NOT NULL DEFAULT SYSUTCDATETIME(),
    CONSTRAINT fk_carts_users FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE cart_items (
    id INT IDENTITY(1,1) PRIMARY KEY,
    cart_id INT NOT NULL,
    motorcycle_id INT NOT NULL,
    quantity INT NOT NULL DEFAULT 1,
    CONSTRAINT fk_cart_items_carts FOREIGN KEY (cart_id) REFERENCES carts(id),
    CONSTRAINT fk_cart_items_motorcycles FOREIGN KEY (motorcycle_id) REFERENCES motorcycles(id)
);

CREATE TABLE orders (
    id INT IDENTITY(1,1) PRIMARY KEY,
    user_id INT NOT NULL,
    total_amount DECIMAL(18,2) NOT NULL,
    status NVARCHAR(30) NOT NULL DEFAULT 'PENDING',
    appointment_date DATETIME2 NULL,
    showroom_address NVARCHAR(255) NULL,
    note NVARCHAR(500) NULL,
    created_at DATETIME2 NOT NULL DEFAULT SYSUTCDATETIME(),
    CONSTRAINT fk_orders_users FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE order_items (
    id INT IDENTITY(1,1) PRIMARY KEY,
    order_id INT NOT NULL,
    motorcycle_id INT NOT NULL,
    quantity INT NOT NULL DEFAULT 1,
    unit_price DECIMAL(18,2) NOT NULL,
    CONSTRAINT fk_order_items_orders FOREIGN KEY (order_id) REFERENCES orders(id),
    CONSTRAINT fk_order_items_motorcycles FOREIGN KEY (motorcycle_id) REFERENCES motorcycles(id)
);

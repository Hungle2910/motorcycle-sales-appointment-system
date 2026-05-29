USE MotoSalesDB;
GO

INSERT INTO brands (name, country)
VALUES
    (N'Honda', N'Japan'),
    (N'Yamaha', N'Japan'),
    (N'Piaggio', N'Italy');

INSERT INTO motorcycles (brand_id, model_name, engine_capacity, color, price, stock_quantity, description)
VALUES
    (1, N'Winner X', N'150cc', N'Đỏ đen', 46000000, 8, N'Xe côn tay thể thao, phù hợp đi phố và đường dài.'),
    (1, N'Air Blade', N'160cc', N'Xám', 57000000, 6, N'Tay ga đô thị, tiết kiệm nhiên liệu.'),
    (2, N'Exciter', N'155cc', N'Xanh GP', 52000000, 5, N'Côn tay hiệu năng cao.'),
    (3, N'Vespa Sprint', N'150cc', N'Trắng', 82000000, 3, N'Tay ga phong cách châu Âu.');

INSERT INTO users (full_name, email, password_hash, role)
VALUES
    (N'Admin MotoSales', N'admin@motosales.local', N'change-me', N'ADMIN'),
    (N'Khách hàng Demo', N'customer@motosales.local', N'change-me', N'CUSTOMER');

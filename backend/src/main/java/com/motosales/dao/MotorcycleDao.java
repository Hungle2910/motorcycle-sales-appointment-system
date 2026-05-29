package com.motosales.dao;

import com.motosales.model.Motorcycle;
import com.motosales.util.DatabaseConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MotorcycleDao {
    public List<Motorcycle> findFeatured() throws SQLException {
        String sql = """
                SELECT TOP 8 m.id, b.name AS brand_name, m.model_name, m.price, m.stock_quantity
                FROM motorcycles m
                INNER JOIN brands b ON b.id = m.brand_id
                WHERE m.is_active = 1
                ORDER BY m.created_at DESC
                """;

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet resultSet = statement.executeQuery()) {
            List<Motorcycle> motorcycles = new ArrayList<>();
            while (resultSet.next()) {
                Motorcycle motorcycle = new Motorcycle();
                motorcycle.setId(resultSet.getInt("id"));
                motorcycle.setBrandName(resultSet.getString("brand_name"));
                motorcycle.setModelName(resultSet.getString("model_name"));
                motorcycle.setPrice(resultSet.getBigDecimal("price"));
                motorcycle.setStockQuantity(resultSet.getInt("stock_quantity"));
                motorcycles.add(motorcycle);
            }
            return motorcycles;
        }
    }
}

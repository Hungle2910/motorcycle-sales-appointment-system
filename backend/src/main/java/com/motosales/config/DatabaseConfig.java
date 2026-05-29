package com.motosales.config;

public final class DatabaseConfig {
    private DatabaseConfig() {
    }

    public static String url() {
        return getEnv("DB_URL", "jdbc:sqlserver://localhost:1433;databaseName=MotoSalesDB;encrypt=true;trustServerCertificate=true");
    }

    public static String user() {
        return getEnv("DB_USER", "sa");
    }

    public static String password() {
        return getEnv("DB_PASSWORD", "YourStrongPassword123");
    }

    private static String getEnv(String key, String fallback) {
        String value = System.getenv(key);
        return value == null || value.isBlank() ? fallback : value;
    }
}

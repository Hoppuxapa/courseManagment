package com.courses.management.common;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;

import java.sql.Connection;
import java.sql.SQLException;

public class DatabaseConnector {

    private final HikariDataSource ds;

    public DatabaseConnector() {
        HikariConfig config = new HikariConfig();
        config.setJdbcUrl("jdbc:postgresql://localhost:5432/postgres");
        config.setUsername("postgres");
        config.setPassword("password");
        ds = new HikariDataSource(config);
    }

    public DatabaseConnector(HikariDataSource ds) {
        this.ds = ds;
    }

    public Connection getConnection() {
            try {
                return ds.getConnection();
            } catch (SQLException e) {
                throw new RuntimeException("Cannot connect to Connection Pool ", e);
            }
        }
    }

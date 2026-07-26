package com.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBconnection {

    public static Connection getConnection() {
        Connection con = null;
        try {
            // Read credentials dynamically from Environment Variables
            String host = System.getenv("DB_HOST");
            if (host == null || host.isEmpty()) {
                host = "your_db_host"; // e.g. localhost or external host
            }

            String dbName = System.getenv("DB_NAME");
            if (dbName == null || dbName.isEmpty()) {
                dbName = "your_db_name";
            }

            String user = System.getenv("DB_USER");
            if (user == null || user.isEmpty()) {
                user = "your_db_user";
            }

            String password = System.getenv("DB_PASS");
            if (password == null || password.isEmpty()) {
                password = "your_db_password";
            }

            String url = "jdbc:mysql://" + host + ":3306/" + dbName 
                       + "?useSSL=false&allowPublicKeyRetrieval=true&connectTimeout=10000";

            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(url, user, password);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return con;
    }
}

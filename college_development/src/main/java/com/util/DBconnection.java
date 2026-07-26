package com.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBconnection {

    public static Connection getConnection() {
        Connection con = null;
        try {
            String host = System.getenv("DB_HOST");
            String dbName = System.getenv("DB_NAME");
            String user = System.getenv("DB_USER");
            String password = System.getenv("DB_PASS");

            String url = "jdbc:mysql://" + host + ":3306/" + dbName 
                       + "?useSSL=true&requireSSL=false&allowPublicKeyRetrieval=true&connectTimeout=10000&socketTimeout=30000";

            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(url, user, password);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return con;
    }
}
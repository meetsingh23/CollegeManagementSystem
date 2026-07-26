package com.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBconnection {

    public static Connection getConnection() {
        Connection con = null;
        try {
            // Read from ENV, if null use exact Clever Cloud credentials as fallback
            String host = System.getenv("DB_HOST");
            if (host == null || host.isEmpty()) {
                host = "brjmrnxaz6zd919k9efp-mysql.services.clever-cloud.com";
            }

            String dbName = System.getenv("DB_NAME");
            if (dbName == null || dbName.isEmpty()) {
                dbName = "brjmrnxaz6zd919k9efp";
            }

            String user = System.getenv("DB_USER");
            if (user == null || user.isEmpty()) {
                user = "uejsm72p8yyls9dl";
            }

            String password = System.getenv("DB_PASS");
            if (password == null || password.isEmpty()) {
                password = "GKWN1bY20vxu7x2iHDd4";
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
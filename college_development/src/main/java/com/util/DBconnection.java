package com.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBconnection {

    public static Connection getConnection() {
        Connection con = null;
        try {

            String host = System.getenv("brjmrnxaz6zd919k9efp-mysql.services.clever-cloud.com");
            String dbName = System.getenv("brjmrnxaz6zd919k9efp");
            String user = System.getenv("uejsm72p8yyls9dl");
            String password = System.getenv("GKWNlbY20vxu7x2iHDd4");

            String url = "jdbc:mysql://" + host + ":3306/" + dbName + "?useSSL=false&allowPublicKeyRetrieval=true";

            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(url, user, password);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return con;
    }
}
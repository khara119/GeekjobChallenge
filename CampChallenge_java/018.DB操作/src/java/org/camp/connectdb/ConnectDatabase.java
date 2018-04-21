/*
 *  Copyright © 2018 University of Aizu
 */
package org.camp.connectdb;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Kohei Hara
 */
public class ConnectDatabase {
    public static void main(String[] args) {
        Connection db_con = null;
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            db_con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Challenge_db", "khara119", "khara119");
            System.out.println("Connect database: Challenge_db");
            db_con.close();
        } catch (SQLException e) {
            System.err.println("接続時にエラーが発生しました。\n" + e.getMessage());
        } catch (Exception e) {
            System.err.println("接続時にエラーが発生しました。\n" + e.getMessage());            
        } finally {
            if (db_con != null) {
                try {
                    db_con.close();
                } catch (Exception e) {
                    System.err.println("Closeでエラーが発生しました。\n" + e.getMessage());
                }
            }
        }
    }
}

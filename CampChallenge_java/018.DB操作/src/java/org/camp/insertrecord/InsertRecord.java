/*
 *  Copyright © 2018 University of Aizu
 */
package org.camp.insertrecord;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author Kohei Hara
 */
public class InsertRecord {
    public static void main(String[] args) {
        Connection db_con = null;
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            db_con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Challenge_db", "khara119", "khara119");
            
            // SQLインジェクション対策のSQL文
            String sql = "insert into profiles values(?, ?, ?, ?, ?)";

            // 各カラムのデータ
            Object[] data = {6, "原昂平", "080-1234-5678", 25, Date.valueOf("1992-06-09")};
            
            PreparedStatement ps = db_con.prepareStatement(sql);
            
            // SQL文の「?」に対応するデータをセット
            for (int i=0; i<data.length; i++) {
                if (data[i] instanceof Integer) {
                    ps.setInt(i+1, (Integer)data[i]);
                } else if (data[i] instanceof Date) {
                    ps.setDate(i+1, (Date)data[i]);
                } else {
                    ps.setString(i+1, (String)data[i]);
                }
            }
            
            ps.executeUpdate();
            db_con.close();
        } catch (SQLException e) {
            System.err.println("エラーが発生しました。\n" + e.getMessage());
        } catch (Exception e) {
            System.err.println("エラーが発生しました。\n" + e.getMessage());            
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

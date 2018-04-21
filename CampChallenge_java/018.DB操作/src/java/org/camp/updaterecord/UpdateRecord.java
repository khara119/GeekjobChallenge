/*
 *  Copyright © 2018 University of Aizu
 */
package org.camp.updaterecord;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Kohei Hara
 */
public class UpdateRecord {
    public static void main(String[] args) {
        Connection db_con = null;
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            db_con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Challenge_db", "khara119", "khara119");

            // 更新処理
            // SQLインジェクション対策のSQL文
            String updateSql = "update profiles set name=?, tel=?, age=?, birthday=? where profilesID=?";
            PreparedStatement ps = db_con.prepareStatement(updateSql);
            ps.setString(1, "高瀬蓮");
            ps.setString(2, "080-0123-4567");
            ps.setInt(3, 18);
            ps.setDate(4, Date.valueOf("2006-11-11"));
            ps.setInt(5, 1);
            
            ps.executeUpdate();
            
            // 検索処理
            String sql = "select * from profiles";
            ps = db_con.prepareStatement(sql);
            
            ResultSet rs = ps.executeQuery();
            
            System.out.println("ID\tName\tTEL\t\tAge\tBirthday");
            while (rs.next()) {
                int id = rs.getInt("profilesID");
                String name = rs.getString("name");
                String tel = rs.getString("tel");
                int age = rs.getInt("age");
                Date birthday = rs.getDate("birthday");
                
                System.out.println(id + "\t" + name + "\t" + tel + "\t" + age + "\t" + birthday);
            }
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

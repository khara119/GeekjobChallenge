package base;
/**
 *
 * @author hayashi-s
 */

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import base.Define;
public class DBManager {
    /**
     * データベースを初期化するためのメソッド
     * 課題に関係なし
     */
    public static void initDatabase() {
        BufferedReader br = null;
        Connection connection = null;
        try {
            connection = getConnection();
            Statement statement = connection.createStatement();
            br = new BufferedReader(new FileReader(new File(Define.PROJECT_PATH + "db/init.db")));
            String s = "";
            while((s = br.readLine()) != null) {
                statement.execute(s);
            }
        } catch (FileNotFoundException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (br != null) {
                    br.close();
                }
                
                if (connection != null) {
                    connection.close();
                }
            } catch (IOException ex) {
                Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
            } catch (SQLException ex) {
                Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
    
    public static Connection getConnection(){
        Connection con = null;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/" + Define.DB_NAME,Define.DB_USER_NAME,Define.DB_USER_PASSWORD);
            System.out.println("DBConnected!!");
            return con;
        }catch(ClassNotFoundException e){
            System.err.println(e);
            throw new IllegalMonitorStateException();
        } catch (SQLException e) {
            System.err.println(e);
            throw new IllegalMonitorStateException();
        }
    }
}

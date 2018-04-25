package base;
/**
 *
 * @author hayashi-s
 */

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
public class DBManager {
    public static Connection getConnection(){
        Connection con = null;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Challenge_db","khara119","khara119");
            System.out.println("DBConnected!!");
            return con;
        }catch(ClassNotFoundException e){
            throw new IllegalMonitorStateException();
        } catch (SQLException e) {
            System.err.println(e);
            throw new IllegalMonitorStateException();
        }
    }
}

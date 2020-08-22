package DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

    private static Connection conn;

    public static Connection getConnection(){

       if(conn == null){
           try {
               Class.forName("com.mysql.cj.jdbc.Driver");
               conn = DriverManager.getConnection("jdbc:mysql://localhost/shop?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","root","");
           }catch (ClassNotFoundException | SQLException e) {
               e.printStackTrace();
           }
       }

        return  conn;
    }
}

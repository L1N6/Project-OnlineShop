/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author LEGION
 */
public class DBcontext {
    private Connection connection;
    public DBcontext()
    {
        //@Students: You are allowed to edit user, pass, url variables to fit 
        //your system configuration
        //You can also add more methods for Database Interaction tasks. 
        //But we recommend you to do it in another class
        // For example : StudentDBContext extends DBContext , 
        //where StudentDBContext is located in dal package, 
        try {
            String user = "sa";
            String pass = "123456";
<<<<<<< HEAD
            String url = "jdbc:sqlserver://DESKTOP-D18FQTD:1433;databaseName=SHOP_DB_Test_12";
=======
            String url = "jdbc:sqlserver://DESKTOP-D18FQTD:1433;databaseName=SHOP_DB_Test_10";
=======
            String pass = "123123";
            String url = "jdbc:sqlserver://DESKTOP-52OQN5G:1433;databaseName=SHOP_DB_Test_10";
<<<<<<< HEAD
>>>>>>> 804e35696b7fed118e0aad6be16c12c0ed6c9c49
=======

>>>>>>> 9d8e97aba7e4993e41cf2d1e0825f6245d217cfe
>>>>>>> Develop
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection = DriverManager.getConnection(url, user, pass);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(DBcontext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Connection getConnection() {
        return connection;
    }

    public void setConnection(Connection connection) {
        this.connection = connection;
    }
    public static void releaseJBDCObject(ResultSet rs,PreparedStatement ps,Connection conn){
        try {
            if(rs!= null) {
                rs.close();
            }
            if(ps!=null) {
                ps.close();
            }
            if(conn!=null) {
                conn.close();
            }
        } catch (SQLException e) {
            Logger.getLogger(DBcontext.class.getName()).log(Level.ALL,e.toString(),e);
        }
    }
    
    



}

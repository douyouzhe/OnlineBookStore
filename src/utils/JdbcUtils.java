package utils;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;



public class JdbcUtils {

    private static DataSource ds = null;
    // only run for one time
    static{
        try {
            //System.out.println("in static try");
            Context initCtx = new InitialContext();
            Context envCtx = (Context) initCtx.lookup("java:comp/env");
            ds = (DataSource) envCtx.lookup("jdbc/ConnectionPool");
        }catch(Exception ex) {
            ex.printStackTrace();
        }
    }

    public static DataSource getDataSource(){
        return ds;
    }


// why this method is never used?????
//    public static Connection getConnection() throws SQLException{
//        return ds.getConnection();
//    }
}

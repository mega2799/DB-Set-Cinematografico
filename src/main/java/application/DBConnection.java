package application;

import java.sql.*;

public class DBConnection {
    static final String DB_URL = "jdbc:mysql://localhost/";
    static final String USER = "Matte";
    static final String PASS = "DBPassword";

    private Connection connection;


    public DBConnection(){
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection(
                        "jdbc:mysql://localhost:3306/cinema",USER ,PASS);
                System.out.println("CONNESSO");
                this.connection = DriverManager.getConnection(DB_URL, USER, PASS);
                System.out.println("OUT:" + this.connection.toString());
            } catch (Exception e) {
                e.printStackTrace();
            }
    }


    public final Connection getConnection() {
        return this.connection;
    }
}
package application;

import java.sql.*;
/*
        Per usarlo in windows su mysqlWorkbench dovete eseguire questa query:
            ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';
            flush privileges;
        Ed avere importato il file cinema.sql su Workbench.
*/
public class DBConnection {
    static final String OS = System.getProperty("os.name");
    static final String DB_URL = "jdbc:mysql://localhost:3306/cinema?characterEncoding=utf8";

    private static String user;
    private static String passw;

    private static Connection connection;

    static {
        System.out.println(OS);
        if(OS.contains("Windows")){
            user = "root";
            passw = "password";
        } else{
            if(OS.contains("Linux")){
                user = "Matte";
                passw = "DBPassword";
            }
        }

    }

    private DBConnection(){
    }

//    public DBConnection(){
//        System.out.println(OS);
//            if(OS.contains("Windows")){
//                this.user = "root";
//                this.passw = "password";
//            } else{
//                if(OS.contains("Linux")){
//                    this.user = "Matte";
//                    this.passw = "DBPassword";
//                }
//            }
//
//            try {
//                this.connection = DriverManager.getConnection(DB_URL,user , passw);
//                System.out.println("CONNESSO");
//                System.out.println("OUT:" + this.connection.toString());
//
//            } catch (Exception e) {
//                e.printStackTrace();
//            }
//    }


    public static Connection getConnection() {
        try {
            if(connection==null || connection.isClosed()){

                    connection = DriverManager.getConnection(DB_URL,user , passw);
                    System.out.println("CONNESSO");
                    System.out.println("OUT:" + connection.toString());
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return connection;
    }
}
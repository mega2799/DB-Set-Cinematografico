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

    private String user = "root";
    private String passw = "password";

    private Connection connection;


    public DBConnection(){
            if(OS.contains("windows")){
                this.user = "Matte";
                this.passw = "DBPassword";
            } else{
                if(OS.contains("linux")){
                    this.user = "root";
                    this.passw = "password";
                }
            }

            try {
                this.connection = DriverManager.getConnection(DB_URL,user , passw);
                System.out.println("CONNESSO");
                System.out.println("OUT:" + this.connection.toString());

            } catch (Exception e) {
                e.printStackTrace();
            }
    }


    public final Connection getConnection() {
        return this.connection;
    }
}
package application;

/*
  try(BufferedReader br = new BufferedReader(new InputStreamReader(this.getClass().getResourceAsStream("/Creation/makeTables.txt"))) {
                StringBuilder sb = new StringBuilder();
                String line = br.readLine();

 */

import java.io.*;
import java.sql.*;

public class CreateTable {

    private static final String DEFAULT_DELIMITER = ";";

    private Connection connection;
    private boolean fullLineDelimiter = true;

    public static String getDelimiter() {
        return DEFAULT_DELIMITER;
    }

    public void runScript(Connection conn, Reader reader) throws IOException,
            SQLException {
        StringBuffer command = null;
        try {
            LineNumberReader lineReader = new LineNumberReader(reader);
            String line = null;
            while ((line = lineReader.readLine()) != null) {
                if (command == null) {
                    command = new StringBuffer();
                }
                String trimmedLine = line.trim();
                if (trimmedLine.startsWith("--")) {
                    System.out.println(trimmedLine);
                } else if (trimmedLine.length() < 1
                        || trimmedLine.startsWith("//")) {
                    // Do nothing
                } else if (trimmedLine.length() < 1
                        || trimmedLine.startsWith("--")) {
                    // Do nothing
                } else if (!fullLineDelimiter
                        && trimmedLine.endsWith(getDelimiter())
                        || fullLineDelimiter
                        && trimmedLine.equals(getDelimiter())) {
                    command.append(line.substring(0, line
                            .lastIndexOf(getDelimiter())));
                    command.append(" ");
                    Statement statement = conn.createStatement();

                    System.out.println(command);

                    boolean hasResults = false;
                    hasResults = statement.execute(command.toString());
                        try {
                            statement.execute(command.toString());
                        } catch (SQLException e) {
                            e.fillInStackTrace();
                            System.out.println("Error executing: " + command);
                            System.out.println(e);
                        }


                    if (!conn.getAutoCommit()) {
                        conn.commit();
                    }

                    ResultSet rs = statement.getResultSet();
                    if (rs != null) {
                        ResultSetMetaData md = rs.getMetaData();
                        int cols = md.getColumnCount();
                        for (int i = 0; i < cols; i++) {
                            String name = md.getColumnLabel(i);
                            System.out.print(name + "\t");
                        }
                        System.out.println("");
                        while (rs.next()) {
                            for (int i = 0; i < cols; i++) {
                                String value = rs.getString(i);
                                System.out.print(value + "\t");
                            }
                            System.out.println("");
                        }
                    }

                    command = null;
                    try {
                        statement.close();
                    } catch (Exception e) {
                        // Ignore to workaround a bug in Jakarta DBCP
                    }
                    Thread.yield();
                } else {
                    command.append(line);
                    command.append(" ");
                }
            }
                conn.commit();
        } catch (SQLException e) {
            e.fillInStackTrace();
            System.out.println("Error executing: " + command);
            throw e;
        } catch (IOException e) {
            e.fillInStackTrace();
            System.out.println("Error executing: " + command);
            throw e;
        } finally {
            conn.rollback();
        }
    }
}

/*
    public void readFile(String path){
        try(BufferedReader br = new BufferedReader(new InputStreamReader(this.getClass().getResourceAsStream("/Creation/makeTables.txt"))) {
            StringBuilder sb = new StringBuilder();
            String line = br.readLine();
        } catch (IOException e) {
            e.printStackTrace();
        }

}*/
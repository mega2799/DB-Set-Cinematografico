package application;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class TellMe {
    private DBConnection connection;

    public TellMe(final DBConnection connection) {
        this.connection = connection;
    }

    public String tellTitle(){
        String query = "select * from Film;";
        try(Statement statement = connection.getConnection().createStatement()){
            ResultSet resultSet = statement.executeQuery(query);
            resultSet.next();
            return resultSet.getString("titolo");
        }catch (SQLException e){
            e.printStackTrace();
        }
        return "miss";
    }


    public String tellActors(){
        String query = "select * from MembroTroupe;";
        List<String> ll = new ArrayList<>();
        try(Statement statement = connection.getConnection().createStatement()){
            ResultSet resultSet = statement.executeQuery(query);
            while(resultSet.next()) {
                ll.add(resultSet.getString("cognome"));
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return ll.toString();
    }
}

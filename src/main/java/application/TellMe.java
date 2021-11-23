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

    /** Actors in the movie
     *
     * @return String
     */
    public String actors(){
        String query = "select * from MembroTroupe where ruolo=\'attore\';";
        List<List<String>> ll = new ArrayList<>();
        try(Statement statement = connection.getConnection().createStatement()){
            ResultSet resultSet = statement.executeQuery(query);
            while(resultSet.next()) {
                ll.add(List.of(resultSet.getString("nome"),resultSet.getString("cognome")));
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return ll.toString();
    }

    /** Troupe Members list ordered
     *
     * @return String
     */
    public String troupeMembers(){
        List<String> roles = List.of("\'sceneggiatore\'", "\'produttore\'",
                "\'produttore esecutivo\'","\'aiuto regista\'", "\'capo regista\'",
                "\'regista\'", "\'attore\'", "\'stilista\'", "\'operatore\'");
        var res = "";
        for (String role: roles ) {
            res += role.toUpperCase() + ":\n";
            String query = "select * from MembroTroupe where ruolo=" + role + ";";
            try(Statement statement = connection.getConnection().createStatement()){
                ResultSet resultSet = statement.executeQuery(query);
                while(resultSet.next()) {
                    res += List.of(resultSet.getString("nome"),resultSet.getString("cognome")).toString() + "\n";
                }

            }catch (SQLException e){
                e.printStackTrace();
            }

        }
        return res;
    }

    /** Sponsors for the movie
     *
     * @return String
     */
    public String sponsors(){
        String query = "select * from Sponsor;";
        List<List<String>> ll = new ArrayList<>();
        try(Statement statement = connection.getConnection().createStatement()){
            ResultSet resultSet = statement.executeQuery(query);
            while(resultSet.next()) {
                ll.add(List.of(resultSet.getString("P_IVA_SPONSOR"),resultSet.getString("nome")));
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return ll.toString();
    }

}

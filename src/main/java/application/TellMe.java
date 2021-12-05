package application;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Stream;

public class TellMe {
    private Connection connection;

    public TellMe() {
        this.connection = DBConnection.getConnection();
    }

    /** Actors in the movie
     *
     * @return String
     */
    public String actors(){
        String query = "select * from MembroTroupe where ruolo=\'attore\';";
        List<List<String>> ll = new ArrayList<>();
        try(Statement statement = connection.createStatement()){
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
            try(Statement statement = connection.createStatement()){
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
//    public String sponsors(){
//        String query = "select * from Sponsor;";
//        List<List<String>> ll = new ArrayList<>();
//        try(Statement statement = connection.createStatement()){
//            ResultSet resultSet = statement.executeQuery(query);
//            while(resultSet.next()) {
//                ll.add(List.of(resultSet.getString("P_IVA_SPONSOR"),resultSet.getString("nome")));
//            }
//        }catch (SQLException e){
//            e.printStackTrace();
//        }
//        return ll.toString();
//    }
    public ResultSet sponsors(){
        String query = "select * from Sponsor;";
        try {
            ResultSet result = connection.createStatement().executeQuery(query);
            return result;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

}

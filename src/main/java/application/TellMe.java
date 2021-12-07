package application;

import com.mysql.jdbc.ResultSetImpl;

import java.sql.*;
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
//    public String actors(){
//        String query = "select * from MembroTroupe where ruolo=\'attore\';";
//        List<List<String>> ll = new ArrayList<>();
//        try(Statement statement = connection.createStatement()){
//            ResultSet resultSet = statement.executeQuery(query);
//            while(resultSet.next()) {
//                ll.add(List.of(resultSet.getString("nome"),resultSet.getString("cognome")));
//            }
//        }catch (SQLException e){
//            e.printStackTrace();
//        }
//        return ll.toString();
//    }

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

//DA QUI INIZIANO QUERY CHE RESTITUISCONO RESULTSETS
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

    public ResultSet film(){
        String query = "select * from Film;";
        try {
            PreparedStatement stmt = DBConnection.getConnection().prepareStatement(query);
            return stmt.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }


    public ResultSet troupe(){
        List<String> roles = List.of("\'sceneggiatore\'", "\'produttore\'",
                "\'produttore esecutivo\'","\'aiuto regista\'", "\'capo regista\'",
                "\'regista\'", "\'attore\'", "\'stilista\'", "\'operatore\'");
        var res = "";
        ResultSet result = null;
        for (String role: roles ) {
            res += role.toUpperCase() + ":\n";
            String query = "select * from MembroTroupe where ruolo=" + role + ";";
            try(Statement statement = connection.createStatement()){
                ResultSet resultSet = statement.executeQuery(query);
                if(result==null){
                    result = resultSet;
                } else {
                    while(resultSet.next()) {
                        result.updateString("nome",resultSet.getString("nome"));
                        result.updateString("nome", resultSet.getString("cognome"));
                    }
                }
            }catch (SQLException e){
                e.printStackTrace();
            }

        }
        return result;
    }

    public ResultSet actors(){
        String query = "select * from MembroTroupe where ruolo='attore';";
        ResultSet result = null;
        try {
            PreparedStatement stmt = DBConnection.getConnection().prepareStatement(query);
            result = stmt.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    private ResultSet getTable(String tableName){
        String query = "select * from " + tableName;
        ResultSet result = null;
        try {
            PreparedStatement stmt = DBConnection.getConnection().prepareStatement(query);
            result = stmt.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    public ResultSet ditte(){
        return getTable("ditta");
    }

    public ResultSet costumi() {
        return getTable("costume");
    }

    public ResultSet finanziatori() {
        return getTable("finanziatore");
    }

    public ResultSet fondi() {
        return getTable("fondo");
    }

    public ResultSet incassi() {
        return getTable("finanziatore");
    }

    public ResultSet indirizzi() {
        return getTable("indirizzo");
    }

    public ResultSet magazzini() {
        return getTable("magazzino");
    }

    public ResultSet oggettiDiScena() {
        return getTable("oggettoscena");
    }

    public ResultSet scene() {
        return getTable("scenaciak");
    }

}

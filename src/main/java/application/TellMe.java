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

    /** Troupe Members list ordered
     *
     * @return String
     */
    public String troupeMembers(){
      var res = "";
            String query = "select MembroTroupe.nome, MembroTroupe.cognome, RuoloMembroTroupe.nomeRuolo from MembroTroupe INNER JOIN RuoloMembroTroupe ON MembroTroupe.CF = RuoloMembroTroupe.CF";
            try(Statement statement = connection.createStatement()){
                ResultSet resultSet = statement.executeQuery(query);
                while(resultSet.next()) {
                    res += List.of(resultSet.getString("nome"),resultSet.getString("cognome"), resultSet.getString("nomeRuolo")).toString() + "\n";
                }

            }catch (SQLException e){
                e.printStackTrace();
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
 //TODO: 07/12/2021 rendere coerente metodi get di tabelle usando getTable come sotto
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
            PreparedStatement stmt = this.connection.prepareStatement(query);
            result = stmt.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    private ResultSet getTable(String tableName){
        String query = "select * from " + tableName + ";";
        ResultSet result = null;
        try {
            PreparedStatement stmt = this.connection.prepareStatement(query);
            result = stmt.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    public ResultSet ditte(){
        return getTable("Ditta");
    }

    public ResultSet costumi() {
        return getTable("Costume");
    }

    public ResultSet finanziatori() {
        return getTable("Finanziatore");
    }

    public ResultSet fondi() {
        return getTable("Fondo");
    }

    public ResultSet incassi() {
        return getTable("Finanziatore");
    }

    public ResultSet indirizzi() {
        return getTable("Indirizzo");
    }

    public ResultSet magazzini() {
        return getTable("Magazzino");
    }

    public ResultSet oggettiDiScena() {
        return getTable("OggettoScena");
    }

    public ResultSet scene() {
        return getTable("ScenaCiak");
    }

}

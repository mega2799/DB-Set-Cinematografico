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
//DA QUI INIZIANO QUERY CHE RESTITUISCONO RESULTSETS
 //TODO: 07/12/2021 rendere coerente metodi get di tabelle usando getTable come sotto
//    public ResultSet sponsors(){
//        String query = "select * from Sponsor;";
//        try {
//            ResultSet result = connection.createStatement().executeQuery(query);
//            return result;
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//        return null;
//    }


    public ResultSet troupeStaffOnly(){
        String query = "select distinct * from MembroTroupe inner join RuoloMembroTroupe on MembroTroupe.CF = RuoloMembroTroupe.CF where RuoloMembroTroupe.nomeRuolo != 'attore'";
        ResultSet result = null;
        try {
            PreparedStatement stmt = this.connection.prepareStatement(query);
            result = stmt.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    public ResultSet actors(){
        String query = "select MembroTroupe.*, RuoloMembroTroupe.nomeRuolo from MembroTroupe INNER JOIN RuoloMembroTroupe ON MembroTroupe.CF = RuoloMembroTroupe.CF WHERE RuoloMembroTroupe.nomeRuolo = 'attore'";
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
            //PreparedStatement stmt = this.connection.prepareStatement(query);
            Statement stmt = this.connection.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
            result = stmt.executeQuery(query);

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
        return getTable("Incasso");
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

    public ResultSet film() {
        return getTable("Film");
    }

    public ResultSet sponsors(final String codF) {
        String query = "select s.* from Sponsor s \n" +
                "left join Fondo f on (s.P_IVA_SPONSOR = f.P_IVA_SPONSOR)\n" +
                "where codF = ?;";
        ResultSet result = null;
        try {
            PreparedStatement stmt = this.connection.prepareStatement(query);
            stmt.setString(1, codF);
            result = stmt.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    //aggiungo troupe per problemi di delete,tolgo momentaneamente query troupeStaffOnly da gui:
    public ResultSet troupe() {
        return getTable("MembroTroupe");
    }


}

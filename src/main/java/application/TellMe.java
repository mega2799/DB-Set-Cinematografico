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

    public ResultSet actors(final String codF){
        String query = "select m.* from MembroTroupe m\n" +
                "join Film_Membro_Troupe fmt on ( m.CF = fmt.CF) \n" +
                "join RuoloMembroTroupe rmt on (m.CF = rmt.CF)\n" +
                "where codF = ? \n" +
                "and nomeRuolo='attore';";
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

    public ResultSet costumi(final String codF) {
        String query = "select concat(concat(m.nome,' '), m.cognome) as utilizzatore, c.* from MembroTroupe m\n" +
                "join Film_Membro_Troupe fmt on ( m.CF = fmt.CF)\n" +
                "join Costume c on (m.CF = c.CF)\n" +
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

    public ResultSet finanziatori(final String codF) {
        String query = "select ff.* from Finanziatore ff \n" +
                "join Fondo f on (ff.P_IVA_FINANZIATORE = f.P_IVA_FINANZIATORE)\n" +
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

    public ResultSet fondi(final String codF) {
        String query = "select dataAccredito, patrimonio, P_IVA_SPONSOR, P_IVA_FINANZIATORE from Fondo\n" +
                "where codF = ?" +
                "order by dataAccredito;";
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

    public ResultSet incassi(final String codF) {
        String query = "select dataInizio, dataFine, incasso from Incasso\n" +
                "where codF = ?" +
                "order by dataInizio;";
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
    public ResultSet incassiJoinIndirizzo(final String codF) {
        String query = "select inc.*,ind.citta,ind.via,ind.civico,ind.CAP from Incasso inc " +
                "join indirizzo ind on (inc.codInd = ind.codInd) " +
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


    public ResultSet indirizzi() {
        return getTable("Indirizzo");
    }

    public ResultSet magazzini() {
        return getTable("Magazzino");
    }

    public ResultSet oggettiDiScena(final String codF) {
        String query = "select ods.descrizione, ods.tipo from OggettoScena os \n" +
                "join OggettiDiScena ods on (os.codO = ods.codO)\n" +
                "join ScenaCiak sc on (os.codScena = sc.codScena)\n" +
                "where sc.codF = ?;";
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

    public ResultSet scene(final String codF) {
        String query = "select codScena, noteDiProduzione, rullo, numRiprese, durataOre, costoAffittoGiornaliero from ScenaCiak\n" +
                "where codF = ?" +
                "order by durataOre desc;";
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

    public ResultSet film() {
        String query = "select codF, titolo, genere, durata, dataUscita from Film;";
        ResultSet result = null;
        try {
            PreparedStatement stmt = this.connection.prepareStatement(query);
            result = stmt.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    public ResultSet sponsors(final String codF) {
        String query = "select s.* from Sponsor s \n" +
                "join Fondo f on (s.P_IVA_SPONSOR = f.P_IVA_SPONSOR)\n" +
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
    public ResultSet troupe(final String codF) {
        String query = "select concat(nome, ' ', cognome) as dipendente, IBAN, dataNascita, telefono from MembroTroupe m\n" +
                "join Film_Membro_Troupe fmt on ( m.CF = fmt.CF) \n" +
                "where codF = ?" +
                "order by dipendente asc;";
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

    public ResultSet troupeJoinAddress(final String codF) {
        String query = "select i.*,m.* from MembroTroupe m " +
                "join Film_Membro_Troupe fmt on ( m.CF = fmt.CF) " +
                "join indirizzo i on ( i.codInd = m.codInd) " +
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

    public ResultSet enti(){
        return this.getTable("enti");
    }


}

package application;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class QueryTeller {
    private Connection connection;

    public QueryTeller() {
        this.connection = DBConnection.getConnection();
    }

    public ResultSet guadagnoFinanziatoriProduttori(){
        String query = "select @Denaro := sum(incasso) as money FROM Incasso;\n" +
                "    select distinct M.nome, M.cognome,M.percentualeContributo, (M.percentualeContributo / 100 * @Denaro ) as guadagno, Rm.nomeRuolo\n" +
                "    from Incasso I, MembroTroupe M, RuoloMembroTroupe Rm\n" +
                "    where (M.CF = Rm.CF) and M.percentualeContributo is not null;";
        ResultSet result = null;
        try {
            PreparedStatement stmt = this.connection.prepareStatement(query);
            result = stmt.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    public ResultSet guadagnoProduttori(){
        String query = "select @Denaro := sum(incasso) as money FROM Incasso;\n" +
                "    select distinct M.nome, M.cognome,M.percentualeContributo, (M.percentualeContributo / 100 * @Denaro ) as guadagno, Rm.nomeRuolo\n" +
                "    from Incasso I, MembroTroupe M, RuoloMembroTroupe Rm\n" +
                "    where (M.CF = Rm.CF) and M.percentualeContributo is not null;";
        ResultSet result = null;
        try {
            PreparedStatement stmt = this.connection.prepareStatement(query);
            result = stmt.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    public ResultSet luoghiFilm(final String title){
        String query = "    select distinct i.*\n" +
                "    from ScenaCiak sc join Film f on (sc.codF=f.codF)\n" +
                "    join Indirizzo i on (i.codInd=sc.codInd)\n" +
                "    where f.titolo=?;";

        ResultSet result = null;
        try {
            PreparedStatement stmt = this.connection.prepareStatement(query);
            stmt.setString(1, title);
            result = stmt.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    public ResultSet costumiScenaAttore(final String codScena,final  String nomeMembroTroupe,final  String cognomeMembroTroupe ){
        String query = " select i.*\n" +
                "    from ScenaCiak sc join CostumeScena cs on (cs.codScena=sc.codScena)\n" +
                "    join Membro_Troupe_Scena mts on (mts.codScena=sc.codScena)\n" +
                "    join Membrotroupe mt on (mt.CF=mts.CF)\n" +
                "    where sc.codScena= ? \n" +
                "    and mt.nome = ?\n" +
                "    and mt.cognome = ?;";

        ResultSet result = null;
        try {
            PreparedStatement stmt = this.connection.prepareStatement(query);
            stmt.setString(1, codScena);
            stmt.setString(2, nomeMembroTroupe);
            stmt.setString(3, cognomeMembroTroupe);
            result = stmt.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    public ResultSet attoriInScena(final String codScena){
        var res = "";
        String query = "select mt.*\n" +
                "    from ScenaCiak sc join Membro_Troupe_Scena mts on (sc.codScena = mts.codScena)\n" +
                "    join MemtroTroupe mt on (mts.CF = mt.CF)\n" +
                "    where sc.codScena = ?;";

        ResultSet result = null;
        try {
            PreparedStatement stmt = this.connection.prepareStatement(query);
            stmt.setString(1, codScena);
            result = stmt.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    public ResultSet oggettiInScena(final String codScena){
        String query = "    select ods.*\n" +
                "    from ScenaCiak sc join OggettoScena os on (sc.codScena=os.codScena)\n" +
                "    join OggettiDiScena ods on (os.codO=ods.codO)\n" +
                "    where sc.codScena=?;";

        ResultSet result = null;
        try {
            PreparedStatement stmt = this.connection.prepareStatement(query);
            stmt.setString(1, codScena);
            result = stmt.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    public ResultSet stipendioMensileTroupeTotale(final String mese){
        String query = "select @stipendi :=  sum(retribuzioneOraria * oreLavorate) as Stipendi \n" +
                "\t    from BustaPaga \n" +
                "\t    where mese = ?;";

        ResultSet result = null;
        try {
            PreparedStatement stmt = this.connection.prepareStatement(query);
            stmt.setString(1, mese);
            result = stmt.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    public ResultSet stipendioMensileDipendente(final String CF){
        String query = "select @stipendio := sum(retribuzioneOraria * oreLavorate) as Stipendio\n" +
                "    from BustaPaga bp join Retribuzione r on (bp.codB = r.codB)\n" +
                "    where r.CF = ?;";
        ResultSet result = null;
        try {
            PreparedStatement stmt = this.connection.prepareStatement(query);
            stmt.setString(1, CF);
            result = stmt.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
}

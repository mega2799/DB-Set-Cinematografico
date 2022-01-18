package application;

import javafx.scene.control.MenuButton;
import javafx.scene.control.MenuItem;
import javafx.scene.control.RadioMenuItem;
import javafx.scene.control.ToggleGroup;

import java.sql.*;
import java.util.List;

public class QueryTeller {
    private Connection connection;

    public QueryTeller() {
        this.connection = DBConnection.getConnection();
    }

    public ResultSet guadagnoProduttori(final String codF){
        String query = "select @Denaro := sum(incasso) as money FROM Incasso;\n";
                String query2 = "select distinct M.nome, M.cognome,M.percentualeContributo, (M.percentualeContributo / 100 * @Denaro ) as guadagno, Rm.nomeRuolo \n" +
                "from Incasso I, MembroTroupe M, RuoloMembroTroupe Rm join Film_Membro_Troupe flm on (Rm.CF = flm.CF) \n" +
                "where (M.CF = Rm.CF) and flm.codF = ? and M.percentualeContributo is not null;";
        ResultSet result = null;
        try {
            PreparedStatement stmt = this.connection.prepareStatement(query);
            stmt.executeQuery();
            PreparedStatement stmt2 = this.connection.prepareStatement(query2);
            stmt2.setString(1, codF);
            result = stmt2.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }


    // TODO lavare questa query, fa schifo,  anche da README e da .fxml
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

    public ResultSet costumiScena(final String noteProduzione){
        String query = " select c.descrizione, c.tipo\n" +
                "                from ScenaCiak sc join CostumeScena cs on (cs.codScena=sc.codScena)\n" +
                "                join Costume c on (c.codC = cs.codC)\n" +
                "                where sc.noteDiProduzione = ?;";

        ResultSet result = null;
        try {
            PreparedStatement stmt = this.connection.prepareStatement(query);
            stmt.setString(1, noteProduzione);
            result = stmt.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    public ResultSet attoriInScena(final String noteDiProduzione, final String codF){
        var res = "";
        String query = "select mt.*\n" +
                "    from ScenaCiak sc join MembroTroupeScena mts on (sc.codScena = mts.codScena)\n" +
                "    join MembroTroupe mt on (mts.CF = mt.CF)\n" +
                "    where sc.noteDiProduzione = ? " +
                "    and codF = ?;";

        ResultSet result = null;
        try {
            PreparedStatement stmt = this.connection.prepareStatement(query);
            stmt.setString(1, noteDiProduzione);
            stmt.setString(2, codF);
            result = stmt.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    public ResultSet oggettiInScena(final String note, final String codF){
        String query = "select ods.*\n" +
                "    from ScenaCiak sc join OggettoScena os on (sc.codScena=os.codScena)\n" +
                "    join OggettiDiScena ods on (os.codO=ods.codO)\n" +
                "    where sc.noteDiProduzione=?" +
                "    and sc.codF = ?;";

        ResultSet result = null;
        try {
            PreparedStatement stmt = this.connection.prepareStatement(query);
            stmt.setString(1, note);
            stmt.setString(2, codF);
            result = stmt.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    public ResultSet stipendioMensileTroupeTotale(final String codF){
        String query = "select @stipendi := sum(retribuzioneOraria * oreLavorate ) as CostoTroupe, mese from BustaPaga b " + 
        "join Retribuzione r on (b.codB = r.codB) " + 
        "join Film_Membro_Troupe flm on (r.CF = flm.CF) " +
        "where codF = ? group by mese;";
               // "\t    from BustaPaga \n" +
               // "\t    where mese = ?;";

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

    public ResultSet profittoFinanziatori(final String codF){
        String query = "select @Denaro := sum(incasso) as money FROM Incasso;\n";
        String query2 = "    select distinct F.nome, F.percentualeGuadagno, (F.percentualeGuadagno / 100 * @Denaro ) as guadagno\n" +
                "    from Finanziatore F join Fondo ff on (F.P_IVA_FINANZIATORE = ff.P_IVA_FINANZIATORE)\n" +
                "    where F.percentualeGuadagno is not null\n" +
                "    and codF = ?;";
        ResultSet result = null;
        try {
            PreparedStatement stmt = this.connection.prepareStatement(query);
            stmt.executeQuery();
            PreparedStatement stmt2 = this.connection.prepareStatement(query2);
            stmt2.setString(1, codF);
            result = stmt2.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    public ToggleGroup setMenuButton(MenuButton menu, String query, String column) {
        ToggleGroup tg = new ToggleGroup();
        try {
            PreparedStatement stmt = connection.prepareStatement(query);
            ResultSet result = null;
            result = stmt.executeQuery();
            menu.getItems().clear();
            while(result.next()) {
                String name = result.getString(column);
                RadioMenuItem menuItem = new RadioMenuItem(name);
                menuItem.setToggleGroup(tg);
                // add event handlers, etc, as needed..
                menu.getItems().add(menuItem);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return tg;
    }

    public ToggleGroup setMenuButton(MenuButton menu, List<String> l) {
        ToggleGroup tg = new ToggleGroup();
            menu.getItems().clear();
            for(String name: l){
                RadioMenuItem menuItem = new RadioMenuItem(name);
                menuItem.setToggleGroup(tg);
                // add event handlers, etc, as needed..
                menu.getItems().add(menuItem);
            }
        return tg;
    }

    public ResultSet getCodF(final String title){

        String query = "select codF from Film where titolo = ?";

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
    public ResultSet oggettiInMagazzino(final int nM){
        //String query = "select oggettidiscena.tipo, oggettidiscena.descrizione, posizionemagazzino.scaffale, posizionemagazzino.percorso " +
           //            "from posizionemagazzino inner join oggettidiscena on posizionemagazzino.codP = oggettidiscena.codP where posizionemagazzino.numMagazzino = "+nM+";";
        String query = "    select *  from OggettoScena o join OggettiDiScena os on (o.codO=os.codO)\n" +
                "    join PosizioneMagazzino pm on (pm.codP=os.codP)     where pm.numMagazzino = ?;";
        ResultSet result = null;
        try(Statement statement = connection.createStatement()) {
            PreparedStatement stmt = this.connection.prepareStatement(query);
            stmt.setInt(1,nM);
            result = stmt.executeQuery();
        }catch (SQLException e){
            System.out.println(result);
            e.printStackTrace();
        }
        return result;
    }

    public ResultSet oggettiInScena(final int codScena){
        String query = "select oggettidiscena.tipo,oggettidiscena.codO, oggettidiscena.descrizione, oggettoscena.codScena " +
                "from oggettoscena inner join oggettidiscena on oggettoscena.codO = oggettidiscena.codO where oggettoscena.codScena = "+ codScena+";";
        ResultSet result = null;
        try(Statement statement = connection.createStatement()) {
            PreparedStatement stmt = this.connection.prepareStatement(query);
            result = stmt.executeQuery();
        }catch (SQLException e){
            System.out.println(result);
            e.printStackTrace();
        }
        return result;
    }

    public boolean checkCF(final String cf){
        String query = "SELECT CF FROM membrotroupe as mt WHERE mt.CF = ?;";
        try(PreparedStatement stmt = connection.prepareStatement(query)){
            stmt.setString(1,cf);
            ResultSet result = stmt.executeQuery();
            if(!result.isBeforeFirst()){
                return false;
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return true;
    }

    public ResultSet incassoTot(String codfilm) {
        String query = "select sum(incasso) as TotaleIncasso\n" +
                "from Incasso\n" +
                "where codF = ?;";
        ResultSet result = null;
        try(Statement statement = connection.createStatement()) {
            PreparedStatement stmt = this.connection.prepareStatement(query);
            stmt.setString(1,codfilm);
            result = stmt.executeQuery();
        }catch (SQLException e){
            System.out.println(result);
            e.printStackTrace();
        }
        return result;
    }
}

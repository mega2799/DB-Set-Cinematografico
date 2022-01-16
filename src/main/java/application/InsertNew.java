package application;

import javafx.beans.Observable;
import javafx.scene.control.Alert;
import javafx.scene.control.DatePicker;
import javafx.scene.control.Label;
import javafx.scene.control.MenuItem;
import javafx.stage.Stage;

import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class InsertNew {

    private static final int P_IVA_LENGHT = 31;

    private Connection connection;
    private TellMe tellMe;

    private Alert alert;

    public InsertNew() {
        this.connection = DBConnection.getConnection();
        this.tellMe = new TellMe();
    }

    private boolean checkIva(final String partitaIva){
        return partitaIva.length() <= P_IVA_LENGHT;
    }

    private boolean checkFilm(final String film) {
        try {
            ResultSet rs = tellMe.film();
            List<Integer> films = new ArrayList<>();
            while (rs.next()) {
                films.add(Integer.parseInt(rs.getString("codF")));
            }
            return films.contains(film);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    private boolean checkAddress(final String codInd){
        try {
            ResultSet rs = tellMe.indirizzi();
            List<String> addresses = new ArrayList<>();
            while (rs.next()) {
                addresses.add(rs.getString("codInd"));
            }
            return addresses.contains(codInd);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public void showAlert(final Alert.AlertType alertType, final String mex){
        this.alert = new Alert(alertType,mex);
        alert.showAndWait();
    }

    public void sponsor( final String partitaIva, final String nome,String film){
        String codF = null;
        try {
            ResultSet result = new QueryTeller().getCodF(film);
            result.next();
            codF = result.getString(1);
        } catch (SQLException e) {
            e.printStackTrace();
            return;
        }
        if(checkIva(partitaIva)) {
            String query = "INSERT IGNORE INTO Sponsor(P_IVA_SPONSOR, nome) VALUES(" + "\'" + partitaIva + "\', " + "\'" + nome + "\');";
            System.out.println(query);
            try(Statement statement = connection.createStatement()) {
                System.out.println("affected rows:" + statement.executeUpdate(query));
                connection.commit();
                query = "insert into fondo(dataAccredito, patrimonio, P_IVA_SPONSOR, P_IVA_FINANZIATORE, codF) values (?,?,?,?,?)";
                PreparedStatement stmt = connection.prepareStatement(query);
                stmt.setDate(1,Date.valueOf(LocalDate.now()));
                stmt.setFloat(2,0);
                stmt.setString(3,partitaIva);
                stmt.setNull(4,Types.VARCHAR);
                stmt.setInt(5,Integer.parseInt(codF));
                stmt.executeUpdate();
                connection.commit();
            }catch (SQLException e){
                e.printStackTrace();
            }
        }else{
            showAlert(Alert.AlertType.ERROR,"Lunghezza P.IVA non corretta");
        }
    }
    public void film(final String titolo,final String genere, final String durata, final String dataUscita, final String idSerie){
        String query = "INSERT IGNORE INTO Film(titolo,genere,durata,dataUscita,idSerie) VALUES(?,?,?,?,?);";
        try(PreparedStatement statement = connection.prepareStatement(query)){
            statement.setString(1,titolo);
            statement.setString(2,genere);
            statement.setInt(3,Integer.parseInt(durata));
            statement.setDate(4,Date.valueOf(dataUscita.replaceAll(" ","-")));
            this.setOptionalElement(statement,5,Types.INTEGER,idSerie);
            System.out.println(statement.toString());
            System.out.println(statement.executeUpdate());
            connection.commit();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    public void indirizzo(final String codInd, final String citta, final String via, final String civico, final String CAP){
        if(checkAddress(codInd)){
            showAlert(Alert.AlertType.ERROR,"CodIndirizzo gia presente");
            return;
        }
        String query = "INSERT INTO indirizzo(codInd,citta,via,civico,CAP) VALUES (?,?,?,?,?);";
        try(PreparedStatement stmt = connection.prepareStatement(query)){
            stmt.setInt(1,Integer.parseInt(codInd));
            stmt.setString(2,citta);
            stmt.setString(3,via);
            stmt.setInt(4,Integer.parseInt(civico));
            stmt.setInt(5,Integer.parseInt(CAP));
            stmt.executeUpdate();
            connection.commit();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }


    public void incasso(final String dataInizio, final String dataFine, final int incasso, final String codF, final String codInd){
        if(checkFilm(codF) && checkAddress(codInd)) {
            String query = "INSERT IGNORE INTO Incasso(dataInizio,dataFine,incasso, codF, codInd) " +
                    "VALUES (\'" + dataInizio + "\', \'" + dataFine + "\', \'" + incasso + "\', \'" + codF + "\', \'" + codInd + "\');";
            try (Statement statement = connection.createStatement()) {
                System.out.println("affected rows:" + statement.executeUpdate(query));
                connection.commit();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }else{
            showAlert(Alert.AlertType.ERROR,"Inserimento errato");
        }
    }


    public void enti(final String partitaIva, final String nome, final String codInd){
        if(checkIva(partitaIva)){
            if(!checkAddress(codInd)){
                showAlert(Alert.AlertType.ERROR,"Indirizzo non esistente");
                return;
            }
            String query = "INSERT IGNORE INTO Enti(P_IVA,nome,codInd) " +
                    "VALUES (\'" + partitaIva + "\', \'" + nome +"\', \'"+ codInd+"\');";
            System.out.println(query);
            try(Statement statement = connection.createStatement()) {
                System.out.println("affected rows:" + statement.executeUpdate(query));
                connection.commit();
            }catch (SQLException e){
                e.printStackTrace();
            }
        }else{
            showAlert(Alert.AlertType.ERROR,"Lunghezza P.IVA non corretta");
        }
    }

    public void finanziatore(final String partitaIva, final String nome, final String codInd, float pGuadagno){
        if(checkIva(partitaIva)){
            if(!checkAddress(codInd)) {
                showAlert(Alert.AlertType.ERROR, "Indirizzo non esistente");
                return;
            }
            String query = "INSERT IGNORE INTO Finanziatore(P_IVA_FINANZIATORE,nome,codInd, percentualeGuadagno) " +
                    "VALUES (\'" + partitaIva + "\', \'" + nome +"\', \'"+ codInd +"\', \'"+ pGuadagno+"\');";
            System.out.println(query);
            try(Statement statement = connection.createStatement()) {
                System.out.println("affected rows:" + statement.executeUpdate(query));
                connection.commit();
            }catch (SQLException e){
                e.printStackTrace();
            }
        }else{
            showAlert(Alert.AlertType.ERROR,"Lunghezza P.IVA non corretta");
        }
    }

    public void operatore(final String cf, final String nome, final String cognome, final String iban, final String data, final String telefono, final String codInd, float pContributo, final String ruolo){
        //List<String> queries = new ArrayList<>();
        String query = "INSERT IGNORE INTO MembroTroupe(CF,nome,cognome,IBAN,dataNascita,telefono,codInd, percentualeContributo) " +
                "VALUES (?,?,?,?,?,?,?,?)";
        /*System.out.println(query);
        queries.add(query);
        ruolo.stream().forEach(r -> queries.add("INSERT IGNORE INTO RuoloMembroTroupe(CF, nomeRuolo) " + "VALUES (\'" + cf + "\', \'" + r+"\');"));
        System.out.println(queries.get(1));
        try(Statement statement = connection.createStatement()) {
            for(String q : queries) {
                System.out.println("affected rows:" + statement.executeUpdate(q));
                connection.commit();
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
         */
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1,cf);
            statement.setString(2,nome);
            statement.setString(3,cognome);
            statement.setString(4,iban);
            statement.setDate(5,Date.valueOf(data));
            statement.setString(6,telefono);
            statement.setInt(7,Integer.parseInt(codInd));
            statement.setFloat(8,pContributo);
            System.out.println(statement.toString());
            System.out.println(statement.executeUpdate());
            connection.commit();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    public void operatore_film(final int codF,final String CF){
        String query = "INSERT INTO film_membro_troupe(codF,CF) VALUES (?,?);";
        try {
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setInt(1,codF);
            stmt.setString(2,CF);
            stmt.executeUpdate();
            connection.commit();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private void setOptionalElement(PreparedStatement stmt,int index, int sqlType, Object value){
        if(value == null){
            try {
                stmt.setNull(index,sqlType);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } else {
            try {
                //incluso solo stringhe e int per ora, forse ci vuole anche data
                switch (sqlType){
                    case Types.INTEGER:
                        stmt.setInt(index,(Integer)value);
                        break;
                    case Types.VARCHAR:
                        stmt.setString(index,(String)value);
                        break;
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}

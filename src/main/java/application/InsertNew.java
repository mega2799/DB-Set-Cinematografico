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

    private static final int P_IVA_LENGHT = 11;

    private Connection connection;
    private TellMe tellMe;

    private Alert alert;

    public InsertNew() {
        this.connection = DBConnection.getConnection();
        this.tellMe = new TellMe();
    }

    private boolean checkIva(final String partitaIva){
        return partitaIva.length() == P_IVA_LENGHT;
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

    private void showAlert(final Alert.AlertType alertType, final String mex){
        this.alert = new Alert(alertType,mex);
        alert.showAndWait();
    }

    public void sponsor(final String partitaIva, final String nome){
        if(checkIva(partitaIva)) {
            String query = "INSERT IGNORE INTO Sponsor(P_IVA_SPONSOR, nome) VALUES(" + "\'" + partitaIva + "\', " + "\'" + nome + "\');";
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

    public void operatore(final String cf, final String nome, final String cognome, final String iban, final String data, final String telefono, final String codInd, float pContributo, final List<String> ruolo){
        List<String> queries = new ArrayList<>();
        String query = "INSERT IGNORE INTO MembroTroupe(CF,nome,cognome,IBAN,dataNascita,telefono,codInd, percentualeContributo) " +
                "VALUES (\'" + cf + "\', \'" + nome +"\', \'"+ cognome +"\', \'" + iban +"\', \'"+ data +"\', \'" + telefono +"\', \'"+ codInd +"\', \'"+ pContributo+"\');";
        System.out.println(query);
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
    }

}

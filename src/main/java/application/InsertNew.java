package application;

import javafx.scene.control.Alert;
import javafx.scene.control.Label;
import javafx.stage.Stage;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class InsertNew {
    private Connection connection;
    private TellMe tellMe;

    public InsertNew() {
        this.connection = DBConnection.getConnection();
        this.tellMe = new TellMe();
    }

    public void sponsor(final String partitaIva, final String nome){
        String query = "INSERT IGNORE INTO Sponsor(P_IVA_SPONSOR, nome) VALUES(" + "\'" + partitaIva + "\', " + "\'" + nome + "\');";
        System.out.println(query);
        try(Statement statement = connection.createStatement()) {
            System.out.println("affected rows:" + statement.executeUpdate(query));
            connection.commit();
        }catch (SQLException e){
            e.printStackTrace();
        }
    }


    public void enti(final String partitaIva, final String nome, final String codInd){
        try {
            ResultSet rs = tellMe.indirizzi();
            List<String> addresses = new ArrayList<>();
            while (rs.next()){
                addresses.add(rs.getString("codInd"));
            }
            if(!addresses.contains(codInd)){
                Alert alert = new Alert(Alert.AlertType.ERROR,"Codice indirizzo non esistente");
                alert.showAndWait();
            }
        } catch (SQLException e) {
            e.printStackTrace();
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
    }

}

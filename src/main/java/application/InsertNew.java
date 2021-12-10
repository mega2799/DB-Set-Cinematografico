package application;

import javafx.scene.control.Label;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class InsertNew {
    private Connection connection;

    public InsertNew() {
        this.connection = DBConnection.getConnection();
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

    public void operatore(final Label tabellaOperatore){
        System.out.println(tabellaOperatore.getId().toString());
    }


}

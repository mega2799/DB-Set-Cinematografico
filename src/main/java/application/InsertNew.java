package application;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class InsertNew {
    private DBConnection connection;

    public InsertNew(final DBConnection connection) {
        this.connection = connection;
    }

    void sponsor(final String partitaIva, final String nome){
        String query = "INSERT IGNORE INTO Sponsor(P_IVA_SPONSOR, nome) VALUES(" + "\'" + partitaIva + "\', " + "\'" + nome + "\');";
        System.out.println(query);
        try(Statement statement = connection.getConnection().createStatement()) {
            System.out.println("affected rows:" + statement.executeUpdate(query));
        }catch (SQLException e){
            e.printStackTrace();
        }
    }
}

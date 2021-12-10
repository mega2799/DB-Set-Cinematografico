package application;

import controllers.InsertTabController;
import controllers.Visualization1Controller;
import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.stage.Stage;

import java.io.*;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;

public class Main extends Application{
    @Override
    public void start(Stage myStage) throws FileNotFoundException, Exception {
        //myStage = FXMLLoader.load(this.getClass().getResource("/GUI/insert.fxml"));
        //myStage.show();

        //non più necessario perchè DBConnection singleton style.
        //DBConnection DbC = new DBConnection();


        /* Create tables, ma abbiamo errore sintassi */
        CreateTable createTable = new CreateTable();
        //List<String> lines =  Files.readAllLines(Paths.get(this.getClass().getResource("/Creation/makeTables.sql").toString()));
        System.out.println("CREATING DB.......");
        try {
            BufferedReader br = new BufferedReader(new InputStreamReader(this.getClass().getResourceAsStream("/Creation/makeTables.sql")));
            createTable.runScript(DBConnection.getConnection(), br);
        } catch (FileNotFoundException fe){
            fe.printStackTrace();
        }

        /* Funziona tutto ma dobbiamo produrre nuovi dati */
        InsertValues insertValues = new InsertValues();
        try {
            BufferedReader br = new BufferedReader(new InputStreamReader(this.getClass().getResourceAsStream("/Insert/insertion.sql")));
            insertValues.runScript(DBConnection.getConnection(), br);
        } catch (FileNotFoundException fe){
            fe.printStackTrace();
        }

        /* executing queries */
        TellMe tellMe = new TellMe();
        //TODO
        // Per come abbiamo modellato il DB george lucas non puo essere sia produttore che sceneggiatore
        System.out.println(tellMe.troupeMembers());

        Stage stage = new FXMLLoader(this.getClass().getResource("/GUI/insert.fxml")).load();

//        InsertNew insertNew = new InsertNew(stage);
//        insertNew.sponsor("29218600223", "BHo SPA");

//        System.out.println(tellMe.sponsors());
        //ci vuole il commit per realizzare le modifiche:
        DBConnection.getConnection().commit();
        stage.show();
        //System.exit(0);

    }

    public static void main(String[] args) {
        launch(args);
    }

}


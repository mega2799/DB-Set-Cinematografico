package application;

import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.stage.Stage;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.Reader;

public class Main extends Application{
    @Override
    public void start(Stage myStage) throws Exception {
        myStage = FXMLLoader.load(this.getClass().getResource("/GUI/insert.fxml"));
        //myStage.show();

        DBConnection DbC = new DBConnection();
        CreateTable createTable = new CreateTable();

       // BufferedReader br = new BufferedReader(new FileReader(new File(this.getClass().getResource("/Creation/makeTables.txt").toString())));
        File f = new File(this.getClass().getResource("/Creation/makeTables.txt").toString());
        Reader br = new FileReader(f);
        createTable.runScript(DbC.getConnection(), br);
        System.exit(0);
    }

    public static void main(String[] args) {
        launch(args);
    }

}


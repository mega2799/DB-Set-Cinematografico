package application;

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
        myStage = FXMLLoader.load(this.getClass().getResource("/GUI/insert.fxml"));
        //myStage.show();

        DBConnection DbC = new DBConnection();
        CreateTable createTable = new CreateTable();
//        List<String> lines = Files.readAllLines(Paths.get(this.getClass().getResource("/Creation/makeTables.txt").toString()));
//        System.out.println(lines.get(2));
        try {
            BufferedReader br = new BufferedReader(new InputStreamReader(this.getClass().getResourceAsStream("/Creation/makeTables.txt")));
            createTable.runScript(DbC.getConnection(), br);
        } catch (FileNotFoundException fe){
            fe.printStackTrace();
        }


        //File f = new File(this.getClass().getResource("/Creation/makeTables.txt").toString());
        //Reader br = new FileReader(f);
        System.exit(0);
    }

    public static void main(String[] args) {
        launch(args);
    }

}


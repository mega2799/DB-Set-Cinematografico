package controllers;
import application.DBConnection;
import application.InsertNew;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.control.Button;
import javafx.scene.control.Tab;
import javafx.scene.control.TabPane;
import javafx.scene.control.TextField;
import javafx.scene.input.MouseEvent;

import java.io.IOException;
import java.sql.SQLException;

public class InsertTabController {

    @FXML
    private Button Operatore_insertButton;

    @FXML
    private TextField capIndirizzo_field;

    @FXML
    private TextField cfOperatore_field;

    @FXML
    private TextField cittaIndirizzo_field;

    @FXML
    private TextField civicoIndirizzo_fielda;

    @FXML
    private TextField codFilm_field;

    @FXML
    private TextField codIndirizzoFinanziatore_field;

    @FXML
    private TextField codIndirizzoIndirizzo_field;

    @FXML
    private TextField codiceIndirizzoEnti_field;

    @FXML
    private TextField codiceIndirizzoOperatore_field;

    @FXML
    private TextField cognomeOperatore_field;

    @FXML
    private TextField dataNascitaOperatore_field;

    @FXML
    private TextField dataUscita_field;

    @FXML
    private TextField durata_field;

    @FXML
    private Button enti_insertButton;

    @FXML
    private Button film_insertButton;

    @FXML
    private Button finanziatore_insertButton;

    @FXML
    private TextField genere_field;

    @FXML
    private TextField ibanOperatore_field;

    @FXML
    private TextField idSerieLetteraria_field;

    @FXML
    private Button indirizzo_insertButton;

    @FXML
    private TextField nomeEnti_field;

    @FXML
    private TextField nomeFinanziatore_field;

    @FXML
    private TextField nomeOperatore_field;

    @FXML
    private TextField nomeSponsor_field;

    @FXML
    private TextField pIvaEnti_field;

    @FXML
    private TextField pIvaFinanziatore_field;

    @FXML
    private TextField pIvaSponsor_field;

    @FXML
    private TextField percentualeContributoOperatore_field;

    @FXML
    private TextField percentualeGuadagnoFinanziatore_field;

    @FXML
    private TextField ruoloOperatore_field;

    @FXML
    private Button sponsor_insertButton;

    @FXML
    private TextField telefonoOperatore_field;

    @FXML
    private TextField tipoOperatore_field;

    @FXML
    private TextField titolo_field;

    @FXML
    private TextField viaIndirizzo_field;

    @FXML
    private TabPane tabPane;

    private DBConnection DbC;

    private InsertNew insertNew;

    private Tab visualization1;



    public void initialize(){
        this.visualization1 = new Tab();
        this.insertNew = new InsertNew();
        FXMLLoader loader = new FXMLLoader(this.getClass().getResource("/GUI/visualization1.fxml"));
        visualization1.setText("visualization");
        visualization1.setClosable(false);
        this.tabPane.getTabs().add(visualization1);
        try {
            visualization1.setContent(loader.load());
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @FXML
    void film_insertButton_clicked(MouseEvent event) {
    }

    @FXML
    void enti_insertButton_clicked(MouseEvent event) {

    }


    @FXML
    void finanziatore_insertButton_clicked(MouseEvent event) {

    }

    @FXML
    void indirizzo_insertButton_clicked(MouseEvent event) {

    }

    @FXML
    void operatore_insertButton_clicked(MouseEvent event) {

    }

    @FXML
    void sponsor_insertButton_clicked(MouseEvent event) {
        this.insertNew.sponsor(pIvaSponsor_field.getText(),nomeSponsor_field.getText());
        pIvaSponsor_field.clear();
        nomeSponsor_field.clear();
    }

    @FXML
    void indirizzo_insertButton_clicked(MouseEvent event) {

    }

    @FXML
    void enti_insertButton_clicked(MouseEvent event) {

    }


    @FXML
    void finanziatore_insertButton_clicked(MouseEvent event) {

    }


    @FXML
    void operatore_insertButton_clicked(MouseEvent event) {

    }

    @FXML
    void sponsor_insertButton_clicked(MouseEvent event) {
        this.insertNew.sponsor(pIvaSponsor_field.getText(),nomeSponsor_field.getText());
        pIvaSponsor_field.clear();
        nomeSponsor_field.clear();
    }
}

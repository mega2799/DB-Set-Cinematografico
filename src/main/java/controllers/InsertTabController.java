package controllers;
import application.DBConnection;
import application.InsertNew;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.control.*;
import javafx.scene.input.MouseEvent;
import javafx.stage.Stage;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

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
    private TextField civicoIndirizzo_field;

    @FXML
    private CheckMenuItem sceneggiatore_field;

    @FXML
    private CheckMenuItem produttore_field;

    @FXML
    private CheckMenuItem produttoreEsecutivo_field;

    @FXML
    private CheckMenuItem attore_field;

    @FXML
    private CheckMenuItem aiutoRegista_field;

    @FXML
    private CheckMenuItem capoRegista_field;

    @FXML
    private CheckMenuItem stilista_field;

    @FXML
    private CheckMenuItem operatoreFonico_field;

    @FXML
    private CheckMenuItem operatoreFotografico_field;

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
    private DatePicker dataNascitaOperatore_field;

    @FXML
    private TextField dataUscita_field;

    @FXML
    private TextField durata_field;

    @FXML
    private Button enti_insertButton;

    @FXML
    private Button film_insertButton;

    @FXML
    private Button incasso_insertButton;

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
    private MenuButton ruoloOperatore_field;

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
    private DatePicker dataInizio_field;

    @FXML
    private DatePicker dataFine_field;

    @FXML
    private TextField incasso_field;

    @FXML
    private TextField codIndirizzoIncasso_field;

    @FXML
    private TextField codFilmIncasso_field;

    @FXML
    private TabPane tabPane;

    private DBConnection DbC;

    private InsertNew insertNew;

    private Tab visualization1;

    private Stage stage;


    public void initialize(){
        this.visualization1 = new Tab();
        this.dataInizio_field.getEditor().setDisable(true);
        this.dataFine_field.getEditor().setDisable(true);
        this.dataInizio_field.getEditor().setOpacity(1);
        this.dataFine_field.getEditor().setOpacity(1);
        this.dataNascitaOperatore_field.getEditor().setDisable(true);
        this.dataNascitaOperatore_field.getEditor().setOpacity(1);
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
    void finanziatore_insertButton_clicked(MouseEvent event) {
        this.insertNew.finanziatore(pIvaFinanziatore_field.getText(),nomeFinanziatore_field.getText(), codIndirizzoFinanziatore_field.getText(), Float.parseFloat(percentualeGuadagnoFinanziatore_field.getText()));
        pIvaFinanziatore_field.clear();
        nomeFinanziatore_field.clear();
        codIndirizzoFinanziatore_field.clear();
        percentualeGuadagnoFinanziatore_field.clear();
    }

    @FXML
    void indirizzo_insertButton_clicked(MouseEvent event) {

    }

    @FXML
    void operatore_insertButton_clicked(MouseEvent event) {
        List<CheckMenuItem> items = Arrays.asList(sceneggiatore_field, aiutoRegista_field, capoRegista_field, produttore_field, produttoreEsecutivo_field, attore_field, stilista_field, operatoreFonico_field, operatoreFotografico_field);
        this.insertNew.operatore(cfOperatore_field.getText(), nomeOperatore_field.getText(), cognomeOperatore_field.getText(), ibanOperatore_field.getText(),
                dataNascitaOperatore_field.getValue().toString(), telefonoOperatore_field.getText(),codiceIndirizzoOperatore_field.getText(),
                Float.parseFloat(percentualeContributoOperatore_field.getText()), items.stream().filter(e -> e.isSelected()).map(e -> e.getText()).collect(Collectors.toList()));
        cfOperatore_field.clear();
        nomeOperatore_field.clear();
        cognomeOperatore_field.clear();
        ibanOperatore_field.clear();
        dataNascitaOperatore_field.setValue(null);
        telefonoOperatore_field.clear();
        codiceIndirizzoOperatore_field.clear();
        percentualeContributoOperatore_field.clear();
        items.stream().forEach(i -> i.setSelected(false));
    }

    @FXML
    void incasso_insertButton_clicked(MouseEvent event){
        this.insertNew.incasso(dataInizio_field.getValue().toString(), dataFine_field.getValue().toString(),
                Integer.parseInt(incasso_field.getText()), codFilmIncasso_field.getText(), codIndirizzoIncasso_field.getText());
        dataInizio_field.setValue(null);
        dataFine_field.setValue(null);
        incasso_field.clear();
        codFilmIncasso_field.clear();
        codIndirizzoIncasso_field.clear();
    }

    @FXML
    void sponsor_insertButton_clicked(MouseEvent event) {
        this.insertNew.sponsor(pIvaSponsor_field.getText(),nomeSponsor_field.getText());
        pIvaSponsor_field.clear();
        nomeSponsor_field.clear();
    }


    @FXML
    void enti_insertButton_clicked(MouseEvent event) {
        this.insertNew.enti(pIvaEnti_field.getText(), nomeEnti_field.getText(), codiceIndirizzoEnti_field.getText());
        pIvaEnti_field.clear();
        nomeEnti_field.clear();
        codiceIndirizzoEnti_field.clear();
    }


}

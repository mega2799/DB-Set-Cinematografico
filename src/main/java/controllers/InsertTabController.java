package controllers;
import application.DBConnection;
import application.InsertNew;
import application.QueryTeller;
import application.TellMe;
import javafx.beans.property.SimpleStringProperty;
import javafx.beans.value.ObservableValue;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.event.Event;
import javafx.event.EventHandler;
import javafx.event.EventType;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Node;
import javafx.scene.control.*;
import javafx.scene.input.MouseEvent;
import javafx.scene.layout.VBox;
import javafx.stage.Stage;
import javafx.util.Callback;

import javax.management.Query;
import javax.swing.event.MenuEvent;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.function.Function;

public class InsertTabController {
    private final QueryTeller queryTeller = new QueryTeller();
    @FXML
    private VBox incassoVBox;
    @FXML
    private VBox finanziatoreVBox;
    @FXML
    private VBox sponsorVBox;
    @FXML
    private VBox operatoreVBox;
    @FXML
    private VBox entiVBox;
    @FXML
    private VBox indirizzoVBox;
    @FXML
    private VBox filmVBox;
    @FXML
    private Button operatore_insertButton;
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
    private DatePicker dataUscita_field;
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
    private TabPane tabPane;
    @FXML
    private MenuButton filmSelection_operatoreTroupe;
    @FXML
    private MenuButton filmSelection_sponsor;
    @FXML
    private MenuButton filmSelection_incasso;
    @FXML
    private MenuButton filmSelection_finanziatore;
    @FXML
    private TableView tableView;

    private DBConnection DbC;
    private InsertNew insertNew;
    private Tab visualization1;
    private Tab query;
    private Stage stage;
    private List<VBox> listVBox;
    private ObservableList<ObservableList> data;
    private TellMe  tellMe;

    public void initialize(){
        this.visualization1 = new Tab();
        this.query = new Tab();
        this.dataInizio_field.getEditor().setDisable(true);
        this.dataFine_field.getEditor().setDisable(true);
        this.dataInizio_field.getEditor().setOpacity(1);
        this.dataFine_field.getEditor().setOpacity(1);
        this.dataNascitaOperatore_field.getEditor().setDisable(true);
        this.dataNascitaOperatore_field.getEditor().setOpacity(1);
        this.insertNew = new InsertNew();
        FXMLLoader loader = new FXMLLoader(this.getClass().getResource("/GUI/visualization1.fxml"));
        FXMLLoader queryGui = new FXMLLoader(this.getClass().getResource("/GUI/query.fxml"));
        visualization1.setText("visualization");
        visualization1.setClosable(false);
        query.setText("query");
        query.setClosable(false);
        this.tabPane.getTabs().add(visualization1);
        this.tabPane.getTabs().add(query);
        try {
            visualization1.setContent(loader.load());
            query.setContent(queryGui.load());
        } catch (IOException e) {
            e.printStackTrace();
        }
        this.refreshMenuFilm();
        this.listVBox = new ArrayList<>(List.of(this.filmVBox,this.indirizzoVBox, this.entiVBox, this.operatoreVBox,this.sponsorVBox,this.finanziatoreVBox,this.incassoVBox));
        this.hideVBoxes();
        this.data = FXCollections.observableArrayList();
        this.tellMe = new TellMe();
    }

    private void populateTable(ResultSet rs) {
        try{
            for(int i=0 ; i<rs.getMetaData().getColumnCount(); i++){
                //We are using non property style for making dynamic table
                final int j = i;
                TableColumn col = new TableColumn<>(rs.getMetaData().getColumnName(i+1));
                col.setCellValueFactory(new Callback<TableColumn.CellDataFeatures<ObservableList,String>, ObservableValue<String>>(){
                    public ObservableValue<String> call(TableColumn.CellDataFeatures<ObservableList, String> param) {
                        if(param.getValue().get(j)==null){
                            return new SimpleStringProperty("null");
                        } else {
                            return new SimpleStringProperty(param.getValue().get(j).toString());
                        }
                    }
                });
                tableView.getColumns().addAll(col);
            }

            while(rs.next()){
                ObservableList<String> row = FXCollections.observableArrayList();
                for(int i=1 ; i<=rs.getMetaData().getColumnCount(); i++){
                    row.add(rs.getString(i));
                }
                System.out.println("Row [1] added "+row );
                data.add(row);
            }

            tableView.setItems(data);
        }catch(Exception e){
            e.printStackTrace();
            System.out.println("Error on Building Data");
        }
    }

    @FXML
    void film_insertButton_clicked(MouseEvent event) {
        if(titolo_field.getText().equals("")||genere_field.getText().equals("")||durata_field.getText().equals("")){
            insertNew.showAlert(Alert.AlertType.WARNING,"titolo,genere and durata can't be null");
            return;
        }
        List<TextField> list = List.of(titolo_field,genere_field,durata_field,idSerieLetteraria_field);
        String[] params = (String[]) list.stream().map(x->{
            return (x.getText().equals("")) ? null: x.getText();
        }).toArray(String[]::new);
        LocalDate date = dataUscita_field.getValue();
        insertNew.film(params[0],params[1],params[2],date==null ? null: date.format(DateTimeFormatter.ofPattern("yyyy-MM-dd")),params[3]);
        list.forEach(x->x.clear());
        dataUscita_field.setValue(null);
        clearAndPopulateTable(tellMe.film());
    }

    @FXML
    void finanziatore_insertButton_clicked(MouseEvent event) {
        Optional<String> selectedFilm = filmSelection_finanziatore.getItems().stream().filter((MenuItem x)->((RadioMenuItem)x).isSelected()).map(x->x.getText()).findFirst();
        if(selectedFilm.isEmpty()){
            insertNew.showAlert(Alert.AlertType.ERROR,"film not selected");
            return;
        }
        if(pIvaFinanziatore_field.getText().equals("")||nomeFinanziatore_field.getText().equals("")||codIndirizzoFinanziatore_field.getText().equals("")||percentualeGuadagnoFinanziatore_field.getText().equals("")){
            insertNew.showAlert(Alert.AlertType.WARNING,"fields can't be null");
            return;
        }
        if(Float.parseFloat(percentualeGuadagnoFinanziatore_field.getText())<0 || Float.parseFloat(percentualeGuadagnoFinanziatore_field.getText())>100){
            insertNew.showAlert(Alert.AlertType.WARNING,"percentuale guadagno must be between 0 and 100");
            return;
        }
        this.insertNew.finanziatore(pIvaFinanziatore_field.getText(),nomeFinanziatore_field.getText(), codIndirizzoFinanziatore_field.getText(), Float.parseFloat(percentualeGuadagnoFinanziatore_field.getText()),selectedFilm.get());
        pIvaFinanziatore_field.clear();
        nomeFinanziatore_field.clear();
        codIndirizzoFinanziatore_field.clear();
        percentualeGuadagnoFinanziatore_field.clear();
        clearAndPopulateTable(tellMe.finanziatori(this.codFFromTitle(selectedFilm.get())));
    }

    @FXML
    void indirizzo_insertButton_clicked(MouseEvent event) {
        if(codIndirizzoIndirizzo_field.getText().equals("")||cittaIndirizzo_field.getText().equals("")||viaIndirizzo_field.getText().equals("")||civicoIndirizzo_field.getText().equals("")||capIndirizzo_field.getText().equals("")){
            insertNew.showAlert(Alert.AlertType.WARNING,"codIndirizzo, citta, via, civico and cap can't be null");
            return;
        }
        if(codIndirizzoIndirizzo_field.getText().length()>5 || capIndirizzo_field.getText().length()!=5){
            insertNew.showAlert(Alert.AlertType.WARNING,"codInd length must be <=5 and cap length = 5");
            return;
        }
        List<TextField> list = List.of(codIndirizzoIndirizzo_field,cittaIndirizzo_field,viaIndirizzo_field,civicoIndirizzo_field,capIndirizzo_field);
        String[] params = (String[]) list.stream().map(x->x.getText()).toArray(String[]::new);
        insertNew.indirizzo(params[0],params[1],params[2],params[3],params[4]);
        list.forEach(x->x.clear());
        clearAndPopulateTable(tellMe.indirizzi());
    }

    @FXML
    void operatore_insertButton_clicked(MouseEvent event) {
        Optional<String> selectedFilm = filmSelection_operatoreTroupe.getItems().stream().filter((MenuItem x)->((RadioMenuItem)x).isSelected()).map(x->x.getText()).findFirst();
        if(selectedFilm.isEmpty()){
            insertNew.showAlert(Alert.AlertType.ERROR,"film not selected");
            return;
        }
        if(cfOperatore_field.getText().equals("")||nomeOperatore_field.getText().equals("")||cognomeOperatore_field.getText().equals("")||ibanOperatore_field.getText().equals("")
            || dataNascitaOperatore_field.getValue()==null || telefonoOperatore_field.getText().equals("") || codiceIndirizzoOperatore_field.getText().equals("")
            || (!percentualeContributoOperatore_field.getText().equals("") && (Float.parseFloat(percentualeContributoOperatore_field.getText())>100 ||Float.parseFloat(percentualeContributoOperatore_field.getText())<0))){
            insertNew.showAlert(Alert.AlertType.WARNING,"fields can't be null and percentualeContributo must be between 0 and 100");
            return;
        }
        QueryTeller queryTeller = new QueryTeller();
        if(!queryTeller.checkCF(cfOperatore_field.getText())){
            insertNew.operatore(cfOperatore_field.getText(),nomeOperatore_field.getText(),cognomeOperatore_field.getText(),
                ibanOperatore_field.getText(),dataNascitaOperatore_field.getValue().format(DateTimeFormatter.ofPattern("yyyy MM dd")).replaceAll(" ","-"),telefonoOperatore_field.getText(),codiceIndirizzoOperatore_field.getText(),Float.parseFloat(percentualeContributoOperatore_field.getText()));
            System.out.println("inserito");
        }
        String codF = codFFromTitle(selectedFilm.get());
        insertNew.operatore_film(Integer.parseInt(codF),cfOperatore_field.getText());
        nomeOperatore_field.clear();
        cognomeOperatore_field.clear();
        ibanOperatore_field.clear();
        dataNascitaOperatore_field.setValue(null);
        telefonoOperatore_field.clear();
        codiceIndirizzoOperatore_field.clear();
        percentualeContributoOperatore_field.clear();
        clearAndPopulateTable(tellMe.troupeJoinAddress(String.valueOf(codF)));
    }

    @FXML
    void incasso_insertButton_clicked(MouseEvent event){
        Optional<String> selectedFilm = filmSelection_incasso.getItems().stream().filter((MenuItem x)->((RadioMenuItem)x).isSelected()).map(x->x.getText()).findFirst();
        if(selectedFilm.isEmpty()){
            insertNew.showAlert(Alert.AlertType.ERROR,"film not selected");
            return;
        }
        if(dataInizio_field.getValue()==null||dataFine_field.getValue()==null||incasso_field.getText().equals("")||codIndirizzoIncasso_field.getText().equals("")){
            insertNew.showAlert(Alert.AlertType.ERROR,"fields can't be null");
        }
        this.insertNew.incasso(dataInizio_field.getValue().toString(), dataFine_field.getValue().toString(),
                Integer.parseInt(incasso_field.getText()), selectedFilm.get(), codIndirizzoIncasso_field.getText());
        dataInizio_field.setValue(null);
        dataFine_field.setValue(null);
        incasso_field.clear();
        codIndirizzoIncasso_field.clear();
        clearAndPopulateTable(tellMe.incassiJoinIndirizzo(this.codFFromTitle(selectedFilm.get())));
    }

    @FXML
    void sponsor_insertButton_clicked(MouseEvent event) {
        Optional<String> selectedFilm = filmSelection_sponsor.getItems().stream().filter((MenuItem x)->((RadioMenuItem)x).isSelected()).map(x->x.getText()).findFirst();
        if(selectedFilm.isEmpty()){
            insertNew.showAlert(Alert.AlertType.ERROR,"film not selected");
            return;
        }
        if(pIvaSponsor_field.getText().equals("")||nomeSponsor_field.getText().equals("")){
            insertNew.showAlert(Alert.AlertType.WARNING,"pIva and name can't be null");
            return;
        }
        this.insertNew.sponsor(pIvaSponsor_field.getText(),nomeSponsor_field.getText(),selectedFilm.orElse(null));
        pIvaSponsor_field.clear();
        nomeSponsor_field.clear();
        clearAndPopulateTable(tellMe.sponsors(this.codFFromTitle(selectedFilm.get())));
    }


    @FXML
    void enti_insertButton_clicked(MouseEvent event) {
        this.insertNew.enti(pIvaEnti_field.getText(), nomeEnti_field.getText(), codiceIndirizzoEnti_field.getText());
        pIvaEnti_field.clear();
        nomeEnti_field.clear();
        codiceIndirizzoEnti_field.clear();
        clearAndPopulateTable(tellMe.enti());
    }

    private void refreshMenuFilm(){
        QueryTeller queryTeller = new QueryTeller();
        this.refreshFilmSelection(this.filmSelection_operatoreTroupe,(String x) -> tellMe.troupeJoinAddress(x));
        this.refreshFilmSelection(this.filmSelection_sponsor,(String x) -> tellMe.troupeJoinAddress(x));
        queryTeller.setMenuButton(this.filmSelection_finanziatore,"SELECT * FROM Film", "titolo");
        queryTeller.setMenuButton(this.filmSelection_incasso,"SELECT * FROM Film", "titolo");
    }

    @FXML
    void refreshButton_clicked(MouseEvent event){
        this.refreshMenuFilm();
    }

    @FXML
    void filmActionToolbar(ActionEvent event) {
        this.hideVBoxes();
        this.filmVBox.setVisible(this.filmVBox.isVisible() ? false : true);
        this.clearAndPopulateTable(this.tellMe.film());
    }
    @FXML
    void indirizzoActionToolbar(ActionEvent event) {
        this.hideVBoxes();
        this.indirizzoVBox.setVisible(this.indirizzoVBox.isVisible() ? false : true);
        this.clearAndPopulateTable(this.tellMe.indirizzi());
    }

    @FXML
    void entiActionToolbar(ActionEvent event) {
        this.hideVBoxes();
        this.entiVBox.setVisible(this.entiVBox.isVisible() ? false : true);
        this.clearAndPopulateTable(this.tellMe.enti());
    }

    @FXML
    void operatoreActionToolbar(ActionEvent event) {
        this.hideVBoxes();
        this.operatoreVBox.setVisible(this.operatoreVBox.isVisible() ? false : true);
        this.clearTable();
        this.refreshFilmSelection(this.filmSelection_operatoreTroupe,(String x) -> tellMe.troupeJoinAddress(x));
    }

    private void refreshFilmSelection(MenuButton menuButton, Function<String,ResultSet> function) {
        queryTeller.setMenuButton(menuButton, "SELECT * FROM Film", "titolo");
        menuButton.getItems().forEach((MenuItem x) -> {
            x.setOnAction(y->{
                try {
                    ResultSet result = queryTeller.getCodF(x.getText());
                    result.next();
                    String codF = result.getString("codF");
                    this.clearAndPopulateTable(function.apply(codF));
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            });
        });
    }

    @FXML
    void sponsorActionToolbar(ActionEvent event) {
        this.hideVBoxes();
        QueryTeller queryTeller = new QueryTeller();
        this.sponsorVBox.setVisible(this.sponsorVBox.isVisible() ? false : true);
        this.refreshFilmSelection(this.filmSelection_sponsor,(String x) -> tellMe.sponsors(x));
    }

    @FXML
    void finanziatoreActionToolbar(ActionEvent event) {
        this.hideVBoxes();
        this.finanziatoreVBox.setVisible(this.finanziatoreVBox.isVisible() ? false : true);
        refreshFilmSelection(this.filmSelection_finanziatore,(String x) -> tellMe.finanziatori(x));

    }

    @FXML
    void incassoActionToolbar(ActionEvent event) {
        this.hideVBoxes();
        this.incassoVBox.setVisible(this.incassoVBox.isVisible() ? false : true);
        this.refreshFilmSelection(this.filmSelection_incasso,(String x) -> tellMe.incassiJoinIndirizzo(x));
    }

    private void hideVBoxes(){
        this.listVBox.forEach(x -> x.setVisible(false));
    }

    private void clearAndPopulateTable(ResultSet rs){
        this.clearTable();
        this.populateTable(rs);
    }

    private void clearTable(){
        this.tableView.getItems().clear();
        this.tableView.getColumns().clear();
    }

    private   String codFFromTitle(String title){
        ResultSet result = queryTeller.getCodF(title);
        try {
            result.next();
            String codF = result.getString("codF");
            return codF;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }


}

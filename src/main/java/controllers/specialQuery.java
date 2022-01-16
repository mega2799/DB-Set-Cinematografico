package controllers;

import application.QueryTeller;
import javafx.beans.property.SimpleStringProperty;
import javafx.beans.value.ObservableValue;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.FXML;
import javafx.scene.control.*;
import javafx.scene.input.MouseEvent;
import javafx.util.Callback;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Optional;

public class specialQuery {

    @FXML
    private Button queryMagazzino_insertButton;

    @FXML
    private Button queryScena_insertButton;

    @FXML
    private TableView queryView;

    @FXML
    private MenuButton selectMagazzino;

    @FXML
    private MenuButton selectScena;

    @FXML
    private MenuButton scene_menu_bar;

    @FXML
    private MenuButton filmSelectioner;

    @FXML
    private Button okButton;

    private ToggleGroup nomiFilm;

    private ToggleGroup tgMagazzino;

    private ToggleGroup noteScena;



    @FXML
    private MenuButton month_sel;

    QueryTeller queryTeller;

    private String CODFILM;


    private ResultSet rs;
    private Method lastQuery;
    private ObservableList<ObservableList> data;
    private Alert alert;
    private ToggleGroup tgMonth;


    // TODO devi modificare anche qua in modo che si possa selezioanare i risultati in base al film, quindi passsare codF anche alle query speciali
    public void initialize() {
        queryTeller = new QueryTeller();
        data = FXCollections.observableArrayList();
        refreshFilmBar();
        this.tgMagazzino = queryTeller.setMenuButton(selectMagazzino, "SELECT numMagazzino FROM Magazzino", "numMagazzino");
        this.tgMonth = queryTeller.setMenuButton(month_sel, List.of("gennaio", "febbraio", "marzo", "aprile", "maggio", "giugno", "luglio", "agosto", "settembre", "ottobre", "novembre", "dicembre"));
    }

    private void refreshFilmBar(){
        this.nomiFilm = queryTeller.setMenuButton(this.filmSelectioner, "SELECT * FROM Film", "titolo");
    }

    private boolean filmCheck(){
        return CODFILM == null;
    }


    private void showAlert(final Alert.AlertType alertType, final String mex){
        this.alert = new Alert(alertType,mex);
        alert.showAndWait();
    }


    @FXML
    void filmSelOK(MouseEvent event){
        RadioMenuItem rb = (RadioMenuItem) nomiFilm.getSelectedToggle();
        rs = this.queryTeller.getCodF(rb.getText());
        try {
            while(rs.next()) {
                this.CODFILM = rs.getString("codF");
                this.filmSelectioner.setText(rb.getText());
                //this.deleteRowButton.setVisible(true);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        // qui aggiornare i menuItem
        this.noteScena = queryTeller.setMenuButton(scene_menu_bar, "SELECT * from ScenaCiak where codF = " + CODFILM + " order by noteDiProduzione ASC", "noteDiProduzione");

    }

    private void setLastQuery(String methodName){
        try {
            lastQuery = Class.forName("application.QueryTeller").getMethod(methodName,(Class<?>[])null);
        } catch (NoSuchMethodException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    private void populateTable() {
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
                queryView.getColumns().addAll(col);
            }

            while(rs.next()){
                ObservableList<String> row = FXCollections.observableArrayList();
                for(int i=1 ; i<=rs.getMetaData().getColumnCount(); i++){
                    row.add(rs.getString(i));
                }
                System.out.println("Row [1] added "+row );
                data.add(row);
            }

            queryView.setItems(data);
        }catch(Exception e){
            e.printStackTrace();
            System.out.println("Error on Building Data");
        }
    }

    public void refreshQuery() {
        try {
            rs = (ResultSet) lastQuery.invoke(queryTeller, (Object[]) null);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }
    }

    public void refreshTable() {
        queryView.getItems().clear();
        queryView.getColumns().clear();
        try {
            rs.beforeFirst();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        populateTable();
    }


    @FXML
    void queryMagazzino_clicked(MouseEvent e){
        RadioMenuItem rb = (RadioMenuItem) tgMagazzino.getSelectedToggle();
        rs = queryTeller.oggettiInMagazzino(Integer.parseInt(rb.getText()));
        //setLastQuery("oggettiInMagazzino");
        refreshTable();
    }


    @FXML
    void attori_in_scena_clicked(MouseEvent e ){
        if(filmCheck()){
            showAlert(Alert.AlertType.ERROR,"Non hai selezionato il Film");
            return;
        }
        RadioMenuItem rb = (RadioMenuItem) noteScena.getSelectedToggle();
        rs = queryTeller.attoriInScena(rb.getText(), CODFILM);
        refreshTable();
    }

    @FXML
    void queryScena_clicked(MouseEvent e ){
        if(filmCheck()){
            showAlert(Alert.AlertType.ERROR,"Non hai selezionato il Film");
            return;
        }
        RadioMenuItem rb = (RadioMenuItem) noteScena.getSelectedToggle();
        rs = queryTeller.oggettiInScena(rb.getText(), CODFILM);
        refreshTable();
    }

    @FXML
    void stipendio_troupe(MouseEvent e){
        if(filmCheck()){
            showAlert(Alert.AlertType.ERROR,"Non hai selezionato il Film");
            return;
        }
        RadioMenuItem rb = (RadioMenuItem) tgMonth.getSelectedToggle();
        rs = queryTeller.stipendioMensileTroupeTotale(rb.getText(), CODFILM);
        refreshTable();
    }


    @FXML
    void profitto_finanzziatori_clicked(MouseEvent e ){
        if(filmCheck()){
            showAlert(Alert.AlertType.ERROR,"Non hai selezionato il Film");
            return;
        }
        rs = queryTeller.profittoFinanziatori(CODFILM);
        refreshTable();
    }

    @FXML
    void stipendio_prod_clicked(MouseEvent e){
        if(filmCheck()){
            showAlert(Alert.AlertType.ERROR,"Non hai selezionato il Film");
            return;
        }
        rs = queryTeller.guadagnoProduttori(CODFILM);
        refreshTable();
    }
}

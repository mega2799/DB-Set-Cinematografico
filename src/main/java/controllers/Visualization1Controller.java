package controllers;
import application.DBConnection;
import application.QueryTeller;
import application.TellMe;
import javafx.beans.property.SimpleStringProperty;
import javafx.beans.value.ObservableValue;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.FXML;
import javafx.scene.control.*;
import javafx.scene.input.MouseEvent;
import javafx.scene.layout.VBox;
import javafx.util.Callback;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class Visualization1Controller {

    @FXML
    private TableView tableView;
    @FXML
    private VBox vbox;
    @FXML
    private Button refreshButton;
    @FXML
    private Button sponsor_button;
    @FXML
    private Button deleteRowButton;
    @FXML
    private MenuButton filmSelectioner;


    @FXML
    private Button okButton;
    private ToggleGroup nomiFilm;


    private ObservableList<ObservableList> data;
    private ResultSet rs;
    private TellMe tell;
    private Method lastQuery;
    private QueryTeller queryTeller;
    private Alert alert;


    private String CODFILM;

    private boolean filmCheck(){
        return CODFILM == null;
    }
    public void initialize(){
        tell = new TellMe();
        data = FXCollections.observableArrayList();
       // sponsor_buttonClicked(null);
        this.queryTeller = new QueryTeller();
        this.refreshFilmBar();
    }

    private void refreshFilmBar(){
        this.nomiFilm= queryTeller.setMenuButton(this.filmSelectioner, "SELECT * FROM Film", "titolo");
    }

    private void showAlert(final Alert.AlertType alertType, final String mex){
        this.alert = new Alert(alertType,mex);
        alert.showAndWait();
    }

    private void setLastQuery(String methodName){
        try {
            lastQuery = Class.forName("application.TellMe").getMethod(methodName, String.class);
            lastQuery.invoke(this.tell, CODFILM);
        } catch (NoSuchMethodException e) {
            try{
                lastQuery = Class.forName("application.TellMe").getMethod(methodName);
                lastQuery.invoke(this.tell);
            } catch (NoSuchMethodException | ClassNotFoundException | IllegalAccessException | InvocationTargetException ex){
                ex.printStackTrace();
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        }
    }


    private void populateTable() {
        try{
            for(int i=0 ; i<rs.getMetaData().getColumnCount(); i++){
                //We are using non property style for making dynamic table
                final int j = i;
                TableColumn col = new TableColumn<>(rs.getMetaData().getColumnName(i+1));
                col.setCellValueFactory(new Callback<TableColumn.CellDataFeatures<ObservableList,String>,ObservableValue<String>>(){
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

    public void refreshQuery() {
        try {
            rs = (ResultSet) lastQuery.invoke(tell, CODFILM);
        } catch (IllegalArgumentException e) {
            try{
                rs = (ResultSet) lastQuery.invoke(tell,(Object[]) null);
            } catch (InvocationTargetException | IllegalAccessException invocationTargetException) {
                invocationTargetException.printStackTrace();
            }
        } catch (InvocationTargetException | IllegalAccessException e) {
            e.printStackTrace();
        }
    }

    public void refreshTable() {
        tableView.getItems().clear();
        tableView.getColumns().clear();
        try {
            rs.beforeFirst();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        populateTable();
        this.refreshFilmBar();
    }

    @FXML
    void refreshButtonClicked(MouseEvent event) {
        refreshQuery();
        refreshTable();
    }

    @FXML
    void film_mouseClicked(MouseEvent event) {
        rs = tell.film();
        setLastQuery("film");
        this.deleteRowButton.setVisible(true);
        refreshTable();
    }

    @FXML
    void sponsor_buttonClicked(MouseEvent event) {
        if(filmCheck()){
            showAlert(Alert.AlertType.ERROR,"Non hai selezionato il Film");
            return;
        }
        rs = tell.sponsors(CODFILM);
        setLastQuery("sponsors");
        this.deleteRowButton.setVisible(true);
        refreshTable();
    }

    @FXML
    void troupe_mouseClicked(MouseEvent event) {
        if(filmCheck()){
            showAlert(Alert.AlertType.ERROR,"Non hai selezionato il Film");
            return;
        }
        rs = tell.troupe(CODFILM);
        setLastQuery("troupe");
        this.deleteRowButton.setVisible(true);
        refreshTable();
    }


    @FXML
    void actors_mouseClicked(MouseEvent event) {
        if(filmCheck()){
            showAlert(Alert.AlertType.ERROR,"Non hai selezionato il Film");
            return;
        }
        rs = tell.actors(CODFILM);
        setLastQuery("actors");
        this.deleteRowButton.setVisible(false);
        refreshTable();
    }

    @FXML
    void ditte_mouseClicked(MouseEvent event) {
        rs = tell.ditte();
        setLastQuery("ditte");
        this.deleteRowButton.setVisible(true);
        refreshTable();
    }

    @FXML
    void costumi_mouseClicked(MouseEvent event) {
        if(filmCheck()){
            showAlert(Alert.AlertType.ERROR,"Non hai selezionato il Film");
            return;
        }
        rs = tell.costumi(CODFILM);
        setLastQuery("costumi");
        this.deleteRowButton.setVisible(true);
        refreshTable();
    }

    @FXML
    void finanziatori_mouseClicked(MouseEvent event) {
        if(filmCheck()){
            showAlert(Alert.AlertType.ERROR,"Non hai selezionato il Film");
            return;
        }
        rs = tell.finanziatori(CODFILM);
        setLastQuery("finanziatori");
        this.deleteRowButton.setVisible(true);
        refreshTable();
    }

    @FXML
    void fondi_mouseClicked(MouseEvent event) {
        if(filmCheck()){
            showAlert(Alert.AlertType.ERROR,"Non hai selezionato il Film");
            return;
        }
        rs = tell.fondi(CODFILM);
        setLastQuery("fondi");
        this.deleteRowButton.setVisible(true);
        refreshTable();
    }

    @FXML
    void incassi_mouseClicked(MouseEvent event) {
        if(filmCheck()){
            showAlert(Alert.AlertType.ERROR,"Non hai selezionato il Film");
            return;
        }
        rs = tell.incassi(CODFILM);
        setLastQuery("incassi");
        this.deleteRowButton.setVisible(true);
        refreshTable();
    }

    @FXML
    void indirizzi_mouseClicked(MouseEvent event) {
        rs = tell.indirizzi();
        setLastQuery("indirizzi");
        this.deleteRowButton.setVisible(true);
        refreshTable();
    }

    @FXML
    void magazzini_mouseClicked(MouseEvent event) {
        rs = tell.magazzini();
        setLastQuery("magazzini");
        this.deleteRowButton.setVisible(true);
        refreshTable();
    }

    @FXML
    void oggettiScena_mouseClicked(MouseEvent event) {
        if(filmCheck()){
            showAlert(Alert.AlertType.ERROR,"Non hai selezionato il Film");
            return;
        }
        rs = tell.oggettiDiScena(CODFILM);
        setLastQuery("oggettiDiScena");
        this.deleteRowButton.setVisible(true);
        refreshTable();
    }

    @FXML
    void scene_mouseClicked(MouseEvent event) {
        if(filmCheck()){
            showAlert(Alert.AlertType.ERROR,"Non hai selezionato il Film");
            return;
        }
        rs = tell.scene(CODFILM);
        setLastQuery("scene");
        this.deleteRowButton.setVisible(true);
        refreshTable();
    }


    @FXML
    void deleteRowButtonClicked(MouseEvent event) {
        System.out.println(this.tableView.getSelectionModel().getSelectedItem());
        int index = this.tableView.getSelectionModel().getSelectedIndex() + 1;
        if( index <= 0){
            return;
        }
        try {
            rs.beforeFirst();
            while(rs.next()){
                if(rs.getRow() == index){
                    System.out.println(rs.getRow() + " "+ index);
                    rs.deleteRow();
                    DBConnection.getConnection().commit();
                    this.refreshTable();
                    break;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @FXML
    void filmSelOK(MouseEvent event){
        RadioMenuItem rb = (RadioMenuItem) nomiFilm.getSelectedToggle();
        rs = this.queryTeller.getCodF(rb.getText());
        try {
            while(rs.next()) {
                this.CODFILM = rs.getString("codF");
                this.filmSelectioner.setText(rb.getText());
                this.deleteRowButton.setVisible(true);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}

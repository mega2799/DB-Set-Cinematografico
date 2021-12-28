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

    // TODO abbisogna selezionare il film dalla visualizzazione, da modificare anche tutte le query con il where codF = codice film
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

    private String CODFILM = "1";
    // todo aggiungere un check prima di ogni funzione se e' nullo

    public void initialize(){
        tell = new TellMe();
        data = FXCollections.observableArrayList();
        sponsor_buttonClicked(null);
        this.queryTeller = new QueryTeller();
        this.nomiFilm = queryTeller.setMenuButton(this.filmSelectioner, "SELECT * FROM Film", "titolo");

    }

    private void setLastQuery(String methodName){
        try {
            lastQuery = Class.forName("application.TellMe").getMethod(methodName, String[].class);
            lastQuery.invoke(methodName, CODFILM);
        } catch (NoSuchMethodException | ClassNotFoundException e) {
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
            rs = (ResultSet) lastQuery.invoke(tell, (Object[]) null);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
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
        rs = tell.sponsors(CODFILM);
        setLastQuery("sponsors");
        this.deleteRowButton.setVisible(true);
        refreshTable();
    }

    @FXML
    void troupe_mouseClicked(MouseEvent event) {
        rs = tell.troupe(CODFILM);
        setLastQuery("troupe");
        this.deleteRowButton.setVisible(true);
        refreshTable();
    }


    @FXML
    void actors_mouseClicked(MouseEvent event) {
        rs = tell.actors(CODFILM);
        setLastQuery("actors");
        this.deleteRowButton.setVisible(false);
        refreshTable();
    }

    @FXML
    void ditte_mouseClicked(MouseEvent event) {
        rs = tell.ditte(CODFILM);
        setLastQuery("ditte");
        this.deleteRowButton.setVisible(true);
        refreshTable();
    }

    @FXML
    void costumi_mouseClicked(MouseEvent event) {
        rs = tell.costumi(CODFILM);
        setLastQuery("costumi");
        this.deleteRowButton.setVisible(true);
        refreshTable();
    }

    @FXML
    void finanziatori_mouseClicked(MouseEvent event) {
        rs = tell.finanziatori(CODFILM);
        setLastQuery("finanziatori");
        this.deleteRowButton.setVisible(true);
        refreshTable();
    }

    @FXML
    void fondi_mouseClicked(MouseEvent event) {
        rs = tell.fondi(CODFILM);
        setLastQuery("fondi");
        this.deleteRowButton.setVisible(true);
        refreshTable();
    }

    @FXML
    void incassi_mouseClicked(MouseEvent event) {
        rs = tell.incassi(CODFILM);
        setLastQuery("incassi");
        this.deleteRowButton.setVisible(true);
        refreshTable();
    }

    @FXML
    void indirizzi_mouseClicked(MouseEvent event) {
        rs = tell.indirizzi(CODFILM);
        setLastQuery("indirizzi");
        this.deleteRowButton.setVisible(true);
        refreshTable();
    }

    @FXML
    void magazzini_mouseClicked(MouseEvent event) {
        rs = tell.magazzini(CODFILM);
        setLastQuery("magazzini");
        this.deleteRowButton.setVisible(true);
        refreshTable();
    }

    @FXML
    void oggettiScena_mouseClicked(MouseEvent event) {
        rs = tell.oggettiDiScena(CODFILM);
        setLastQuery("oggettiDiScena");
        this.deleteRowButton.setVisible(true);
        refreshTable();
    }

    @FXML
    void scene_mouseClicked(MouseEvent event) {
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
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}

package controllers;
import application.TellMe;
import javafx.beans.property.SimpleStringProperty;
import javafx.beans.value.ObservableValue;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.FXML;
import javafx.scene.control.Button;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.input.MouseEvent;
import javafx.scene.layout.VBox;
import javafx.util.Callback;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
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

    private ObservableList<ObservableList> data;
    private ResultSet rs;
    private TellMe tell;
    private Method lastQuery;

    public void initialize(){
        tell = new TellMe();
        data = FXCollections.observableArrayList();
        sponsor_buttonClicked(null);
    }

    private void setLastQuery(String methodName){
        try {
            lastQuery = Class.forName("application.TellMe").getMethod(methodName,(Class<?>[])null);
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
        refreshTable();
    }

    @FXML
    void sponsor_buttonClicked(MouseEvent event) {
        rs = tell.sponsors();
        setLastQuery("sponsors");
        refreshTable();
    }

    @FXML
    void troupe_mouseClicked(MouseEvent event) {
        rs = tell.troupe();
        setLastQuery("troupe");
        refreshTable();
    }


    @FXML
    void actors_mouseClicked(MouseEvent event) {
        rs = tell.actors();
        setLastQuery("actors");
        refreshTable();
    }

    @FXML
    void ditte_mouseClicked(MouseEvent event) {
        rs = tell.ditte();
        setLastQuery("ditte");
        refreshTable();
    }

    @FXML
    void costumi_mouseClicked(MouseEvent event) {
        rs = tell.costumi();
        setLastQuery("costumi");
        refreshTable();
    }

    @FXML
    void finanziatori_mouseClicked(MouseEvent event) {
        rs = tell.finanziatori();
        setLastQuery("finanziatori");
        refreshTable();
    }

    @FXML
    void fondi_mouseClicked(MouseEvent event) {
        rs = tell.fondi();
        setLastQuery("fondi");
        refreshTable();
    }

    @FXML
    void incassi_mouseClicked(MouseEvent event) {
        rs = tell.incassi();
        setLastQuery("incassi");
        refreshTable();
    }

    @FXML
    void indirizzi_mouseClicked(MouseEvent event) {
        rs = tell.indirizzi();
        setLastQuery("indirizzi");
        refreshTable();
    }

    @FXML
    void magazzini_mouseClicked(MouseEvent event) {
        rs = tell.magazzini();
        setLastQuery("magazzini");
        refreshTable();
    }

    @FXML
    void oggettiScena_mouseClicked(MouseEvent event) {
        rs = tell.oggettiDiScena();
        setLastQuery("oggettiDiScena");
        refreshTable();
    }

    @FXML
    void scene_mouseClicked(MouseEvent event) {
        rs = tell.scene();
        setLastQuery("scene");
        refreshTable();
    }


}

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

    private ToggleGroup tgMagazzino;

    private ToggleGroup tgScena;

    QueryTeller queryTeller;
    private ResultSet rs;
    private Method lastQuery;
    private ObservableList<ObservableList> data;

    public void initialize(){
        queryTeller = new QueryTeller();
        data = FXCollections.observableArrayList();
        tgMagazzino = queryTeller.setMenuButton(selectMagazzino, "SELECT numMagazzino FROM magazzino", "numMagazzino");
        tgScena = queryTeller.setMenuButton(selectScena, "SELECT codScena FROM scenaciak", "codScena");
    }

    /*private void setLastQuery(String methodName){
        try {
            lastQuery = Class.forName("application.QueryTeller").getMethod(methodName,(Class<?>[])null);
        } catch (NoSuchMethodException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }*/

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
    void queryScena_clicked(MouseEvent e){
        RadioMenuItem rb = (RadioMenuItem) tgScena.getSelectedToggle();
        rs = queryTeller.oggettiInScena(Integer.parseInt(rb.getText()));
        refreshTable();
    }


}

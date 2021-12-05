package controllers;
import application.DBConnection;
import application.TellMe;
import javafx.beans.property.SimpleStringProperty;
import javafx.beans.value.ObservableValue;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.FXML;
import javafx.scene.control.Button;
import javafx.scene.control.ListView;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.input.MouseEvent;
import javafx.scene.layout.VBox;
import javafx.util.Callback;

import javax.xml.transform.Result;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

public class Visualization1Controller {

    @FXML
    private TableView tableView;

    @FXML
    private VBox vbox;

    @FXML
    private Button refreshButton;

    private ObservableList<ObservableList> data;
    private ResultSet rs;
    private TellMe tell;
    public void initialize(){
        tell = new TellMe();
        rs = tell.sponsors();
        data = FXCollections.observableArrayList();

        populateTable();
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

    public void refresh(){
        //rifare query al posto di tell.sponsors
        rs = tell.sponsors();

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
        refresh();
    }
}

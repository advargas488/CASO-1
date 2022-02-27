import java.sql.*;

public class Consulta1 extends Thread{
    private String Canton;
    private int i;
    public Consulta1(String Canton, int i){
        this.Canton = Canton;
        this.i = i+1;
    }

    public void run() {
        Connection connection = null;
        CallableStatement consult = null;
        try {
            connection = DriverManager.getConnection("jdbc:sqlserver://ADRIAN\\SERVIDORSQL;databaseName=Caso_1;integratedSecurity=true", "sa","sa");
            consult = connection.prepareCall("{CALL Consulta_1(?)}");
            consult.setString(1, Canton);
            ResultSet resultSet = consult.executeQuery();
//            while (resultSet.next()) {
//                System.out.println("Id partido: " + resultSet.getString("IdPartido") + " "
//                        + "Id accion:" + resultSet.getString("IdAction") + " "
//                        + "Id Canton: " + resultSet.getString("IdCanton") + " " +
//                        "Id plan: " + resultSet.getString("IdPlan") + " " +
//                        "Post time: " + resultSet.getString("PostTime") + "\n\n");
//            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                consult.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
//        System.out.println("Hilo: " + i);
    }
}

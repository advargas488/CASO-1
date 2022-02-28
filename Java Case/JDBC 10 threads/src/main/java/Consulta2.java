import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

public class Consulta2 extends Thread{//extends thread hace que esta clase sea un thread

    static Pool pool = null;
    private int i;
    public Consulta2(Pool pool, int i){
        this.pool = pool;
        this.i = i+1;
    }

    public void run() {
        ResultSet rs = null;

        Connection connection = null;
        try {
            //se llama una coneccion a la pool
            connection = pool.connection();
            rs = pool.SqlQuery("EXECUTE Consulta_2", connection);
//            while (rs.next()){
//                System.out.println("Canton: " + rs.getString("Nombre"));
//            }
            //se mata ese hilo para dar espacio al siguiente thread
            pool.disconnect(connection);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}

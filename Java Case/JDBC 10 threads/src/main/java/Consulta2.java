import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

public class Consulta2 extends Thread{

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
            connection = pool.connection();
            rs = pool.SqlQuery("EXECUTE Consulta_2", connection);
//            while (rs.next()){
//                System.out.println("Canton: " + rs.getString("Nombre"));
//            }
            pool.disconnect(connection);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        //System.out.println("Hilo consulta 2: " + i);
    }
}

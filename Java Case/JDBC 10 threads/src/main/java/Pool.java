import org.apache.commons.dbcp2.BasicDataSource;
import javax.sql.DataSource;
import java.sql.*;

public class Pool {

    private static String dbURL = "jdbc:sqlserver://ADRIAN\\SERVIDORSQL;databaseName=Caso_1;integratedSecurity=true";
    private String user;
    private String pass;
    BasicDataSource data = new BasicDataSource();

    public Pool(String user, String pass){
        this.user = user;
        this.pass = pass;
        data.setUrl(dbURL);
        data.setUsername(this.user);
        data.setPassword(this.pass);
        data.setInitialSize(2);
        data.setMaxTotal(5);
        data.setMaxIdle(5);
        data.setMinIdle(2);
    }

    public Connection connection() throws SQLException {
        return data.getConnection();
    }

    public void disconnect(Connection connection) throws SQLException {
        connection.close();
    }

    public void killPool() throws SQLException {
        data.close();
    }

    public ResultSet SqlQuery(String sql, Connection connection) throws SQLException {
        PreparedStatement statement = connection.prepareStatement(sql);
        ResultSet rs = statement.executeQuery();
        return rs;
    }
}

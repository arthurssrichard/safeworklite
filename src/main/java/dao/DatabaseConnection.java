package dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
	private static final String driver = "com.mysql.cj.jdbc.Driver";
    private static final String URL = "jdbc:mysql://Localhost:3306/safeworklite?useTimezone=true&serverTimezone=UTC&useUnicode=true&characterEncoding=utf8";
    private static final String USER = "labdatabase";
    private static final String PASSWORD = "lab@Database2022";
    
    public static Connection getConnection() {
        Connection con = null;
        try {
            Class.forName(driver);
            con = DriverManager.getConnection(URL, USER, PASSWORD);
            return con; 
        } catch (ClassNotFoundException e) {
            System.out.println("Driver não encontrado: " + e);
            return null;
        } catch (SQLException e) {
            System.out.println("Erro ao conectar ao banco de dados: " + e);
            return null;
        }
    }

}

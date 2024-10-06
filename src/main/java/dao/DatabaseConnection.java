package dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
	// lembrar de adicionar o driver amamanha
	private static final String driver = "com.mysql.cj.jdbc.Driver";
    private static final String URL = "jdbc:mysql://127.0.0.1:3306/safeworklite?useTimezone=true&serverTimezone=UTC";
    private static final String USER = "root";
    private static final String PASSWORD = "";
    
    public static Connection getConnection() {
        Connection con = null;
        try {
            Class.forName(driver);  // Adiciona esta linha
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

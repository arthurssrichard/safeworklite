package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import model.Cargo;

public class CargoDAO {
	/* CRUD CREATE */
	public void adicionar(Cargo tupla){  //REFATORADO OK
		String sql = "INSERT INTO Cargos (nome, descricao, ID_setor) VALUES (?,?, ?)";
		try {
			Connection con = DatabaseConnection.getConnection();
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1, tupla.getNome());
			pst.setString(2, tupla.getDescricao());
			pst.setInt(3, tupla.getSetor().getID());
			
			pst.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	}
	
	public static ArrayList<Cargo> listar(int id_setor){ // NAO PRECISA DE REFATORACAO
		ArrayList<Cargo> lista = new ArrayList<>();
		
		String sql = "SELECT ID, nome, descricao FROM Cargos WHERE ID_setor=?";
		try {
			Connection con = DatabaseConnection.getConnection();
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setInt(1, id_setor);
			// Executar a query
			ResultSet rs = pst.executeQuery();

			while(rs.next()) {
				//variaveis de apoio que recebem os dados do banco
				int id = rs.getInt(1);
				String nome = rs.getString(2);
				String descricao = rs.getString(3);
				// popular o arraylist
				lista.add(new Cargo(id,nome,descricao));
			}
			con.close();

		} catch (Exception e) {
			System.out.println(e);
		}
		
		return lista;
	}
	
	/* CRUD READ */
	public static Cargo find(int id){// NAO PRECISA DE REFATORACAO
		String sql = "SELECT nome, descricao FROM Cargos WHERE ID=?";
		
		Cargo cargo = null;
		try {
			Connection con = DatabaseConnection.getConnection();
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setInt(1, id);
			ResultSet rs = pst.executeQuery();
			

	        if (rs.next()) {
	            String nome = rs.getString(1);
	            String descricao = rs.getString(2);
	            
	            // Cria o objeto Cargo
	            cargo = new Cargo(id, nome, descricao);
	        }
			
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return cargo;
	}
	
	/* CRUD UPDATE */
	public static void atualizar(Cargo tupla) { // NAO PRECISA DE REFATORACAO
		String sql = "UPDATE cargos SET nome=?, descricao=? where id=?";
		try {
			Connection con = DatabaseConnection.getConnection();
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1, tupla.getNome());
			pst.setString(2, tupla.getDescricao());
			pst.setInt(3, tupla.getID());
			
			pst.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	}
	
	/* CRUD DELETE */
	public static void remove(int id) { // NAO PRECISA DE REFATORACAO
		String sql = "DELETE FROM Cargos WHERE ID = ?";
		try {
			Connection con = DatabaseConnection.getConnection();
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setInt(1, id);
			
			pst.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	}
	
	
}

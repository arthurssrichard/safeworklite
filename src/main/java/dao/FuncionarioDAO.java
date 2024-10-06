package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import model.Cargo;
import model.Funcionario;
import model.FuncionarioComCargo;

public class FuncionarioDAO {
	/* CRUD CREATE */
	public void adicionar(Funcionario tupla) {
		String sql = "INSERT INTO funcionarios (nome, data_matricula, ID_setor, ID_cargo) VALUES (?,?,?,?)";
		try {
			Connection con = DatabaseConnection.getConnection();
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1, tupla.getNome());
			pst.setString(2, tupla.getDataMatricula());
			pst.setInt(3, tupla.getID_setor());
			pst.setInt(4, tupla.getID_cargo());

			pst.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	public static ArrayList<FuncionarioComCargo> listar(int id_setor) {
		ArrayList<FuncionarioComCargo> lista = new ArrayList<>();

		String sql = "SELECT f.ID, f.nome, f.data_matricula, f.data_demissao, c.ID as cargo_id, c.nome as cargo_nome "
				+ "FROM funcionarios f " + "JOIN cargos c ON f.ID_cargo = c.ID " + "WHERE f.ID_setor=?";
		try {
			Connection con = DatabaseConnection.getConnection();
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setInt(1, id_setor);
			// Executar a query
			ResultSet rs = pst.executeQuery();

			while (rs.next()) {
				// variaveis de apoio que recebem os dados do banco
				int id = rs.getInt(1);
				String nome = rs.getString(2);
				String dataMatricula = rs.getString(3);
				String dataDemissao = rs.getString(4);
				int cargoId = rs.getInt(5);
				String cargoNome = rs.getString(6);
				// popular o arraylist
				lista.add(new FuncionarioComCargo(id, nome, dataMatricula, dataDemissao, cargoNome, cargoId));
			}
			con.close();

		} catch (Exception e) {
			System.out.println(e);
		}

		return lista;
	}

	/* CRUD UPDATE */
	public static void atualizar(Funcionario tupla) {
		String sql = "UPDATE funcionarios SET nome=?, data_matricula=?, ID_cargo=? where id=?";
		try {
			Connection con = DatabaseConnection.getConnection();
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1, tupla.getNome());
			pst.setString(2, tupla.getDataMatricula());
			pst.setInt(3, tupla.getID_cargo());
			pst.setInt(4, tupla.getID());
			
			pst.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	/* CRUD READ */
	public static Funcionario find(int id){
		String sql = "SELECT nome, data_matricula, data_demissao, ID_cargo, ID_setor FROM funcionarios WHERE ID=?";
		
		Funcionario funcionario = null;
		try {
			Connection con = DatabaseConnection.getConnection();
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setInt(1, id);
			ResultSet rs = pst.executeQuery();
			

	        if (rs.next()) {
	            String nome = rs.getString(1);
	            String dataMatricula = rs.getString(2);
	            String dataDemissao = rs.getString(3);
	            int ID_cargo = rs.getInt(4);
	            int ID_setor = rs.getInt(5);
	            
	            // Cria o objeto funcionario
	            funcionario = new Funcionario(id, nome, dataMatricula, dataDemissao, ID_cargo, ID_setor);
	        }
			
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return funcionario;
	}
	
	
	public static void remove(int id) {
		String sql = "DELETE FROM funcionarios WHERE ID = ?";
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

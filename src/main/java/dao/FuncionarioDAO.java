package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import model.Cargo;
import model.EmpresaSetor;
import model.Funcionario;
import model.FuncionarioComCargo;

public class FuncionarioDAO {
	/* CRUD CREATE */
	public static void adicionar(Funcionario tupla) {
		String sql = "INSERT INTO funcionarios (nome, data_matricula, ID_setor, ID_cargo) VALUES (?,?,?,?)";
		try {
			Connection con = DatabaseConnection.getConnection();
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1, tupla.getNome());
			pst.setString(2, tupla.getDataMatricula());
			pst.setInt(3, tupla.getSetor().getID());
			pst.setInt(4, tupla.getCargo().getID());

			pst.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	}



	/* CRUD UPDATE */
	public static void atualizar(Funcionario tupla) {
		String sql = "UPDATE funcionarios SET nome=?, data_matricula=?, data_demissao=?, ID_cargo=? where id=?";
		try {
			Connection con = DatabaseConnection.getConnection();
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1, tupla.getNome());
			pst.setString(2, tupla.getDataMatricula());
			pst.setString(3, tupla.getDataDemissao());
			pst.setInt(4, tupla.getCargo().getID());
			pst.setInt(5, tupla.getID());
			
			pst.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	/* CRUD READ */
	public static Funcionario find(int id){ // REFATORAR
		String sql = "SELECT f.nome, f.data_matricula, f.data_demissao, f.ID_setor, "
				+    "c.ID as cargo_id, c.nome as cargo_nome, c.descricao as cargo_descricao "
				+    "FROM funcionarios f JOIN cargos c ON f.ID_cargo = c.ID "
				+    "WHERE f.ID=?;";
		
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
	            int setor_id = rs.getInt(4);
	            int cargo_id = rs.getInt(5);
	            String cargo_nome = rs.getString(6);
	            String cargo_descricao = rs.getString(7);

	            
	            // Cria o objeto funcionario
	            Cargo cargo = new Cargo(cargo_id, cargo_nome, cargo_descricao);
	            EmpresaSetor setor = new EmpresaSetor();
	            setor.setID(setor_id);;
	            funcionario = new Funcionario(id, nome, dataMatricula, cargo, setor);
	            funcionario.setDataDemissao(dataDemissao);
	        }
			
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return funcionario;
	}
	// LISTAR
	public static ArrayList<FuncionarioComCargo> listar(int id_setor) {
		ArrayList<FuncionarioComCargo> lista = new ArrayList<>();

		String sql = "SELECT f.ID, f.nome, f.data_matricula, f.data_demissao, c.ID as cargo_id, c.nome as cargo_nome "
				+ "FROM funcionarios f " 
				+ "JOIN cargos c ON f.ID_cargo = c.ID " 
				+ "WHERE f.ID_setor=?";
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

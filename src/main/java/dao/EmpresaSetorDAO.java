package dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import model.EmpresaSetor;

public class EmpresaSetorDAO {
	/* CRUD CREATE */
	public void adicionar(EmpresaSetor tupla){
		String sql = "INSERT INTO empresas_setor (nome_empresa, nome_setor, senha) VALUES (?,?,?)";
		try {
			Connection con = DatabaseConnection.getConnection();
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1, tupla.getNome_empresa());
			pst.setString(2, tupla.getNome_setor());
			pst.setString(3, tupla.getSenha());
			
			pst.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	}
	
	public static int validate(String empresa, String password) {
		int status = -1;	
		String sql = "SELECT * FROM empresas_setor WHERE nome_empresa=? AND senha=?";
		
		try {
			Connection con = DatabaseConnection.getConnection();
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1, empresa);
			pst.setString(2, password);
			
			ResultSet result = pst.executeQuery();
			if(result.next()) {
				status = result.getInt(1);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
}

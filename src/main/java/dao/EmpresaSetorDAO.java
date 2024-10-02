package dao;
import java.sql.Connection;
import java.sql.PreparedStatement;

import model.EmpresaSetor;

public class EmpresaSetorDAO {
	/* CRUD CREATE */
	public void adicionar(EmpresaSetor tupla){
		String sql = "INSERT INTO Empresas_Setor (nome_empresa, nome_setor, senha) VALUES (?,?,?)";
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
}

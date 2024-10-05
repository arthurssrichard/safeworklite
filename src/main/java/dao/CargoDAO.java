package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import model.Cargo;

public class CargoDAO {
	/* CRUD CREATE */
	public void adicionar(Cargo tupla){
		String sql = "INSERT INTO Cargos (nome, descricao) VALUES (?,?)";
		try {
			Connection con = DatabaseConnection.getConnection();
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1, tupla.getNome());
			pst.setString(2, tupla.getDescricao());
			
			pst.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	}
}

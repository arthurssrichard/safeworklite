package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import model.Cargo;

public class CargoDAO {
	
	
	
	/**
	 * CRUD CREATE Adiciona um novo cargo à tabela 'Cargos' no banco de dados.
	 * 
	 * @param tupla - Objeto Cargo contendo as informações do cargo a ser
	 *              adicionado.
	 */
	public static void adicionar(Cargo tupla) {
		String sql = "INSERT INTO Cargos (nome, descricao, ID_setor) VALUES (?,?, ?)";
		try {
			Connection con = DatabaseConnection.getConnection();
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1, tupla.getNome());
			pst.setString(2, tupla.getDescricao());
			pst.setInt(3, tupla.getSetor().getID()); // Define o ID do setor correspondente

			pst.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	
	
	
	/**
	 * CRUD READ Retorna uma entidade 'Cargo' buscada por seu ID (PK).
	 * 
	 * @param id - ID do cargo a ser encontrado.
	 * @return Cargo - Retorna um objeto 'Cargo' com o nome e descrição encontrados,
	 *         ou null se não for encontrado.
	 */
	public static Cargo find(int id) {
		String sql = "SELECT nome, descricao FROM Cargos WHERE ID=?"; // Query SQL

		Cargo cargo = null;
		try {
			Connection con = DatabaseConnection.getConnection();
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setInt(1, id); // Substitui o primeiro '?' pelo valor do id
			ResultSet rs = pst.executeQuery();

			if (rs.next()) {
				// Resgata o nome e a descrição da consulta
				String nome = rs.getString(1);
				String descricao = rs.getString(2);

				// Cria o objeto Cargo com os valores retornados
				cargo = new Cargo(id, nome, descricao);
			}
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return cargo;
	}

	
	
	
    /**
     * CRUD READ
     * Retorna todas as entidades 'Cargo' cadastradas para um determinado setor.
     * 
     * @param id_setor - ID do setor cujos cargos serão listados.
     * @return ArrayList<Cargo> - Retorna uma lista de todos os cargos do setor, ou uma lista vazia se nenhum cargo for encontrado.
     */
    public static ArrayList<Cargo> listar(int id_setor){
        ArrayList<Cargo> lista = new ArrayList<>();
        
        String sql = "SELECT ID, nome, descricao FROM Cargos WHERE ID_setor=?"; // Query SQL
        try {
            Connection con = DatabaseConnection.getConnection();
            PreparedStatement pst = con.prepareStatement(sql);
            pst.setInt(1, id_setor);  // Substitui '?' pelo ID do setor
            ResultSet rs = pst.executeQuery();

            while(rs.next()) {
                // Recupera os valores da consulta e cria objetos 'Cargo'
                int id = rs.getInt(1);
                String nome = rs.getString(2);
                String descricao = rs.getString(3);
                
                // Adiciona o cargo à lista
                lista.add(new Cargo(id, nome, descricao));
            }
            con.close();

        } catch (Exception e) {
            System.out.println(e);
        }
        
        return lista;
    }

    
    
    
    /**
     * CRUD UPDATE
     * Atualiza as informações de um cargo no banco de dados com base no ID fornecido.
     * 
     * @param tupla - Objeto 'Cargo' contendo as informações atualizadas do cargo.
     */
    public static void atualizar(Cargo tupla) {
        String sql = "UPDATE cargos SET nome=?, descricao=? WHERE id=?";
        try {
            Connection con = DatabaseConnection.getConnection();
            PreparedStatement pst = con.prepareStatement(sql);
            pst.setString(1, tupla.getNome());     // Define o nome do cargo
            pst.setString(2, tupla.getDescricao());  // Define a descrição do cargo
            pst.setInt(3, tupla.getID());         // Define o ID do cargo que será atualizado
            
            pst.executeUpdate();
            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    
    
    
    /**
     * CRUD DELETE
     * Remove um cargo da tabela 'Cargos' com base no ID fornecido.
     * 
     * @param id - ID do cargo a ser removido.
     */
    public static void remove(int id) {
        String sql = "DELETE FROM Cargos WHERE ID = ?";
        try {
            Connection con = DatabaseConnection.getConnection();
            PreparedStatement pst = con.prepareStatement(sql);
            pst.setInt(1, id);  // Substitui '?' pelo ID do cargo a ser removido
            
            pst.executeUpdate();
            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

}

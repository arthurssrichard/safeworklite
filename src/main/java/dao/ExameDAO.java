package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import com.google.gson.Gson;

import model.Exame;

public class ExameDAO {
	
	
	
	/**
	 * CRUD CREATE Adiciona um novo exame à tabela 'exames' no banco de dados.
	 * 
	 * @param tupla - Objeto Exame contendo as informações do exame a ser
	 *              adicionado.
	 */
	public static void adicionar(Exame tupla) {
		String sql = "INSERT INTO exames (nome, descricao, admissao, demissao, retorno_ao_trabalho, vezes_por_ano, ID_setor, resultado_nome_dado, resultado_tipo_dado, resultado_numerico_esperado, resultado_booleano_esperado) VALUES (?,?,?,?,?,?,?,?,?,?,?)";
		
		//passando de boolean pra ENUM
		String admissao = tupla.isAdmissao() ? "S" : "N"; 
		String demissao = tupla.isDemissao() ? "S" : "N";
		String retornoAoTrabalho = tupla.isRetornoAoTrabalho() ? "S" : "N";
		
		//Resultados esperados
		String resultadoTipoDado = tupla.getResultadoTipoDado();
		String resultadoBooleanoEsperado = tupla.getResultadoBooleanoEsperado() ? "S" : "N";
		
		if(resultadoTipoDado.equals("numerico")) { // não deu pra setar boolean como null no java, então esse foi o jeito, caso o resultado_tipo_dado for numerico
			resultadoBooleanoEsperado = null;
		}
		
		//criando json a partir do vetor
		int resultadoNumericoEsperado[] = tupla.getResultadoNumericoEsperado();
		Gson gson = new Gson();
		String resultNumericoEsperado = gson.toJson(resultadoNumericoEsperado);
		
		try {
			Connection con = DatabaseConnection.getConnection();
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1, tupla.getNome());
			pst.setString(2, tupla.getDescricao());
			pst.setString(3, admissao);
			pst.setString(4, demissao);
			pst.setString(5, retornoAoTrabalho);
			pst.setInt(6, tupla.getVezesPorAno());
			pst.setInt(7, tupla.getIdSetor());
			
			// Resutados Esperados
			pst.setString(8, tupla.getResultadoNomeDado());
			pst.setString(9, resultadoTipoDado);
			pst.setString(10, resultNumericoEsperado); // precisa ser um json
			pst.setString(11, resultadoBooleanoEsperado);
			

			pst.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	}
	
	
	
	
	/**
	 * CRUD READ Retorna uma entidade 'Exame' buscada por seu ID (PK).
	 * 
	 * @param id - ID do exame a ser encontrado.
	 * @return Exame - Retorna um objeto 'Exame' com infos encontrados,
	 *         ou null se não for encontrado.
	 */
	public static Exame find(int id) {
		String sql = "SELECT ID, nome, descricao, admissao, demissao, retorno_ao_trabalho, vezes_por_ano, "
				+ "resultadoNomeDado, ID_setor, resultado_nome_dado, resultado_tipo_dado, resultado_numerico_esperado, "
				+ "resultado_booleano_esperado FROM exames WHERE ID=?";
		Exame exame = null;
		try {
			Connection con = DatabaseConnection.getConnection();
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setInt(1, id);
			ResultSet rs = pst.executeQuery();
			
			if(rs.next()) {
				String nome = rs.getString(2);
				String descricao = rs.getString(3);
				String admissao = rs.getString(4);
				String demissao = rs.getString(5);
				String retornoAoTrabalho = rs.getString(6);
				int vezesPorAno = rs.getInt(7);
				String resultadoNomeDado = rs.getString(8);
				int idSetor = rs.getInt(9);
				String resultadoTipoDado = rs.getString(10);
				String resultadoNumericoEsperadoJson = rs.getString(11);
				String resultadoBooleanoEsperado = rs.getString(12);
				
				
				// Tratando o resultado booleano
	            boolean resultBooleanoEsperado = "S".equals(resultadoBooleanoEsperado);
	            boolean admissaoBoolean = "S".equals(admissao);
	            boolean demissaoBoolean = "S".equals(demissao);
	            boolean retornoAoTrabalhoBoolean = "S".equals(retornoAoTrabalho);
	            
	            
	            // Decodificando o JSON para um vetor de inteiros
	            Gson gson = new Gson();
	            int[] resultadoNumericoEsperado = gson.fromJson(resultadoNumericoEsperadoJson, int[].class);
	            

				//int, string, string, boolean, boolean, boolean, int, string, string, int[], boolean
				exame = new Exame(id, 
								nome, 
								descricao,
								admissaoBoolean,
								demissaoBoolean,
								retornoAoTrabalhoBoolean,
								vezesPorAno,
								resultadoNomeDado,
								idSetor,
								resultadoTipoDado,
								resultadoNumericoEsperado,
								resultBooleanoEsperado);
			}
			
		} catch (Exception e) {
			System.out.println(e);
		}
		return exame;
	}
	
	
	
	
    /**
     * CRUD READ
     * Retorna todas as entidades 'Exame' cadastradas para um determinado setor.
     * 
     * @param id_setor - ID do setor cujos exames serão listados.
     * @return ArrayList<Exame> - Retorna uma lista de todos os exames do setor, ou uma lista vazia se nenhum exame for encontrado.
     */
    public static ArrayList<Exame> listar(int id_setor){
        ArrayList<Exame> lista = new ArrayList<>();
        String sql = ""; // Query SQL
        
        return lista;
    }
    
    
    
    
    /**
     * CRUD UPDATE
     * Atualiza as informações de um exame no banco de dados com base no ID fornecido.
     * 
     * @param tupla - Objeto 'Exame' contendo as informações atualizadas do exame.
     */
    public static void atualizar(Exame tupla) {
        String sql = "";
        
    }
    
    
    
    
    /**
     * CRUD DELETE
     * Remove um exame da tabela 'Exame' com base no ID fornecido.
     * 
     * @param id - ID do exame a ser removido.
     */
    public static void remove(int id) {
        String sql = "";
        
    }

}

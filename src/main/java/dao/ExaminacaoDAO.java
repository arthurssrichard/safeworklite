package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import model.Cargo;
import model.EmpresaSetor;
import model.Exame;
import model.Examinacao;
import model.Funcionario;

public class ExaminacaoDAO {
	
	/**
	 * CRUD CREATE Adiciona um novo exame à tabela 'exames' no banco de dados.
	 * 
	 * @param tupla - Objeto Exame contendo as informações do exame a ser
	 *              adicionado.
	 */
	public static void adicionar(Examinacao tupla) {
		String sql = "INSERT INTO examinacoes (ID_funcionario, ID_exame, data_realizada, tipo_dado, resultado_numerico, resultado_booleano) VALUES(?,?,?,?,?,?)";
		
		
		String tipoDado = tupla.getTipoDado();
		String resultadoBooleano = tupla.getResultadoBooleano() ? "S" : "N";
		
		if(tipoDado.equals("numerico")) { // não deu pra setar boolean como null no java, então esse foi o jeito, caso o tipo_dado for numerico
			resultadoBooleano = null;
		}
		
		
		try {
			Connection con = DatabaseConnection.getConnection();
			PreparedStatement pst = con.prepareStatement(sql);
			
			pst.setInt(1, tupla.getFuncionario().getID());  // FK ID FUNCIONARIO
			pst.setInt(2, tupla.getExame().getId());        // FK ID EXAME
			pst.setString(3, tupla.getDataRealizada());     // Data realizada
			pst.setString(4, tipoDado);                     // Tipo de dado ('numerico', 'booleano')
			pst.setDouble(5, tupla.getResultadoNumerico()); // resultado numerico (se for null a tabela permite
			pst.setString(6, resultadoBooleano);            // resultado booleano enum('S', 'N'), mas pode ser null (tratado na linha 21-25)
			

			pst.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	}
	
	
	/**
	 * CRUD READ Retorna uma entidade 'Examinacao' buscada por seu ID (PK).
	 * 
	 * @param id - ID da examinacao a ser encontrada.
	 * @return Exame - Retorna um objeto 'Examinacao' com infos encontrados, (do funcionario que fez, e de qual exame foi feito)
	 *         ou null se não for encontrado.
	 */
	public static Examinacao find(int id) {
		String sql = "SELECT exmc.ID,  exmc.data_realizada,  exmc.tipo_dado, exmc.resultado_numerico, exmc.resultado_booleano, "
				+ "f.nome  AS funcionario_nome,  f.data_matricula AS funcionario_data_matricula, f.ID AS funcionario_id,"
				+ "ex.ID, ex.nome AS exame_nome, ex.descricao AS exame_descricao, ex.resultado_nome_dado AS exame_nome_dado "
				+ "FROM examinacoes AS exmc "
				+ "JOIN funcionarios AS f ON exmc.ID_funcionario = f.ID "
				+ "JOIN exames AS ex ON exmc.ID_exame = ex.ID "
				+ "WHERE exmc.ID = ?;";
		Examinacao examinacao = null;
		
		try {
			Connection con = DatabaseConnection.getConnection();
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setInt(1, id);
			ResultSet rs = pst.executeQuery();
			
			// Colhe os resultados
	        if (rs.next()) {
	        	// Examinacao
	            int examinacaoId = rs.getInt(1);
	            String dataRealizada = rs.getString(2);
	            String tipoDado = rs.getString(3);
	            double resultadoNumerico = rs.getDouble(4);
	            String resultadoBooleano = rs.getString(5); 
	            
	            boolean resultBooleano = false;
	            if(tipoDado.equals("booleano")) { // converte de string (enum) para booleano
	            	if(resultadoBooleano.equals("S")) {
	            		resultBooleano = true;
	            	}else {
	            		resultBooleano = false;
	            	}
	            }
	            
	            
	            // Funcionario
	            String funcionarioNome = rs.getString(6);
	            int funcionarioId = rs.getInt(7);
	            String funcionarioDataMatricula = rs.getString(8);
	            Funcionario funcionario = new Funcionario(funcionarioId, funcionarioNome, funcionarioDataMatricula); // instancia 
	            
	            // Exame
	            int exameId = rs.getInt(9);
	            String exameNome = rs.getString(10);
	            String exameDescricao = rs.getString(11);
	            String exameNomeDado = rs.getString(12);
	            Exame exame = new Exame(exameId, exameNome, exameDescricao, exameNomeDado);
	            
	            // Cria o objeto examinacao
	            examinacao = new Examinacao(funcionario, exame, dataRealizada, tipoDado, resultadoNumerico, resultBooleano);
	            examinacao.setId(examinacaoId);
	        }
			
			con.close();
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return examinacao;
	}
	
	
}

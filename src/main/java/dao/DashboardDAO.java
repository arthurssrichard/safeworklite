package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import model.Funcionario;

public class DashboardDAO {

	/**
	 * Retorna a quantidade de exames inadequados para cada cargo em um determinado setor.
	 * 
	 * @param id_setor - ID do setor cujos exames serão analisados.
	 * @return Map<String, Integer> - Retorna uma lista com a quantidade de exames inadequados por cargo.
	 */
	public static List<Map<String, Object>> quantExamesInadequadosPorCargo(int id_setor) {
	    List<Map<String, Object>> lista = new ArrayList<>();

	    String sql = "SELECT cargos.nome AS cargo_nome, COUNT(exmc.ID) AS quantidade_inadequada "
	               + "FROM cargos "
	               + "JOIN funcionarios ON funcionarios.ID_cargo = cargos.ID "
	               + "JOIN examinacoes AS exmc ON exmc.ID_funcionario = funcionarios.ID "
	               + "JOIN exames AS ex ON ex.ID = exmc.ID_exame "
	               + "WHERE cargos.ID_setor = ? "
	               + "AND ( "
	               + "(ex.resultado_tipo_dado = 'numerico' "
	               + "AND (exmc.resultado_numerico < JSON_EXTRACT(ex.resultado_numerico_esperado, '$[0]') "
	               + "OR exmc.resultado_numerico > JSON_EXTRACT(ex.resultado_numerico_esperado, '$[1]'))) "
	               + "OR (ex.resultado_tipo_dado = 'booleano' "
	               + "AND exmc.resultado_booleano != ex.resultado_booleano_esperado) "
	               + ") "
	               + "GROUP BY cargos.nome;";

	    try {
	        Connection con = DatabaseConnection.getConnection();
	        PreparedStatement pst = con.prepareStatement(sql);
	        pst.setInt(1, id_setor);
	        ResultSet rs = pst.executeQuery();

	        while (rs.next()) {
	            Map<String, Object> map = new HashMap<>();
	            map.put("cargo", rs.getString(1));
	            map.put("quantidade_inadequada", rs.getInt(2));
	            lista.add(map);
	        }

	        con.close();

	    } catch (Exception e) {
	        System.out.println(e);
	    }

	    return lista;
	}

	
	public static List<Map<String, Object>> topFuncionariosForaDoPadrao(){
		List<Map<String, Object>> lista = new ArrayList<>();
		String sql = "SELECT "
		           + "funcionarios.nome AS funcionario_nome, funcionarios.ID AS funcionario_ID, funcionarios.data_matricula AS funcionario_data_matricula, "
		           + "COUNT(exmc.ID) AS exames_fora_padrao "
		           + "FROM funcionarios "
		           + "JOIN examinacoes AS exmc ON exmc.ID_funcionario = funcionarios.ID "
		           + "JOIN exames AS ex ON ex.ID = exmc.ID_exame "
		           + "WHERE (ex.resultado_tipo_dado = 'numerico' AND (exmc.resultado_numerico < JSON_EXTRACT(ex.resultado_numerico_esperado, '$[0]') "
		           + "OR exmc.resultado_numerico > JSON_EXTRACT(ex.resultado_numerico_esperado, '$[1]'))) "
		           + "OR (ex.resultado_tipo_dado = 'booleano' AND exmc.resultado_booleano != ex.resultado_booleano_esperado) "
		           + "GROUP BY funcionarios.nome, funcionarios.ID, funcionarios.data_matricula "
		           + "ORDER BY exames_fora_padrao DESC "
		           + "LIMIT 5;";

	    try {
	        Connection con = DatabaseConnection.getConnection();
	        PreparedStatement pst = con.prepareStatement(sql); 
	        ResultSet rs = pst.executeQuery();
	        
	        while (rs.next()) {	            
	            Map<String, Object> map = new HashMap<>();
	            
	            
	            String nome = rs.getString(1);
	            int id = rs.getInt(2);
	            String dataMatricula = rs.getString(3);
	            Funcionario funcionario = new Funcionario(id, nome, dataMatricula);
	            
	            
	            
	            map.put("funcionario", funcionario);
	            map.put("quantExamesForaDoPadrao", rs.getInt(4));
	            lista.add(map);
	        }
	        
	        con.close();
	        
	    } catch (Exception e) {
	        System.out.println(e);
	    }
	    
	    return lista;
	}
	
	public static Map<String, Integer> splash() {
	    
	    Map<String, Integer> contagemRegistros = new HashMap<>();
	    
	   
	    String sql = "SELECT 'empresas_setor' AS tabela, COUNT(*) AS total FROM empresas_setor "
	               + "UNION ALL "
	               + "SELECT 'cargos', COUNT(*) FROM cargos "
	               + "UNION ALL "
	               + "SELECT 'funcionarios', COUNT(*) FROM funcionarios "
	               + "UNION ALL "
	               + "SELECT 'exames', COUNT(*) FROM exames "
	               + "UNION ALL "
	               + "SELECT 'examinacoes', COUNT(*) FROM examinacoes";

	    try {
	       
	        Connection con = DatabaseConnection.getConnection();
	        PreparedStatement pst = con.prepareStatement(sql);
	        ResultSet rs = pst.executeQuery();
	        
	        while (rs.next()) {
	            String tabela = rs.getString("tabela");
	            int total = rs.getInt("total");
	            contagemRegistros.put(tabela, total);
	        }
  
	        con.close();
	    } catch (Exception e) {
	        System.out.println("Erro ao contar registros: " + e);
	    }
	    
	    return contagemRegistros;
	}


	
}

package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import model.Dashboard;

public class DashboardDAO {

	/**
	 * Retorna a quantidade de exames inadequados para cada cargo em um determinado setor.
	 * 
	 * @param id_setor - ID do setor cujos exames serão analisados.
	 * @return ArrayList<ExameDashboard> - Retorna uma lista com a quantidade de exames inadequados por cargo.
	 */
	public static Map<String, Integer> listarExamesInadequadosPorCargo(int id_setor) {
		Map<String, Integer> lista = new HashMap<>();
	    
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
	            String cargoNome = rs.getString(1);
	            int quantidadeInadequada = rs.getInt(2);
	            lista.put(cargoNome, quantidadeInadequada);
	        }
	        
	        con.close();
	        
	    } catch (Exception e) {
	        System.out.println(e);
	    }
	    
	    return lista;
	}
	
	public static List<Map <> > topFuncionariosForaDoPadrao(){
		ArrayList<Object> lista = new ArrayList<>();
	    String sql = "SELECT "
	    		+ "funcionarios.nome AS funcionario_nome, "
	    		+ "COUNT(exmc.ID) AS exames_fora_padrao "
	    		+ "FROM funcionarios "
	    		+ "JOIN examinacoes AS exmc ON exmc.ID_funcionario = funcionarios.ID "
	    		+ "JOIN exames AS ex ON ex.ID = exmc.ID_exame "
	    		+ "WHERE (ex.resultado_tipo_dado = 'numerico' AND (exmc.resultado_numerico < JSON_EXTRACT(ex.resultado_numerico_esperado, '$[0]')  "
	    		+ "OR exmc.resultado_numerico > JSON_EXTRACT(ex.resultado_numerico_esperado, '$[1]'))) "
	    		+ "OR (ex.resultado_tipo_dado = 'booleano' AND exmc.resultado_booleano != ex.resultado_booleano_esperado) "
	    		+ "GROUP BY funcionarios.nome "
	    		+ "ORDER BY exames_fora_padrao DESC"
	    		+ "LIMIT 5;";
	    try {
	        Connection con = DatabaseConnection.getConnection();
	        PreparedStatement pst = con.prepareStatement(sql); 
	        ResultSet rs = pst.executeQuery();
	        
	        while (rs.next()) {
	            String funcionarioNome = rs.getString(1);
	            int quantExaminacoesInadequadas = rs.getInt(2);
	            
	            lista.add(new Dashboard(cargoNome, quantidadeInadequada));
	        }
	        
	        con.close();
	        
	    } catch (Exception e) {
	        System.out.println(e);
	    }
	    
	    return lista;
	}

	
}

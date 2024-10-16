package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ExameDAO;
import model.Exame;


public class ExameController extends Controller{

	
	/* Método de levar para a view de lista de funcionários, passando um arraylist de objetos */
	public static void list(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		int id_setor = (int) session.getAttribute("id");

		// manda pra pagina da lista com os atributos
		RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
		rd.forward(request, response);
	}
	
	/* Método de levar para a view de lista de funcionários, passando um arraylist de objetos */
	public static void store(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// pega o id do setor
		HttpSession session = request.getSession();
		int id_setor = (int) session.getAttribute("id");
		
		
		/* Conteúdo base do exame */
		String nome = request.getParameter("nome");
		String descricao = request.getParameter("descricao");
		boolean demissao = request.getParameter("demissao") != null ? true : false; 
		boolean retornoAoTrabalho = request.getParameter("retorno-ao-trabalho") != null ? true : false; 
		boolean admissao = request.getParameter("admissao") != null ? true : false; 
		int qtdVezesPorAno = Integer.parseInt(request.getParameter("vezes-por-ano"));
		
		
		/* Resultado esperado */
		String nomeDoDado = request.getParameter("nome-dado");
		String tipoDado = request.getParameter("tipo-dado");
		
		int[] resultadoNumericoEsperado = null;
		boolean resultBoolEsperado = false;
		
		if(tipoDado.equals("numerico")) {
			// pega os dados numericos esperados
			int resultMinEsperado = Integer.parseInt(request.getParameter("result-min-esperado"));
			int resultMaxEsperado = Integer.parseInt(request.getParameter("result-max-esperado"));
			
			//converte pra vetor (posteriormente vai virar json). Vetor com o intervalo do valor numerico (ex, hemoglobina ENTRE 13 e 16, ambos no vetor)
			resultadoNumericoEsperado = new int[2];
			resultadoNumericoEsperado[0] = resultMinEsperado;
			resultadoNumericoEsperado[1] = resultMaxEsperado;
			
		}else if(tipoDado.equals("booleano")) {
			resultBoolEsperado = request.getParameter("resultado-booleano-esperado").equals("S") ? true : false; 
		}
		
		Exame exame = new Exame(id_setor, 
								nome, 
								descricao, 
								demissao, 
								admissao,
								retornoAoTrabalho, 
								qtdVezesPorAno, 
								nomeDoDado, 
								tipoDado, 
								resultadoNumericoEsperado, 
								resultBoolEsperado);
		ExameDAO.adicionar(exame);
		
		
		
		response.sendRedirect(request.getContextPath() + "/exame");
	}
}
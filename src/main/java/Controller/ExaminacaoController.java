package Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ExameDAO;
import dao.ExaminacaoDAO;
import dao.FuncionarioDAO;
import model.Exame;
import model.Examinacao;
import model.Funcionario;

public class ExaminacaoController extends Controller{
	
	
	
	public static void create(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// Usa getParameter para capturar o id da query string
		int idFuncionario = Integer.parseInt(request.getParameter("idFuncionario")); 
		Funcionario funcionario = FuncionarioDAO.find(idFuncionario);
		
		// Pega id do setor
		HttpSession session = request.getSession();
		int id_setor = (int) session.getAttribute("id");
		
		ArrayList<Exame> exames = ExameDAO.listar(id_setor); // exames disponiveis para serem feitos
		
		request.setAttribute("funcionario", funcionario);
		request.setAttribute("exames", exames);

		RequestDispatcher rd = request.getRequestDispatcher("cadastrar.jsp");
		rd.forward(request, response);
	}
	
	
	public static void list(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}
	
	
	public static void listFromFuncionario(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// Usa getParameter para capturar o id da query string
		int idFuncionario = Integer.parseInt(request.getParameter("id-funcionario")); 
		Funcionario funcionario = FuncionarioDAO.find(idFuncionario);
		
		ArrayList<Examinacao> lista = ExaminacaoDAO.listarFromFuncionario(idFuncionario);
		
		request.setAttribute("examinacoes", lista);
		RequestDispatcher rd = request.getRequestDispatcher("examinacoes.jsp");
		rd.forward(request, response);
	}
	
	
	public static void store(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int idFuncionario = Integer.parseInt(request.getParameter("id-funcionario")); // passado por input hidden
		Funcionario funcionario = new Funcionario(); funcionario.setID(idFuncionario);
		
		int idExame = Integer.parseInt(request.getParameter("exame"));
		Exame exame = new Exame(); exame.setId(idExame);
		
		String data = request.getParameter("data");
		String tipoDado = request.getParameter("resultado-tipo-dado"); // passado por input hidden
		int resultNumerico = 0;
		boolean resultBooleano = false;
		    if (tipoDado.equals("numerico")) {
		        resultNumerico = Integer.parseInt(request.getParameter("valorNumerico"));  // Certifique-se que o valor é numérico
		    } else if (tipoDado.equals("booleano")) {
		        resultBooleano = "S".equals(request.getParameter("resultadoBooleano"));
		    }


		Examinacao examinacao = new Examinacao(funcionario, exame, data, tipoDado, resultNumerico, resultBooleano);
		
		
		ExaminacaoDAO.adicionar(examinacao);
		
		response.sendRedirect(request.getContextPath() + "/examinacao");
	}
	
	public static void edit(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		
		int idExaminacao = Integer.parseInt(request.getParameter("id")); // passado por input hidden
		Examinacao examinacao = ExaminacaoDAO.find(idExaminacao);
		
		
		// Pega id do setor
		HttpSession session = request.getSession();
		int id_setor = (int) session.getAttribute("id");
		ArrayList<Exame> exames = ExameDAO.listar(id_setor); // exames disponiveis para serem feitos
		
		request.setAttribute("examinacao", examinacao);
		request.setAttribute("exames", exames);
		RequestDispatcher rd = request.getRequestDispatcher("edit.jsp"); // Manda os atributos e o usuário para a view de editar
		rd.forward(request, response);
	}
	
	public static void update(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {

	    // Recupera o ID da examinação e do funcionário a partir dos parâmetros ocultos
	    int idExaminacao = Integer.parseInt(request.getParameter("id-examinacao"));  // passado por input hidden
	    int idFuncionario = Integer.parseInt(request.getParameter("id-funcionario"));  // passado por input hidden
	    Funcionario funcionario = new Funcionario(); 
	    funcionario.setID(idFuncionario);

	    // Recupera o ID do exame selecionado e cria o objeto Exame
	    int idExame = Integer.parseInt(request.getParameter("exame")); 
	    Exame exame = new Exame(); 
	    exame.setId(idExame);

	    // Recupera a data da examinação
	    String data = request.getParameter("data");

	    // Recupera o tipo de dado e inicializa as variáveis de resultado
	    String tipoDado = request.getParameter("resultado-tipo-dado");
	    double resultadoNumerico = 0.0;
	    boolean resultadoBooleano = false;

	    // Verifica o tipo de dado e atribui o valor correto (numérico ou booleano)
	    if (tipoDado.equals("numerico")) {
	        resultadoNumerico = Double.parseDouble(request.getParameter("valorNumerico"));
	    } else if (tipoDado.equals("booleano")) {
	        resultadoBooleano = "S".equals(request.getParameter("resultadoBooleano"));
	    }

	    // Cria o objeto Examinacao com os dados recebidos
	    Examinacao examinacao = new Examinacao(funcionario, exame, data, tipoDado, resultadoNumerico, resultadoBooleano);
	    examinacao.setId(idExaminacao);  // Define o ID da examinação para realizar o update

	    // Atualiza a examinação no banco de dados
	    ExaminacaoDAO.atualizar(examinacao);

	    // Redireciona para a página de listagem de examinações
	    response.sendRedirect(request.getContextPath() + "/examinacoes?idFuncionario="+idFuncionario);
	}

	
	public static void delete(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
	    int id = Integer.parseInt(request.getParameter("id"));  // ID da examinação
	    int idFuncionario = Integer.parseInt(request.getParameter("idFuncionario"));  // ID do funcionário
	    
	    // Remove a examinação do banco de dados
	    ExaminacaoDAO.remove(id);

	    // Redireciona para a lista de examinações desse funcionário
	    response.sendRedirect(request.getContextPath() + "/funcionario/examinacoes?id-funcionario=" + idFuncionario);
	}

}

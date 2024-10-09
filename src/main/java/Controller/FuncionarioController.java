package Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CargoDAO;
import dao.FuncionarioDAO;
import model.Cargo;
import model.Funcionario;
import model.FuncionarioComCargo;

public class FuncionarioController extends Controller {

	
	public static void create(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		int id_setor = (int) session.getAttribute("id");

		ArrayList<Cargo> lista = CargoDAO.listar(id_setor);
		
		// manda pra pagina da lista com os atributos
		request.setAttribute("cargos", lista);
		RequestDispatcher rd = request.getRequestDispatcher("cadastrar.jsp");
		rd.forward(request, response);
	}
	
	public static void store(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException { // PRECISO REFATORAR
		
		HttpSession session = request.getSession();
		int id_setor = (int) session.getAttribute("id");

		FuncionarioDAO dao = new FuncionarioDAO();
		String nome = request.getParameter("nome");
		String dataMatricula = request.getParameter("data-matricula");
		int id_cargo = (int) Integer.parseInt(request.getParameter("id-cargo"));
		Funcionario funcionario = new Funcionario(nome, dataMatricula, cargo, id_setor);

		dao.adicionar(funcionario);
		response.sendRedirect(request.getContextPath() + "/funcionario");
	}
	
	public static void list(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		int id_setor = (int) session.getAttribute("id");

		CargoDAO.find(id_setor);
		ArrayList<FuncionarioComCargo> lista = FuncionarioDAO.listar(id_setor);


		//manda pra pagina da lista com os atributos
		request.setAttribute("funcionarios", lista);
		RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
		rd.forward(request, response);
	}
	
	public static void edit(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int id = Integer.parseInt(request.getParameter("id"));// Usa getParameter para capturar o id da query string
		
		HttpSession session = request.getSession();
		int id_setor = (int) session.getAttribute("id");
		ArrayList<Cargo> lista = CargoDAO.listar(id_setor);
		request.setAttribute("cargos", lista);
		
		Funcionario funcionario = FuncionarioDAO.find(id);
		request.setAttribute("funcionario", funcionario);

		RequestDispatcher rd = request.getRequestDispatcher("edit.jsp");
		rd.forward(request, response);
	}
	
	public static void update(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		int id_setor = (int) session.getAttribute("id");

		FuncionarioDAO dao = new FuncionarioDAO();
		int id = (int) Integer.parseInt(request.getParameter("id"));
		String nome = request.getParameter("nome");
		String dataMatricula = request.getParameter("data-matricula");
		int id_cargo = (int) Integer.parseInt(request.getParameter("id-cargo"));
		Funcionario funcionario = new Funcionario(nome, dataMatricula, id_cargo, id_setor); // LEMBRAR DE ADICIONAR DATA DE DEMISSAO
		funcionario.setID(id);

		dao.atualizar(funcionario);
		
		response.sendRedirect(request.getContextPath() + "/funcionario");
	}
	
	public static void delete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id")); // passado pelo input hidden
		FuncionarioDAO.remove(id);
		response.sendRedirect(request.getContextPath() + "/funcionario");
	}
}


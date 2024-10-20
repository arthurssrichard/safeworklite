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
import model.EmpresaSetor;
import model.Funcionario;

public class FuncionarioController extends Controller {

	/* Método de levar para a view de cadastro */
	public static void create(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		// Pega o setor setor pelo id salvo na seção
		HttpSession session = request.getSession();
		int id_setor = (int) session.getAttribute("id");

		// Gera uma lista de cargos
		ArrayList<Cargo> lista = CargoDAO.listar(id_setor); // o id setor é passado para retornar apenas os cargos cadastrados pela empresa/setor

		// manda pra pagina da lista com os atributos
		request.setAttribute("cargos", lista);
		RequestDispatcher rd = request.getRequestDispatcher("cadastrar.jsp");
		rd.forward(request, response);
	}

	/* Método que recebe os dados preenchidos no formulário e guarda no banco de dados */
	public static void store(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		// Caso um espertalhão vá no inspecionar e tire o "required" do input
		if(request.getParameter("nome") == "" || request.getParameter("data-matricula") == ""){
			response.sendRedirect(request.getContextPath() + "/funcionario");
			System.out.println("Erro store Funcionario: Dados não fornecidos corretamente");
			return;
		}

		// Monta atributo "setor" que o funcionario pertence
		HttpSession session = request.getSession();
		int id_setor = (int) session.getAttribute("id");
		EmpresaSetor setor = new EmpresaSetor();
		setor.setID(id_setor);

		// Monta atributo "cargo" que o funcionario pertence
		int id_cargo = (int) Integer.parseInt(request.getParameter("id-cargo"));
		Cargo cargo = new Cargo();
		cargo.setID(id_cargo);
		
		// Pega outros atributos do funcionario e monta ele
		String nome = request.getParameter("nome");
		String dataMatricula = request.getParameter("data-matricula");
		Funcionario funcionario = new Funcionario(nome, dataMatricula, cargo, setor);

		// Cadastra e redireciona para a lista de funcionários
		FuncionarioDAO.adicionar(funcionario);
		response.sendRedirect(request.getContextPath() + "/funcionario");
	}

	/* Método de levar para a view de lista de funcionários, passando um arraylist de objetos */
	public static void list(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		int id_setor = (int) session.getAttribute("id");

		CargoDAO.find(id_setor);
		ArrayList<Funcionario> lista = FuncionarioDAO.listar(id_setor);

		// manda pra pagina da lista com os atributos
		request.setAttribute("funcionarios", lista);
		RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
		rd.forward(request, response);
	}

	public static void edit(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
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
		request.setCharacterEncoding("UTF-8");
		
		// Monta atributo "setor" que o funcionario pertence
		HttpSession session = request.getSession();
		int id_setor = (int) session.getAttribute("id");
		EmpresaSetor setor = new EmpresaSetor();
		setor.setID(id_setor);

		// Monta atributo "cargo" que o funcionario pertence
		int id_cargo = (int) Integer.parseInt(request.getParameter("id-cargo"));
		Cargo cargo = new Cargo();
		cargo.setID(id_cargo);

		// Pega outros atributos do funcionario e monta ele
		int id = (int) Integer.parseInt(request.getParameter("id"));
		String nome = request.getParameter("nome");
		String dataMatricula = request.getParameter("data-matricula");
		String dataDemissao = request.getParameter("data-demissao");
		Funcionario funcionario = new Funcionario(id, nome, dataMatricula, cargo, setor);
		funcionario.setDataDemissao(dataDemissao);
		
		// Atualiza e redireciona para a lista de funcionários
		FuncionarioDAO.atualizar(funcionario);
		response.sendRedirect(request.getContextPath() + "/funcionario");
	}

	public static void delete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int id = Integer.parseInt(request.getParameter("id")); // passado pelo input hidden
		FuncionarioDAO.remove(id);
		response.sendRedirect(request.getContextPath() + "/funcionario");
	}
}

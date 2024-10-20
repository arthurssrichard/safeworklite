package Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CargoDAO;
import model.Cargo;
import model.EmpresaSetor;

public class CargoController extends Controller {

	
	
	/* Método que recebe os dados preenchidos no formulário e guarda no banco de dados */
	public static void store(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// Caso um espertalhão vá no inspecionar e tire o "required" do input
		if(request.getParameter("nome") == ""){
			response.sendRedirect(request.getContextPath() + "/cargo");
			System.out.println("Erro store Cargo: Dados não fornecidos corretamente");
			return;
		}
		// Monta o atributo "setor" do cargo
		HttpSession session = request.getSession();
		int id_setor = (int) session.getAttribute("id");
		EmpresaSetor setor = new EmpresaSetor();
		setor.setID(id_setor);

		// Pega outros atributos do cargo e monta ele
		String nome = request.getParameter("nome");
		String descricao = request.getParameter("descricao");
		Cargo cargo = new Cargo(nome, descricao, setor);

		// Cadastra no banco e manda o usuário pra pagina de lista
		CargoDAO.adicionar(cargo);
		response.sendRedirect(request.getContextPath() + "/cargo");
	}

	
	
	/* Método de levar para a view de lista de cergos, passando um arraylist de objetos */
	public static void list(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		int id_setor = (int) session.getAttribute("id");

		ArrayList<Cargo> lista = CargoDAO.listar(id_setor);

		// manda pra pagina da lista com os atributos
		request.setAttribute("cargos", lista);
		RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
		rd.forward(request, response);
	}

	
	
	/* Método de levar para a view de editar cargo, passando seus atributos para mostrar o usuário seu estado atual*/
	public static void edit(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int id = Integer.parseInt(request.getParameter("id")); // Usa getParameter para capturar o id da query string

		Cargo cargo = CargoDAO.find(id); //acha o cargo pelo seu id
		request.setAttribute("cargo", cargo);
		
		// Manda os atributos e o usuário para a view de editar
		RequestDispatcher rd = request.getRequestDispatcher("edit.jsp");
		rd.forward(request, response);
	}

	
	
	/* Método que recebe os dados preenchidos no formulário e atualiza no banco de dados */
	public static void update(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// Pega atributos do cargo e monta ele
		int id = Integer.parseInt(request.getParameter("id")); // passado pelo input hidden
		String nome = request.getParameter("nome");
		String descricao = request.getParameter("descricao");
		Cargo cargo = new Cargo(id, nome, descricao);

		// Atualiza no banco e manda o usuário pra pagina de lista
		CargoDAO.atualizar(cargo);
		response.sendRedirect(request.getContextPath() + "/cargo");
	}

	
	
	/* Método que deleta um cargo */
	public static void delete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int id = Integer.parseInt(request.getParameter("id")); 
		CargoDAO.remove(id);
		response.sendRedirect(request.getContextPath() + "/cargo"); // Manda para a página de lista
	}
}

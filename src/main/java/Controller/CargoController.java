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

	public static void store(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		int id_setor = (int) session.getAttribute("id");
		EmpresaSetor setor = new EmpresaSetor();
		setor.setID(id_setor);

		CargoDAO dao = new CargoDAO();
		String nome = request.getParameter("nome");
		String descricao = request.getParameter("descricao");
		
		Cargo cargo = new Cargo(nome, descricao, setor);

		dao.adicionar(cargo);
		response.sendRedirect(request.getContextPath() + "/cargo");
		// EmpresaSetor empresa = new EmpresaSetor(request.getParameter("nome-empresa"),
		// request.getParameter("nome-setor"), request.getParameter("senha"));
	}

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

	public static void edit(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int id = Integer.parseInt(request.getParameter("id")); // Usa getParameter para capturar o id da query string

		Cargo cargo = CargoDAO.find(id);
		request.setAttribute("cargo", cargo);

		RequestDispatcher rd = request.getRequestDispatcher("edit.jsp");
		rd.forward(request, response);
	}

	public static void update(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id")); // passado pelo input hidden
		String nome = request.getParameter("nome");
		String descricao = request.getParameter("descricao");
		Cargo cargo = new Cargo(id, nome, descricao);

		CargoDAO.atualizar(cargo);
		response.sendRedirect(request.getContextPath() + "/cargo");
	}

	public static void delete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id")); // passado pelo input hidden
		CargoDAO.remove(id);
		response.sendRedirect(request.getContextPath() + "/cargo");
	}
}

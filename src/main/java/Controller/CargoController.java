package Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CargoDAO;
import model.Cargo;
import model.EmpresaSetor;

public class CargoController extends Controller {

	public static void store(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		CargoDAO dao = new CargoDAO();
		String nome = request.getParameter("nome");
		String descricao = request.getParameter("descricao");
		Cargo cargo = new Cargo(nome, descricao);
		
		dao.adicionar(cargo);
		response.sendRedirect("index.jsp");
		//EmpresaSetor empresa = new EmpresaSetor(request.getParameter("nome-empresa"), request.getParameter("nome-setor"), request.getParameter("senha"));
	}
	
	
}

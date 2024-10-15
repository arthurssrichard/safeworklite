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
import model.FuncionarioComCargo;

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
		
		/*
		 * processar e salvar no banco
		 * */
		
		response.sendRedirect(request.getContextPath() + "/exame");
	}
}
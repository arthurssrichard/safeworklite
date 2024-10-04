package Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.EmpresaSetorDAO;
import model.EmpresaSetor;

public class EmpresaController {

	
	public static void inserirEmpresa(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		EmpresaSetorDAO dao = new EmpresaSetorDAO();
		EmpresaSetor empresa = new EmpresaSetor(request.getParameter("nome-empresa"), request.getParameter("nome-setor"), request.getParameter("senha"));
		
		dao.adicionar(empresa);
		response.sendRedirect("index.jsp");
	}
	
	public static void cadastrarEmpresa(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		response.sendRedirect("cadastrarEmpresa.jsp");
	}

}

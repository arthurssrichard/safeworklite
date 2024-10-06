package Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.EmpresaSetorDAO;
import model.EmpresaSetor;

public class Controller {

	public static void create(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
	    response.sendRedirect("cadastrar.jsp");
	}

}

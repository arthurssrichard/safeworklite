package Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.EmpresaSetorDAO;
import model.EmpresaSetor;

public class Controller {
	/* Método de levar para a view de cadastro, devido a todas as views de cadastro terem o mesmo nome, foi colocado como método na classe mãe.
	 * No entanto, alguns controllers filhos sobscreveram esse método, pois precisaram adicionar alguns parâmetros antes de retornar a view */
	public static void create(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
	    response.sendRedirect("cadastrar.jsp");
	}

}

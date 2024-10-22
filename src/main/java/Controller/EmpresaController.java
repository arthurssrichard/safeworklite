package Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.EmpresaSetorDAO;
import model.EmpresaSetor;

public class EmpresaController {

	public static void logar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String empresa_nome = request.getParameter("empresa");
		String password = request.getParameter("password");

		if (EmpresaSetorDAO.validate(empresa_nome, password) != -1) {
			HttpSession session = request.getSession();
			int id = EmpresaSetorDAO.validate(empresa_nome, password);
			session.setAttribute("id", id);
			session.setAttribute("nomeEmpresa", empresa_nome);

			System.out.printf("Tentativa de login: Sucesso: %s | %s \n", id, empresa_nome);

			response.sendRedirect("dashboard/"); // ajeitar onde vai ser essa home ai emm
		} else {
			// se der erro
			request.setAttribute("errorMessage", "Usuário ou senha inválidos");
			System.out.printf("Tentativa de login: falha: %s", empresa_nome);

			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
	}

	public static void iniciar(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
	    HttpSession session = request.getSession(false);
	    
	    if (session != null && session.getAttribute("id") != null) {
	        response.sendRedirect(request.getContextPath() + "/dashboard/");
	    } else {

	        response.sendRedirect(request.getContextPath() + "/login");
	    }
	}


	public static void create(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.sendRedirect("cadastrarEmpresa.jsp");
	}

	public static void store(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		EmpresaSetorDAO dao = new EmpresaSetorDAO();
		EmpresaSetor empresa = new EmpresaSetor(request.getParameter("nome-empresa"),
				request.getParameter("nome-setor"), request.getParameter("senha"));

		dao.adicionar(empresa);
		response.sendRedirect("index.jsp");
	}

}

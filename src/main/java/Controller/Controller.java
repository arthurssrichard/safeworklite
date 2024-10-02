package Controller;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.EmpresaSetorDAO;
import model.EmpresaSetor;
/**
 * Servlet implementation class Controller
 */
@WebServlet(urlPatterns = {"/Controller", "/main", "/cadastro","/insertEmpresa"})
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Controller() {
        super();
        // TODO Auto-generated constructor stub
    }
   
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */// TODO Auto-generated constructor stub
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		String action = request.getServletPath();
		System.out.println(action);
		if(action.equals("/Controller")) {
			PrintWriter out = response.getWriter();
			out.println("<div>Vtncgld</div>");
		}else if(action.equals("/main")) {
			PrintWriter out = response.getWriter();
			out.println("<div>main</div>");
		}else if(action.equals("/cadastro")) {
			response.sendRedirect("cadastrarEmpresa.jsp");
		}else if(action.equals("/insertEmpresa")) {
			inserirEmpresa(request,response);
		}else {
			response.sendRedirect("index.jsp");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	protected void inserirEmpresa(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		EmpresaSetorDAO dao = new EmpresaSetorDAO();
		EmpresaSetor empresa = new EmpresaSetor(request.getParameter("nome-empresa"), request.getParameter("nome-setor"), request.getParameter("senha"));
		
		dao.adicionar(empresa);
		response.sendRedirect("index");
	}

}

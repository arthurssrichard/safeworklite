package routes;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Controller.CargoController;
import Controller.EmpresaController;
import Controller.FuncionarioController;

@WebServlet(urlPatterns = {
		/* Login e autenticação */
		"/login",
		"/auth",
		
	    /* Empresa */
	    "/cadastro", 
	    "/insertEmpresa",
	    
	    /* Cargo */
	    "/cargo/", 
	    "/cargo/cadastrar", 
	    "/cargo/store",
	    "/cargo/edit",
	    "/cargo/update",
	    "/cargo/delete",
	    
	    /* Funcionario */
	    "/funcionario/",
	    "/funcionario/cadastrar", 
	    "/funcionario/store",
	    "/funcionario/edit",
	    "/funcionario/update",
	    "/funcionario/delete"
	})
	public class Routes extends HttpServlet {
	    private static final long serialVersionUID = 1L;
	       
	    public Routes() {
	        super();
	    }

	    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        String action = request.getServletPath();
	        System.out.println("GET: "+action);

	        /* ROTAS */
	        switch(action) {
            	case "/login":
	                response.sendRedirect("login.jsp");
	                break;
	        
	            case "/cadastro":
	                EmpresaController.create(request, response);
	                break;
	                
	            case "/cargo/":
	                CargoController.list(request, response);
	                break;
	                
	            case "/cargo/cadastrar":
	                CargoController.create(request, response);
	                break;
	                
	            case "/cargo/edit":
	                CargoController.edit(request, response);
	                break;
	                
	            case "/funcionario/":
	                FuncionarioController.list(request, response);
	                break;
	                
	            case "/funcionario/cadastrar":
	                FuncionarioController.create(request, response);
	                break;
	                
	            case "/funcionario/edit":
	                FuncionarioController.edit(request, response);
	                break;
	            	
	            default:
	                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Rota não encontrada");
	                break;
	        }
	    }

	    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        String action = request.getServletPath();
	        System.out.println("POST: "+action);

	        /* ROTAS */
	        switch(action) {
	        	case "/auth":
	                EmpresaController.logar(request, response);
	                break;
	        
	        	case "/insertEmpresa":
	                EmpresaController.store(request, response);
	                break;
	                
	            case "/cargo/store":
	                CargoController.store(request, response);
	                break;
	                
	            case "/cargo/update":
	                CargoController.update(request, response);
	                break;
	                
	            case "/cargo/delete":
	                CargoController.delete(request, response);
	                break;
	                
	            case "/funcionario/store":
	                FuncionarioController.store(request, response);
	                break;
	                
	            case "/funcionario/update":
	            	FuncionarioController.update(request, response);
	            	break;
	                
	            case "/funcionario/delete":
	                FuncionarioController.delete(request, response);
	                break;
	            	
	            default:
	                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Rota não encontrada");
	                break;
	        }
	    }
	}

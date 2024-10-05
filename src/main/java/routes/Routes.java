package routes;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Controller.*;

@WebServlet(urlPatterns = {
		"/login",
		"/auth",
	    /* Empresa Routes */
	    "/cadastro", 
	    "/insertEmpresa",
	    
	    /* Cargo Routes */
	    "/cargo/cadastrar", 
	    "/cargo/store",
	    
	    /* Funcionario Routes */
	    "/funcionario/cadastrar", 
	    "/funcionario/store",
	    
	    /* Risco Routes */
	    "/risco/cadastrar", 
	    "/risco/store",
	    
	    /* Risco Routes */
	    "/risco/agente/cadastrar", 
	    "/risco/agente/store"
	})
	public class Routes extends HttpServlet {
	    private static final long serialVersionUID = 1L;
	       
	    public Routes() {
	        super();
	    }

	    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        String action = request.getServletPath();
	        System.out.println(action);

	        /* ROTAS */
	        switch(action) {
            	case "/login":
	                response.sendRedirect("login.jsp");
	                break;
	        
	            case "/cadastro":
	                EmpresaController.create(request, response);
	                break;
	                
	            case "/cargo/cadastrar":
	                CargoController.create(request, response);
	                break;
	                
	            case "/funcionario/cadastrar":
	                FuncionarioController.create(request, response);
	                break;
	                
	            case "/risco/cadastrar":
	            	RiscoController.create(request, response);
	            	break;
	            	
	            default:
	                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Rota não encontrada");
	                break;
	        }
	    }

	    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        String action = request.getServletPath();
	        System.out.println(action);

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
	                
	                
	            case "/funcionario/store":
	                FuncionarioController.store(request, response);
	                break;
	                
            	
	            case "/risco/store":
	            	//RiscoController.store(request, response);
	            	break;
	            	
	            case "/risco/agente/store":
	            	// agente controller
	            	break;
	            	
	            default:
	                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Rota não encontrada");
	                break;
	        }
	    }
	}

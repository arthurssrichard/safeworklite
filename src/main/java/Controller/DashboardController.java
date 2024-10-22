package Controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import dao.DashboardDAO;

public class DashboardController {

	public static void show(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Pega o setor setor pelo id salvo na seção
		HttpSession session = request.getSession();
		int id_setor = (int) session.getAttribute("id");
		
		List<Map<String, Object>> topFuncionarios = DashboardDAO.topFuncionariosForaDoPadrao(id_setor);
		request.setAttribute("topFuncionarios", topFuncionarios);
		
		Map<String, Integer> splash = DashboardDAO.splash();
		request.setAttribute("splash", splash);
		
		RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
		rd.forward(request, response);
	}

	public static void quantExamesInadequadosCargo(HttpServletRequest request, HttpServletResponse response)
			throws IOException {

		// Pega o setor setor pelo id salvo na seção
		HttpSession session = request.getSession();
		int id_setor = (int) session.getAttribute("id");

		List<Map<String, Object>> dadosGrafico = DashboardDAO.quantExamesInadequadosPorCargo(id_setor);

		// Converte os dados para JSON
		Gson gson = new Gson();
		String json = gson.toJson(dadosGrafico);

		// Configura a resposta
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(json);
	}
}
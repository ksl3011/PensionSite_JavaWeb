package messenger;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(description = "메신저유저확인", urlPatterns = { "/messenger.do" })
public class MessengerController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MessengerController() {}

	protected void ServiceHandler(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String isAdmin = (String)request.getParameter("messengerAUX");
		request.setAttribute("isAdmin", isAdmin);
    	
    	RequestDispatcher dispatcher = request.getRequestDispatcher("/MessengerView/MessengerView.jsp");
    	dispatcher.forward(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ServiceHandler(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ServiceHandler(request, response);
	}

}

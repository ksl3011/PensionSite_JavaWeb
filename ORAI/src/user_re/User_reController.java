package user_re;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

/**
 * Servlet implementation class User_reController
 */
@WebServlet(urlPatterns = { "/user_re" })
public class User_reController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    final private Logger LOG = Logger.getLogger(User_reController.class);
    User_reService ser;
    
    public User_reController() {
    	ser = new User_reService();
    }

    protected void doUser_re(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		User_reVO invo = new User_reVO();
		invo.setRNAME(name);
		invo.setPHONE(phone);
		User_reVO outvo = (User_reVO)ser.do_selectOne_Condition(invo);
		
		//예약리스트 조회
		if(request.getParameter("what").equals("reference")){
			if(outvo != null){
				String roomInfo = ser.return_Info(outvo);
				request.setAttribute("name", name);
				request.setAttribute("phone", phone);
				request.setAttribute("info", roomInfo);
			}
			RequestDispatcher dispatcher = request.getRequestDispatcher("/User_reView/User_reView_result.jsp");
		    dispatcher.forward(request, response);
			
		  //예약취소
		}else if(request.getParameter("what").equals("cancel")){
			int flag = ser.do_delete(outvo);
			request.setAttribute("flag", flag);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/User_reView/CancelPage.jsp");
			dispatcher.forward(request, response);
		}
	}
    
	protected void doServiceHandler(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String where = request.getParameter("from");
		switch(where){
			case "user_re":
				doUser_re(request, response);
				break;
		}
		
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doServiceHandler(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

package sights;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RoominfoCtrl
 */
@WebServlet(description = "주변관광지", urlPatterns = { "/villa/sightsctrl.do" })
public class SightsCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
      SightsService service ;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SightsCtrl() {
       service=new SightsService();
        
    }

	/**jsp
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doServiceHandler(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { 
    	SightsVO inVO = new SightsVO();
		List<SightsVO>list= service.do_retrieve(inVO);
		
		//jsp에 던질 request 에 DB 에가져온 리스느 resultList 로 가져올수 있게 담기
		request.setAttribute("list", list);
		System.out.println(list.get(0).getLocation());
	
		//어느 jsp로 던질지 정하기
       RequestDispatcher dispatcher= request.getRequestDispatcher("/villa/sights.jsp");
       dispatcher.forward(request, response);
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doServiceHandler(request, response);
	
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doServiceHandler(request, response);
	}
	
	

}

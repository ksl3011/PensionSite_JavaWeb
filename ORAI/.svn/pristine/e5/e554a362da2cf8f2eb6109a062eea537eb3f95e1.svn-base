package roominfo_bk;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import cmn.DTO;
import cmn.StringUtil;

/**
 * Servlet implementation class RoominfoCtrl
 */
@WebServlet(description = "방정보", urlPatterns = { "/roominfoctrl/roominfoctrl.do" })
public class RoominfoCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
    RoominfoService service ;   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RoominfoCtrl() {
        service = new RoominfoService();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RoominfoVO inVO = new RoominfoVO();
		String rcode = StringUtil.nvl(request.getParameter("rcode"),"");
		inVO.setRcode(rcode);
		
		RoominfoVO outVO = (RoominfoVO) service.do_selectOne(inVO);
		
		ImgVO outVO2 =(ImgVO)service.do_Img(inVO);
		request.setAttribute("outVO2", outVO2);
		
		
		request.setAttribute("outVO", outVO);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/villa/roominfo.jsp");
		dispatcher.forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}



}

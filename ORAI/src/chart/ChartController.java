package chart;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonArray;

/**
 * Servlet implementation class Chart
 */
@WebServlet(description = "차트", urlPatterns = { "/Chart.json" })
public class ChartController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ChartService ser;
	
    public ChartController() {
    	ser = new ChartService();
    }
    
	protected void dochartHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String workDiv = request.getParameter("work_div");
		if(workDiv == null) workDiv = "";
		
		switch(workDiv){
		case "do_piechart":
			do_piechart(request,response);
			break;
		}

		
	}

	protected void do_piechart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PiechartVO invo = new PiechartVO();
		List<PiechartVO> list = ser.do_RoomChart(invo);

		Gson gson = new Gson();
    	response.setContentType("text/html; charset=UTF-8");
    	PrintWriter pw = response.getWriter();
    	String gsonString = "";
    	
    	JsonArray arr = new JsonArray();
    	for(int i=0 ; i<list.size() ; i++){
    		JsonArray sArr = new JsonArray();
    		sArr.add(list.get(i).getRoomName());
    		sArr.add(list.get(i).getTotal());
    		arr.add(sArr);
    	}
    	gsonString = arr.toString();
    	pw.print(gsonString);
		
	}

	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		dochartHandle(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		dochartHandle(request, response);
	}

}

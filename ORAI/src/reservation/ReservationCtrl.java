package reservation;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Locale;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.reflect.TypeToken;

import cmn.ConHandler;
import cmn.MessageVO;
import cmn.StringUtil;
import javafx.scene.input.DataFormat;
import pay.PayVO;
import roominfo_bk.RoominfoVO;



/**
 * Servlet implementation class ReservationCtrl
 */
@WebServlet(description = "예약", urlPatterns = { "/reservationctrl/reservationctrl.do","/reservationctrl/reservationctrl.json" })
public class ReservationCtrl extends HttpServlet implements ConHandler {
	private static final long serialVersionUID = 1L;
	
       ReservationService service;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReservationCtrl() {
        service=new ReservationService();
        // TODO Auto-generated constructor stub
    }
   




	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    public void do_nextpage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	LOG.debug("do_nextpage");
    	String UUID   =StringUtil.nvl(request.getParameter("jData"),"");
    	TempVO outVO =new TempVO();
    	outVO=this.service.do_temp_retrieve(UUID);
    	request.setAttribute("vo", outVO);
    	RequestDispatcher dispatcher =request.getRequestDispatcher("/villa/PayView.jsp");
    	dispatcher.forward(request, response);
    	
	}
    
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
    	doServiceHandler(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doServiceHandler(request, response);
	}
	 public void doServiceHandler(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 request.setCharacterEncoding("UTF-8");
	    	//work_div:read
	   String workDiv = StringUtil.nvl(request.getParameter("work_div"),"");
		 switch(workDiv){
 		 	   
			case "do_save_move":
				do_save_move(request,response);
			break;
		
 		case "do_insert":
 			do_insert(request,response);
 		break;
 		
 		case "do_update":
 			do_update(request,response);
 		break;  
 		
 		case "do_delete":
 			do_delete(request,response);
 		break;     
 		
 		case "do_selectone":
 			do_selectone(request,response);
 		break;  
 		
 		case "do_retrieve":
 			do_retrieve(request,response);
 		break;
 		case "do_nextpage":
 			do_nextpage(request,response);
 		break;   
 		
 		case "do_insert_temp":
 			do_insert_temp(request,response);
 		break;
 	}
		 
		 
		 

		 
	 }
	 @Override
		public void do_insert(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {
			
			ReservationVO rVO=new ReservationVO();
			PayVO payVO=new PayVO();
			
			Gson gson = new Gson();
		       String rv = request.getParameter("jrowData");
		       List<String> list =gson.fromJson(rv, new TypeToken<List<String>>(){}.getType());
		       LOG.debug("list:"+list);
		       String seq=Integer.toString(this.service.do_temp_seq());
		       String rcode =list.get(0);
		       int pnum =Integer.parseInt(list.get(1));
		       String today=(list.get(2));
		       int period=Integer.parseInt(list.get(3));
		       int pay=Integer.parseInt(list.get(4));
		       String icode=list.get(5);
		       String rname=list.get(6);
		       String phone=list.get(7);
		       DateFormat dateFormat =new SimpleDateFormat("yyyy-MM-dd");
		       Date date=null;
		       try {
				date=dateFormat.parse(today);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		     
		       Calendar cal =Calendar.getInstance();
		       cal.setTime(date);
		       cal.add(Calendar.DATE,period);
		       String edate = dateFormat.format(cal.getTime());
		       
		       
		       rVO.setNo(rcode+"-"+seq);
		       rVO.setRcode(rcode);
		       rVO.setPhone(phone);
		       rVO.setPnum(pnum);
		       rVO.setRname(rname);
		       rVO.setSdate(today);
		       rVO.setEdate(edate);
		       
		       
		       
		       
		       int flag= this.service.do_insert(rVO);
		       LOG.debug(flag);
		       payVO.setI_code(icode);
		       payVO.setNo(rcode+"-"+seq);
		       payVO.setPay(pay* period);
		       service.pay_insert(payVO);
		       service.do_resetTable();
		       response.setContentType("text/html;charset= utf-8");
		       PrintWriter out = response.getWriter();
		       String msg ="";
		       String gsonString ="";
		       if(flag>0){
		          msg= "예약이 완료 되엇습니다.";
		       }else{
		          msg="예약실패";
		       }
		       gsonString = gson.toJson(new MessageVO(String.valueOf(flag),msg));
		       LOG.debug("03.4 gsonString:"+gsonString);
		       out.print(gsonString);
		 
		 
		 
			
			 
			
		}
	 

	
	public void do_insert_temp(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		LOG.debug("do_insert_temp");
		TempVO inVO=new TempVO();
		Gson gson = new Gson();
	       String rv = request.getParameter("jrowData");
	       List<String> list =gson.fromJson(rv, new TypeToken<List<String>>(){}.getType());
	       LOG.debug("list:"+list);
	       
	       String room =list.get(0);
	       int period =Integer.parseInt(list.get(1));
	       int pnum=Integer.parseInt(list.get(2));
	       int pay=Integer.parseInt(list.get(3));
	       String icode=list.get(4);
	       String today=list.get(5);
	       String rcode=list.get(6);
	       String UUID=StringUtil.getUUID();
	       inVO.setUUID(UUID);
	       inVO.setROOM(room);
	       inVO.setPERIOD(period);
	       inVO.setPNUM(pnum);
	       inVO.setPAY(pay);
	       inVO.setICODE(icode);
	       inVO.setTODAY(today);
	       inVO.setRcode(rcode);
	       LOG.debug("03.2 param:"+inVO);
	       
	       int flag= this.service.do_insert_temp(inVO);
	       
	       
	      
	       response.setContentType("text/html;charset= utf-8");
	       PrintWriter out = response.getWriter();
	       
	       String gsonString = gson.toJson(UUID);
	       LOG.debug("03.4 gsonString:"+gsonString);
	       out.print(gsonString);
	      
		
	}

	@Override
	public void do_update(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void do_delete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void do_selectone(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void do_retrieve(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		 request.setCharacterEncoding("UTF-8");
		 String today = StringUtil.nvl(request.getParameter("today"),"");

		 List<ListVO> list= this.service.reservation_list(today);
		 
		 LOG.debug(list);
		
		
		
		 Gson gson = new Gson();
		 response.setContentType("text/html;charset=utf-8");
		 PrintWriter  out = response.getWriter();
		 String jsonPlace = gson.toJson(list);
		 LOG.debug(jsonPlace);
		 out.print(jsonPlace);

		
	     
	    
	    	
		
	}

	@Override
	public void do_save_move(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

}

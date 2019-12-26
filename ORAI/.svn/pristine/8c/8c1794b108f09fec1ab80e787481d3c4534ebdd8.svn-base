package admin_re;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.List;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import cmn.MessageVO;
import cmn.StringUtil;



/**
 * Servlet implementation class AdminReCtrl
 */
@WebServlet(description = "예약관리", urlPatterns = { "/villa/adminRe.do" })
public class AdminReCtrl extends HttpServlet {
   private static final long serialVersionUID = 1L;
   private AdminReService adminReService;
   private final Logger LOG = Logger.getLogger(AdminReDao.class);   
  
    public AdminReCtrl() {
       adminReService= new AdminReService();
    }

    protected void doServiceHandler(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       //기능 분기 
       LOG.debug("02 doServiceHandler()");
       //work div가 들어오면 분기해서 처리한다 
      
       //request null 처리 
       String workDiv = StringUtil.nvl(request.getParameter("work_div"),""); //request null 뜨면 ""으로 뜨도록 util로 묶어준다.
       LOG.debug("02.1 workDiv"+workDiv);
       
       //case로 분기 하기 
       /*do_retrieve : 목록
        *do_update: 수정
        */
       //workDiv로 구분한다.
       switch(workDiv){
         case "do_update": 
            //호출되는지 확인 
            do_update(request,response);
            break;

         case "do_retrieve": 
            //호출되는지 확인 
            do_retrieve(request,response);
            break;
          }
    }
     
    //수정
    private void do_update(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
       LOG.debug("03.1 do_update");   
       AdminReVO inVO = new AdminReVO();
       
       //param
       Gson gson = new Gson();
       String pay = request.getParameter("jrowData");
       List<String> list =gson.fromJson(pay, new TypeToken<List<String>>(){}.getType());
       LOG.debug("list:"+list);
       String payCode = list.get(0);
       String pState = list.get(1);
       LOG.debug("payCode:"+payCode);
       LOG.debug("pState:"+pState);

       inVO.setpState(pState);
       inVO.setPayCode(payCode);    
       LOG.debug("03.2 param:"+inVO);
       
       int flag= this.adminReService.do_update(inVO);
       LOG.debug("03.3 flag:"+flag);
       //--param
       
       //JSON으로 만든 것 받기 Gson
       response.setContentType("text/html;charset= utf-8");
       PrintWriter out = response.getWriter();
       
       String msg ="";
       String gsonString ="";
       if(flag>0){
          msg= "결제 상태를 수정하였습니다.";
       }else{
          msg="수정실패";
       }
       gsonString = gson.toJson(new MessageVO(String.valueOf(flag),msg));
       LOG.debug("03.4 gsonString:"+gsonString);
       out.print(gsonString);
    }
    
    //조회
    private void do_retrieve(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       request.setCharacterEncoding("UTF-8");
       LOG.debug("03.1 do_retrieve");
       AdminReVO inVO = new AdminReVO();
       //param
       String today =StringUtil.nvl(request.getParameter("today"), "");
       inVO.setDate(today);
       
       LOG.debug("03.2 param:"+inVO);
       
       List<AdminReVO> list= (List<AdminReVO>) adminReService.do_retrieve(inVO);
       
       //gson리스트로 만든 것을 보내주는 역할
       Gson gson = new Gson();
       response.setContentType("text/html;charset=utf-8"); 
       PrintWriter out = response.getWriter();
       String jsonPlace = gson.toJson(list);
        LOG.debug(jsonPlace);
        out.print(jsonPlace);
       
    }
    
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      LOG.debug("01 doGet()");
      LOG.debug("01.1 adminReService:"+adminReService);
      doServiceHandler(request,response);//doServiceHandler로 모아준다. 
   }

   
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      LOG.debug("01 doPost()");
      LOG.debug("01.1 noticeService:"+adminReService);
      doServiceHandler(request,response);   
   }

}
package notice1;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.text.html.HTMLDocument.HTMLReader.HiddenAction;

import org.apache.log4j.Logger;

import com.google.gson.Gson;
import cmn.MessageVO;
import cmn.SearchVO;
import cmn.StringUtil;

/**
 * Servlet implementation class NoticeCtrl
 */
@WebServlet(description = "공지사항 게시판", urlPatterns = { "/villa/notice.do" })
public class NoticeCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private NoticeService noticeService;
	private final Logger LOG = Logger.getLogger(NoticeDao.class);
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeCtrl() {
    	noticeService= new NoticeService();
    
    }
    //글쓰기 이동
    public void do_write_move(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	LOG.debug("02 do_write_move()");
    	
       	//화면제어: readonly
    	request.setAttribute("mode", "insert");
    	RequestDispatcher dispatcher = request.getRequestDispatcher("/villa/noticePost.jsp");
    	dispatcher.forward(request, response);
 
    }
    
    
    protected void doServiceHandler(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	//기능 분기 
    	LOG.debug("02 doServiceHandler()");
    	//work div가 들어오면 분기해서 처리한다 
    	request.setCharacterEncoding("UTF-8");
    	//request null 처리 
    	String workDiv = StringUtil.nvl(request.getParameter("work_div"),""); //request null 뜨면 ""으로 뜨도록 util로 묶어준다.
    	LOG.debug("02.1 workDiv"+workDiv);
    	
    	//case로 분기 하기 
    	/*do_retrieve : 목록
    	 *do_insert: 등록
    	 *do_update: 수정
    	 *do_selectone:단건조회
    	 *do_delete:삭제 
    	 */
    	//workDiv로 구분한다.
    	switch(workDiv){
    		case "do_write_move":
    			do_write_move(request,response);
    			break;
			case "do_insert": 
				//호출되는지 확인 
				do_insert(request,response);
				break;
			case "do_update": 
				//호출되는지 확인 
				do_update(request,response);
				break;
			case "do_delete": 
				//호출되는지 확인 
				do_delete(request,response);
				break;
			case "do_selectone": 
				//호출되는지 확인 
				do_selectone(request,response);
				break;
			case "do_retrieve": 
				//호출되는지 확인 
				do_retrieve(request,response);
				break;
	    	}
    }
    
    private void do_insert(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		LOG.debug("03.1 do_insert");
		NoticeVO inVO = new NoticeVO();
    	//param
		String seq= StringUtil.nvl(request.getParameter("seq"), "");
    	String title = StringUtil.nvl(request.getParameter("tname"),"");
        String readCnt = StringUtil.nvl(request.getParameter("read_cnt"),"");
        String contents = StringUtil.nvl(request.getParameter("contents"),"");
        String regId = StringUtil.nvl(request.getParameter("reg_id"),"admin");
        String regDt = StringUtil.nvl(request.getParameter("reg_dt"),"");
        inVO.setSeq(seq);
        inVO.setTitle(title);
        inVO.setRead_cnt(readCnt);
        inVO.setContents(contents);
        inVO.setReg_id(regId);
        inVO.setReg_dt(regDt);
    	LOG.debug("03.2 param:"+inVO);
   
    	int flag= this.noticeService.do_insert(inVO);
    	LOG.debug("03.3 flag:"+flag);
    	//--param
    	
    	Gson gson = new Gson();
    	response.setContentType("text/html;charset= utf-8");
    	PrintWriter out = response.getWriter();
    	
    	String msg ="";
    	String gsonString ="";
    	if(flag>0){
    		msg= "글을 등록하였습니다.";
    	}else{
    		msg="등록실패";
    	}
    	gsonString = gson.toJson(new MessageVO(String.valueOf(flag),msg));
    	LOG.debug("03.4 gsonString:"+gsonString);
    	out.print(gsonString);
    }
	

	private void do_update(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		LOG.debug("03.1 do_update");	
		NoticeVO inVO = new NoticeVO();
    	//param
		String seq= StringUtil.nvl(request.getParameter("seq"), "");
    	String title = StringUtil.nvl(request.getParameter("tname"),"");
        String readCnt = StringUtil.nvl(request.getParameter("read_cnt"),"");
        String contents = StringUtil.nvl(request.getParameter("contents"),"");
        String regId = StringUtil.nvl(request.getParameter("reg_id"),"admin");
        String regDt = StringUtil.nvl(request.getParameter("reg_dt"),"");
        inVO.setSeq(seq);
        inVO.setTitle(title);
        inVO.setRead_cnt(readCnt);
        inVO.setContents(contents);
        inVO.setReg_id(regId);
        inVO.setReg_dt(regDt);
    	LOG.debug("03.2 param:"+inVO);
    	
    	int flag= this.noticeService.do_update(inVO);
    	LOG.debug("03.3 flag:"+flag);
    	//--param
    	
    	Gson gson = new Gson();
    	response.setContentType("text/html;charset= utf-8");
    	PrintWriter out = response.getWriter();
    	
    	String msg ="";
    	String gsonString ="";
    	if(flag>0){
    		msg= "글을 수정하였습니다.";
    	}else{
    		msg="수정실패";
    	}
    	gsonString = gson.toJson(new MessageVO(String.valueOf(flag),msg));
    	LOG.debug("03.4 gsonString:"+gsonString);
    	out.print(gsonString);
	}

	private void do_delete(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		LOG.debug("03.1 do_delete");
		//service call 삭제
		NoticeVO inVO = new NoticeVO();
    	//param: seq
    	String seq = StringUtil.nvl(request.getParameter("seq"),""); //null처리 디폴트 값은 ""
    	inVO.setSeq(seq);
    	int flag= noticeService.do_delete(inVO);
    	LOG.debug("03.2 flag: "+flag);
    	//JSON
    	Gson gson = new Gson();
    	response.setContentType("text/html;charset=utf-8"); 
    	PrintWriter out = response.getWriter();
    	String msg = "";
    	String gsonString ="";
    	
    	//msgId=flag
    	//msgContents ='삭제되었습니다';
    	
    	//삭제되었습니다. 알림
    	if(flag>0){
    		msg="삭제되었습니다.";
    	}else{
    		msg="삭제 실패.";
    	}
    	gsonString=gson.toJson(new cmn.MessageVO(String.valueOf(flag),msg));
    	LOG.debug("03.3 gsonString: "+gsonString);
    	out.print(gsonString);
    	
	}
	
	private void do_selectone(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		LOG.debug("03.1 do_selectone");
		//param 세팅
		NoticeVO inVO = new NoticeVO();
		String seq= StringUtil.nvl(request.getParameter("seq"), "");
		// ip 찾는 것 request.getRemoteAddr('')
		String ip= StringUtil.nvl(request.getRemoteAddr(),"0.0.0.0");
		LOG.debug("03.2 ip:"+ip);
		HttpSession  session= request.getSession();
		//String userId = (String) session.getAttribute("user_id");
    	//String regId = StringUtil.nvl(userId,"admin");
    	
        inVO.setSeq(seq);
        inVO.setIp(ip);
        //TO_DO: session으로 변경 할것
    	//inVO.setReg_id(regId);
      
    	LOG.debug("03.2 inVO:"+inVO);
    	NoticeVO outVO =noticeService.do_selectOne(inVO);
    	LOG.debug("03.3 outVO:"+outVO);  	
    	request.setAttribute("vo",outVO);
    	
    	//화면제어 
    	request.setAttribute("mode", "udlate");
    	RequestDispatcher dispatcher = request.getRequestDispatcher("/villa/noticePost.jsp");
    	dispatcher.forward(request, response);
    	
	}
	
	private void do_retrieve(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		LOG.debug("03.1 do_retrieve");
        SearchVO inVO = new SearchVO();
        String pageNum = StringUtil.nvl(request.getParameter("page_num"),"1");
        String searchDiv = StringUtil.nvl(request.getParameter("search_div"),"");
        String searchWord = StringUtil.nvl(request.getParameter("search_word"),"");
        String pageSize = StringUtil.nvl(request.getParameter("page_size"),"10");
        inVO.setPageNum(Integer.parseInt(pageNum));
        inVO.setSearchDiv(searchDiv);
        inVO.setSearchWord(searchWord);
        inVO.setPageSize(Integer.parseInt(pageSize));
        
        LOG.debug("03.2 inVO:"+inVO);
        List<NoticeVO> list = noticeService.do_retrieve(inVO);
        LOG.debug("-----------------------");
        for(NoticeVO vo:list){
           LOG.debug(vo);
        }
        LOG.debug("-----------------------");
        int totalCnt =0; //초기화
        //총 글수
        if(null !=list &&list.size()>0){
        	NoticeVO totalVO = list.get(0);
    		totalCnt = totalVO.getTotal();
    	}
        request.setAttribute("totalCnt",totalCnt);
        
        request.setAttribute("list",list);
        request.setAttribute("paramVO", inVO);
        RequestDispatcher dispacher= request.getRequestDispatcher("/villa/noticeList.jsp");
        dispacher.forward(request, response);
	}
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		LOG.debug("01 doGet()");
		LOG.debug("01.1 noticeService:"+noticeService);
		doServiceHandler(request,response);//doServiceHandler로 모아준다. 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		LOG.debug("01 doPost()");
		LOG.debug("01.1 noticeService:"+noticeService);
		doServiceHandler(request,response);	
	}

}

package notice1;

import java.util.List;

import org.apache.log4j.Logger;

import cmn.SearchVO;

public class NoticeTest {
	

	private final Logger LOG = Logger.getLogger(NoticeTest.class);
	
	private NoticeVO vo01;
	private NoticeVO vo02;
	private NoticeVO vo03;
	
	private NoticeDao dao;
	
	public NoticeTest() {
		vo01= new NoticeVO("1","제목1","0","내용1","admin","","");
		vo02= new NoticeVO("2","제목2","0","내용2","admin","","");           
		vo03= new NoticeVO("3","제목3","0","내용3","admin","","");
		
		dao = new NoticeDao();
		
	}
	//단권조회
	public void do_selectOne(){
		vo01.setSeq("14");
		NoticeVO outVO = (NoticeVO)dao.do_selectOne(vo01);
		LOG.debug("=============================");
		LOG.debug("outVO:"+outVO);
		LOG.debug("=============================");
	}
	
	//삭제
	public void do_delete(){
		vo01.setSeq("8");
		int flag = dao.do_delete(vo01);
		LOG.debug("=============================");
		LOG.debug("flag:"+flag);
		LOG.debug("=============================");      
	}
	
	//추가
	public void do_insert(){
		int flag = dao.do_insert(vo02);
	}
	
	//수정
	public void do_update(){
		vo01.setSeq("11");
		vo01.setTitle("HR_U");
		vo01.setContents("HR_Contents_U");
		vo01.setReg_id("admin_U");
		int flag = dao.do_update(vo01);
	}
	//전체조회
	public void do_retrieve(){
		SearchVO searchVO  = new SearchVO();  
		searchVO.setPageSize(10);
		searchVO.setPageNum(1);
		
		List<NoticeVO> list = (List<NoticeVO>)dao.do_retrieve(searchVO);
		LOG.debug("==================");
		for(NoticeVO vo:list){
			LOG.debug("vo"+vo);
		}
		LOG.debug("=====================");
	}
	public static void main(String[] args) {
		NoticeTest noticeTest = new NoticeTest();
		//noticeTest.do_insert();
		//noticeTest.do_delete();
		noticeTest.do_update();
		//noticeTest.do_retrieve();
		//noticeTest.do_selectOne();
	}

}

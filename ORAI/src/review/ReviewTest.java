package review;

import java.util.List;

import org.apache.log4j.Logger;

import cmn.SearchVO;



public class ReviewTest {
private final Logger LOG = Logger.getLogger(ReviewTest.class);
	
	private ReviewVO vo01;
	private ReviewVO vo02;
	private ReviewVO vo03;
	
	private ReviewDao dao;
	
	public ReviewTest() {
		vo01 = new ReviewVO("1","no추가 컬럼1","3","집에가고싶다","jiyoon","","1432578","1024");
		vo02 = new ReviewVO("2","제목2","0","내용2","admin","","1432578","1024");
		vo03 = new ReviewVO("3","시간안에 끝낼 수 있을까","0","5일이 남았다","jiyoon","","100-100-102","1024");
		
		dao  = new ReviewDao();
	}
	public void do_selectOne(){
		vo03.setSeq("52");
		ReviewVO outVO=(ReviewVO) dao.do_selectOne(vo03);
		LOG.debug("======================");
		LOG.debug("outVO="+outVO);
		LOG.debug("======================");
	}

	public void do_delete(){
		vo03.setSeq("52");
		int flag = dao.do_delete(vo03);
		LOG.debug("======================");
		LOG.debug("flag="+flag);
		LOG.debug("======================");		
	}
	
	public void do_insert(){
		
		int flag = dao.do_insert(vo03);
		
	}
	
	public void do_update(){
		vo01.setSeq("82");
		vo01.setTitle("집에가고 싶다");
		vo01.setContents("HR_Contents_U");
		vo01.setReg_id("jiyoon");
		vo01.setNo("1354984254");
		vo01.setPasswd("1111");
		int flag = dao.do_update(vo01);
	}
	public void do_upsert(){
		//자기 db
		vo02.setSeq("12");
		vo02.setTitle("제목2_T");
		vo02.setContents("내용2_U");
		vo02.setReg_id("johanna_U");
		
		
	}
	public void do_retrieve() {
		SearchVO searchVO=new SearchVO();
		searchVO.setPageSize(10);
		searchVO.setPageNum(1);
		//searchVO.setSearchDiv("10");
		//searchVO.setSearchWord("제목1");

		List<ReviewVO> list = (List<ReviewVO>) dao.do_retrieve(searchVO);
		LOG.debug("===================");
		for(ReviewVO vo:list){
			LOG.debug("vo"+vo);	
		}
		
		LOG.debug("===================");		
	}
	public static void main(String[] args) {
		ReviewTest reviewTest = new ReviewTest();
	
		//reviewTest.do_insert();
		//reviewTest.do_delete();
		reviewTest.do_update();
		//reviewTest.do_retrieve();
		//reviewTest.do_selectOne();
	}
}

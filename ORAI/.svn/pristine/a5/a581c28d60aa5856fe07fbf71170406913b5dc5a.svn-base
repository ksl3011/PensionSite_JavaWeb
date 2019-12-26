package admin_re;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;


import cmn.SearchVO;


public class AdminReTest {
	
	private final Logger LOG =Logger.getLogger(AdminReTest.class);
	
	private AdminReVO adminRevo;
	private AdminReDao dao;
	
	public AdminReTest(){
		
		adminRevo = new AdminReVO("1001-101","java","김철수","010-222-3333",10,"19/07/20","19/07/23",100000,"","0","1001-101-100");
		dao=new AdminReDao();
	}
	//수정
		public void do_update(){
			adminRevo.setpState("1");
			adminRevo.setPayCode("1000");
			int flag = dao.do_update(adminRevo);
		}
	
	//한건조회
	public void do_selectOne(){
		adminRevo.setDate("19/06/30");
		AdminReVO outVO =(AdminReVO) dao.do_selectOne(adminRevo);
		LOG.debug("-------------");
		LOG.debug("3.outVO:"+outVO);
		LOG.debug("-------------");
		
		
	}
	//여러건조회
	public void do_retrieve(){
		adminRevo.setDate("2019-08-01");
		List<AdminReVO> list = (List<AdminReVO>) dao.do_retrieve(adminRevo);
		LOG.debug("==================");
		for(AdminReVO vo:list){
			LOG.debug("vo"+vo);
		}
		LOG.debug("=====================");
	}
	public static void main(String[] args) {
		AdminReTest adminretest=new AdminReTest();
		//adminretest.do_selectOne();
		//adminretest.do_retrieve();
		adminretest.do_update();
	}

}

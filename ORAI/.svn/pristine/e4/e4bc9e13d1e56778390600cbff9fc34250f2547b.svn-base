package sights;

import java.util.List;

import org.apache.log4j.Logger;


public class SightsTest {
	private final Logger LOG=Logger.getLogger(SightsTest.class);
	private SightsVO vo01;
	
	private SightsDAO dao;
	public SightsTest(){
		dao = new SightsDAO();
		vo01= new SightsVO("육담폭포","1001","강원도 속초시 설악동","",38.16432,128.501179,0,0);
	}
	public void do_retrieve(){
		vo01.setPen_code("1001");
		List<SightsVO> list=dao.do_retrieve(vo01);
		LOG.debug(list);
		
		
	}
	public static void main(String[] args) {
		SightsTest st = new SightsTest();
		
		st.do_retrieve();
		// 
	}
}

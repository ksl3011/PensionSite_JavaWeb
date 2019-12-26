package review;

import org.apache.log4j.Logger;

public class RoomTest {
	private final Logger LOG = Logger.getLogger(RoomTest.class);
	
	private RoomVO vo01;
	
	private RoomDao dao;
	
	public RoomTest(){
		vo01 = new RoomVO("java","1001-101-100");
		
		dao = new RoomDao();
	}
	public void do_selectOne(){
		vo01.setNo("1001-101-100");
		RoomVO outVO= (RoomVO)dao.do_selectOne(vo01);
		LOG.debug("======================");
		LOG.debug("outVO="+outVO);
		LOG.debug("======================");
	}
	public static void main(String[] args) {
		RoomTest roomTest = new RoomTest();
		roomTest.do_selectOne();
	}	
}

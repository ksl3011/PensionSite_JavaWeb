package reservation;

import java.util.List;
import java.util.Scanner;

import org.apache.log4j.Logger;

import roominfo_bk.RoominfoVO;









public class ReservationTest {
	private final Logger LOG=Logger.getLogger(ReservationTest.class);
	private ReservationVO VO01;
	private ReservationVO VO02;
	private String today;
	private ReservationDao dao;
	public ReservationTest() {
		VO01= new ReservationVO("1001-101-105", "1001-101","010-5641-1235",6,"김도연","19-07-30","","19-07-31");
		VO02= new ReservationVO("1001-101-104", "1001-102","010-5644-1235",6,"정준","2019-06-30","","19-07-01");
		
		dao=new ReservationDao();
	}
	public void do_insert(){
		dao.do_insert(VO02);
		
	}
	public void reservation_list(){
		today="2019-08-01";
		List<ListVO> list=dao.reservation_list(today);
		for(ListVO vo:list){
			LOG.debug("vo"+vo);	
		}
	
	}
	public void do_delete(){
		
		int flag=dao.do_delete(VO01);
		LOG.debug(flag);
	}

	public static void main(String[] args) {
		ReservationTest RC=new ReservationTest();
//		RC.do_insert();
		//RC.do_select_One();
//		RC.do_delete();
	
	
		
		
	}

}

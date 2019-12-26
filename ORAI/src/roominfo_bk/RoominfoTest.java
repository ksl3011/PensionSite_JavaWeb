package roominfo_bk;

import java.util.List;
import java.util.Scanner;

import org.apache.log4j.Logger;

import sights.SightsVO;





public class RoominfoTest {
	private static final Logger LOG=Logger.getLogger(RoominfoTest.class);
	private static RoominfoVO vo01;
	private static ImgVO vo02;
	private RoominfoDao dao;
	
	
	public RoominfoTest(){
		
	dao=new RoominfoDao();	
	}
	public void select_one(){
		RoominfoVO outVO=(RoominfoVO) dao.do_selectOne(vo01);
		LOG.debug(outVO);
	}
	public void do_retrieve(){
		vo02.setRcode("1001-101");
		List<ImgVO> list=(List<ImgVO>) dao.do_retrieve(vo02);
		LOG.debug(list);
	}
	
	
	public static void main(String[] args) {
		RoominfoTest RIC=new RoominfoTest();
		
		while(true){
					Scanner sc=new Scanner(System.in);
					LOG.debug("RCODE를 입력하세요:\n");
					String input=sc.nextLine();
					vo01=new RoominfoVO(input, null, 0, 0, 0, null, null, null, 0, 0, 0,null);
					vo02=new ImgVO(null, null, null, null, null, null, null);
					//RIC.select_one();
					RIC.do_retrieve();
		}
		

	}
}

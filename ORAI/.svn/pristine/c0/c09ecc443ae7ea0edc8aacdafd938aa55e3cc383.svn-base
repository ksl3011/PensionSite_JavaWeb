package pay;

import java.util.Scanner;

import org.apache.log4j.Logger;



public class PayTest {
	private final Logger LOG=Logger.getLogger(PayTest.class);
	private PayVO vo01;
	private PayVO vo02;
	private PayDao dao;
	public PayTest() {
		vo01=new PayVO("1004","100", "1001-101-100", 300000, 0, "19/02/11");
		vo02=new PayVO("1001","199", "1001-101-100", 300000, 0, "19/02/11");
		dao=new PayDao();
	}
	public void do_insert(){
		dao.do_insert(vo01);
		
	}
	public void do_delete(){
		int flag=dao.do_delete(vo01);
		LOG.debug(flag);
	}
	public static void main(String[] args) {
		PayTest PC=new PayTest();
//		PC.do_insert();
	//	PC.do_delete();
		int input=0;
	
		
		while(true){
			Scanner sc=new Scanner(System.in);
			System.out.println("command를 입력하시오:\n");
			input=sc.nextInt();
			
			if(input==1){
				PC.do_insert();
				
			}
			else if(input==2){
				PC.do_insert();
				PC.do_delete();
			}
			else if(input==3) {
				break;
			}
			else{
				System.out.println("command를 확인하세요");
				continue;
			}
		}
		
	}


}

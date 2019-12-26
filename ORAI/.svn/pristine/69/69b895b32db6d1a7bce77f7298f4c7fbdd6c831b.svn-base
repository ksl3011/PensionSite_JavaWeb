package admin;

import org.apache.log4j.Logger;

	public class AdminTest {
		private final Logger LOG = Logger.getLogger(AdminTest.class);
			
			private AdminVO vo01;
			private AdminDao dao;
			
			public AdminTest() {
				vo01 = new AdminVO("Admin","1024");
				
				dao  = new AdminDao();
			}
			public void do_selectOne(){
				vo01.setAdmin("Admin");
				AdminVO outVO=(AdminVO) dao.do_selectOne(vo01);
				LOG.debug("======================");
				LOG.debug("outVO="+outVO);
				LOG.debug("======================");
			}
		
			public static void main(String[] args) {
				AdminTest adminTest = new AdminTest();
				//reviewTest.do_insert();
				//reviewTest.do_delete();
				//reviewTest.do_update();
				//adiminTest.do_retrieve();
				adminTest.do_selectOne();
			
			}
}

/**
 * @Class Name : ConnectionMaker.java
 * @Description : 
 * @Modification Information
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2019. 6. 25.           최초생성
 *
 * @author 개발프레임웍크 실행환경 개발팀
 * @since 2019. 6. 25. 
 * @version 1.0
 * @see
 *
 *  Copyright (C) by H.R. KIM All right reserved.
 */
 
package cmn;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import org.apache.log4j.Logger;

/**
 * @author sist
 *
 */
public class ConnectionMaker {
	private final Logger LOG=Logger.getLogger(ConnectionMaker.class);
	public Connection getConnection(){
		String dbUrl="jdbc:oracle:thin:@211.238.142.124:1521:orcl";
		String dbUser="ORAI";
		String dbPasswd="ORAI1024";
		Connection conn=null;
		try {
			//jdbc 드라이버 로딩.
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			LOG.debug("-----------------");
			LOG.debug("ClassNotFoundException"+e.getMessage());
			LOG.debug("-----------------");
		}
		LOG.debug("1.jdbc 드라이버 로딩");
		try {
			conn=DriverManager.getConnection(dbUrl,dbUser,dbPasswd);
		} catch (SQLException e) {
			LOG.debug("-----------------");
			LOG.debug("SQLException"+e.getMessage());
			LOG.debug("-----------------");
		}
		LOG.debug("2.데이터베이스 커넥션 생성"+conn);
		return conn;
	}
}

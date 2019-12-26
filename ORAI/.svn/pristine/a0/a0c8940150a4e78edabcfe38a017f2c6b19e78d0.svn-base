/**
 * @Class Name : JDBCReturnReso.java
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
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.log4j.Logger;

/**
 * @author sist
 *
 */
public class JDBCReturnReso {

	private static Logger LOG=Logger.getLogger(JDBCReturnReso.class);
	
	public static void close(ResultSet rs){
		try {
			if(null !=rs){
				rs.close();
				}
		} catch (Exception e) {
			LOG.debug("-----------------");
			LOG.debug("ResultSet"+e.getMessage());
			LOG.debug("-----------------");
		}
	}
	public static void close(PreparedStatement pstmt){
		try {
			if(null !=pstmt){
			pstmt.close();
			}
		} catch (SQLException e) {
			LOG.debug("-----------------");
			LOG.debug("PreparedStatement"+e.getMessage());
			LOG.debug("-----------------");
		}
	}
	public static void close(Connection conn){
		try {
			if(null !=conn){
			conn.close();
			}
		} catch (SQLException e) {
			LOG.debug("-----------------");
			LOG.debug("Connection"+e.getMessage());
			LOG.debug("-----------------");
		}
	}
}

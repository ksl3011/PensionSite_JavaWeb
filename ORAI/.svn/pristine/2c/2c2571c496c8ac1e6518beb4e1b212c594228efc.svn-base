/**
 * @Class Name : ConHandler.java
 * @Description : 
 * @Modification Information
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2019. 7. 24.           최초생성
 *
 * @author 개발프레임웍크 실행환경 개발팀
 * @since 2019. 7. 24. 
 * @version 1.0
 * @see
 *
 *  Copyright (C) by H.R. KIM All right reserved.
 */
 
package cmn;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;



/**
 * @author SIST
 *
 */
public interface ConHandler {
	Logger LOG=Logger.getLogger(ConHandler.class);
	public void doServiceHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException;
	public void do_insert(HttpServletRequest request, HttpServletResponse response)	 throws ServletException, IOException;
		    
	public void do_update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
	
	public void do_delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
	
	public void do_selectone(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
	
	public void do_retrieve(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
	
	public void do_save_move(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
		        
}

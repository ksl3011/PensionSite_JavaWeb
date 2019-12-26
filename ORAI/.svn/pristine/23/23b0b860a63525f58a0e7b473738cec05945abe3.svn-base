/**
 * @Class Name : Hello.java
 * @Description : Hello
 * @Modification Information
 * @
 * @  ������      ������              ��������
 * @ ---------   ---------   -------------------------------
 * @ 2018.07.02           ���ʻ���
 *
 * @author ���������ӿ�ũ ����ȯ�� ������
 * @since 2018.07.10 
 * @version 1.0
 * @see
 *
 *  Copyright (C) by H.R. KIM All right rechart
 */

package chart;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;

import cmn.ConnectionMaker;
import cmn.DTO;
import cmn.JDBCReturnReso;
import cmn.WorkDiv;

/**
 * @author sist
 *
 */
public class ChartDAO implements WorkDiv{
	final private Logger LOG = Logger.getLogger(ChartDAO.class);
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public ChartDAO(){
	}
	
	public List<PiechartVO> do_RoomChart(DTO invo){
		PiechartVO vo = (PiechartVO)invo;
		List<PiechartVO> list = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			conn = new ConnectionMaker().getConnection();
			
			LOG.debug("conn:"+conn);
			
			StringBuilder sb = new StringBuilder();
			sb.append("SELECT COUNT(*) TOTAL,                           \n");
			sb.append("    b.room ROOMNAME                             \n");
			sb.append("FROM reservation a JOIN room b                   \n");
			sb.append("ON a.RCODE = b.RCODE                             \n");
			sb.append("GROUP BY b.room                                  \n");
			
			LOG.debug("sql:"+sb.toString());
			
			pstmt = conn.prepareStatement(sb.toString());
			
			rs = pstmt.executeQuery();
			while(rs.next()){
				vo = new PiechartVO();
				vo.setTotal(rs.getInt("TOTAL"));
				vo.setRoomName(rs.getString("ROOMNAME"));			
				list.add(vo);
			}	
		} catch(SQLException e){
			e.printStackTrace();
		}finally{
			JDBCReturnReso.close(rs);
			JDBCReturnReso.close(pstmt);
			JDBCReturnReso.close(conn);
		}

		return list;
	}

	@Override
	public int do_insert(DTO dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int do_update(DTO dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int do_delete(DTO dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public DTO do_selectOne(DTO dto) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<?> do_retrieve(DTO dto) {
		// TODO Auto-generated method stub
		return null;
	}

}

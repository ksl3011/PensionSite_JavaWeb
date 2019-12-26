package review;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.apache.log4j.Logger;

import cmn.ConnectionMaker;
import cmn.DTO;
import cmn.JDBCReturnReso;
import cmn.WorkDiv;

public class RoomDao implements WorkDiv {
	private final Logger LOG = Logger.getLogger(RoomDao.class);
	private ConnectionMaker  connectionMaker;
	
	public RoomDao() {
		connectionMaker = new ConnectionMaker();
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
	public RoomVO do_selectOne(DTO dto) {
		RoomVO vo = (RoomVO) dto;
		RoomVO outVO = null;
		Connection conn = null;
		PreparedStatement pstmt= null;
		ResultSet rs = null;
		
			try{
			StringBuilder sb=new StringBuilder();
			sb.append(" SELECT b.room, 						\n");
			sb.append(" 	   c.no 						\n");
			sb.append(" FROM reservation a JOIN room b      \n");
			sb.append(" ON a.rcode = b.rcode                \n");
			sb.append(" JOIN board2 c                       \n");
			sb.append(" ON c.no = a.no                      \n");
			sb.append(" WHERE c.no = ?    					\n");
			
			conn = connectionMaker.getConnection();
			LOG.debug("1.============================");
			LOG.debug("1.query: \n"+sb.toString());
			LOG.debug("1.============================");
			
			pstmt = conn.prepareStatement(sb.toString());
			//query param
			pstmt.setString(1, vo.getNo());
			LOG.debug("2.============================");
			LOG.debug("2.param no="+vo.getNo());
			LOG.debug("2.============================");			
			
			rs = pstmt.executeQuery();
			if(rs.next()){
				outVO = new RoomVO();
				outVO.setRoom(rs.getString("room"));
				outVO.setNo(rs.getString("no"));
			}
		}catch(SQLException e){
			LOG.debug("===================");
			LOG.debug("SQLException="+e.getMessage());
			LOG.debug("===================");
		}finally{
			JDBCReturnReso.close(rs);
			JDBCReturnReso.close(pstmt);
			JDBCReturnReso.close(conn);
		}
		return outVO;
	}
		

	@Override
	public List<?> do_retrieve(DTO dto) {
		// TODO Auto-generated method stub
		return null;
	}
}

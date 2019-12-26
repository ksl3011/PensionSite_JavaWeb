package admin_re;

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
import cmn.SearchVO;
import cmn.WorkDiv;
import notice1.NoticeVO;

public class AdminReDao implements WorkDiv {
	private final Logger LOG = Logger.getLogger(AdminReDao.class);
	private ConnectionMaker connectionMaker;
	public AdminReDao() {
		connectionMaker = new ConnectionMaker();
	}
	//필요한 기능: 예약 조회

	public DTO do_selectOne(DTO dto) {
		// 하나만 조회
		AdminReVO vo= (AdminReVO) dto;
		AdminReVO outVO = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs= null;
		
		try{
			StringBuilder sb= new StringBuilder();
			sb.append(" SELECT b.rcode                                         	 								 \n");
			sb.append("       ,b.room                                                                            \n");
			sb.append("       ,a.rname                                       		                             \n");
			sb.append("       ,a.phone                                         	                                 \n");
			sb.append("       ,a.pnum                                          	                                 \n");
			sb.append("       ,a.sdate  								  			                             \n");
			sb.append(" 	   ,a.edate												                             \n");
			sb.append("       ,c.weekday                                                                         \n");
			sb.append("       ,d.pay                                                                             \n");
			sb.append("       ,d.p_state                                                                             \n");
			sb.append(" FROM reservation a JOIN room b                                                           \n");
			sb.append(" ON a.rcode = b.rcode                                                                     \n");
			sb.append(" JOIN item c                                                                              \n");
			sb.append(" ON b.pen_code = c.pen_code                                                               \n");
			sb.append(" JOIN payment d                                                                           \n");
			sb.append(" ON d.no = a.no                                                                           \n");
			sb.append(" where TO_DATE(?,'YYYY-MM-DD')BETWEEN TO_DATE(a.sdate) AND TO_DATE(a.edate)               \n");
			
			//커넥션 만들기
			conn= connectionMaker.getConnection();
			LOG.debug("1.==========================");
			LOG.debug("1.query:\n"+sb.toString());
			LOG.debug("1.==========================");
			
			//prepareStatement 만들기
			pstmt = conn.prepareStatement(sb.toString());
			//쿼리 파람세팅(물음표 세팅)
			pstmt.setString(1, vo.getDate()); //첫번째 물음표에 vo에 들어있는 값을 넣는다는 의미
			LOG.debug("2.==========================");
			LOG.debug("2.vo:"+vo.getDate());
			LOG.debug("2.==========================");
			
			//쿼리 날리기 
			rs = pstmt.executeQuery();
			//커서이동 반드시 해줘야함
			if(rs.next()){
				outVO = new AdminReVO();
				outVO.setRcode(rs.getString("rcode"));
				outVO.setRoom(rs.getString("room"));
				outVO.setRname(rs.getString("rname"));
				outVO.setPhone(rs.getString("phone"));
				outVO.setPnum(rs.getInt("pnum"));
				outVO.setSdate(rs.getString("sdate"));
				outVO.setEdate(rs.getString("edate"));
				outVO.setWeekday(rs.getInt("weekday"));
			}
			
		}catch(SQLException e){
			LOG.debug("=========================");
			LOG.debug("SQLException="+e.getMessage());
			LOG.debug("=========================");
			
		}finally{
			JDBCReturnReso.close(rs);
			JDBCReturnReso.close(pstmt);
			JDBCReturnReso.close(conn);	
		}
		
		return outVO;
	}

	@Override
	public int do_insert(DTO dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int do_update(DTO dto) {
		AdminReVO vo=(AdminReVO)dto;
		int flag=0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		try{
			StringBuilder sb = new StringBuilder();
			sb.append(" UPDATE payment           \n");
			sb.append(" SET p_state =  ?         \n");
			sb.append(" WHERE pay_code = ?       \n");
			
			conn= connectionMaker.getConnection();
			LOG.debug("1.===========================");
			LOG.debug("1.query\n"+sb.toString());
			LOG.debug("1.===========================");
			
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, vo.getpState());
			pstmt.setString(2, vo.getPayCode());
			LOG.debug("2.===========================");
			LOG.debug("2.param:"+vo);
			LOG.debug("2.===========================");
			
			flag=pstmt.executeUpdate();
			LOG.debug("3.===========================");
			LOG.debug("3.flag:"+flag);
			LOG.debug("3.===========================");
			
		}catch(SQLException s){
			LOG.debug("==========================");
			LOG.debug("SQLException="+s.toString());
			LOG.debug("==========================");
			
		}finally{
			JDBCReturnReso.close(pstmt);
			JDBCReturnReso.close(conn);
		}
				
		return flag;
	}

	@Override
	public int do_delete(DTO dto) {
		// TODO Auto-generated method stub
		return 0;
	}


	public List<?> do_retrieve(DTO dto) {
		AdminReVO vo= (AdminReVO)dto;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<AdminReVO> list = new ArrayList<>();
		
		try{
			StringBuilder sb= new StringBuilder();
			sb.append(" SELECT d.pay_code                                         	 								 \n");
			sb.append(" 	  ,b.rcode                                         	 								 \n");
			sb.append("       ,b.room                                                                            \n");
			sb.append("       ,a.rname                                       		                             \n");
			sb.append("       ,a.phone                                         	                                 \n");
			sb.append("       ,a.pnum                                          	                                 \n");
			sb.append("       ,a.sdate  								  			                             \n");
			sb.append(" 	  ,a.edate												                             \n");
			sb.append("       ,c.weekday                                                                         \n");
			sb.append("       ,d.pay                                                                             \n");
			sb.append("       ,d.p_state                                                                         \n");
			sb.append(" FROM reservation a JOIN room b                                                           \n");
			sb.append(" ON a.rcode = b.rcode                                                                     \n");
			sb.append(" JOIN item c                                                                              \n");
			sb.append(" ON b.rcode = c.rcode                                                                     \n");
			sb.append(" JOIN payment d                                                                           \n");
			sb.append(" ON d.no = a.no                                                                           \n");
			sb.append(" where TO_DATE(?)BETWEEN TO_DATE(a.sdate) AND TO_DATE(a.edate)  \n");
			
			LOG.debug("1================================");
			LOG.debug("1.query:"+sb.toString());
			LOG.debug("1================================");
			
			conn = connectionMaker.getConnection();
			pstmt= conn.prepareStatement(sb.toString());
			//param
			pstmt.setString(1, vo.getDate());
			LOG.debug("2================================");
			LOG.debug("2.param:"+vo.getDate());
			LOG.debug("2================================");
			
			rs= pstmt.executeQuery();
			while(rs.next()){
				AdminReVO outVO = new AdminReVO();
				outVO.setPayCode(rs.getString("pay_code"));
				outVO.setRcode(rs.getString("rcode"));
				outVO.setRoom(rs.getString("room"));
				outVO.setRname(rs.getString("rname"));
				outVO.setPhone(rs.getString("phone"));
				outVO.setPnum(rs.getInt("pnum"));
				outVO.setSdate(rs.getString("sdate"));
				outVO.setEdate(rs.getString("edate"));
				outVO.setWeekday(rs.getInt("weekday"));
				outVO.setpState(rs.getString("p_state"));
				list.add(outVO);
			}
			
		}catch(SQLException e){
			
			
		}finally{
			JDBCReturnReso.close(rs);
			JDBCReturnReso.close(pstmt);
			JDBCReturnReso.close(conn);
		}
		
		return list;
	}

}




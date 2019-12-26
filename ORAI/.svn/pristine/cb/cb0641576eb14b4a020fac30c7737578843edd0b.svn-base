package reservation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;

import admin_re.AdminReVO;
import cmn.ConnectionMaker;
import cmn.DTO;
import cmn.JDBCReturnReso;
import cmn.WorkDiv;
import pay.PayDao;
import roominfo_bk.RoominfoVO;

public class ReservationDao implements WorkDiv {
	private final Logger LOG= Logger.getLogger(PayDao.class);
	private ConnectionMaker connectionMaker;
	
	public ReservationDao() {
		connectionMaker =new ConnectionMaker();
	}
	public void do_resetTable(){
		Connection conn=null;
		PreparedStatement pstmt =null;
		
		try{
			StringBuilder sb=new StringBuilder();

			sb.append("  TRUNCATE TABLE temp \n");
			
			
			LOG.debug("1.------------------");
			LOG.debug("1query\n"+sb.toString());
			LOG.debug("1.------------------");
			conn= connectionMaker.getConnection();
			pstmt=conn.prepareStatement(sb.toString());
		
		
			
			pstmt.executeUpdate();
			
			
		}catch(SQLException e)
		{
			LOG.debug("------------------");
			LOG.debug("SQLException:"+e.getMessage());
			
		}finally{
			JDBCReturnReso.close(pstmt);
			JDBCReturnReso.close(conn);
		}
		
		
	}
	
	public int do_temp_seq() {
		int seq =0;
		Connection conn = null;
		PreparedStatement pstmt= null;
		ResultSet rs = null;
		try{
			StringBuilder sb=new StringBuilder();

			sb.append("select TEMP_SEQ.nextval    \n");
			sb.append("from dual                  \n");
			
			LOG.debug("1.------------------");
			LOG.debug("1query\n"+sb.toString());
			LOG.debug("1.------------------");
			conn= connectionMaker.getConnection();
			pstmt=conn.prepareStatement(sb.toString());
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
			seq=rs.getInt("nextval");
			}
			LOG.debug(seq);
			
			
		}catch(SQLException e)
		{
			LOG.debug("===================");
			LOG.debug("SQLException="+e.getMessage());
			LOG.debug("===================");
			
		}finally{
			JDBCReturnReso.close(rs);
			JDBCReturnReso.close(pstmt);
			JDBCReturnReso.close(conn);
		}
		
		
	
		return seq;
	}
	
	public int do_insert_temp(DTO dto){
		TempVO vo =(TempVO) dto;
		int flag=0;
		
		Connection conn=null;
		PreparedStatement pstmt =null;
		
		try{
			StringBuilder sb=new StringBuilder();

			sb.append(" INSERT INTO temp(\n");
			sb.append(" PNUM,            \n");
			sb.append(" ROOM,            \n");
			sb.append(" PERIOD,          \n");
			sb.append(" ICODE,           \n");
			sb.append(" PAY,             \n");
			sb.append(" UUID,             \n");
			sb.append(" TODAY,            \n");
			sb.append(" rcode            \n");
			sb.append(" ) VALUES (       \n");
			sb.append(" ?,               \n");
			sb.append(" ?,               \n");
			sb.append(" ?,               \n");
			sb.append(" ?,               \n");
			sb.append(" ?, 				 \n");
			sb.append(" ?,					\n");
			sb.append(" ?,                \n");
			sb.append(" ?                \n");
			sb.append(" )                \n");
			LOG.debug("1.------------------");
			LOG.debug("1query\n"+sb.toString());
			LOG.debug("1.------------------");
			conn= connectionMaker.getConnection();
			pstmt=conn.prepareStatement(sb.toString());
			pstmt.setInt(1, vo.getPNUM());
			pstmt.setString(2, vo.getROOM());
			pstmt.setInt(3, vo.getPERIOD());
			pstmt.setString(4, vo.getICODE());
			pstmt.setInt(5, vo.getPAY());
			pstmt.setString(6, vo.getUUID());
			pstmt.setString(7, vo.getTODAY());
			pstmt.setString(8, vo.getRcode());
			
			LOG.debug("2.------------------");
			LOG.debug("param"+vo.toString());
			LOG.debug("2.------------------");
			
			flag=pstmt.executeUpdate();
			
			LOG.debug("3.------------------");
			LOG.debug("flag"+flag);
			LOG.debug("3.------------------");
			
		}catch(SQLException e)
		{
			LOG.debug("------------------");
			LOG.debug("SQLException:"+e.getMessage());
			
		}finally{
			JDBCReturnReso.close(pstmt);
			JDBCReturnReso.close(conn);
		}
		
		return flag;
	}
	
	public int do_insert(DTO dto) {
		ReservationVO vo =(ReservationVO) dto;
		int flag=0;
	
		Connection conn=null;
		PreparedStatement pstmt =null;
		
		try{
			StringBuilder sb=new StringBuilder();

			sb.append("  INSERT INTO reservation ( \n");
			sb.append("  NO,                       \n");
			sb.append("  RCODE,                    \n");
			sb.append("  PHONE,                    \n");
			sb.append("  PNUM,                     \n");
			sb.append("  RNAME,                    \n");
			sb.append("  SDATE,                    \n");
			sb.append("  REG_DT,                   \n");
			sb.append("  EDATE                     \n");
			sb.append("  ) VALUES (                \n");
			sb.append("  ?,       	 \n");
			sb.append("  ?,                        \n");
			sb.append("  ?,                        \n");
			sb.append("  ?,                        \n");
			sb.append("  ?,                        \n");
			sb.append("  ?,                        \n");
			sb.append("  sysdate,                  \n");
			sb.append("  ?                         \n");
			sb.append("  )                         \n");
			LOG.debug("1.------------------");
			LOG.debug("1query\n"+sb.toString());
			LOG.debug("1.------------------");
			conn= connectionMaker.getConnection();
			pstmt=conn.prepareStatement(sb.toString());
			pstmt.setString(1, vo.getNo());
			pstmt.setString(2, vo.getRcode());
			pstmt.setString(3, vo.getPhone());
			pstmt.setInt(4, vo.getPnum());
			pstmt.setString(5, vo.getRname());
			pstmt.setString(6, vo.getSdate());
			pstmt.setString(7, vo.getEdate());
			
			LOG.debug("2.------------------");
			LOG.debug("param"+vo.toString());
			LOG.debug("2.------------------");
			
			flag=pstmt.executeUpdate();
			
			LOG.debug("3.------------------");
			LOG.debug("flag"+flag);
			LOG.debug("3.------------------");
			
		}catch(SQLException e)
		{
			LOG.debug("------------------");
			LOG.debug("SQLException:"+e.getMessage());
			
		}finally{
			JDBCReturnReso.close(pstmt);
			JDBCReturnReso.close(conn);
		}
		
		return flag;
	}
	

	@Override
	public int do_update(DTO dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int do_delete(DTO dto) {
		ReservationVO vo = (ReservationVO) dto;
		int flag = 0;
		Connection conn=null;
		PreparedStatement pstmt=null;
		
		StringBuilder sb=new StringBuilder();
		sb.append("	DELETE FROM Reservation \n");
		sb.append("	WHERE   no = ?   \n");
		try{
			
			conn= connectionMaker.getConnection();
			//transaction 관리를 개발자가 한다.
			conn.setAutoCommit(false);
			LOG.debug("1-----------------------------");
			LOG.debug("query:\n"+sb.toString());
			LOG.debug("1-----------------------------");
			pstmt=conn.prepareStatement(sb.toString());
			pstmt.setString(1,vo.getNo());
			LOG.debug("2-----------------------------");
			LOG.debug("param NO:\n"+vo.toString());
			LOG.debug("2-----------------------------");
			flag=pstmt.executeUpdate();
			if(flag>0)
			{
				LOG.debug("3======================");
				LOG.debug("transaction="+conn);
				LOG.debug("3======================");		
				conn.commit();
				}
			else {
				conn.rollback();}
			
			
					}catch (SQLException e) {
						LOG.debug("============");
						LOG.debug("SQLException"+e.getMessage());
						LOG.debug("============");
		}finally {
			
			JDBCReturnReso.close(pstmt);
			JDBCReturnReso.close(conn);
	}
		
		return flag;
	}

	@Override
	public DTO do_selectOne(DTO dto) {
			
		
			return null;
	}
	

	@Override
	public List<?> do_retrieve(DTO dto) {
		// TODO Auto-generated method stub
		return null;
	}
	public TempVO do_temp_retrieve(String UUID) {
		
		TempVO outVO = null;
		Connection conn = null;
		PreparedStatement pstmt= null;
		ResultSet rs = null;
		try{
			StringBuilder sb=new StringBuilder();
			sb.append("select pnum, \n");
			sb.append("room,        \n");
			sb.append("period,      \n");
			sb.append("icode,       \n");
			sb.append("pay,         \n");
			sb.append("today,        \n");
			sb.append("rcode        \n");
			sb.append("from temp    \n");
			sb.append("where UUID= ? \n");
			
			
			conn = connectionMaker.getConnection();
			LOG.debug("1.============================");
			LOG.debug("1.query: \n"+sb.toString());
			LOG.debug("1.============================");
			
			pstmt = conn.prepareStatement(sb.toString());
			//query param
			pstmt.setString(1,UUID);
			LOG.debug("2.============================");
			LOG.debug("2.param UUID="+UUID);
			LOG.debug("2.============================");			
			
			rs = pstmt.executeQuery();
			if(rs.next()){
				outVO = new TempVO();
				outVO.setPNUM(rs.getInt("pnum"));
				outVO.setROOM(rs.getString("room"));
				outVO.setPERIOD(rs.getInt("period"));
				outVO.setICODE(rs.getString("icode"));
				outVO.setPAY(rs.getInt("pay"));
				outVO.setTODAY(rs.getString("today"));
				outVO.setRcode(rs.getString("rcode"));
				
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
	
	
	public List<ListVO> reservation_list(String today) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<ListVO> list = new ArrayList<>();
		
		try{
			StringBuilder sb= new StringBuilder();
			sb.append("SELECT                                                                        \n");   
			sb.append("a.rcode,                                                                      \n");     
			sb.append("a.room,                                                                       \n");     
			sb.append("a.capacity,                                                                   \n");     
			sb.append("a.state,                                                                      \n");     
			sb.append("a.rnum,                                                                       \n");     
			sb.append("a.reg_dt,                                                                     \n");     
			sb.append("a.rinfo,                                                                      \n");     
			sb.append("a.pen_code,                                                                   \n");
			sb.append("b.weekday,                                                                    \n");
			sb.append("b.weekend,                                                                    \n");
			sb.append("b.season,                                                                      \n");
			sb.append("b.i_code                                                                      \n");
			sb.append("FROM  room a JOIN item b                                                      \n");
			sb.append("on a.rcode= b.rcode                                                           \n");
			sb.append("WHERE a.rcode                                                                 \n");     
			sb.append("NOT IN	( SELECT rcode                                                       \n");  
			sb.append("		 FROM reservation                                                        \n");
			sb.append("		 where TO_DATE(?)BETWEEN TO_DATE(sdate) AND TO_DATE(edate)-1	)			 \n");
			sb.append("	order by(rcode) 															 \n");
			 
			
			LOG.debug("1================================");
			
			LOG.debug("1.query:"+sb.toString());
			LOG.debug("1================================");
			
			conn = connectionMaker.getConnection();
			pstmt= conn.prepareStatement(sb.toString());
			//param
			pstmt.setString(1,today);
			LOG.debug("2================================");
			LOG.debug("2.param:"+today);
			LOG.debug("2================================");
			
			rs= pstmt.executeQuery();
			while(rs.next()){
				ListVO outVO=new ListVO();
				outVO.setRcode(rs.getString("rcode"));
				outVO.setRoom(rs.getString("room"));
				outVO.setCapacity(rs.getInt("capacity"));
				outVO.setState(rs.getInt("state"));
				outVO.setRnum(rs.getInt("rnum"));
				outVO.setReg_dt(rs.getString("reg_dt"));
				outVO.setRinfo(rs.getString("rinfo"));
				outVO.setPen_code(rs.getString("pen_code"));
				outVO.setWeekday(rs.getInt("weekday"));
				outVO.setWeekend(rs.getInt("weekend"));
				outVO.setSeason(rs.getInt("season"));
				outVO.setIcode(rs.getString("i_code"));
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

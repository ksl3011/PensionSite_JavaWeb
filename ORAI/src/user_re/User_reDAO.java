package user_re;

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
import cmn.SearchVO;
import user_re.User_reDAO;
import user_re.User_reVO;
import roominfo_bk.RoominfoVO;

/**
 * @author sist
 *
 */
public class User_reDAO implements WorkDiv{
	final private Logger LOG = Logger.getLogger(User_reDAO.class);
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public User_reDAO(){
	}

	/* (non-Javadoc)
	 * @see com.hr.cmn.WorkDiv#do_insert(com.hr.cmn.DTO)
	 */
	@Override
	public int do_insert(DTO dto) {
		conn = new ConnectionMaker().getConnection();
		int flag = -1;
		User_reVO inVO = (User_reVO)dto;
		StringBuilder sb = new StringBuilder();
		
		sb.append("INSERT INTO reservation (					\n");
		sb.append("    no,                                      \n");
		sb.append("    rcode,                                   \n");
		sb.append("    phone,                                   \n");
		sb.append("    pnum,                                    \n");
		sb.append("    rname,                                   \n");
		sb.append("    sdate,                                   \n");
		sb.append("    reg_dt,                                  \n");
		sb.append("    edate                                    \n");
		sb.append(") VALUES (                                   \n");
		sb.append("    ?,                                       \n");
		sb.append("    ?,                                       \n");
		sb.append("    ?,                                       \n");
		sb.append("    ?,                                       \n");
		sb.append("    ?,                                       \n");
		sb.append("    TO_CHAR(?,'yyyy/MM/dd hh24:mm:mi'),      \n");
		sb.append("    TO_CHAR(SYSDATE,'yyyy/MM/dd hh24:mm:mi'),\n");
		sb.append("    TO_CHAR(?,'yyyy/MM/dd hh24:mm:mi')       \n");
		sb.append(")                                              ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			
			pstmt.setString(1, inVO.getNO());
			pstmt.setString(2, inVO.getRCODE());
			pstmt.setString(3, inVO.getPHONE());
			pstmt.setString(4, inVO.getPNUM());
			pstmt.setString(5, inVO.getRNAME());
			pstmt.setString(6, inVO.getREG_DT());
			pstmt.setString(7, inVO.getEDATE());
			
			LOG.debug("--------------------------");
			LOG.debug("Quary\n" + sb.toString());
			LOG.debug("--------------------------");
			
			flag = pstmt.executeUpdate();
			
		} catch (SQLException se) {
			LOG.error("--------------------------");
			LOG.error("SQLException\n" + se.getMessage());
			LOG.error("--------------------------");
		} finally{
			JDBCReturnReso.close(pstmt);
			JDBCReturnReso.close(conn);
		}
		
		return flag;
	}

	/* (non-Javadoc)
	 * @see com.hr.cmn.WorkDiv#do_update(com.hr.cmn.DTO)
	 */
	@Override
	public int do_update(DTO dto) {
		conn = new ConnectionMaker().getConnection();
		int flag = -1;
		User_reVO inVO = (User_reVO)dto;
		StringBuilder sb = new StringBuilder();
		
		sb.append("UPDATE reservation								 \n");
		sb.append("SET                                               \n");
		sb.append("	rcode = ?                                        \n");
		sb.append("	phone = ?                                        \n");
		sb.append("	pnum = ?                                         \n");
		sb.append("	rname = ?                                        \n");
		sb.append("	sdate = ?                                        \n");
		sb.append("	reg_dt = TO_CHAR(SYSDATE,'yyyy/MM/dd hh24:mm:mi')\n");
		sb.append("	edate = ?                                        \n");
		sb.append("WHERE                                             \n");
		sb.append("    no = ?                                          ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			
			pstmt.setString(1, inVO.getRCODE());
			pstmt.setString(2, inVO.getPHONE());
			pstmt.setString(3, inVO.getPNUM());
			pstmt.setString(4, inVO.getRNAME());
			pstmt.setString(5, inVO.getSDATE());
			pstmt.setString(6, inVO.getEDATE());
			pstmt.setString(7, inVO.getNO());
			
			LOG.debug("--------------------------");
			LOG.debug("Quary\n" + sb.toString());
			LOG.debug("--------------------------");
			
			flag = pstmt.executeUpdate();
		
		} catch (SQLException se) {
			LOG.error("--------------------------");
			LOG.error("SQLException\n" + se.getMessage());
			LOG.error("--------------------------");
			
		} finally{
			JDBCReturnReso.close(pstmt);
			JDBCReturnReso.close(conn);
		}
		
		return flag;
	}

	/* (non-Javadoc)
	 * @see com.hr.cmn.WorkDiv#do_delete(com.hr.cmn.DTO)
	 */
	@Override
	public int do_delete(DTO dto) {
		conn = new ConnectionMaker().getConnection();
		int flag =0;
		User_reVO inVO = (User_reVO)dto;
		StringBuilder sb = new StringBuilder();
		
		sb.append("DELETE FROM reservation\n");
		sb.append("WHERE no = ?      ");
				
		try {
			pstmt = conn.prepareStatement(sb.toString());
			
			pstmt.setString(1, inVO.getNO());

			LOG.debug("--------------------------");
			LOG.debug("Quary\n" + sb.toString());
			LOG.debug("--------------------------");
			
			flag = pstmt.executeUpdate();
			
		} catch (SQLException se) {
			LOG.error("--------------------------");
			LOG.error("SQLException\n" + se.getMessage());
			LOG.error("--------------------------");
		} finally{
			JDBCReturnReso.close(pstmt);
			JDBCReturnReso.close(conn);
		}
		
		return flag;
	}

	/* (non-Javadoc)
	 * @see com.hr.cmn.WorkDiv#do_selectOne(com.hr.cmn.DTO)
	 */
	@Override
	public DTO do_selectOne(DTO dto) {
		conn = new ConnectionMaker().getConnection();
		ResultSet rs = null;
		User_reVO inVO = (User_reVO)dto;
		User_reVO outVO = null;
		
		StringBuilder sb = new StringBuilder();
		sb.append("SELECT * FROM reservation \n");
		sb.append("WHERE no = ?                ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, inVO.getNO());

			LOG.debug("--------------------------");
			LOG.debug("Quary\n" + sb.toString());
			LOG.debug("--------------------------");
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				outVO = new User_reVO();
				outVO.setNO(rs.getString("NO"));
				outVO.setRCODE(rs.getString("RCODE"));
				outVO.setPHONE(rs.getString("PHONE"));
				outVO.setPNUM(rs.getString("PNUM"));
				outVO.setRNAME(rs.getString("RNAME"));
				outVO.setSDATE(rs.getString("SDATE"));
				outVO.setREG_DT(rs.getString("REG_DT"));
				outVO.setEDATE(rs.getString("EDATE"));
			}
			
		} catch (SQLException se) {
			LOG.error("--------------------------");
			LOG.error("SQLException\n" + se.getMessage());
			LOG.error("--------------------------");
		} finally{
			JDBCReturnReso.close(rs);
			JDBCReturnReso.close(pstmt);
			JDBCReturnReso.close(conn);
		}
		
		return outVO;
	}

	/* (non-Javadoc)
	 * @see com.hr.cmn.WorkDiv#do_retrieve(com.hr.cmn.DTO)
	 */
	@Override
	public List<?> do_retrieve(DTO dto) {
		conn = new ConnectionMaker().getConnection();
		List<User_reVO> list = new ArrayList<>();
		ResultSet rs = null;
		SearchVO sVO = (SearchVO)dto;
		User_reVO outVO = null;
		
		StringBuilder sb = new StringBuilder();
		sb.append("SELECT              \n");
		sb.append("	rownum,            \n");
		sb.append("    a.no,           \n");
		sb.append("    a.rcode,        \n");
		sb.append("    a.phone,        \n");
		sb.append("    a.pnum,         \n");
		sb.append("    a.rname,        \n");
		sb.append("    a.sdate,        \n");
		sb.append("    a.reg_dt,       \n");
		sb.append("    a.edate,        \n");
		sb.append("    b.*             \n");
		sb.append("FROM (              \n");
		sb.append("	SELECT no,         \n");
		sb.append("	       rcode,      \n");
		sb.append("	       phone,      \n");
		sb.append("	       pnum,       \n");
		sb.append("	       rname,      \n");
		sb.append("	       sdate,      \n");
		sb.append("	       reg_dt,     \n");
		sb.append("	       edate,      \n");
		sb.append("		   rownum AS RM\n");
		sb.append("	FROM reservation   \n");
		
		if(null != sVO.getSearchDiv()){
			if(sVO.getSearchDiv().equals(1))
				sb.append("WHERE no LIKE '?%'    \n");
			else if(sVO.getSearchDiv().equals(2))
				sb.append("WHERE rcode LIKE '?%' \n");
			else if(sVO.getSearchDiv().equals(3))
				sb.append("WHERE pnum LIKE '?%'  \n");	
			else if(sVO.getSearchDiv().equals(4))
				sb.append("WHERE rname LIKE '?%' \n");	
			else if(sVO.getSearchDiv().equals(5))
				sb.append("WHERE sdate LIKE '?%' \n");	
			else if(sVO.getSearchDiv().equals(6))
				sb.append("WHERE reg_dt LIKE '?%'\n");	
			else if(sVO.getSearchDiv().equals(7))
				sb.append("WHERE edate LIKE '?%' \n");	
		}
		sb.append("		) a,                                       \n");
		sb.append("		(SELECT COUNT(*) FROM reservation) b       \n");
		sb.append("WHERE CEIL(a.RM/?) = ?                          \n");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			
			if(null != sVO.getSearchDiv()){
				pstmt.setString(1, sVO.getSearchWord());
				pstmt.setInt(2, sVO.getPageSize());
				pstmt.setInt(3, sVO.getPageNum());
			}
			else {
				pstmt.setInt(1, sVO.getPageSize());
				pstmt.setInt(2, sVO.getPageNum());
			}
			
			LOG.debug("--------------------------");
			LOG.debug("Quary\n" + sb.toString());
			LOG.debug("--------------------------");
			
			rs = pstmt.executeQuery();
			
			while( rs.next()){
				outVO = new User_reVO();
				outVO.setNO(rs.getString("NO"));
				outVO.setRCODE(rs.getString("RCODE"));
				outVO.setPHONE(rs.getString("PHONE"));
				outVO.setPNUM(rs.getString("PNUM"));
				outVO.setRNAME(rs.getString("RNAME"));
				outVO.setSDATE(rs.getString("SDATE"));
				outVO.setREG_DT(rs.getString("REG_DT"));
				outVO.setEDATE(rs.getString("EDATE"));
				
				list.add(outVO);
			}
			
		} catch (SQLException se) {
			LOG.error("--------------------------");
			LOG.error("SQLException\n" + se.getMessage());
			LOG.error("--------------------------");
		} finally{
			JDBCReturnReso.close(rs);
			JDBCReturnReso.close(pstmt);
			JDBCReturnReso.close(conn);
		}

		return list;		
	}

	/**
	 * @Method Name  : roomInfo
	 * @작성일   : 2019. 7. 17.
	 * @작성자   : sist
	 * @변경이력  : 최초작성
	 * @Method 설명 : RCODE를 받아 방 정보를 리턴
	 * @param dto
	 * @return
	 */
	public RoominfoVO roomInfo(DTO dto){
		conn = new ConnectionMaker().getConnection();
		ResultSet rs = null;
		User_reVO inVO = (User_reVO)dto;
		RoominfoVO outVO = null;
		
		StringBuilder sb = new StringBuilder();
		sb.append("SELECT room,              \n");
		sb.append("       capacity           \n");
		sb.append("FROM room 				 \n");
		sb.append("WHERE rcode = ?             ");
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, inVO.getRCODE());
			LOG.debug("--------------------------");
			LOG.debug("Quary\n" + sb.toString());
			LOG.debug("--------------------------");
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				outVO = new RoominfoVO();
				outVO.setRoom((rs.getString("ROOM")));
				outVO.setCapacity((rs.getInt("CAPACITY")));
			}
			
		} catch (SQLException se) {
			LOG.error("--------------------------");
			LOG.error("SQLException\n" + se.getMessage());
			LOG.error("--------------------------");
		} finally{
			JDBCReturnReso.close(rs);
			JDBCReturnReso.close(pstmt);
			JDBCReturnReso.close(conn);
		}
		
		return outVO;
	}
	
	/**
	 * @Method Name  : do_selectOne_Condition
	 * @작성일   : 2019. 7. 17.
	 * @작성자   : sist
	 * @변경이력  : 최초작성
	 * @Method 설명 : 이름과 전화번호만 받아 전체정보 리턴
	 * @param dto
	 * @return
	 */
	public DTO do_selectOne_Condition(DTO dto){
		conn = new ConnectionMaker().getConnection();
		ResultSet rs = null;
		User_reVO inVO = (User_reVO)dto;
		User_reVO outVO = null;
		
		StringBuilder sb = new StringBuilder();
		sb.append("SELECT * FROM reservation \n");
		sb.append("WHERE rname = ?           \n");
		sb.append("AND   phone = ?             ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, inVO.getRNAME());
			pstmt.setString(2, inVO.getPHONE());
			

			LOG.debug("--------------------------");
			LOG.debug("Quary\n" + sb.toString());
			LOG.debug("--------------------------");
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				outVO = new User_reVO();
				outVO.setNO(rs.getString("NO"));
				outVO.setRCODE(rs.getString("RCODE"));
				outVO.setPHONE(rs.getString("PHONE"));
				outVO.setPNUM(rs.getString("PNUM"));
				outVO.setRNAME(rs.getString("RNAME"));
				outVO.setSDATE(rs.getString("SDATE"));
				outVO.setREG_DT(rs.getString("REG_DT"));
				outVO.setEDATE(rs.getString("EDATE"));
			}
			
		} catch (SQLException se) {
			LOG.error("--------------------------");
			LOG.error("SQLException\n" + se.getMessage());
			LOG.error("--------------------------");
		} finally{
			JDBCReturnReso.close(rs);
			JDBCReturnReso.close(pstmt);
			JDBCReturnReso.close(conn);
		}
		
		return outVO;
	}
}

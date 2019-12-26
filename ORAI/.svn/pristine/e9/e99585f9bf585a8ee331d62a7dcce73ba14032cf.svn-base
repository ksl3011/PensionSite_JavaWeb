package roominfo_bk;

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
import sights.SightsVO;


public class RoominfoDao implements WorkDiv {
	private final Logger LOG= Logger.getLogger(RoominfoDao.class);
	private ConnectionMaker connectionMaker;

	public RoominfoDao() {
		connectionMaker =new ConnectionMaker();
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
		
		RoominfoVO vo = (RoominfoVO) dto;
		RoominfoVO outVO=null;
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs =null;
		
		StringBuilder sb=new StringBuilder();
		sb.append(" SELECT                     \n");      
		sb.append(" a.rcode,                   \n");
		sb.append(" a.room,                    \n");
		sb.append(" a.capacity,                \n");
		sb.append(" a.state,                   \n");
		sb.append(" a.rnum,                    \n");
		sb.append(" a.reg_dt,                  \n");
		sb.append(" a.rinfo,                   \n");
		sb.append(" a.pen_code,                \n");
		sb.append(" b.weekday,                 \n");
		sb.append(" b.weekend,                 \n");
		sb.append(" b.season,     	           \n");
		sb.append(" a.r_image      	           \n");
		sb.append(" FROM  room a join item b   \n");
		sb.append(" on a.rcode=b.rcode         \n");
		sb.append(" WHERE a.rcode= ?	       \n");
				
		try {
			conn=connectionMaker.getConnection();
			LOG.debug("1-----------------------------");
			LOG.debug("query: \n"+sb.toString());
			LOG.debug("1-----------------------------");
			
			pstmt=conn.prepareStatement(sb.toString());
			//query param
			pstmt.setString(1, vo.getRcode());
			LOG.debug("2-----------------------------");
			LOG.debug("param seq:\n"+vo.toString());
			LOG.debug("2-----------------------------");
			rs=pstmt.executeQuery();
			if(rs.next()){
				outVO=new RoominfoVO();
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
				outVO.setR_image(rs.getString("r_image"));
				
			}
			
			
		}catch(SQLException e){
			LOG.debug("3============");
			LOG.debug("SQLException"+e.getMessage());
			LOG.debug("3============");
		}finally{
			JDBCReturnReso.close(rs);
			JDBCReturnReso.close(pstmt);
			JDBCReturnReso.close(conn);
		}
		return outVO;
	}

	
	public ImgVO do_Img(DTO dto) {
		RoominfoVO vo = (RoominfoVO) dto;
		ImgVO outVO= null;
		List<ImgVO> list=new ArrayList<>();
	    Connection conn=null; //db연결
	    PreparedStatement pstmt=null; //query수행
	    ResultSet rs =null; // 결과처리
	    
	    StringBuilder sb=new StringBuilder();
	    sb.append("SELECT                       \n");
	    sb.append("b.img1,                      \n");
	    sb.append("b.img2,                      \n");
	    sb.append("b.img3,                      \n");
	    sb.append("b.img4,                      \n");
	    sb.append("b.img5,                      \n");
	    sb.append("b.img6                       \n");
	    sb.append("FROM  room a join image b    \n");
	    sb.append("on a.rcode=b.rcode           \n");
	    sb.append("WHERE a.rcode= ?				\n");  
	    
	    try {
	         conn= new ConnectionMaker().getConnection();
	         pstmt=conn.prepareStatement(sb.toString());
	     
	         LOG.debug("3param\n:"+vo);
	         pstmt.setString(1, vo.getRcode());
	         
	         rs=pstmt.executeQuery();
	         
	         while(rs.next()){
	        	outVO=new ImgVO();
	            outVO.setImg1(rs.getString("img1"));
	            outVO.setImg2(rs.getString("img2"));
	            outVO.setImg3(rs.getString("img3"));
	            outVO.setImg4(rs.getString("img4"));
	            outVO.setImg5(rs.getString("img5"));
	            outVO.setImg6(rs.getString("img6"));
	            
	      
	            
	           
	         }
	         
	         
	      } catch (SQLException e) {
	         e.printStackTrace();
	      }finally {
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

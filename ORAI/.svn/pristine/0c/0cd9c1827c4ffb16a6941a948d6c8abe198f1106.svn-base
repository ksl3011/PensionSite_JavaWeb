package sights;

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
import roominfo_bk.RoominfoDao;
import roominfo_bk.RoominfoVO;

public class SightsDAO implements WorkDiv {
	private final Logger LOG= Logger.getLogger(SightsDAO.class);
	private ConnectionMaker connectionMaker;

	public SightsDAO() {
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
	public List<SightsVO> do_retrieve(DTO dto) {
		SightsVO vo = (SightsVO) dto;
	    List<SightsVO> list=new ArrayList<>();
	    Connection conn=null; //db연결
	    PreparedStatement pstmt=null; //query수행
	    ResultSet rs =null; // 결과처리
	      
	//설계서
//	      sb.append("   SELECT T1.*,T2.*\n");
//	      sb.append("   FROM            \n");
//	      sb.append("   (               \n");
//	      sb.append("                 \n");
//	      if(이름으로 검색){
//	      sb.append("   WHERE         \n");
//	      }
//	      sb.append("   )T1             \n");
//	      sb.append("   CORSS JOIN      \n");
//	      sb.append("   (               \n");
//	      sb.append("                   \n");
//	      if(이름으로 검색){
//	      sb.append("   WHERE \n        \n");
//	      }
//	      sb.append("   )T2             \n");
	      //검색 커리
	      StringBuilder sb=new StringBuilder();
	      sb.append("SELECT                       \n");
	      sb.append("a.s_name,                    \n");
	      sb.append("a.pen_code,                  \n");
	      sb.append("a.location,                  \n");
	      sb.append("a.d_location,                \n");
	      sb.append("a.s_latitude,                \n");
	      sb.append("a.s_longitude,               \n");
	      sb.append("b.latitude,                  \n");
	      sb.append("b.longitude                  \n");
	      sb.append("                             \n");
	      sb.append("FROM                         \n");
	      sb.append("sights a JOIN PENSION b      \n");
	      sb.append("ON a.pen_code= b.pen_code    \n");
	      sb.append("AND a.pen_code='1001'        \n");
	     
	      
	      LOG.debug("sql:\n"+sb.toString());
	      try {
	         conn= new ConnectionMaker().getConnection();
	         pstmt=conn.prepareStatement(sb.toString());
	     
	         LOG.debug("3param\n:"+vo);
//	         pstmt.setString(1, vo.getPen_code());
	         
	         rs=pstmt.executeQuery();
	         
	         while(rs.next()){
	            SightsVO outVO=new SightsVO();
	            outVO.setS_name(rs.getString("s_name"));
	            outVO.setPen_code(rs.getString("pen_code"));
	            outVO.setLocation(rs.getString("location"));
	            outVO.setD_location(rs.getString("d_location"));
	            outVO.setS_latitude(rs.getDouble("s_latitude"));
	            outVO.setS_longitude(rs.getDouble("s_longitude"));
	            outVO.setLatitude(rs.getDouble("latitude"));
	            outVO.setLongitude(rs.getDouble("longitude"));
	      
	            
	            list.add(outVO);
	         }
	         
	         
	      } catch (SQLException e) {
	         e.printStackTrace();
	      }finally {
	         JDBCReturnReso.close(rs);
	         JDBCReturnReso.close(pstmt);
	         JDBCReturnReso.close(conn);
	      }
	      
	   return list;
	}

	@Override
	public DTO do_selectOne(DTO dto) {
		// TODO Auto-generated method stub
		return null;
	}
	

}

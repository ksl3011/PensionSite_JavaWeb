package notice1;

import java.sql.CallableStatement;
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
import read_cnt.ReadCntVO;

public class NoticeDao implements WorkDiv {
	private final Logger LOG= Logger.getLogger(NoticeDao.class);
	private ConnectionMaker connectionMaker;
	
	public NoticeDao() {
		connectionMaker = new ConnectionMaker();
	}
	//ip등록
	public int do_retInsert(DTO dto) {
		ReadCntVO vo =(ReadCntVO)dto;
		int flag=0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		try{
			StringBuilder sb = new StringBuilder();
			sb.append(" INSERT INTO read_cnt (  \n");
			sb.append("     seq,                \n");
			sb.append("     ip,                 \n");
			sb.append("     red_dt              \n");
			sb.append(" ) VALUES (              \n");
			sb.append("     ?,				    \n");
			sb.append("     ?,                  \n");
			sb.append("     SYSDATE             \n");
			sb.append(" )                       \n");
			
			//오류나면 꺼낼 수 있도록 로그 만들기
			LOG.debug("1.=========================");
			LOG.debug("1.query\n:"+sb.toString());
			LOG.debug("1.=========================");
			
			//커넥션 만들기
			conn = connectionMaker.getConnection();
			pstmt= conn.prepareStatement(sb.toString());
			//파람 3개설정(물음표 2개임)
			pstmt.setString(1, vo.getSeq());
			pstmt.setString(2, vo.getIp());
			LOG.debug("2.=========================");
			LOG.debug("2.param\n:"+vo.toString());
			LOG.debug("2.=========================");
			
			//쿼리날리기
			flag = pstmt.executeUpdate();
			LOG.debug("3.=========================");
			LOG.debug("3.flag\n:"+flag);
			LOG.debug("3.=========================");
				
		}catch(SQLException e){
			LOG.debug("=========================");
			LOG.debug("SQLException"+e.toString());
			LOG.debug("=========================");
			
		}finally{
			JDBCReturnReso.close(pstmt);
			JDBCReturnReso.close(conn);	
		}
		
		return flag;
	}
	
	//클릭한 횟수
	public int do_retSelectCnt(DTO dto){
		ReadCntVO vo =(ReadCntVO) dto;
		int flag = 0;
		Connection conn = null;
		PreparedStatement pstmt= null;
		ResultSet rs = null;
		try{
			StringBuilder sb=new StringBuilder();
			sb.append(" SELECT COUNT(*) cnt \n");
			sb.append(" FROM read_cnt      \n");
			sb.append(" WHERE  seq = ?      \n");
			conn = connectionMaker.getConnection();
			LOG.debug("1.============================");
			LOG.debug("1.query: \n"+sb.toString());
			LOG.debug("1.============================");
			
			pstmt = conn.prepareStatement(sb.toString());
			//query param
			pstmt.setString(1, vo.getSeq());
			LOG.debug("2.============================");
			LOG.debug("2.param seq="+vo.getSeq());
			LOG.debug("2.============================");			
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				flag = rs.getInt("cnt");
			}
			LOG.debug("3.============================");
			LOG.debug("3.flag="+flag);
			LOG.debug("3.============================");			
						
			
		}catch(SQLException e){
			LOG.debug("===================");
			LOG.debug("SQLException="+e.getMessage());
			LOG.debug("===================");
		}finally{
			JDBCReturnReso.close(rs);
			JDBCReturnReso.close(pstmt);
			JDBCReturnReso.close(conn);
		}
		
		return flag;
	}
	
	//조회수 증가 
	public int do_updateReadCnt(DTO dto) {
		NoticeVO vo=(NoticeVO)dto;
		int flag=0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		try{
			StringBuilder sb = new StringBuilder();
			sb.append(" update board                                                    \n");
			sb.append(" set read_cnt = (SELECT NVL(read_cnt,0)+1 FROM board WHERE seq=?)\n");
			sb.append(" WHERE seq=?                                                     \n");
			
			conn= connectionMaker.getConnection();
			LOG.debug("1.===========================");
			LOG.debug("1.query\n"+sb.toString());
			LOG.debug("1.===========================");
			
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, vo.getSeq());
			pstmt.setString(2, vo.getSeq());
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
	//저장
	@Override
	public int do_insert(DTO dto) {
		NoticeVO vo =(NoticeVO)dto;
		int flag=0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		try{
			StringBuilder sb = new StringBuilder();
			sb.append(" INSERT INTO board (     \n");
			sb.append("     seq,                \n");
			sb.append("     title,              \n");
			sb.append("     contents,           \n");
			sb.append("     reg_id,             \n");
			sb.append("     reg_dt              \n");
			sb.append(" ) VALUES (              \n");
			sb.append("     SEQ_BOARD.nextval,  \n");
			sb.append("     ?,                  \n");
			sb.append("     ?,                  \n");
			sb.append("     ?,                  \n");
			sb.append("     SYSDATE             \n");
			sb.append(" )                       \n");
			
			//오류나면 꺼낼 수 있도록 로그 만들기
			LOG.debug("1.=========================");
			LOG.debug("1.query\n:"+sb.toString());
			LOG.debug("1.=========================");
			
			//커넥션 만들기
			conn = connectionMaker.getConnection();
			pstmt= conn.prepareStatement(sb.toString());
			//파람 3개설정(물음표 3개임)
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getContents());
			pstmt.setString(3, vo.getReg_id());
			LOG.debug("2.=========================");
			LOG.debug("2.param\n:"+vo.toString());
			LOG.debug("2.=========================");
			
			//쿼리날리기
			flag = pstmt.executeUpdate();
			LOG.debug("3.=========================");
			LOG.debug("3.flag\n:"+flag);
			LOG.debug("3.=========================");
				
		}catch(SQLException e){
			LOG.debug("=========================");
			LOG.debug("SQLException"+e.toString());
			LOG.debug("=========================");
			
		}finally{
			JDBCReturnReso.close(pstmt);
			JDBCReturnReso.close(conn);	
		}
		
		return flag;
	}

	
	//수정
	@Override
	public int do_update(DTO dto) {
		NoticeVO vo=(NoticeVO)dto;
		int flag=0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		try{
			StringBuilder sb = new StringBuilder();
			sb.append(" UPDATE board            \n");
			sb.append(" SET title =  ?,         \n");
			sb.append("     contents =  ?,      \n");
			sb.append("     reg_id =  ?,        \n");
			sb.append("     reg_dt = SYSDATE    \n");
			sb.append(" WHERE seq = ?           \n");
			
			conn= connectionMaker.getConnection();
			LOG.debug("1.===========================");
			LOG.debug("1.query\n"+sb.toString());
			LOG.debug("1.===========================");
			
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getContents());
			pstmt.setString(3, vo.getReg_id());
			pstmt.setString(4, vo.getSeq());
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
	//삭제
	@Override
	public int do_delete(DTO dto) {
		NoticeVO vo= (NoticeVO) dto;
		int flag = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		StringBuilder sb=new StringBuilder();
		sb.append(" DELETE FROM board \n");
		sb.append(" WHERE seq = ?     \n");
		
		try{
		    conn= connectionMaker.getConnection();
			conn.setAutoCommit(false); //트렌잭션을 내가 관리할 수 있게 됨. 원래 디폴드값은 true(자동 커밋)
			LOG.debug("1===========================");
			LOG.debug("query:\n"+sb.toString());
			LOG.debug("1===========================");
			
			pstmt = conn.prepareStatement(sb.toString()); //쿼리 디버깅
			//쿼리 파람세팅 (물음표에 대한 값세팅)
			pstmt.setString(1, vo.getSeq());
			LOG.debug("2===========================");
			LOG.debug("param,seq:\n"+vo.getSeq());
			LOG.debug("2===========================");
			
			// 쿼리날리기
			flag = pstmt.executeUpdate();
			//트렌젝션임. 
			if(flag>0) {
				LOG.debug("2===========================");
				LOG.debug("transaction:\n"+conn);
				LOG.debug("2===========================");
				conn.commit();
			}
			else {
				conn.rollback();
			}
			
		}catch (SQLException e) {
			e.printStackTrace();
		}finally{
			
			JDBCReturnReso.close(pstmt);
			JDBCReturnReso.close(conn);						
	    }
		
		LOG.debug("3=====================");
		LOG.debug("flag:"+flag);
		LOG.debug("3=====================");
		
		return flag;
	}
	//단건검색
	@Override
	public NoticeVO do_selectOne(DTO dto) {
		NoticeVO vo= (NoticeVO) dto;
		NoticeVO outVO = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs= null;
		
		try{
			StringBuilder sb= new StringBuilder();
			sb.append(" SELECT                                               \n");
			sb.append("     seq,                                             \n");
			sb.append("     title,                                           \n");
			sb.append("     read_cnt,                                        \n");
			sb.append("     contents,                                        \n");
			sb.append("     reg_id,                                          \n");
			sb.append("     TO_CHAR(reg_dt,'YYYY-MM-DD HH24:mi:ss') reg_dt   \n");
			sb.append(" FROM                                                 \n");
			sb.append("     board                                            \n");
			sb.append(" WHERE seq = ?                                        \n");
			
			//커넥션 만들기
			conn= connectionMaker.getConnection();
			LOG.debug("1.==========================");
			LOG.debug("1. conn:"+conn);
			LOG.debug("1.query:\n"+sb.toString());
			LOG.debug("1.==========================");
			
			//prepareStatement 만들기
			pstmt = conn.prepareStatement(sb.toString());
			//쿼리 파람세팅(물음표 세팅)
			pstmt.setString(1, vo.getSeq()); //첫번째 물음표에 vo에 들어있는 값을 넣는다는 의미
			LOG.debug("2.==========================");
			LOG.debug("2.param seq:\n"+vo.getSeq());
			LOG.debug("2.==========================");
			
			//쿼리 날리기 
			rs = pstmt.executeQuery();
			//커서이동 반드시 해줘야함
			if(rs.next()){
				outVO = new NoticeVO();
				outVO.setSeq(rs.getString("seq"));
				outVO.setTitle(rs.getString("title"));
				outVO.setRead_cnt(rs.getString("read_cnt"));
				outVO.setContents(rs.getString("contents"));
				outVO.setReg_id(rs.getString("reg_id"));
				outVO.setReg_dt(rs.getString("reg_dt")); 
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
	//목록검색
	@Override
	public List<?> do_retrieve(DTO dto) {
		
		SearchVO vo= (SearchVO)dto;
		List<NoticeVO> list=new ArrayList<>();
		Connection conn = null;//db 연결
		PreparedStatement pstmt = null;//query수행
		ResultSet rs = null;//결과처리 
			
		//검색 query
		StringBuilder sbWhere=new StringBuilder();
		//제목=10,내용=20,ID=30
		if(null != vo){
			if("10".equals(vo.getSearchDiv())){
				sbWhere.append("WHERE title like ?||'%' \n");
			}else if("20".equals(vo.getSearchDiv())){
				sbWhere.append("WHERE contents like ?||'%' \n");
			}else if("30".equals(vo.getSearchDiv())){
				sbWhere.append("WHERE reg_id like ?||'%' \n");
			}
		}
			
			//main query
		StringBuilder sb=new StringBuilder();
		sb.append(" SELECT T1.*,T2.*                                            \n");
		sb.append(" FROM                                                        \n");
		sb.append(" (                                                           \n");
		sb.append("     SELECT b.rnum num,                                      \n");
		sb.append("            b.seq,                                           \n");
		sb.append("            b.title,                                         \n");
		sb.append("           (SELECT COUNT(*) FROM read_cnt BR WHERE BR.SEQ=B.SEQ  ) read_cnt, \n"); 
		sb.append("            b.contents,                                      \n");
		sb.append("            b.reg_id,                                        \n");
		sb.append("            DECODE(TO_CHAR(b.reg_dt,'YYYY-MM-DD')            \n");
		sb.append("                  ,TO_CHAR(SYSDATE,'YYYY-MM-DD')             \n");
		sb.append("                  ,TO_CHAR(b.reg_dt,'HH24:mi')               \n");
		sb.append("                  ,TO_CHAR(b.reg_dt,'YYYY-MM-DD')) as reg_dt \n"); 
		sb.append("     FROM(                                                   \n");
		sb.append("         SELECT ROWNUM rnum,A.*                              \n");
		sb.append("         FROM(                                               \n");
		sb.append("             SELECT a.*                                      \n");
		sb.append("             FROM board a                                    \n");
		sb.append("             --SEARCH CONDITION                              \n"); 
			//-------------------------------------------------------------------------------
			if(null != vo.getSearchDiv()){//검색구분
				if(null != vo.getSearchWord() && vo.getSearchWord().length()>0){ 
					sb.append(sbWhere.toString());
				}
			}
			//-------------------------------------------------------------------------------		
			
			sb.append(" 		ORDER BY a.reg_dt DESC                                  \n");  
			sb.append(" 	)A                                                        \n");  
			//sb.append("     WHERE ROWNUM <=(&PAGE_SIZE*(&PAGE_NUM-1)+&PAGE_SIZE)  )B  \n");  
			//sb.append(" WHERE B.rnum>= (&PAGE_SIZE*(&PAGE_NUM-1)+1)                   \n");  
			sb.append("     WHERE ROWNUM <=( ? * ( ?-1)+ ?)  )B    		              \n");  
			sb.append(" WHERE B.rnum>= ( ? * ( ?-1)+1)                  		       \n");  
			sb.append("                                                               \n");  
			sb.append(" )T1                                                           \n");  
			sb.append(" CROSS JOIN                                                    \n");  
			sb.append(" (                                                             \n");  
			sb.append(" SELECT COUNT(*) total_cnt                                     \n");  
			sb.append(" FROM board  a                                                 \n");
			sb.append(" --SEARCH CONDITION                                           \n");  
			//-------------------------------------------------------------------------------
			if(null != vo.getSearchDiv() ){//검색구분
				if(null != vo.getSearchWord() && vo.getSearchWord().length()>0){//검색어가 있는냐
					sb.append(sbWhere.toString());
				}
			}		
			//-------------------------------------------------------------------------------		
			sb.append( " )T2                                                             \n");		
			
			LOG.debug("2 sql \n:"+sb.toString());
			try{
				conn = new ConnectionMaker().getConnection();
				pstmt = conn.prepareStatement(sb.toString());
				
				//param
				if(null != vo.getSearchDiv()&& !"".equals(vo.getSearchDiv())){
					//검색어
					//PAGE_SIZE
					//PAGE_NUM
					//PAGE_SIZE
					//PAGE_SIZE
					//PAGE_NUM
					//검색어
					pstmt.setString(1, vo.getSearchWord());
					pstmt.setInt(2, vo.getPageSize());
					pstmt.setInt(3, vo.getPageNum());
					pstmt.setInt(4, vo.getPageSize());
					pstmt.setInt(5, vo.getPageSize());
					pstmt.setInt(6, vo.getPageNum());	
					pstmt.setString(7, vo.getSearchWord());
				}else{//검색이 없는 경우
					//PAGE_SIZE
					//PAGE_NUM
					//PAGE_SIZE
					//PAGE_SIZE
					//PAGE_NUM
					pstmt.setInt(1, vo.getPageSize());
					pstmt.setInt(2, vo.getPageNum());
					pstmt.setInt(3, vo.getPageSize());
					pstmt.setInt(4, vo.getPageSize());
					pstmt.setInt(5, vo.getPageNum());				
				}
				LOG.debug("3 param \n:"+vo);
				rs = pstmt.executeQuery();
				while(rs.next()){
					NoticeVO outVO=new NoticeVO();
					outVO.setNum(rs.getInt("num"));
					outVO.setSeq(rs.getString("seq"));
					outVO.setTitle(rs.getString("title"));
					outVO.setRead_cnt(rs.getString("read_cnt"));
					outVO.setContents(rs.getString("contents"));
					outVO.setReg_id(rs.getString("reg_id"));
					outVO.setReg_dt(rs.getString("reg_dt"));
					outVO.setTotal(rs.getInt("total_cnt"));
					
					list.add(outVO);
				}
				
			}catch(SQLException e){
				e.printStackTrace();
			}finally{
				JDBCReturnReso.close(rs);
				JDBCReturnReso.close(pstmt);
				JDBCReturnReso.close(conn);					
			}
			
			
			return list;
	}

}

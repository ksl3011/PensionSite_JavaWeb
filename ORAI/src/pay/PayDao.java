package pay;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import org.apache.log4j.Logger;

import cmn.ConnectionMaker;
import cmn.DTO;
import cmn.JDBCReturnReso;
import cmn.WorkDiv;
import reservation.ReservationVO;

public class PayDao implements WorkDiv {
	private final Logger LOG= Logger.getLogger(PayDao.class);
	private ConnectionMaker connectionMaker;

	public PayDao() {
		connectionMaker =new ConnectionMaker();
	}

	@Override
	public int do_insert(DTO dto) {
		PayVO vo =(PayVO) dto;
		int flag=0;
		System.out.println("1");
		Connection conn=null;
		PreparedStatement pstmt =null;
		
		try{
			StringBuilder sb=new StringBuilder();

			sb.append( "INSERT INTO payment ( 	  \n");
			sb.append( "PAY_CODE,                 \n");
			sb.append( "I_CODE,                   \n");
			sb.append( "NO,                       \n");
			sb.append( "PAY,                      \n");
			sb.append( "P_STATE,                  \n");
			sb.append( "REG_DT                    \n");
			sb.append( " ) VALUES (               \n"); 
			sb.append( "seq_board.nextval,                        \n");
			sb.append( "?,                        \n");
			sb.append( "?,                        \n");
			sb.append( "?,                        \n");
			sb.append( "0,                        \n");                        
			sb.append( "sysdate                   \n");
			sb.append( ")                         \n");
			LOG.debug("1.------------------");
			LOG.debug("1query\n"+sb.toString());
			LOG.debug("1.------------------");
			conn= connectionMaker.getConnection();
			pstmt=conn.prepareStatement(sb.toString());
			pstmt.setString(1, vo.getI_code());
			pstmt.setString(2, vo.getNo());
			pstmt.setInt(3, vo.getPay());
			
			
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
		PayVO vo = (PayVO) dto;
		int flag = 0;
		Connection conn=null;
		PreparedStatement pstmt=null;
		
		StringBuilder sb=new StringBuilder();
		sb.append("	DELETE FROM payment \n");
		sb.append("	WHERE   pay_code = ?   \n");
		try{
			
			conn= connectionMaker.getConnection();
			//transaction 관리를 개발자가 한다.
			conn.setAutoCommit(false);
			LOG.debug("1-----------------------------");
			LOG.debug("query:\n"+sb.toString());
			LOG.debug("1-----------------------------");
			pstmt=conn.prepareStatement(sb.toString());
			pstmt.setString(1,vo.getPay_code());
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
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<?> do_retrieve(DTO dto) {
		// TODO Auto-generated method stub
		return null;
	}

}

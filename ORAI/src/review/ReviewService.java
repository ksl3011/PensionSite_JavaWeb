package review;

import java.util.List;

import org.apache.log4j.Logger;

import cmn.DTO;
import notice1.NoticeVO;
import read_cnt.ReadCntVO;
import read_cnt2.ReadCntVO2;

public class ReviewService {
//View->Controller->Service->Dao
	private final Logger LOG=Logger.getLogger(ReviewDao.class);
	private ReviewDao reviewDao;
	
	//생성자의 목적은 초기화 
	public ReviewService(){
		reviewDao=new ReviewDao();
	}
	/**
	 * 
	 * @Method Name  : do_insert
	 * @작성일   : 2019. 7. 19.
	 * @작성자   : sist
	 * @변경이력  : 최초작성
	 * @Method 설명 :등록 기능 
	 * @param dto
	 * @return
	 */
	public int do_insert(DTO dto){
	 return reviewDao.do_insert(dto);
		
	}
	/**
	 * 
	 * @Method Name  : do_update
	 * @작성일   : 2019. 7. 19.
	 * @작성자   : sist
	 * @변경이력  : 최초작성
	 * @Method 설명 : 수정기능 
	 * @param dto
	 * @return
	 */
	public int do_update(DTO dto){
		return reviewDao.do_update(dto);
	}
	/**
	 * 
	 * @Method Name  : do_delete
	 * @작성일   : 2019. 7. 19.
	 * @작성자   : sist
	 * @변경이력  : 최초작성
	 * @Method 설명 :삭제기능 
	 * @param dto
	 * @return
	 */
	public int do_delete(DTO dto){
		return reviewDao.do_delete(dto);
		
	}
	//단건조회 
	public ReviewVO do_selectOne(DTO dto){
		ReviewVO inVO = (ReviewVO) dto;
		//단건조회
		ReviewVO outVO = (ReviewVO)reviewDao.do_selectOne(dto);
		
		//조회관리
		ReadCntVO2 readCntVO=new ReadCntVO2();
		readCntVO.setSeq(inVO.getSeq());
		readCntVO.setIp(inVO.getIp());
		
		//조회수 증가 
		int flag = reviewDao.do_retSelectCnt(readCntVO);
		LOG.debug("1.do_selectOne=====================");
		if(flag == 0){
			flag= reviewDao.do_retInsert(readCntVO);
			LOG.debug("0-flag------------------"+flag);
			outVO.setwFlag(flag);
		}
		LOG.debug("1.outVO"+outVO);
		LOG.debug("1.do_selectOne=====================");
				
		return outVO;
				
	}
	
	public List<ReviewVO> do_retrieve(DTO dto) {
		return (List<ReviewVO>) reviewDao.do_retrieve(dto); 
	}
	
}

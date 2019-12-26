package notice1;

import java.util.List;

import org.apache.log4j.Logger;

import cmn.DTO;
import read_cnt.ReadCntVO;


public class NoticeService {
	private final Logger LOG=Logger.getLogger(NoticeService.class);
	private NoticeDao noticeDao;
	
	//생성자의 목적은 초기화 
	public NoticeService(){
		noticeDao=new NoticeDao();
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
		return noticeDao.do_insert(dto);
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
		return noticeDao.do_update(dto);
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
		return noticeDao.do_delete(dto);
		
	}
	//단건조회 
	public NoticeVO do_selectOne(DTO dto){
		NoticeVO inVO =  (NoticeVO)dto;
		//단건조회
		NoticeVO outVO = (NoticeVO) noticeDao.do_selectOne(dto);
		//조회관리
			ReadCntVO readCntVO=new ReadCntVO();
			readCntVO.setSeq(inVO.getSeq());
			readCntVO.setIp(inVO.getIp());
		//조회수 증가 
		int flag = noticeDao.do_retSelectCnt(readCntVO);
		LOG.debug("1.do_selectOne=====================");
		if(flag == 0){
			flag= noticeDao.do_retInsert(readCntVO);
			LOG.debug("0-flag------------------"+flag);
			outVO.setwFlag(flag);
		}
		LOG.debug("1.outVO"+outVO);
		LOG.debug("1.do_selectOne=====================");
				
		return outVO;
		
	}
	//리스트조회
	public List<NoticeVO> do_retrieve(DTO dto) {
		return (List<NoticeVO>) noticeDao.do_retrieve(dto); 
	}
}

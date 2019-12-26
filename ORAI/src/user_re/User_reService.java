package user_re;

import cmn.DTO;
import user_re.User_reVO;
import roominfo_bk.RoominfoVO;

/**
 * @author sist
 *
 */
public class User_reService extends User_reDAO{
	
	public User_reService(){}
	
	
	/**
	 * @Method Name  : return_Info
	 * @작성일   : 2019. 7. 17.
	 * @작성자   : sist
	 * @변경이력  : 최초작성
	 * @Method 설명 : 예약정보 리턴
	 * @param dto
	 * @return
	 */
	public String return_Info(DTO dto){
		String result = "";
		User_reVO out= (User_reVO)this.do_selectOne_Condition(dto);
		if(null == out) out = new User_reVO();
		RoominfoVO outR = this.roomInfo(out);
		
		if(null != outR && null != out){
			result = "["
					+ out.getSDATE()
					+ " ~ "
					+ out.getEDATE()
					+ "] "
					+ outR.getRoom() + "방 "
					+ outR.getCapacity()
					+ "인"
					;
		}
		return result;
	}
	
	/**
	 * @Method Name  : reservation_Cancel
	 * @작성일   : 2019. 7. 17.
	 * @작성자   : sist
	 * @변경이력  : 최초작성
	 * @Method 설명 : 예약취소, 성공시 1 리턴
	 * @param dto
	 * @return
	 */
	public int reservation_Cancel(DTO dto){
		int flag = 0;
		System.out.println(dto.toString());
		User_reVO inVO= (User_reVO)this.do_selectOne_Condition(dto);
		System.out.println(inVO);
		if(inVO != null){
			flag = this.do_delete(inVO);
		}
		
		return flag;
	}
	
}
package pay;

import cmn.DTO;

public class PayService {
	PayDao payDao;
	public PayService() {
		payDao=new PayDao();
	}
	
	public int do_insert(DTO dto) {
		return payDao.do_insert(dto);
	}
	public int do_delete(DTO dto) {
		return payDao.do_delete(dto);
	}

}

package reservation;

import java.util.List;

import cmn.DTO;
import pay.PayDao;
import pay.PayVO;
import roominfo_bk.RoominfoVO;

public class ReservationService {
		ReservationDao dao;
		PayDao pdao;
	public ReservationService() {
		dao=new ReservationDao();
		pdao=new PayDao();
	}
	public int do_insert(DTO dto) {
		return dao.do_insert(dto);
	}
	public int do_delete(DTO dto) {
		return do_delete(dto);
		
	}
	public List<ListVO>  reservation_list(String today){
		return dao.reservation_list(today);
	}
	public int do_insert_temp(DTO dto){
		return dao.do_insert_temp(dto);
	}
	public int do_temp_seq(){
		return dao.do_temp_seq();
	}
	
	public TempVO do_temp_retrieve(String UUID){
		return dao.do_temp_retrieve(UUID);
	}
	public int pay_insert(DTO dto){
		 return pdao.do_insert(dto);
	}
	public void do_resetTable(){
		 dao.do_resetTable();
	}

}

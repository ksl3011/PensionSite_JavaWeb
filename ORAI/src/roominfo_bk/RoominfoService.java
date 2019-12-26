   package roominfo_bk;

import java.util.List;

import cmn.DTO;
import cmn.WorkDiv;

public class RoominfoService implements WorkDiv {
	RoominfoDao dao;
	public RoominfoService() {
		dao= new RoominfoDao();
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
		
		return dao.do_selectOne(dto);
	}

	@Override
	public List<?> do_retrieve(DTO dto) {
		// TODO Auto-generated method stub
		return null;
	}
	public ImgVO do_Img(DTO dto){
		return dao.do_Img(dto);
	}

}

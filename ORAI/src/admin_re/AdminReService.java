package admin_re;

import java.util.List;

import org.apache.log4j.Logger;

import cmn.DTO;

public class AdminReService {
   private final Logger LOG=Logger.getLogger(AdminReService.class);
   private AdminReDao adminReDao;
   
   //생성자의 목적은 초기화 
   public AdminReService(){
      adminReDao=new AdminReDao();
   }

   //수정
   public int do_update(DTO dto){
      return adminReDao.do_update(dto);
   }

   //리스트조회
   public List<?> do_retrieve(DTO dto) {
      return (List<AdminReVO>) adminReDao.do_retrieve(dto);
   }

}
/**
 * @Class Name : Hello.java
 * @Description : Hello
 * @Modification Information
 * @
 * @  ������      ������              ��������
 * @ ---------   ---------   -------------------------------
 * @ 2018.07.02           ���ʻ���
 *
 * @author ���������ӿ�ũ ����ȯ�� ������
 * @since 2018.07.10 
 * @version 1.0
 * @see
 *
 *  Copyright (C) by H.R. KIM All right rechart
 */

package chart;

import java.util.List;

import org.apache.log4j.Logger;

import cmn.DTO;


/**
 * @author sist
 *
 */
public class ChartService {
	final static Logger LOG = Logger.getLogger(ChartService.class);
	private ChartDAO dao;
	
	public ChartService(){
		dao = new ChartDAO();
	}
	
	public List<PiechartVO> do_RoomChart(DTO dto){
		return dao.do_RoomChart(dto);
	}
}

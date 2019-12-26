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

import cmn.DTO;

/**
 * @author sist
 *
 */
public class PiechartVO extends DTO {

	private int total;
	private String roomName;
	
	public PiechartVO(){}

	public PiechartVO(int total, String roomName) {
		super();
		this.total = total;
		this.roomName = roomName;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public String getRoomName() {
		return roomName;
	}

	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}

	@Override
	public String toString() {
		return "PiechartVO [total=" + total + ", roomName=" + roomName + "]";
	}
	
}

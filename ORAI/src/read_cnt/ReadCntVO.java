package read_cnt;

import cmn.DTO;

public class ReadCntVO extends DTO{
	/*ip주소*/
	private String ip;
	/*클릭한 게시글 번호*/
	private String seq;
	/*등록 날짜*/
	private String red_dt;
	
	public ReadCntVO(){}

	@Override
	public String toString() {
		return "ReadCntVO [ip=" + ip + ", seq=" + seq + ", red_dt=" + red_dt + "]";
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public String getSeq() {
		return seq;
	}

	public void setSeq(String seq) {
		this.seq = seq;
	}

	public String getRed_dt() {
		return red_dt;
	}

	public void setRed_dt(String red_dt) {
		this.red_dt = red_dt;
	}

	public ReadCntVO(String ip, String seq, String red_dt) {
		super();
		this.ip = ip;
		this.seq = seq;
		this.red_dt = red_dt;
	}

}
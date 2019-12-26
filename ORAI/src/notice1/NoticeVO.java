package notice1;

import cmn.DTO;

public class NoticeVO extends DTO {
	  /**게시글번호*/
	   private String seq;
	   /**게시글제목*/
	   private String title;
	   /**게시글조회수*/
	   private String read_cnt;
	   /**게시글내용*/
	   private String contents;
	   /**게시글작성자*/
	   private String reg_id;
	   /**게시글작성일*/
	   private String reg_dt;
	   /**ip주소*/
	   private String ip;
	   
	public NoticeVO(){
		
	}


	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((contents == null) ? 0 : contents.hashCode());
		result = prime * result + ((ip == null) ? 0 : ip.hashCode());
		result = prime * result + ((read_cnt == null) ? 0 : read_cnt.hashCode());
		result = prime * result + ((reg_dt == null) ? 0 : reg_dt.hashCode());
		result = prime * result + ((reg_id == null) ? 0 : reg_id.hashCode());
		result = prime * result + ((seq == null) ? 0 : seq.hashCode());
		result = prime * result + ((title == null) ? 0 : title.hashCode());
		return result;
	}


	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		NoticeVO other = (NoticeVO) obj;
		if (contents == null) {
			if (other.contents != null)
				return false;
		} else if (!contents.equals(other.contents))
			return false;
		if (ip == null) {
			if (other.ip != null)
				return false;
		} else if (!ip.equals(other.ip))
			return false;
		if (read_cnt == null) {
			if (other.read_cnt != null)
				return false;
		} else if (!read_cnt.equals(other.read_cnt))
			return false;
		if (reg_dt == null) {
			if (other.reg_dt != null)
				return false;
		} else if (!reg_dt.equals(other.reg_dt))
			return false;
		if (reg_id == null) {
			if (other.reg_id != null)
				return false;
		} else if (!reg_id.equals(other.reg_id))
			return false;
		if (seq == null) {
			if (other.seq != null)
				return false;
		} else if (!seq.equals(other.seq))
			return false;
		if (title == null) {
			if (other.title != null)
				return false;
		} else if (!title.equals(other.title))
			return false;
		return true;
	}


	public NoticeVO(String seq, String title, String read_cnt, String contents, String reg_id, String reg_dt,
			String ip) {
		super();
		this.seq = seq;
		this.title = title;
		this.read_cnt = read_cnt;
		this.contents = contents;
		this.reg_id = reg_id;
		this.reg_dt = reg_dt;
		this.ip = ip;
	}


	

	@Override
	public String toString() {
		return "NoticeVO [seq=" + seq + ", title=" + title + ", read_cnt=" + read_cnt + ", contents=" + contents
				+ ", reg_id=" + reg_id + ", reg_dt=" + reg_dt + ", ip=" + ip + "]";
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

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getRead_cnt() {
		return read_cnt;
	}

	public void setRead_cnt(String read_cnt) {
		this.read_cnt = read_cnt;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getReg_id() {
		return reg_id;
	}

	public void setReg_id(String reg_id) {
		this.reg_id = reg_id;
	}

	public String getReg_dt() {
		return reg_dt;
	}

	public void setReg_dt(String reg_dt) {
		this.reg_dt = reg_dt;
	}
	   

			
}

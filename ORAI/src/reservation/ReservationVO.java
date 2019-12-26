package reservation;

import cmn.DTO;

public class ReservationVO extends DTO {

	public ReservationVO() {
		// TODO Auto-generated constructor stub
	}
    private String no;
    private String rcode;
    private String phone;
    private int pnum;
    private String rname;
    private String sdate;
    private String reg_dt;
    private String edate;
	
    public ReservationVO(String no, String rcode, String phone, int pnum, String rname, String sdate, String reg_dt,
			String edate) {
		super();
		this.no = no;
		this.rcode = rcode;
		this.phone = phone;
		this.pnum = pnum;
		this.rname = rname;
		this.sdate = sdate;
		this.reg_dt = reg_dt;
		this.edate = edate;
	}

	@Override
	public String toString() {
		return "reservationVO [no=" + no + ", rcode=" + rcode + ", phone=" + phone + ", pnum=" + pnum + ", rname="
				+ rname + ", sdate=" + sdate + ", reg_dt=" + reg_dt + ", edate=" + edate + "]";
	}

	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public String getRcode() {
		return rcode;
	}

	public void setRcode(String rcode) {
		this.rcode = rcode;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public int getPnum() {
		return pnum;
	}

	public void setPnum(int pnum) {
		this.pnum = pnum;
	}

	public String getRname() {
		return rname;
	}

	public void setRname(String rname) {
		this.rname = rname;
	}

	public String getSdate() {
		return sdate;
	}

	public void setSdate(String sdate) {
		this.sdate = sdate;
	}

	public String getReg_dt() {
		return reg_dt;
	}

	public void setReg_dt(String reg_dt) {
		this.reg_dt = reg_dt;
	}

	public String getEdate() {
		return edate;
	}

	public void setEdate(String edate) {
		this.edate = edate;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((edate == null) ? 0 : edate.hashCode());
		result = prime * result + ((no == null) ? 0 : no.hashCode());
		result = prime * result + ((phone == null) ? 0 : phone.hashCode());
		result = prime * result + pnum;
		result = prime * result + ((rcode == null) ? 0 : rcode.hashCode());
		result = prime * result + ((reg_dt == null) ? 0 : reg_dt.hashCode());
		result = prime * result + ((rname == null) ? 0 : rname.hashCode());
		result = prime * result + ((sdate == null) ? 0 : sdate.hashCode());
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
		ReservationVO other = (ReservationVO) obj;
		if (edate == null) {
			if (other.edate != null)
				return false;
		} else if (!edate.equals(other.edate))
			return false;
		if (no == null) {
			if (other.no != null)
				return false;
		} else if (!no.equals(other.no))
			return false;
		if (phone == null) {
			if (other.phone != null)
				return false;
		} else if (!phone.equals(other.phone))
			return false;
		if (pnum != other.pnum)
			return false;
		if (rcode == null) {
			if (other.rcode != null)
				return false;
		} else if (!rcode.equals(other.rcode))
			return false;
		if (reg_dt == null) {
			if (other.reg_dt != null)
				return false;
		} else if (!reg_dt.equals(other.reg_dt))
			return false;
		if (rname == null) {
			if (other.rname != null)
				return false;
		} else if (!rname.equals(other.rname))
			return false;
		if (sdate == null) {
			if (other.sdate != null)
				return false;
		} else if (!sdate.equals(other.sdate))
			return false;
		return true;
	}

	
	
}

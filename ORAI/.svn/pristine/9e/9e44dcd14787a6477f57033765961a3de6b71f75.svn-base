package pay;

import cmn.DTO;

public class PayVO extends DTO {

	public PayVO() {
		
	}
	  private String pay_code;
	  private String  i_code;
	  private String  no;
	  private int  pay;
	  private int  p_state;
	  private String   reg_dt;
	  
	  
	public String getPay_code() {
		return pay_code;
	}
	public void setPay_code(String pay_code) {
		this.pay_code = pay_code;
	}
	public String getI_code() {
		return i_code;
	}
	public void setI_code(String i_code) {
		this.i_code = i_code;
	}
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public int getPay() {
		return pay;
	}
	public void setPay(int pay) {
		this.pay = pay;
	}
	public int getP_state() {
		return p_state;
	}
	public void setP_state(int p_state) {
		this.p_state = p_state;
	}
	public String getReg_dt() {
		return reg_dt;
	}
	public void setReg_dt(String reg_dt) {
		this.reg_dt = reg_dt;
	}
	@Override
	public String toString() {
		return "payVO [pay_code=" + pay_code + ", i_code=" + i_code + ", no=" + no + ", pay=" + pay + ", p_state="
				+ p_state + ", reg_dt=" + reg_dt + "]";
	}
	public PayVO(String pay_code, String i_code, String no, int pay, int p_state, String reg_dt) {
		super();
		this.pay_code = pay_code;
		this.i_code = i_code;
		this.no = no;
		this.pay = pay;
		this.p_state = p_state;
		this.reg_dt = reg_dt;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((i_code == null) ? 0 : i_code.hashCode());
		result = prime * result + ((no == null) ? 0 : no.hashCode());
		result = prime * result + p_state;
		result = prime * result + pay;
		result = prime * result + ((pay_code == null) ? 0 : pay_code.hashCode());
		result = prime * result + ((reg_dt == null) ? 0 : reg_dt.hashCode());
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
		PayVO other = (PayVO) obj;
		if (i_code == null) {
			if (other.i_code != null)
				return false;
		} else if (!i_code.equals(other.i_code))
			return false;
		if (no == null) {
			if (other.no != null)
				return false;
		} else if (!no.equals(other.no))
			return false;
		if (p_state != other.p_state)
			return false;
		if (pay != other.pay)
			return false;
		if (pay_code == null) {
			if (other.pay_code != null)
				return false;
		} else if (!pay_code.equals(other.pay_code))
			return false;
		if (reg_dt == null) {
			if (other.reg_dt != null)
				return false;
		} else if (!reg_dt.equals(other.reg_dt))
			return false;
		return true;
	}

}

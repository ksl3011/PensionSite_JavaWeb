package reservation;

import cmn.DTO;

public class ListVO extends DTO{
	private String rcode;
	private String room;
	private int capacity;
	private int state;
	private int rnum;
	private String reg_dt;
	private String rinfo;
	private String pen_code;
	private	int weekday;
	private int weekend;
	private int season;
	private String icode;
	private String today;
	
	public ListVO() {
		// TODO Auto-generated constructor stub
	}

	public String getRcode() {
		return rcode;
	}

	public void setRcode(String rcode) {
		this.rcode = rcode;
	}

	public String getRoom() {
		return room;
	}

	public void setRoom(String room) {
		this.room = room;
	}

	public int getCapacity() {
		return capacity;
	}

	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

	public String getReg_dt() {
		return reg_dt;
	}

	public void setReg_dt(String reg_dt) {
		this.reg_dt = reg_dt;
	}

	public String getRinfo() {
		return rinfo;
	}

	public void setRinfo(String rinfo) {
		this.rinfo = rinfo;
	}

	public String getPen_code() {
		return pen_code;
	}

	public void setPen_code(String pen_code) {
		this.pen_code = pen_code;
	}

	public int getWeekday() {
		return weekday;
	}

	public void setWeekday(int weekday) {
		this.weekday = weekday;
	}

	public int getWeekend() {
		return weekend;
	}

	public void setWeekend(int weekend) {
		this.weekend = weekend;
	}

	public int getSeason() {
		return season;
	}

	public void setSeason(int season) {
		this.season = season;
	}

	public String getIcode() {
		return icode;
	}

	public void setIcode(String icode) {
		this.icode = icode;
	}

	public String getToday() {
		return today;
	}

	public void setToday(String today) {
		this.today = today;
	}

	@Override
	public String toString() {
		return "ListVO [rcode=" + rcode + ", room=" + room + ", capacity=" + capacity + ", state=" + state + ", rnum="
				+ rnum + ", reg_dt=" + reg_dt + ", rinfo=" + rinfo + ", pen_code=" + pen_code + ", weekday=" + weekday
				+ ", weekend=" + weekend + ", season=" + season + ", icode=" + icode + ", today=" + today
				+ ", getRcode()=" + getRcode() + ", getRoom()=" + getRoom() + ", getCapacity()=" + getCapacity()
				+ ", getState()=" + getState() + ", getRnum()=" + getRnum() + ", getReg_dt()=" + getReg_dt()
				+ ", getRinfo()=" + getRinfo() + ", getPen_code()=" + getPen_code() + ", getWeekday()=" + getWeekday()
				+ ", getWeekend()=" + getWeekend() + ", getSeason()=" + getSeason() + ", getIcode()=" + getIcode()
				+ ", getToday()=" + getToday() + ", toString()=" + super.toString() + ", getTotal()=" + getTotal()
				+ ", getNum()=" + getNum() + ", getwFlag()=" + getwFlag() + ", getClass()=" + getClass()
				+ ", hashCode()=" + hashCode() + "]";
	}

	public ListVO(String rcode, String room, int capacity, int state, int rnum, String reg_dt, String rinfo,
			String pen_code, int weekday, int weekend, int season, String icode, String today) {
		super();
		this.rcode = rcode;
		this.room = room;
		this.capacity = capacity;
		this.state = state;
		this.rnum = rnum;
		this.reg_dt = reg_dt;
		this.rinfo = rinfo;
		this.pen_code = pen_code;
		this.weekday = weekday;
		this.weekend = weekend;
		this.season = season;
		this.icode = icode;
		this.today = today;
	}

	

}

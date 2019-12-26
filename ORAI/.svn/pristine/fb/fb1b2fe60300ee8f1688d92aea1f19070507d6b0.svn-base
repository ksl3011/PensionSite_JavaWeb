package sights;

import cmn.DTO;

public class SightsVO extends DTO{
	private String s_name       ;
	private String pen_code     ;
	private String location     ;
	private String d_location   ;
	private double s_latitude      ;
	private double s_longitude		;
	private double latitude		;
	private double longitude		;
	
	
	public SightsVO(){}


	public String getS_name() {
		return s_name;
	}


	public void setS_name(String s_name) {
		this.s_name = s_name;
	}


	public String getPen_code() {
		return pen_code;
	}


	public void setPen_code(String pen_code) {
		this.pen_code = pen_code;
	}


	public String getLocation() {
		return location;
	}


	public void setLocation(String location) {
		this.location = location;
	}


	public String getD_location() {
		return d_location;
	}


	public void setD_location(String d_location) {
		this.d_location = d_location;
	}


	public double getS_latitude() {
		return s_latitude;
	}


	public void setS_latitude(double s_latitude) {
		this.s_latitude = s_latitude;
	}


	public double getS_longitude() {
		return s_longitude;
	}


	public void setS_longitude(double s_longitude) {
		this.s_longitude = s_longitude;
	}


	public double getLatitude() {
		return latitude;
	}


	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}


	public double getLongitude() {
		return longitude;
	}


	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}


	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((d_location == null) ? 0 : d_location.hashCode());
		long temp;
		temp = Double.doubleToLongBits(latitude);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		result = prime * result + ((location == null) ? 0 : location.hashCode());
		temp = Double.doubleToLongBits(longitude);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		result = prime * result + ((pen_code == null) ? 0 : pen_code.hashCode());
		temp = Double.doubleToLongBits(s_latitude);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		temp = Double.doubleToLongBits(s_longitude);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		result = prime * result + ((s_name == null) ? 0 : s_name.hashCode());
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
		SightsVO other = (SightsVO) obj;
		if (d_location == null) {
			if (other.d_location != null)
				return false;
		} else if (!d_location.equals(other.d_location))
			return false;
		if (Double.doubleToLongBits(latitude) != Double.doubleToLongBits(other.latitude))
			return false;
		if (location == null) {
			if (other.location != null)
				return false;
		} else if (!location.equals(other.location))
			return false;
		if (Double.doubleToLongBits(longitude) != Double.doubleToLongBits(other.longitude))
			return false;
		if (pen_code == null) {
			if (other.pen_code != null)
				return false;
		} else if (!pen_code.equals(other.pen_code))
			return false;
		if (Double.doubleToLongBits(s_latitude) != Double.doubleToLongBits(other.s_latitude))
			return false;
		if (Double.doubleToLongBits(s_longitude) != Double.doubleToLongBits(other.s_longitude))
			return false;
		if (s_name == null) {
			if (other.s_name != null)
				return false;
		} else if (!s_name.equals(other.s_name))
			return false;
		return true;
	}


	@Override
	public String toString() {
		return "SightsVO [s_name=" + s_name + ", pen_code=" + pen_code + ", location=" + location + ", d_location="
				+ d_location + ", s_latitude=" + s_latitude + ", s_longitude=" + s_longitude + ", latitude=" + latitude
				+ ", longitude=" + longitude + "]";
	}


	public SightsVO(String s_name, String pen_code, String location, String d_location, double s_latitude,
			double s_longitude, double latitude, double longitude) {
		super();
		this.s_name = s_name;
		this.pen_code = pen_code;
		this.location = location;
		this.d_location = d_location;
		this.s_latitude = s_latitude;
		this.s_longitude = s_longitude;
		this.latitude = latitude;
		this.longitude = longitude;
	}
	
	
	
}


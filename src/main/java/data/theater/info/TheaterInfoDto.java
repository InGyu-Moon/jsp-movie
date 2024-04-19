package data.theater.info;

public class TheaterInfoDto { // 극장
	private String theaterId;
	private Region region;
	private String branch;
	private String numberOfscreens;
	private String totalTheaterSeats;
	private String address;
	private String theaterPhoneNumber;
	private String isImax;
	private String is4D;
	
	
	public String getTheaterId() {
		return theaterId;
	}
	public void setTheaterId(String theaterId) {
		this.theaterId = theaterId;
	}
	public Region getRegion() {
		return region;
	}
	public void setRegion(Region region) {
		this.region = region;
	}
	public String getBranch() {
		return branch;
	}
	public void setBranch(String branch) {
		this.branch = branch;
	}
	public String getNumberOfscreens() {
		return numberOfscreens;
	}
	public void setNumberOfscreens(String numberOfscreens) {
		this.numberOfscreens = numberOfscreens;
	}
	public String getTotalTheaterSeats() {
		return totalTheaterSeats;
	}
	public void setTotalTheaterSeats(String totalTheaterSeats) {
		this.totalTheaterSeats = totalTheaterSeats;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getTheaterPhoneNumber() {
		return theaterPhoneNumber;
	}
	public void setTheaterPhoneNumber(String theaterPhoneNumber) {
		this.theaterPhoneNumber = theaterPhoneNumber;
	}
	public String getIsImax() {
		return isImax;
	}
	public void setIsImax(String isImax) {
		this.isImax = isImax;
	}
	public String getIs4D() {
		return is4D;
	}
	public void setIs4D(String is4d) {
		is4D = is4d;
	}
	@Override
	public String toString() {
		return "TheaterInfoDto [theaterId=" + theaterId + ", region=" + region + ", branch=" + branch
				+ ", numberOfscreens=" + numberOfscreens + ", totalTheaterSeats=" + totalTheaterSeats + ", address="
				+ address + ", theaterPhoneNumber=" + theaterPhoneNumber + ", isImax=" + isImax + ", is4D=" + is4D
				+ "]";
	}
	
	

}

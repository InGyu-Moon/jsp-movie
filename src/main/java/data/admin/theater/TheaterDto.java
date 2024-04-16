package data.admin.theater;

public class TheaterDto {
	private String theaterId;
	private Region region; // 지역
	private String branch; // 지점
	private String numberOfScreens; // 상영관수
	private String totalTheaterScreens; // 총 좌석수
	private String address; // 상세주소
	private String theaterPhoneNumber; // 전화번호
	private Integer isIMAX; // 전화번호
	private Integer is4D; // 전화번호
	private String img; // 배너 이미지
	
	
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
	public String getNumberOfScreens() {
		return numberOfScreens;
	}
	public void setNumberOfScreens(String numberOfScreens) {
		this.numberOfScreens = numberOfScreens;
	}
	public String getTotalTheaterScreens() {
		return totalTheaterScreens;
	}
	public void setTotalTheaterScreens(String totalTheaterScreens) {
		this.totalTheaterScreens = totalTheaterScreens;
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
	public Integer getIsIMAX() {
		return isIMAX;
	}
	public void setIsIMAX(Integer isIMAX) {
		this.isIMAX = isIMAX;
	}
	public Integer getIs4D() {
		return is4D;
	}
	public void setIs4D(Integer is4d) {
		is4D = is4d;
	}
	
	
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	@Override
	public String toString() {
		return "TheaterDto [theaterId=" + theaterId + ", region=" + region + ", branch=" + branch + ", numberOfScreens="
				+ numberOfScreens + ", totalTheaterScreens=" + totalTheaterScreens + ", address=" + address
				+ ", theaterPhoneNumber=" + theaterPhoneNumber + ", isIMAX=" + isIMAX + ", is4D=" + is4D + ", img="
				+ img + "]";
	}
	
	
	
	
}

package data.movie.theaterscreen;

public class TheaterScreenDto {
	private String theaterScreenId;
	private String theaterId;
	private String totalSeats;
	private String screenInfo;
	private String screenName;
	
	
	public String getTheaterScreenId() {
		return theaterScreenId;
	}
	public void setTheaterScreenId(String theaterScreenId) {
		this.theaterScreenId = theaterScreenId;
	}
	public String getTheaterId() {
		return theaterId;
	}
	public void setTheaterId(String theaterId) {
		this.theaterId = theaterId;
	}
	public String getTotalSeats() {
		return totalSeats;
	}
	public void setTotalSeats(String totalSeats) {
		this.totalSeats = totalSeats;
	}
	public String getScreenInfo() {
		return screenInfo;
	}
	public void setScreenInfo(String screenInfo) {
		this.screenInfo = screenInfo;
	}
	public String getScreenName() {
		return screenName;
	}
	public void setScreenName(String screenName) {
		this.screenName = screenName;
	}
	@Override
	public String toString() {
		return "TheaterScreenDto [theaterScreenId=" + theaterScreenId + ", theaterId=" + theaterId + ", totalSeats="
				+ totalSeats + ", screenInfo=" + screenInfo + ", screenName=" + screenName + "]";
	}
	
	
}

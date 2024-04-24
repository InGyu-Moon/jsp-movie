package data.movie.screening;

import java.sql.Date;
import java.sql.Timestamp;

public class ScreeningDto {
	private String screeningInfoId;
	private String theaterId;
	private String theaterScreenId;
	private String movieId;
	private Date screeningDate;
	private Timestamp screeningTime;
	//====================================== 상영관 데이터 추가
	private String totalSeats;
	private String screenInfo;
	private String screenName;
	
	
	public String getScreeningInfoId() {
		return screeningInfoId;
	}
	public void setScreeningInfoId(String screeningInfoId) {
		this.screeningInfoId = screeningInfoId;
	}
	public String getTheaterId() {
		return theaterId;
	}
	public void setTheaterId(String theaterId) {
		this.theaterId = theaterId;
	}
	public String getTheaterScreenId() {
		return theaterScreenId;
	}
	public void setTheaterScreenId(String theaterScreenId) {
		this.theaterScreenId = theaterScreenId;
	}
	public String getMovieId() {
		return movieId;
	}
	public void setMovieId(String movieId) {
		this.movieId = movieId;
	}
	public Date getScreeningDate() {
		return screeningDate;
	}
	public void setScreeningDate(Date screeningDate) {
		this.screeningDate = screeningDate;
	}
	public Timestamp getScreeningTime() {
		return screeningTime;
	}
	public void setScreeningTime(Timestamp screeningTime) {
		this.screeningTime = screeningTime;
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
		return "ScreeningDto [screeningInfoId=" + screeningInfoId + ", theaterId=" + theaterId + ", theaterScreenId="
				+ theaterScreenId + ", movieId=" + movieId + ", screeningDate=" + screeningDate + ", screeningTime="
				+ screeningTime + "]";
	}
	
}

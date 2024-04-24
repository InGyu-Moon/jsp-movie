package data.theater.info;

import java.sql.Date;
import java.sql.Time;

public class TheaterDto {
	// MOVIE_INFO
	private String movieId;
	private String movieTitle;
	private String genre;
	private String runningTime;
	private Date releaseDate;
	private String viewingRating;

	// THEATER_INFO
	private String theaterId;
	private String region; // 지역
	private String branch; // 지점
	private String numberOfScreens; // 상영관수
	private String totalTheaterSeats; // 총 좌석수
	private String address; // 상세주소
	private String theaterPhoneNumber; // 전화번호
	private int isIMAX; // 전화번호
	private int is4D; // 전화번호
	private String img; // 배너 이미지

	// THEATER_SCREEN
	private String theaterScreenId;
	// private String theaterID
	private String totalSeats;
	private String screenInfo;
	private String screenName;

	// SCREENING_INFO
	private String screeningInfoId;
	// private String theaterID
	// private String screenId = theaterScreenId
	private Date screeningDate;
	private Time screeningTime;

	public String getMovieId() {
		return movieId;
	}

	public void setMovieId(String movieId) {
		this.movieId = movieId;
	}

	public String getMovieTitle() {
		return movieTitle;
	}

	public void setMovieTitle(String movieTitle) {
		this.movieTitle = movieTitle;
	}

	public String getGenre() {
		return genre;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}

	public String getRunningTime() {
		return runningTime;
	}

	public void setRunningTime(String runningTime) {
		this.runningTime = runningTime;
	}

	public Date getReleaseDate() {
		return releaseDate;
	}

	public void setReleaseDate(Date releaseDate) {
		this.releaseDate = releaseDate;
	}

	public String getViewingRating() {
		return viewingRating;
	}

	public void setViewingRating(String viewingRating) {
		this.viewingRating = viewingRating;
	}

	public String getTheaterId() {
		return theaterId;
	}

	public void setTheaterId(String theaterId) {
		this.theaterId = theaterId;
	}

	public String getRegion() {
		return region;
	}

	public void setRegion(String region) {
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

	public int getIsIMAX() {
		return isIMAX;
	}

	public void setIsIMAX(int isIMAX) {
		this.isIMAX = isIMAX;
	}

	public int getIs4D() {
		return is4D;
	}

	public void setIs4D(int is4d) {
		is4D = is4d;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getTheaterScreenId() {
		return theaterScreenId;
	}

	public void setTheaterScreenId(String theaterScreenId) {
		this.theaterScreenId = theaterScreenId;
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

	public String getScreeningInfoId() {
		return screeningInfoId;
	}

	public void setScreeningInfoId(String screeningInfoId) {
		this.screeningInfoId = screeningInfoId;
	}

	public Date getScreeningDate() {
		return screeningDate;
	}

	public void setScreeningDate(Date screeningDate) {
		this.screeningDate = screeningDate;
	}

	public Time getScreeningTime() {
		return screeningTime;
	}

	public void setScreeningTime(Time screeningTime) {
		this.screeningTime = screeningTime;
	}

}

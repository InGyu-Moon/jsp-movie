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
	private String theater_id;
	private String region; // 지역
	private String branch; // 지점
	private String number_of_screens; // 상영관수
	private String total_theater_seats; // 총 좌석수
	private String address; // 상세주소
	private String theater_phone_number; // 전화번호
	private int is_imax; // 전화번호
	private int is_4d; // 전화번호
	private String theater_img; // 배너 이미지

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

	public String getTheater_id() {
		return theater_id;
	}

	public void setTheater_id(String theater_id) {
		this.theater_id = theater_id;
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

	public String getNumber_of_screens() {
		return number_of_screens;
	}

	public void setNumber_of_screens(String number_of_screens) {
		this.number_of_screens = number_of_screens;
	}

	public String getTotal_theater_seats() {
		return total_theater_seats;
	}

	public void setTotal_theater_seats(String total_theater_seats) {
		this.total_theater_seats = total_theater_seats;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getTheater_phone_number() {
		return theater_phone_number;
	}

	public void setTheater_phone_number(String theater_phone_number) {
		this.theater_phone_number = theater_phone_number;
	}

	public int getIs_imax() {
		return is_imax;
	}

	public void setIs_imax(int is_imax) {
		this.is_imax = is_imax;
	}

	public int getIs_4d() {
		return is_4d;
	}

	public void setIs_4d(int is_4d) {
		this.is_4d = is_4d;
	}

	public String getTheater_img() {
		return theater_img;
	}

	public void setTheater_img(String theater_img) {
		this.theater_img = theater_img;
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

	@Override
	public String toString() {
		return "TheaterDto [theater_id=" + theater_id + ", region=" + region + ", branch=" + branch
				+ ", number_of_screens=" + number_of_screens + ", total_theater_seats=" + total_theater_seats
				+ ", address=" + address + ", theater_phone_number=" + theater_phone_number + ", theater_img="
				+ theater_img + ", is_imax=" + is_imax + ", is_4d=" + is_4d + "]";
	}

}

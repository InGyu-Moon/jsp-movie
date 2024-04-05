package data.movie.movieinfo;

import java.sql.Date;

public class MovieDto {
	private int id; //영화id
	private String movieTitle; //영화제목 
	private int runningTime; //러닝타임
	private String viewingRating; //영화 등급 enum
	private String director; //감독
	private String cast; //배우진
	private String bookingRate; // 예매율
	private Date releaseDate; // 개봉일
	private String genre; // 장르
	private String gmovieDescription; // 영화소개
	private String country; // 나라
	private String rating; // 평점
	private String endDate; // 상영종료일
	private String movieDetailLink; // 영화 링크
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getMovieTitle() {
		return movieTitle;
	}
	public void setMovieTitle(String movieTitle) {
		this.movieTitle = movieTitle;
	}
	public int getRunningTime() {
		return runningTime;
	}
	public void setRunningTime(int runningTime) {
		this.runningTime = runningTime;
	}
	public String getViewingRating() {
		return viewingRating;
	}
	public void setViewingRating(String viewingRating) {
		this.viewingRating = viewingRating;
	}
	public String getDirector() {
		return director;
	}
	public void setDirector(String director) {
		this.director = director;
	}
	public String getCast() {
		return cast;
	}
	public void setCast(String cast) {
		this.cast = cast;
	}
	public String getBookingRate() {
		return bookingRate;
	}
	public void setBookingRate(String bookingRate) {
		this.bookingRate = bookingRate;
	}
	public Date getReleaseDate() {
		return releaseDate;
	}
	public void setReleaseDate(Date releaseDate) {
		this.releaseDate = releaseDate;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public String getGmovieDescription() {
		return gmovieDescription;
	}
	public void setGmovieDescription(String gmovieDescription) {
		this.gmovieDescription = gmovieDescription;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getRating() {
		return rating;
	}
	public void setRating(String rating) {
		this.rating = rating;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getMovieDetailLink() {
		return movieDetailLink;
	}
	public void setMovieDetailLink(String movieDetailLink) {
		this.movieDetailLink = movieDetailLink;
	}
	
	
	@Override
	public String toString() {
		return "MovieDto [id=" + id + ", movieTitle=" + movieTitle + ", runningTime=" + runningTime + ", viewingRating="
				+ viewingRating + ", director=" + director + ", cast=" + cast + ", bookingRate=" + bookingRate
				+ ", releaseDate=" + releaseDate + ", genre=" + genre + ", gmovieDescription=" + gmovieDescription
				+ ", country=" + country + ", rating=" + rating + ", endDate=" + endDate + "]";
	}
	
}

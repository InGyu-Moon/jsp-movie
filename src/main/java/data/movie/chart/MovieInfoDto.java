package data.movie.chart;

import java.sql.Date;
import java.util.List;

public class MovieInfoDto {

	private String movie_id;
	private String movie_title;
	private int running_time;
	private String viewing_rating;
	private String director;
	private String cast;
	private double booking_rate;
	private Date release_date;
	private String genre;
	private String movie_description;
	private double rating;
	private Date end_date;
	private String country;
	private List<MovieImgDto> imgs;
	private String image_link;

	public String getMovie_id() {
		return movie_id;
	}

	public void setMovie_id(String movie_id) {
		this.movie_id = movie_id;
	}

	public String getMovie_title() {
		return movie_title;
	}

	public void setMovie_title(String movie_title) {
		this.movie_title = movie_title;
	}

	public int getRunning_time() {
		return running_time;
	}

	public void setRunning_time(int running_time) {
		this.running_time = running_time;
	}

	public String getViewing_rating() {
		return viewing_rating;
	}

	public void setViewing_rating(String viewing_rating) {
		this.viewing_rating = viewing_rating;
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

	public double getBooking_rate() {
		return booking_rate;
	}

	public void setBooking_rate(double booking_rate) {
		this.booking_rate = booking_rate;
	}

	public Date getRelease_date() {
		return release_date;
	}

	public void setRelease_date(Date release_date) {
		this.release_date = release_date;
	}

	public String getGenre() {
		return genre;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}

	public String getMovie_description() {
		return movie_description;
	}

	public void setMovie_description(String movie_description) {
		this.movie_description = movie_description;
	}

	public double getRating() {
		return rating;
	}

	public void setRating(double rating) {
		this.rating = rating;
	}

	public Date getEnd_date() {
		return end_date;
	}

	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public List<MovieImgDto> getImgs() {
		return imgs;
	}

	public void setImgs(List<MovieImgDto> imgs) {
		this.imgs = imgs;
	}

	public String getImage_link() {
		return image_link;
	}

	public void setImage_link(String image_link) {
		this.image_link = image_link;
	}
	
	

}

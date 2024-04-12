package data.ticket;

public class TicketDto {
	private String theater_id;
	private String region;
	private String branch;
	private int number_of_screens;
	private int total_theater_seats;
	private String address;
	private String theater_phone_number;
	private String theater_img;
	private int is_imax;
	private int is_4d;

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

	public int getNumber_of_screens() {
		return number_of_screens;
	}

	public void setNumber_of_screens(int number_of_screens) {
		this.number_of_screens = number_of_screens;
	}

	public int getTotal_theater_seats() {
		return total_theater_seats;
	}

	public void setTotal_theater_seats(int total_theater_seats) {
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

	public String getTheater_img() {
		return theater_img;
	}

	public void setTheater_img(String theater_img) {
		this.theater_img = theater_img;
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

}

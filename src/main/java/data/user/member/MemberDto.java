package data.user.member;

import java.sql.Date;

public class MemberDto {
	private int id;
	private String userName;
	private String password;
	private String name;
	private String gender;
	private String email;
	private Date birthdate;
	private String address;
	private String phoneNumber;
	private String userPhoto;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getBirthdate() {
		return birthdate;
	}
	public void setBirthdate(Date birthdate) {
		this.birthdate = birthdate;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getUserPhoto() {
		return userPhoto;
	}
	public void setUserPhoto(String userPhoto) {
		this.userPhoto = userPhoto;
	}
	
	
	@Override
	public String toString() {
		return "MemberDto [id=" + id + ", userName=" + userName + ", password=" + password + ", name=" + name
				+ ", gender=" + gender + ", email=" + email + ", birthdate=" + birthdate + ", address=" + address
				+ ", phoneNumber=" + phoneNumber + ", userPhoto=" + userPhoto + "]";
	}
	
	
}

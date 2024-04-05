package user.nonmember;

import java.sql.Date;

public class NonMemberDto {
	private int id;
	private Date birthdate;
	private String phoneNumber;
	private int verificationCode; // 폰 번호로 인증
	private String password; // 나중에 비회원 조회 시 인증 password
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Date getBirthdate() {
		return birthdate;
	}
	public void setBirthdate(Date birthdate) {
		this.birthdate = birthdate;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public int getVerificationCode() {
		return verificationCode;
	}
	public void setVerificationCode(int verificationCode) {
		this.verificationCode = verificationCode;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	@Override
	public String toString() {
		return "NonMemberDto [id=" + id + ", birthdate=" + birthdate + ", phoneNumber=" + phoneNumber
				+ ", verificationCode=" + verificationCode + ", password=" + password + "]";
	}
	
	
}

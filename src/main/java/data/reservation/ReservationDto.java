package data.reservation;

import java.sql.Timestamp;

public class ReservationDto {
	private String reservationId; //예매id
	private String screeningInfoId; //상영정보id
	private String memberId; //회원id
	private String nonMemberId; //비회원id
	private String reservedSeats; //예매좌석
	private String amount; //금액
	private String paymentMethod; //결제방법
	private Timestamp paymentTime; //결제시간
	private String paymentStatus; //결제상태
	
	
	public String getReservationId() {
		return reservationId;
	}
	public void setReservationId(String reservationId) {
		this.reservationId = reservationId;
	}
	public String getScreeningInfoId() {
		return screeningInfoId;
	}
	public void setScreeningInfoId(String screeningInfoId) {
		this.screeningInfoId = screeningInfoId;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getNonMemberId() {
		return nonMemberId;
	}
	public void setNonMemberId(String nonMemberId) {
		this.nonMemberId = nonMemberId;
	}
	public String getReservedSeats() {
		return reservedSeats;
	}
	public void setReservedSeats(String reservedSeats) {
		this.reservedSeats = reservedSeats;
	}
	public String getAmount() {
		return amount;
	}
	public void setAmount(String amount) {
		this.amount = amount;
	}
	public String getPaymentMethod() {
		return paymentMethod;
	}
	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}
	public Timestamp getPaymentTime() {
		return paymentTime;
	}
	public void setPaymentTime(Timestamp paymentTime) {
		this.paymentTime = paymentTime;
	}
	public String getPaymentStatus() {
		return paymentStatus;
	}
	public void setPaymentStatus(String paymentStatus) {
		this.paymentStatus = paymentStatus;
	}
	@Override
	public String toString() {
		return "ReservationDto [reservationId=" + reservationId + ", screeningInfoId=" + screeningInfoId + ", memberId="
				+ memberId + ", nonMemberId=" + nonMemberId + ", reservedSeats=" + reservedSeats + ", amount=" + amount
				+ ", paymentMethod=" + paymentMethod + ", paymentTime=" + paymentTime + ", paymentStatus="
				+ paymentStatus + "]";
	}
	
}

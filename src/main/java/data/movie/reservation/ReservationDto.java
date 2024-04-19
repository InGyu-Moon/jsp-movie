package data.movie.reservation;

import java.security.Timestamp;

public class ReservationDto {
	private int id; // 예매결제id
	private int screeningId; // 상영정보id
	private int memberId; // 회원id
	private int nonMemberId; // 비회원id
	private int reservedSeats; // 예매 좌석수
	private int amount; // 금액
	private String paymentMethod; // 결제방법
	private Timestamp paymenTime; // 결제시간
	private PaymentStatus paymentStatus; // 결제상태 -> enum 타입
	
}

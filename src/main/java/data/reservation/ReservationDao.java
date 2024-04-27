package data.reservation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import data.movie.screening.ScreeningDto;
import data.theater.info.TheaterDto;
import data.user.member.Gender;
import data.user.member.MemberDto;
import db.mysql.DbConnect;

public class ReservationDao {
	DbConnect db = new DbConnect();

	// 영화 선택 시 지점 출력
	public List<TheaterDto> screenIsList(String movieTitle) {
		List<TheaterDto> list = new ArrayList<>();
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = db.getConnection();
			String sql = "SELECT T.region 지역, T.branch 지점 FROM ((select movie_id from movie_info where movie_title=?) M JOIN screening_info S ON M.movie_id=S.movie_id) "
					+ "JOIN THEATER_INFO T ON T.theater_id=S.theater_id ";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				TheaterDto dto = new TheaterDto();
				dto.setBranch(rs.getString("branch"));
				dto.setRegion(rs.getString("region"));
				
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}

		return list;
	}

	// 해당 영화의 예매된 좌석
	public ArrayList<String> getReservedSeat(String screeningInfoId){
		Connection conn = db.getConnection();;
		PreparedStatement pstmt = null;
		ResultSet rs = null;


		String sql = "select RESERVED_SEATS from RESERVATION_INFO where SCREENING_INFO_ID = ? and PAYMENT_STATUS = 'Completed'";

		ArrayList<String> reservedSeats = new ArrayList<>();

        try {
            pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, screeningInfoId);

			rs = pstmt.executeQuery();
			while(rs.next()){
				reservedSeats.add(rs.getString("RESERVED_SEATS"));
			}
        } catch (SQLException e) {
			System.out.println("e = " + e);
        }finally {
			db.dbClose(rs,pstmt,conn);
		}
		return reservedSeats;
    }

	//영화 예매 (회원)
	public void insertReservation(ReservationDto reservationDto){
		Connection conn = db.getConnection();;
		PreparedStatement pstmt = null;

		String sql = "insert into RESERVATION_INFO value (null,?,?,null,?,?,?,DATE_ADD(now(), INTERVAL 9 HOUR),'Completed' )";

        try {
            pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,reservationDto.getScreeningInfoId());
			pstmt.setString(2,reservationDto.getMemberId());
			pstmt.setString(3,reservationDto.getReservedSeats());
			pstmt.setString(4,reservationDto.getAmount());
			pstmt.setString(5,reservationDto.getPaymentMethod());
			pstmt.executeUpdate();
        } catch (SQLException e) {
			System.out.println("e = " + e);
        }finally {
			db.dbClose(pstmt,conn);
		}

    }

	//전제 예약 목록
	public List<ReservationDto> getAllReservationInfo(){
		Connection conn = db.getConnection();;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		List<ReservationDto> list = new ArrayList<>();

		String sql="select * from RESERVATION_INFO order by reservation_id desc";

        try {
            pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				ReservationDto dto = new ReservationDto();
				dto.setReservationId(rs.getString("reservation_id"));
				dto.setReservedSeats(rs.getString("reserved_seats"));
				dto.setMemberId(rs.getString("member_id"));
				dto.setNonMemberId(rs.getString("non_member_id"));
				dto.setScreeningInfoId(rs.getString("screening_info_id"));
				dto.setAmount(rs.getString("amount"));
				dto.setPaymentMethod(rs.getString("payment_method"));
				dto.setPaymentTime(rs.getTimestamp("payment_time"));
				dto.setPaymentStatus(rs.getString("payment_status"));
				list.add(dto);
			}

        } catch (SQLException e) {
			System.out.println("e = " + e);
        }finally {
			db.dbClose(rs,pstmt,conn);
		}

		return list;
    }

	public int getCount() {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select count(*) from RESERVATION_INFO";
		int count = 0;

		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				count = rs.getInt(1);
			}

		} catch (Exception ex) {
			System.out.println("ex = " + ex);
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		return count;
	}

	public List<ReservationDto> getList(int start, int perPage) {

		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		List<ReservationDto> list = new ArrayList<>();

		String sql = "select * from RESERVATION_INFO order by reservation_id desc limit ?,?";

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, start);
			pstmt.setInt(2, perPage);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				ReservationDto dto = new ReservationDto();
				dto.setReservationId(rs.getString("reservation_id"));
				dto.setReservedSeats(rs.getString("reserved_seats"));
				dto.setMemberId(rs.getString("member_id"));
				dto.setNonMemberId(rs.getString("non_member_id"));
				dto.setScreeningInfoId(rs.getString("screening_info_id"));
				dto.setAmount(rs.getString("amount"));
				dto.setPaymentMethod(rs.getString("payment_method"));
				dto.setPaymentTime(rs.getTimestamp("payment_time"));
				dto.setPaymentStatus(rs.getString("payment_status"));
				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		return list;
	}

	public ReservationDto getReservationInfoById(String reservationId){
		Connection conn = db.getConnection();;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		ReservationDto dto = new ReservationDto();

		String sql="select * from RESERVATION_INFO where reservation_id = ?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,reservationId);
			rs = pstmt.executeQuery();
			if(rs.next()){
				dto.setReservationId(rs.getString("reservation_id"));
				dto.setReservedSeats(rs.getString("reserved_seats"));
				dto.setMemberId(rs.getString("member_id"));
				dto.setNonMemberId(rs.getString("non_member_id"));
				dto.setScreeningInfoId(rs.getString("screening_info_id"));
				dto.setAmount(rs.getString("amount"));
				dto.setPaymentMethod(rs.getString("payment_method"));
				dto.setPaymentTime(rs.getTimestamp("payment_time"));
				dto.setPaymentStatus(rs.getString("payment_status"));
			}

		} catch (SQLException e) {
			System.out.println("e = " + e);
		}finally {
			db.dbClose(rs,pstmt,conn);
		}

		return dto;
	}

	public String getBranchByScreeningInfoId(String id){
		Connection conn = db.getConnection();;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select BRANCH from SCREENING_INFO inner join THEATER_INFO on SCREENING_INFO.THEATER_ID = THEATER_INFO.THEATER_ID where SCREENING_INFO_ID = ?";
		String branch = "없음";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,id);
			rs = pstmt.executeQuery();
			if(rs.next()){
				branch=rs.getString("branch");
			}
		} catch (SQLException e) {
			System.out.println("e = " + e);
		}finally {
			db.dbClose(rs,pstmt,conn);
		}
		return branch;
	}
	public String getMovieNameByScreeningInfoId(String id){
		Connection conn = db.getConnection();;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select MOVIE_TITLE\n" +
				"from SCREENING_INFO\n" +
				"         inner join MOVIE_INFO on SCREENING_INFO.MOVIE_ID = MOVIE_INFO.MOVIE_ID\n" +
				"where SCREENING_INFO_ID = ?";

		String movie = "없음";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,id);
			rs = pstmt.executeQuery();
			if(rs.next()){
				movie=rs.getString("MOVIE_TITLE");
			}
		} catch (SQLException e) {
			System.out.println("e = " + e);
		}finally {
			db.dbClose(rs,pstmt,conn);
		}
		return movie;
	}
	public List<Timestamp> getScreenTime(String id){
		Connection conn = db.getConnection();;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select SCREENING_DATE,SCREENING_TIME from SCREENING_INFO where SCREENING_INFO_ID = ?";
		List<Timestamp> list = new ArrayList<>();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,id);
			rs = pstmt.executeQuery();
			if(rs.next()){
				list.add(rs.getTimestamp("SCREENING_DATE"));
				list.add(rs.getTimestamp("SCREENING_TIME"));
			}
		} catch (SQLException e) {
			System.out.println("e = " + e);
		}finally {
			db.dbClose(rs,pstmt,conn);
		}
		return list;
	}


	public void updateReservationStatus(String id){
		Connection conn = db.getConnection();;
		PreparedStatement pstmt = null;

		String sql = "update RESERVATION_INFO set PAYMENT_STATUS = 'Cancelled' where reservation_id = ?";

        try {
            pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,id);
			pstmt.executeUpdate();
        } catch (SQLException e) {
			System.out.println("e = " + e);
        }finally {
			db.dbClose(pstmt,conn);
		}
    }

	public List<String> getReservedMovieListByMemberId(String memberId){
		Connection conn = db.getConnection();;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<String> list = new ArrayList<>();

		String sql = "SELECT DISTINCT SCREENING_INFO_ID\n" +
				"from RESERVATION_INFO\n" +
				"where MEMBER_ID = ?\n" +
				"  and PAYMENT_STATUS = 'Completed'";

        try {
            pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,memberId);
			rs = pstmt.executeQuery();
			while(rs.next()){
				list.add(rs.getString("SCREENING_INFO_ID"));
			}
        } catch (SQLException e) {
			System.out.println("e = " + e);
        } finally {
			db.dbClose(rs,pstmt,conn);
		}
        return list;
	}

	public ReservationInfoDto getReservationInfoByMemberIdAndScreenInfoId(String memberId, String screenInfoId){
		Connection conn = db.getConnection();;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ReservationInfoDto dto = new ReservationInfoDto();

		String sql = "SELECT DISTINCT M.MEMBER_ID, MI.MOVIE_TITLE, MI.MOVIE_IMG, MI.VIEWING_RATING, SI.SCREENING_DATE, SI.SCREENING_TIME, TI.BRANCH, TS.SCREEN_NAME,\n" +
				"                RI.PAYMENT_STATUS, RI.PAYMENT_METHOD, RI.SCREENING_INFO_ID\n" +
				"FROM RESERVATION_INFO RI\n" +
				"JOIN SCREENING_INFO SI ON RI.SCREENING_INFO_ID = SI.SCREENING_INFO_ID\n" +
				"JOIN THEATER_SCREEN TS ON SI.THEATER_SCREEN_ID = TS.THEATER_SCREEN_ID\n" +
				"JOIN THEATER_INFO TI ON SI.THEATER_ID = TI.THEATER_ID\n" +
				"JOIN MOVIE_INFO MI ON SI.MOVIE_ID = MI.MOVIE_ID\n" +
				"JOIN MEMBER_INFO M ON RI.MEMBER_ID = M.MEMBER_ID\n" +
				"WHERE RI.MEMBER_ID = ? and RI.SCREENING_INFO_ID=? and PAYMENT_STATUS = 'Completed'";

        try {
            pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,memberId);
			pstmt.setString(2,screenInfoId);
			rs = pstmt.executeQuery();
			while(rs.next()){
				dto.setMemberId(rs.getString("MEMBER_ID"));
				dto.setMovieTitle(rs.getString("MOVIE_TITLE"));
				dto.setMovieImg(rs.getString("MOVIE_IMG"));
				dto.setViewingRating(rs.getString("VIEWING_RATING"));
				dto.setScreeningDate(rs.getTimestamp("SCREENING_DATE"));
				dto.setScreeningTime(rs.getTimestamp("SCREENING_TIME"));
				dto.setBranch(rs.getString("BRANCH"));
				dto.setScreenName(rs.getString("SCREEN_NAME"));
				dto.setPaymentStatus(rs.getString("PAYMENT_STATUS"));
				dto.setPaymentMethod(rs.getString("PAYMENT_METHOD"));
				dto.setScreeningInfoId(rs.getString("SCREENING_INFO_ID"));
			}
        } catch (SQLException e) {
			System.out.println("e = " + e);
        } finally {
			db.dbClose(rs,pstmt,conn);
		}
		return dto;

    }
	public HashMap<String,Integer> getSeatInfoByMemberIdAndScreenInfoId(String memberId, String screenInfoId){
		Connection conn = db.getConnection();;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		HashMap<String,Integer> map = new HashMap<>();

		String sql = "select RESERVED_SEATS, AMOUNT\n" +
				"from RESERVATION_INFO\n" +
				"where SCREENING_INFO_ID = ?\n" +
				"  and MEMBER_ID = ?\n" +
				"  and PAYMENT_STATUS = 'Completed'";

        try {
            pstmt = conn.prepareStatement(sql);
			pstmt.setString(2,memberId);
			pstmt.setString(1,screenInfoId);
			rs = pstmt.executeQuery();
			while(rs.next()){
				map.put(rs.getString("RESERVED_SEATS"),rs.getInt("AMOUNT"));
			}

        } catch (SQLException e) {
			System.out.println("e = " + e);
        }finally {
			db.dbClose(rs,pstmt,conn);
		}
		return map;


    }




}

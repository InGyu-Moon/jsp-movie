package data.ticket;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.mysql.DbConnect;

public class TicketDao {
	DbConnect db = new DbConnect();

	// 모든 지역의 극장 리스트
	public List<TicketDto> regionList() {
		List<TicketDto> list = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = db.getConnection();
			String sql = "SELECT * FROM THEATER_INFO";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				TicketDto dto = new TicketDto();
				dto.setAddress(rs.getString("address"));
				dto.setBranch(rs.getString("branch"));
				dto.setIs_4d(rs.getInt("is_4d"));
				dto.setIs_imax(rs.getInt("is_imax"));
				dto.setNumber_of_screens(rs.getInt("number_of_screens"));
				dto.setRegion(rs.getString("region"));
				dto.setTheater_id(rs.getString("theater_id"));
				dto.setTheater_img(rs.getString("theater_img"));
				dto.setTheater_phone_number(rs.getString("theater_phone_number"));
				dto.setTotal_theater_seats(rs.getInt("total_theater_seats"));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}

		return list;
	}

	// 해당 지역의 모든 지점명을 가져오는 메서드
	public List<String> addressList(String region) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<String> theaterNames = new ArrayList<>();

		try {
			conn = db.getConnection();
			String sql = "SELECT branch FROM THEATER_INFO WHERE region = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, region);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				String theaterName = rs.getString("branch");
				theaterNames.add(theaterName);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}

		return theaterNames;
	}
}
package data.movie.screening;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import data.theater.info.TheaterDto;
import db.mysql.DbConnect;

public class ScreeningDao {
	DbConnect db = new DbConnect();

	// 날짜만 출력
	public List<ScreeningDto> getDate() {
		List<ScreeningDto> list = new ArrayList<>();
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = db.getConnection();
			String sql = "SELECT \r\n"
					+ "    DATE_ADD(CURDATE(), INTERVAL n DAY) AS Date,\r\n"
					+ "    CASE WEEKDAY(DATE_ADD(CURDATE(), INTERVAL n DAY))\r\n"
					+ "        WHEN 0 THEN '월요일'\r\n"
					+ "        WHEN 1 THEN '화요일'\r\n"
					+ "        WHEN 2 THEN '수요일'\r\n"
					+ "        WHEN 3 THEN '목요일'\r\n"
					+ "        WHEN 4 THEN '금요일'\r\n"
					+ "        WHEN 5 THEN '토요일'\r\n"
					+ "        WHEN 6 THEN '일요일'\r\n"
					+ "    END AS DayOfWeek\r\n"
					+ "FROM \r\n"
					+ "    (SELECT 0 AS n UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL\r\n"
					+ "     SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL\r\n"
					+ "     SELECT 8 UNION ALL SELECT 9 UNION ALL SELECT 10 UNION ALL SELECT 11 UNION ALL\r\n"
					+ "     SELECT 12 UNION ALL SELECT 13 UNION ALL SELECT 14) AS Numbers";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				ScreeningDto dto = new ScreeningDto();
				dto.setScreeningDate(rs.getDate("Date"));
				
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}

		return list;
	}
	// 상영시간, 상영날짜, 상영관정보, 상영관이름 얻음
	public List<ScreeningDto> getScreeningAndTheaterScreen(String branch, String movieId) {
		List<ScreeningDto> list = new ArrayList<>();
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = db.getConnection();
			String sql = "select S.screening_info_id, S.screening_date 상영날짜, S.screening_time 상영시간, TS.screen_info 상영관정보, TS.screen_name 상영관이름\r\n"
					+ "from SCREENING_INFO S, (select * from THEATER_INFO where branch=?) T, \r\n"
					+ "THEATER_SCREEN TS, (select * from MOVIE_INFO where movie_id=?) M\r\n"
					+ "where S.theater_id=T.theater_id AND S.theater_screen_id=TS.theater_screen_id AND M.movie_id=S.movie_id\r\n"
					+ "order by 상영시간";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, branch);
			pstmt.setString(2, movieId);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				ScreeningDto dto = new ScreeningDto();
				dto.setScreeningInfoId(rs.getString("screening_info_id"));
				dto.setScreeningDate(rs.getDate("상영날짜"));
				dto.setScreeningTime(rs.getTimestamp("상영시간"));
				dto.setScreenInfo(rs.getString("상영관정보"));
				dto.setScreenName(rs.getString("상영관이름"));
				
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		return list;
	}
	// 상영시간 얻음
	public List<ScreeningDto> getScreeningTime(String movieId, String branch, Date screeningDate) {
		List<ScreeningDto> list = new ArrayList<>();
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = db.getConnection();
			String sql = "select S.screening_info_id, S.screening_time 상영시간 , TS.screen_info 상영관정보, TS.screen_name 상영관이름\r\n"
					+ "from \r\n"
					+ "(select * from SCREENING_INFO where screening_date=?) S, \r\n"
					+ "(select * from THEATER_INFO where branch=?) T, \r\n"
					+ "(select * from MOVIE_INFO where movie_id=?) M,\r\n"
					+ "THEATER_SCREEN TS\r\n"
					+ "where S.theater_id=T.theater_id AND S.movie_id=M.movie_id AND S.theater_screen_id=TS.theater_screen_id order by 상영시간";
			pstmt = conn.prepareStatement(sql);
			pstmt.setDate(1, screeningDate);
			pstmt.setString(2, branch);
			pstmt.setString(3, movieId);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				ScreeningDto dto = new ScreeningDto();
				dto.setScreeningInfoId(rs.getString("screening_info_id"));
				dto.setScreeningTime(rs.getTimestamp("상영시간"));
				dto.setScreenInfo(rs.getString("상영관정보"));
				dto.setScreenName(rs.getString("상영관이름"));
				
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		return list;
	}
}

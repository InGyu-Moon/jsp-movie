package data.movie.theaterscreen;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import data.movie.screening.ScreeningDto;
import db.mysql.DbConnect;

public class TheaterScreenDao {
	DbConnect db = new DbConnect();

	// TheaterScreen 가져오기 => 지점과 상영날짜와 제목으로 찾아옴
	public List<TheaterScreenDto> getTheaterScreen(String movieTitle, String branch, Date screeningDate) {
		List<TheaterScreenDto> list = new ArrayList<>();
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = db.getConnection();
			String sql = "SELECT TS.* "
					+ "FROM (SELECT * FROM MOVIE_INFO WHERE MOVIE_TITLE=?) M, "
					+ "	(SELECT * FROM THEATER_INFO WHERE BRANCH=?) T, "
					+ "	(SELECT * FROM SCREENING_INFO WHERE SCREENING_DATE=?) S, "
					+ "    THEATER_SCREEN TS "
					+ "WHERE S.MOVIE_ID=M.MOVIE_ID AND S.THEATER_ID=T.THEATER_ID AND S.THEATER_SCREEN_ID=TS.THEATER_SCREEN_ID "
					+ "GROUP BY TS.THEATER_SCREEN_ID";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, movieTitle);
			pstmt.setString(2, branch);
			pstmt.setDate(3, screeningDate);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				TheaterScreenDto dto = new TheaterScreenDto();
				dto.setTheaterScreenId(rs.getString("THEATER_SCREEN_ID"));
				dto.setTheaterId(rs.getString("THEATER_ID"));
				dto.setTotalSeats(rs.getString("TOTAL_SEATS"));
				dto.setScreenInfo(rs.getString("SCREEN_INFO"));
				dto.setScreenName(rs.getString("SCREEN_NAME"));
				
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

package data.movie.screening;

import java.sql.Connection;
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
					+ "     SELECT 12 UNION ALL SELECT 13 UNION ALL SELECT 14) AS Numbers;";
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
}

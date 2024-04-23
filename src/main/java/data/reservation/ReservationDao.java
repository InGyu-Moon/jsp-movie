package data.reservation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import data.movie.screening.ScreeningDto;
import data.theater.info.TheaterDto;
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
	
	
	
	

}

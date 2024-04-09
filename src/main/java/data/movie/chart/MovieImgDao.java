package data.movie.chart;

import java.sql.Connection;



import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.mysql.DbConnect;

public class MovieImgDao {

	DbConnect db = new DbConnect();

	public List<MovieImgDto> getImagesForMovie(String movie_id) {
		List<MovieImgDto> ilist = new ArrayList<MovieImgDto>();
		
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "SELECT * FROM MOVIE_IMAGES WHERE MOVIE_ID = ? order by movie_id";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, movie_id);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				MovieImgDto dto = new MovieImgDto();
				dto.setImage_id(rs.getString("IMAGE_ID"));
				dto.setMovie_id(rs.getString("MOVIE_ID"));
				dto.setImage_link(rs.getString("IMAGE_LINK"));
				ilist.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}

		return ilist;
	}

}

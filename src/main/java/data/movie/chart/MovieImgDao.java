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

	public List<MovieImgDto> getImagesForMovie(String movieId) {
		List<MovieImgDto> ilist = new ArrayList<MovieImgDto>();
		
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "SELECT * FROM MOVIE_IMAGES WHERE MOVIE_ID = ? order by movie_id";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, movieId);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				MovieImgDto dto = new MovieImgDto();
				dto.setImageId(rs.getString("IMAGE_ID"));
				dto.setMovieId(rs.getString("MOVIE_ID"));
				dto.setImageLink(rs.getString("IMAGE_LINK"));
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

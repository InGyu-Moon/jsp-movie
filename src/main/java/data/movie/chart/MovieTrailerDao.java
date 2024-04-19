package data.movie.chart;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.mysql.DbConnect;


public class MovieTrailerDao {
	
	DbConnect db = new DbConnect();

	public List<MovieTrailerDto> getTrailersForMovie(String movie_id) {
		List<MovieTrailerDto> tlist = new ArrayList<MovieTrailerDto>();
		
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "SELECT * FROM MOVIE_TRAILERS WHERE MOVIE_ID = ? order by Trailer_ID";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, movie_id);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				MovieTrailerDto dto = new MovieTrailerDto();
				dto.setTrailerId(rs.getString("trailer_id"));
				dto.setMovieId(rs.getString("movie_id"));
				dto.setTrailerLink(rs.getString("trailer_link"));
				dto.setTrailerImg(rs.getString("trailer_img"));
				dto.setTrailerTitle(rs.getString("trailer_title"));
				tlist.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}

		return tlist;
	}

}

package data.movie.chart;

import java.sql.Connection;



import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.mysql.DbConnect;

public class Movie_InfoDao {

	DbConnect db = new DbConnect();

	// 예매순 1위 ~ 3위
	public List<Movie_InfoDto> getThreeMovieData() {
		List<Movie_InfoDto> list = new ArrayList<Movie_InfoDto>();

		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "SELECT MI.MOVIE_ID, MI.MOVIE_TITLE, MI.RUNNING_TIME, MI.VIEWING_RATING, MI.DIRECTOR, MI.CAST, MI.BOOKING_RATE, "
				+ "MI.RELEASE_DATE, MI.GENRE, MI.MOVIE_DESCRIPTION, MI.RATING, MI.END_DATE, MI.COUNTRY, "
				+ "M_IMAGES.IMAGE_LINK " + "FROM MOVIE_INFO MI "
				+ "LEFT JOIN MOVIE_IMAGES M_IMAGES ON MI.MOVIE_ID = M_IMAGES.MOVIE_ID "
				+ "WHERE M_IMAGES.IMAGE_ID = MI.MOVIE_ID " + "ORDER BY MI.BOOKING_RATE DESC " + "LIMIT 3";

		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				Movie_InfoDto dto = new Movie_InfoDto();

				dto.setMovie_id(rs.getString("movie_id"));
				dto.setMovie_title(rs.getString("movie_title"));
				dto.setRunning_time(rs.getInt("running_time"));
				dto.setViewing_rating(rs.getString("viewing_rating"));
				dto.setDirector(rs.getString("director"));
				dto.setCast(rs.getString("cast"));
				dto.setBooking_rate(rs.getDouble("booking_rate"));
				dto.setRelease_date(rs.getDate("release_date"));
				dto.setGenre(rs.getString("genre"));
				dto.setMovie_description(rs.getString("movie_description"));
				dto.setRating(rs.getDouble("rating"));
				dto.setEnd_date(rs.getDate("end_date"));
				dto.setCountry(rs.getString("country"));
				dto.setImage_link(rs.getString("image_link"));

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

	// 예매순 4위 ~ 19위
	public List<Movie_InfoDto> getElseMovieData() {
		List<Movie_InfoDto> elist = new ArrayList<Movie_InfoDto>();

		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "SELECT MI.MOVIE_ID, MI.MOVIE_TITLE, MI.RUNNING_TIME, MI.VIEWING_RATING, MI.DIRECTOR, MI.CAST, MI.BOOKING_RATE, "
				+ "MI.RELEASE_DATE, MI.GENRE, MI.MOVIE_DESCRIPTION, MI.RATING, MI.END_DATE, MI.COUNTRY, "
				+ "M_IMAGES.IMAGE_LINK " + "FROM MOVIE_INFO MI "
				+ "LEFT JOIN MOVIE_IMAGES M_IMAGES ON MI.MOVIE_ID = M_IMAGES.MOVIE_ID "
				+ "WHERE M_IMAGES.IMAGE_ID = MI.MOVIE_ID " + "order by MI.booking_rate DESC LIMIT 15 OFFSET 3";

		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				Movie_InfoDto dto = new Movie_InfoDto();

				dto.setMovie_id(rs.getString("movie_id"));
				dto.setMovie_title(rs.getString("movie_title"));
				dto.setRunning_time(rs.getInt("running_time"));
				dto.setViewing_rating(rs.getString("viewing_rating"));
				dto.setDirector(rs.getString("director"));
				dto.setCast(rs.getString("cast"));
				dto.setBooking_rate(rs.getDouble("booking_rate"));
				dto.setRelease_date(rs.getDate("release_date"));
				dto.setGenre(rs.getString("genre"));
				dto.setMovie_description(rs.getString("movie_description"));
				dto.setRating(rs.getDouble("rating"));
				dto.setEnd_date(rs.getDate("end_date"));
				dto.setCountry(rs.getString("country"));
				dto.setImage_link(rs.getString("image_link"));

				elist.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		return elist;
	}

	// 평점순 1위 ~ 3위
	public List<Movie_InfoDto> getThreeMovieData2() {
		List<Movie_InfoDto> listtwo = new ArrayList<Movie_InfoDto>();

		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "SELECT MI.MOVIE_ID, MI.MOVIE_TITLE, MI.RUNNING_TIME, MI.VIEWING_RATING, MI.DIRECTOR, MI.CAST, MI.BOOKING_RATE, "
				+ "MI.RELEASE_DATE, MI.GENRE, MI.MOVIE_DESCRIPTION, MI.RATING, MI.END_DATE, MI.COUNTRY, "
				+ "M_IMAGES.IMAGE_LINK " + "FROM MOVIE_INFO MI "
				+ "LEFT JOIN MOVIE_IMAGES M_IMAGES ON MI.MOVIE_ID = M_IMAGES.MOVIE_ID "
				+ "WHERE M_IMAGES.IMAGE_ID = MI.MOVIE_ID " + "order by MI.rating desc limit 3";

		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				Movie_InfoDto dto = new Movie_InfoDto();

				dto.setMovie_id(rs.getString("movie_id"));
				dto.setMovie_title(rs.getString("movie_title"));
				dto.setRunning_time(rs.getInt("running_time"));
				dto.setViewing_rating(rs.getString("viewing_rating"));
				dto.setDirector(rs.getString("director"));
				dto.setCast(rs.getString("cast"));
				dto.setBooking_rate(rs.getDouble("booking_rate"));
				dto.setRelease_date(rs.getDate("release_date"));
				dto.setGenre(rs.getString("genre"));
				dto.setMovie_description(rs.getString("movie_description"));
				dto.setRating(rs.getDouble("rating"));
				dto.setEnd_date(rs.getDate("end_date"));
				dto.setCountry(rs.getString("country"));
				dto.setImage_link(rs.getString("image_link"));

				listtwo.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		return listtwo;
	}

	// 평점순 4위 ~ 19위
	public List<Movie_InfoDto> getElseMovieData2() {
		List<Movie_InfoDto> elisttwo = new ArrayList<Movie_InfoDto>();

		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "SELECT MI.MOVIE_ID, MI.MOVIE_TITLE, MI.RUNNING_TIME, MI.VIEWING_RATING, MI.DIRECTOR, MI.CAST, MI.BOOKING_RATE, "
				+ "MI.RELEASE_DATE, MI.GENRE, MI.MOVIE_DESCRIPTION, MI.RATING, MI.END_DATE, MI.COUNTRY, "
				+ "M_IMAGES.IMAGE_LINK " + "FROM MOVIE_INFO MI "
				+ "LEFT JOIN MOVIE_IMAGES M_IMAGES ON MI.MOVIE_ID = M_IMAGES.MOVIE_ID "
				+ "WHERE M_IMAGES.IMAGE_ID = MI.MOVIE_ID " + "order by MI.rating desc LIMIT 15 OFFSET 3";

		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				Movie_InfoDto dto = new Movie_InfoDto();

				dto.setMovie_id(rs.getString("movie_id"));
				dto.setMovie_title(rs.getString("movie_title"));
				dto.setRunning_time(rs.getInt("running_time"));
				dto.setViewing_rating(rs.getString("viewing_rating"));
				dto.setDirector(rs.getString("director"));
				dto.setCast(rs.getString("cast"));
				dto.setBooking_rate(rs.getDouble("booking_rate"));
				dto.setRelease_date(rs.getDate("release_date"));
				dto.setGenre(rs.getString("genre"));
				dto.setMovie_description(rs.getString("movie_description"));
				dto.setRating(rs.getDouble("rating"));
				dto.setEnd_date(rs.getDate("end_date"));
				dto.setCountry(rs.getString("country"));
				dto.setImage_link(rs.getString("image_link"));

				elisttwo.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		return elisttwo;
	}

	// 현재상영작 chk 예매순 1위 ~ 3위
	public List<Movie_InfoDto> getThreeMovieDataChk() {
		List<Movie_InfoDto> listchk = new ArrayList<Movie_InfoDto>();

		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "SELECT MI.MOVIE_ID, MI.MOVIE_TITLE, MI.RUNNING_TIME, MI.VIEWING_RATING, MI.DIRECTOR, MI.CAST, MI.BOOKING_RATE, "
				+ "MI.RELEASE_DATE, MI.GENRE, MI.MOVIE_DESCRIPTION, MI.RATING, MI.END_DATE, MI.COUNTRY, "
				+ "M_IMAGES.IMAGE_LINK " + "FROM MOVIE_INFO MI "
				+ "LEFT JOIN MOVIE_IMAGES M_IMAGES ON MI.MOVIE_ID = M_IMAGES.MOVIE_ID "
				+ "WHERE M_IMAGES.IMAGE_ID = MI.MOVIE_ID and MI.RELEASE_DATE <= curdate() "
				+ "ORDER BY MI.BOOKING_RATE DESC " + "LIMIT 3";

		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				Movie_InfoDto dto = new Movie_InfoDto();

				dto.setMovie_id(rs.getString("movie_id"));
				dto.setMovie_title(rs.getString("movie_title"));
				dto.setRunning_time(rs.getInt("running_time"));
				dto.setViewing_rating(rs.getString("viewing_rating"));
				dto.setDirector(rs.getString("director"));
				dto.setCast(rs.getString("cast"));
				dto.setBooking_rate(rs.getDouble("booking_rate"));
				dto.setRelease_date(rs.getDate("release_date"));
				dto.setGenre(rs.getString("genre"));
				dto.setMovie_description(rs.getString("movie_description"));
				dto.setRating(rs.getDouble("rating"));
				dto.setEnd_date(rs.getDate("end_date"));
				dto.setCountry(rs.getString("country"));
				dto.setImage_link(rs.getString("image_link"));

				listchk.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		return listchk;
	}

	// 현재상영작 chk 예매순 4위 ~ 19위
	public List<Movie_InfoDto> getElseMovieDataChk() {
		List<Movie_InfoDto> elistchk = new ArrayList<Movie_InfoDto>();

		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "SELECT MI.MOVIE_ID, MI.MOVIE_TITLE, MI.RUNNING_TIME, MI.VIEWING_RATING, MI.DIRECTOR, MI.CAST, MI.BOOKING_RATE, "
				+ "MI.RELEASE_DATE, MI.GENRE, MI.MOVIE_DESCRIPTION, MI.RATING, MI.END_DATE, MI.COUNTRY, "
				+ "M_IMAGES.IMAGE_LINK " + "FROM MOVIE_INFO MI "
				+ "LEFT JOIN MOVIE_IMAGES M_IMAGES ON MI.MOVIE_ID = M_IMAGES.MOVIE_ID "
				+ "WHERE M_IMAGES.IMAGE_ID = MI.MOVIE_ID and MI.RELEASE_DATE <= curdate() "
				+ "ORDER BY MI.BOOKING_RATE DESC " + "LIMIT 15 OFFSET 3";

		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				Movie_InfoDto dto = new Movie_InfoDto();

				dto.setMovie_id(rs.getString("movie_id"));
				dto.setMovie_title(rs.getString("movie_title"));
				dto.setRunning_time(rs.getInt("running_time"));
				dto.setViewing_rating(rs.getString("viewing_rating"));
				dto.setDirector(rs.getString("director"));
				dto.setCast(rs.getString("cast"));
				dto.setBooking_rate(rs.getDouble("booking_rate"));
				dto.setRelease_date(rs.getDate("release_date"));
				dto.setGenre(rs.getString("genre"));
				dto.setMovie_description(rs.getString("movie_description"));
				dto.setRating(rs.getDouble("rating"));
				dto.setEnd_date(rs.getDate("end_date"));
				dto.setCountry(rs.getString("country"));
				dto.setImage_link(rs.getString("image_link"));

				elistchk.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		return elistchk;
	}

	// 현재상영작 chk 평점순 1위 ~ 3위
	public List<Movie_InfoDto> getThreeMovieDataChk2() {
		List<Movie_InfoDto> listtwochk = new ArrayList<Movie_InfoDto>();

		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "SELECT MI.MOVIE_ID, MI.MOVIE_TITLE, MI.RUNNING_TIME, MI.VIEWING_RATING, MI.DIRECTOR, MI.CAST, MI.BOOKING_RATE, "
				+ "MI.RELEASE_DATE, MI.GENRE, MI.MOVIE_DESCRIPTION, MI.RATING, MI.END_DATE, MI.COUNTRY, "
				+ "M_IMAGES.IMAGE_LINK " + "FROM MOVIE_INFO MI "
				+ "LEFT JOIN MOVIE_IMAGES M_IMAGES ON MI.MOVIE_ID = M_IMAGES.MOVIE_ID "
				+ "WHERE M_IMAGES.IMAGE_ID = MI.MOVIE_ID and MI.RELEASE_DATE <= curdate() " + "ORDER BY MI.rating DESC "
				+ "LIMIT 3";

		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				Movie_InfoDto dto = new Movie_InfoDto();

				dto.setMovie_id(rs.getString("movie_id"));
				dto.setMovie_title(rs.getString("movie_title"));
				dto.setRunning_time(rs.getInt("running_time"));
				dto.setViewing_rating(rs.getString("viewing_rating"));
				dto.setDirector(rs.getString("director"));
				dto.setCast(rs.getString("cast"));
				dto.setBooking_rate(rs.getDouble("booking_rate"));
				dto.setRelease_date(rs.getDate("release_date"));
				dto.setGenre(rs.getString("genre"));
				dto.setMovie_description(rs.getString("movie_description"));
				dto.setRating(rs.getDouble("rating"));
				dto.setEnd_date(rs.getDate("end_date"));
				dto.setCountry(rs.getString("country"));
				dto.setImage_link(rs.getString("image_link"));

				listtwochk.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		return listtwochk;
	}

	// 현재상영작 chk 평점순 4위 ~ 19위
	public List<Movie_InfoDto> getElseMovieDataChk2() {
		List<Movie_InfoDto> elisttwochk = new ArrayList<Movie_InfoDto>();

		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "SELECT MI.MOVIE_ID, MI.MOVIE_TITLE, MI.RUNNING_TIME, MI.VIEWING_RATING, MI.DIRECTOR, MI.CAST, MI.BOOKING_RATE, "
				+ "MI.RELEASE_DATE, MI.GENRE, MI.MOVIE_DESCRIPTION, MI.RATING, MI.END_DATE, MI.COUNTRY, "
				+ "M_IMAGES.IMAGE_LINK " + "FROM MOVIE_INFO MI "
				+ "LEFT JOIN MOVIE_IMAGES M_IMAGES ON MI.MOVIE_ID = M_IMAGES.MOVIE_ID "
				+ "WHERE M_IMAGES.IMAGE_ID = MI.MOVIE_ID and MI.RELEASE_DATE <= curdate() " + "ORDER BY MI.rating DESC "
				+ "LIMIT 15 OFFSET 3";

		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				Movie_InfoDto dto = new Movie_InfoDto();

				dto.setMovie_id(rs.getString("movie_id"));
				dto.setMovie_title(rs.getString("movie_title"));
				dto.setRunning_time(rs.getInt("running_time"));
				dto.setViewing_rating(rs.getString("viewing_rating"));
				dto.setDirector(rs.getString("director"));
				dto.setCast(rs.getString("cast"));
				dto.setBooking_rate(rs.getDouble("booking_rate"));
				dto.setRelease_date(rs.getDate("release_date"));
				dto.setGenre(rs.getString("genre"));
				dto.setMovie_description(rs.getString("movie_description"));
				dto.setRating(rs.getDouble("rating"));
				dto.setEnd_date(rs.getDate("end_date"));
				dto.setCountry(rs.getString("country"));
				dto.setImage_link(rs.getString("image_link"));

				elisttwochk.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		return elisttwochk;
	}

	// 상영예정작 예매순 1위 ~ 3위
	public List<Movie_InfoDto> getThreeMovieSchedule() {
		List<Movie_InfoDto> listschedule = new ArrayList<Movie_InfoDto>();

		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "SELECT MI.MOVIE_ID, MI.MOVIE_TITLE, MI.RUNNING_TIME, MI.VIEWING_RATING, MI.DIRECTOR, MI.CAST, MI.BOOKING_RATE, "
				+ "MI.RELEASE_DATE, MI.GENRE, MI.MOVIE_DESCRIPTION, MI.RATING, MI.END_DATE, MI.COUNTRY, "
				+ "M_IMAGES.IMAGE_LINK " + "FROM MOVIE_INFO MI "
				+ "LEFT JOIN MOVIE_IMAGES M_IMAGES ON MI.MOVIE_ID = M_IMAGES.MOVIE_ID "
				+ "WHERE M_IMAGES.IMAGE_ID = MI.MOVIE_ID and MI.RELEASE_DATE > curdate() "
				+ "ORDER BY MI.booking_rate DESC " + "LIMIT 3";

		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				Movie_InfoDto dto = new Movie_InfoDto();

				dto.setMovie_id(rs.getString("movie_id"));
				dto.setMovie_title(rs.getString("movie_title"));
				dto.setRunning_time(rs.getInt("running_time"));
				dto.setViewing_rating(rs.getString("viewing_rating"));
				dto.setDirector(rs.getString("director"));
				dto.setCast(rs.getString("cast"));
				dto.setBooking_rate(rs.getDouble("booking_rate"));
				dto.setRelease_date(rs.getDate("release_date"));
				dto.setGenre(rs.getString("genre"));
				dto.setMovie_description(rs.getString("movie_description"));
				dto.setRating(rs.getDouble("rating"));
				dto.setEnd_date(rs.getDate("end_date"));
				dto.setCountry(rs.getString("country"));
				dto.setImage_link(rs.getString("image_link"));

				listschedule.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		return listschedule;
	}

	// 상영예정작 예매순 날짜별
	public List<Movie_InfoDto> getElseMovieSchedule() {
		List<Movie_InfoDto> elistschedule = new ArrayList<Movie_InfoDto>();

		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "SELECT MI.MOVIE_ID, MI.MOVIE_TITLE, MI.RUNNING_TIME, MI.VIEWING_RATING, MI.DIRECTOR, MI.CAST, MI.BOOKING_RATE, "
				+ "MI.RELEASE_DATE, MI.GENRE, MI.MOVIE_DESCRIPTION, MI.RATING, MI.END_DATE, MI.COUNTRY, M_IMAGES.IMAGE_LINK "
				+ "FROM MOVIE_INFO MI LEFT JOIN MOVIE_IMAGES M_IMAGES ON MI.MOVIE_ID = M_IMAGES.MOVIE_ID "
				+ "WHERE M_IMAGES.IMAGE_ID = MI.MOVIE_ID and MI.RELEASE_DATE > curdate() order by MI.release_date";

		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				Movie_InfoDto dto = new Movie_InfoDto();

				dto.setMovie_id(rs.getString("movie_id"));
				dto.setMovie_title(rs.getString("movie_title"));
				dto.setRunning_time(rs.getInt("running_time"));
				dto.setViewing_rating(rs.getString("viewing_rating"));
				dto.setDirector(rs.getString("director"));
				dto.setCast(rs.getString("cast"));
				dto.setBooking_rate(rs.getDouble("booking_rate"));
				dto.setRelease_date(rs.getDate("release_date"));
				dto.setGenre(rs.getString("genre"));
				dto.setMovie_description(rs.getString("movie_description"));
				dto.setRating(rs.getDouble("rating"));
				dto.setEnd_date(rs.getDate("end_date"));
				dto.setCountry(rs.getString("country"));
				dto.setImage_link(rs.getString("image_link"));

				elistschedule.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		return elistschedule;
	}

	//movie_id에 대한 dto 반환
	public Movie_InfoDto getData(String movie_id) {
		Movie_InfoDto dto = new Movie_InfoDto();

		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "SELECT MI.MOVIE_ID, MI.MOVIE_TITLE, MI.RUNNING_TIME, MI.VIEWING_RATING, MI.DIRECTOR, MI.CAST, MI.BOOKING_RATE, \r\n"
				+ "MI.RELEASE_DATE, MI.GENRE, MI.MOVIE_DESCRIPTION, MI.RATING, MI.END_DATE, MI.COUNTRY,\r\n"
				+ "M_IMAGES.IMAGE_LINK\r\n"
				+ "FROM MOVIE_INFO MI\r\n"
				+ "LEFT JOIN MOVIE_IMAGES M_IMAGES ON MI.MOVIE_ID = M_IMAGES.MOVIE_ID\r\n"
				+ "WHERE MI.MOVIE_ID = ? and M_IMAGES.IMAGE_ID = MI.Movie_id";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, movie_id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				dto.setMovie_id(rs.getString("movie_id"));
				dto.setMovie_title(rs.getString("movie_title"));
				dto.setRunning_time(rs.getInt("running_time"));
				dto.setViewing_rating(rs.getString("viewing_rating"));
				dto.setDirector(rs.getString("director"));
				dto.setCast(rs.getString("cast"));
				dto.setBooking_rate(rs.getDouble("booking_rate"));
				dto.setRelease_date(rs.getDate("release_date"));
				dto.setGenre(rs.getString("genre"));
				dto.setMovie_description(rs.getString("movie_description"));
				dto.setRating(rs.getDouble("rating"));
				dto.setEnd_date(rs.getDate("end_date"));
				dto.setCountry(rs.getString("country"));
				dto.setImage_link(rs.getString("image_link"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		return dto;
	}

}

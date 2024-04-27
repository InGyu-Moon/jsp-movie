package data.theater.info;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import data.movie.chart.MovieInfoDto;
import db.mysql.DbConnect;

public class TheaterDao {
	DbConnect db = new DbConnect();

	// 모든 지역의 극장 리스트
	public List<TheaterDto> regionList() {
		List<TheaterDto> list = new ArrayList<>();
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = db.getConnection();
			String sql = "SELECT * FROM THEATER_INFO";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				TheaterDto dto = new TheaterDto();
				dto.setTheater_id(rs.getString("theater_id"));
				dto.setRegion(rs.getString("region"));
				dto.setBranch(rs.getString("branch"));
				dto.setNumber_of_screens(rs.getString("number_of_screens"));
				dto.setTotal_theater_seats(rs.getString("total_theater_seats"));
				dto.setAddress(rs.getString("address"));
				dto.setTheater_phone_number(rs.getString("theater_phone_number"));
				dto.setTheater_img(rs.getString("theater_img"));
				dto.setIs_imax(rs.getInt("is_imax"));
				dto.setIs_4d(rs.getInt("is_4d"));

				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}

		return list;
	}
	
	// 지역 출력
	public List<TheaterDto> getRegionList() {
		List<TheaterDto> list = new ArrayList<>();
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = db.getConnection();
			String sql = "SELECT region, MAX(theater_id) AS theater_id FROM THEATER_INFO GROUP BY region;";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				TheaterDto dto = new TheaterDto();
				dto.setRegion(rs.getString("region"));
				dto.setTheater_id(rs.getString("theater_id"));
				
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		return list;
	}
	
	// 지점 출력
	public List<TheaterDto> getBranchList() {
		List<TheaterDto> list = new ArrayList<>();
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = db.getConnection();
			String sql = "SELECT DISTINCT branch, theater_id FROM THEATER_INFO where region='서울'";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				TheaterDto dto = new TheaterDto();
				dto.setTheater_id(rs.getString("theater_id"));
				dto.setBranch(rs.getString("branch"));
				
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		return list;
	}
	
	// 영화 지점에 대한 지역 출력
	public List<TheaterDto> getBranchListByRegion(String movieId) {
		List<TheaterDto> list = new ArrayList<>();
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = db.getConnection();
			String sql = "SELECT branch, theater_id FROM THEATER_INFO\r\n"
					+ "where theater_id = (select S.theater_id from screening_info S, (select * from movie_info where movie_id=?) M\r\n"
					+ "									where S.movie_id=M.movie_id);";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, movieId);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				TheaterDto dto = new TheaterDto();
				dto.setTheater_id(rs.getString("theater_id"));
				dto.setBranch(rs.getString("branch"));
				
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
		System.out.println("test2"+region);
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<String> theaterNames = new ArrayList<>();

		try {
			conn = db.getConnection();
			String sql = "SELECT BRANCH FROM THEATER_INFO WHERE REGION = ?";
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

	// 특정 지점의 상영 정보를 가져오는 메서드
	public TheaterDto theaterList(String branch) {
		TheaterDto dto = new TheaterDto();
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM THEATER_INFO WHERE BRANCH = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, branch);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				dto.setAddress(rs.getString("address"));
				dto.setBranch(rs.getString("branch"));
				dto.setIs_4d((rs.getInt("is_4d")));  
				dto.setIs_imax((rs.getInt("is_imax")));
				dto.setNumber_of_screens(rs.getString("number_of_screens"));
				dto.setRegion(rs.getString("region"));
				dto.setTheater_id(rs.getString("theater_id"));
				dto.setTheater_img(rs.getString("theater_img"));
				dto.setTheater_phone_number(rs.getString("theater_phone_number"));
				dto.setTotal_theater_seats(rs.getString("total_theater_seats"));
				dto.setTheater_id(rs.getString("theater_id"));
				//dto.setTheater_img(rs.getString("theater_img"));

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		return dto;

	}
	
	public List<TheaterDto> theaterMovieList(String branch, String screeningDate) {
		List<TheaterDto> list = new ArrayList<TheaterDto>();
		
		
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT DISTINCT TI.BRANCH, TI.THEATER_ID, MI.MOVIE_ID, MI.MOVIE_TITLE, MI.GENRE, MI.RUNNING_TIME, MI.RELEASE_DATE, MI.VIEWING_RATING, SI.SCREENING_DATE\r\n"
				+ "FROM THEATER_INFO TI\r\n"
				+ "JOIN SCREENING_INFO SI ON TI.THEATER_ID = SI.THEATER_ID\r\n"
				+ "JOIN MOVIE_INFO MI ON SI.MOVIE_ID = MI.MOVIE_ID\r\n"
				+ "WHERE TI.BRANCH = ? and SI.SCREENING_DATE=? ORDER BY MOVIE_TITLE";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, branch);
			pstmt.setString(2, screeningDate);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				TheaterDto dto = new TheaterDto();
				
				dto.setTheater_id(rs.getString("theater_id"));
				dto.setMovieId(rs.getString("movie_id"));
				dto.setBranch(rs.getString("branch"));
				dto.setMovieTitle(rs.getString("movie_title"));
				dto.setGenre(rs.getString("genre"));
				dto.setRunningTime(rs.getString("running_time"));
				dto.setReleaseDate(rs.getDate("release_date"));
				dto.setViewingRating(rs.getString("viewing_rating"));
				dto.setScreeningDate(rs.getDate("screening_date"));
				
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		return list;

	}
	
	public List<TheaterDto> theaterTheaterList(String branch, String screeningDate, String movieTitle) {
		List<TheaterDto> list = new ArrayList<TheaterDto>();
		
		
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT DISTINCT TI.BRANCH, TI.THEATER_ID, MI.MOVIE_TITLE, MI.MOVIE_ID, SI.SCREENING_DATE, TS.THEATER_SCREEN_ID, TS.SCREEN_INFO, TS.SCREEN_NAME, TS.TOTAL_SEATS\r\n"
				+ "FROM THEATER_INFO TI\r\n"
				+ "JOIN SCREENING_INFO SI ON TI.THEATER_ID = SI.THEATER_ID\r\n"
				+ "JOIN MOVIE_INFO MI ON SI.MOVIE_ID = MI.MOVIE_ID\r\n"
				+ "JOIN THEATER_SCREEN TS ON SI.THEATER_SCREEN_ID = TS.THEATER_SCREEN_ID\r\n"
				+ "WHERE TI.BRANCH = ? and SI.SCREENING_DATE=? and MI.MOVIE_TITLE = ? ORDER BY MOVIE_TITLE";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, branch);
			pstmt.setString(2, screeningDate);
			pstmt.setString(3, movieTitle);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				TheaterDto dto = new TheaterDto();
				
				dto.setTheater_id(rs.getString("theater_id"));
				dto.setMovieId(rs.getString("movie_id"));
				dto.setBranch(rs.getString("branch"));
				dto.setMovieTitle(rs.getString("movie_title"));
				dto.setScreeningDate(rs.getDate("screening_date"));
				dto.setTheaterScreenId(rs.getString("theater_screen_id"));
				dto.setScreenInfo(rs.getString("screen_info"));
				dto.setScreenName(rs.getString("screen_name"));
				dto.setTotalSeats(rs.getString("total_seats"));
				
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
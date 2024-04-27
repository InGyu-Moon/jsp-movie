package data.movie.chart;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import data.user.member.Gender;
import data.user.member.MemberDto;
import db.mysql.DbConnect;

public class MovieInfoDao {

	DbConnect db = new DbConnect();

	// 예매순 전체출력
	public List<MovieInfoDto> getAllMovieData() {
		List<MovieInfoDto> list = new ArrayList<MovieInfoDto>();
		
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT * FROM MOVIE_INFO ORDER BY BOOKING_RATE DESC";
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				MovieInfoDto dto = new MovieInfoDto();
				
				dto.setMovieId(rs.getString("movie_id"));
				dto.setMovieTitle(rs.getString("movie_title"));
				dto.setRunningTime(rs.getInt("running_time"));
				dto.setViewingRating(rs.getString("viewing_rating"));
				dto.setDirector(rs.getString("director"));
				dto.setCast(rs.getString("cast"));
				dto.setBookingRate(rs.getDouble("booking_rate"));
				dto.setReleaseDate(rs.getDate("release_date"));
				dto.setGenre(rs.getString("genre"));
				dto.setMovieDescription(rs.getString("movie_description"));
				dto.setRating(rs.getDouble("rating"));
				dto.setEndDate(rs.getDate("end_date"));
				dto.setCountry(rs.getString("country"));
				dto.setMovieImg(rs.getString("movie_img"));
				
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
	
	// 예매순 1위 ~ 3위
	public List<MovieInfoDto> getThreeMovieData() {
		List<MovieInfoDto> list = new ArrayList<MovieInfoDto>();

		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "SELECT * FROM MOVIE_INFO ORDER BY BOOKING_RATE DESC LIMIT 3";

		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				MovieInfoDto dto = new MovieInfoDto();

				dto.setMovieId(rs.getString("movie_id"));
				dto.setMovieTitle(rs.getString("movie_title"));
				dto.setRunningTime(rs.getInt("running_time"));
				dto.setViewingRating(rs.getString("viewing_rating"));
				dto.setDirector(rs.getString("director"));
				dto.setCast(rs.getString("cast"));
				dto.setBookingRate(rs.getDouble("booking_rate"));
				dto.setReleaseDate(rs.getDate("release_date"));
				dto.setGenre(rs.getString("genre"));
				dto.setMovieDescription(rs.getString("movie_description"));
				dto.setRating(rs.getDouble("rating"));
				dto.setEndDate(rs.getDate("end_date"));
				dto.setCountry(rs.getString("country"));
				dto.setMovieImg(rs.getString("movie_img"));

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
	public List<MovieInfoDto> getElseMovieData() {
		List<MovieInfoDto> elist = new ArrayList<MovieInfoDto>();

		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "SELECT * FROM MOVIE_INFO order by booking_rate DESC LIMIT 16 OFFSET 3";

		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				MovieInfoDto dto = new MovieInfoDto();

				dto.setMovieId(rs.getString("movie_id"));
				dto.setMovieTitle(rs.getString("movie_title"));
				dto.setRunningTime(rs.getInt("running_time"));
				dto.setViewingRating(rs.getString("viewing_rating"));
				dto.setDirector(rs.getString("director"));
				dto.setCast(rs.getString("cast"));
				dto.setBookingRate(rs.getDouble("booking_rate"));
				dto.setReleaseDate(rs.getDate("release_date"));
				dto.setGenre(rs.getString("genre"));
				dto.setMovieDescription(rs.getString("movie_description"));
				dto.setRating(rs.getDouble("rating"));
				dto.setEndDate(rs.getDate("end_date"));
				dto.setCountry(rs.getString("country"));
				dto.setMovieImg(rs.getString("movie_img"));

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
	public List<MovieInfoDto> getThreeMovieData2() {
		List<MovieInfoDto> listtwo = new ArrayList<MovieInfoDto>();

		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "SELECT * FROM MOVIE_INFO order by rating desc limit 3";

		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				MovieInfoDto dto = new MovieInfoDto();

				dto.setMovieId(rs.getString("movie_id"));
				dto.setMovieTitle(rs.getString("movie_title"));
				dto.setRunningTime(rs.getInt("running_time"));
				dto.setViewingRating(rs.getString("viewing_rating"));
				dto.setDirector(rs.getString("director"));
				dto.setCast(rs.getString("cast"));
				dto.setBookingRate(rs.getDouble("booking_rate"));
				dto.setReleaseDate(rs.getDate("release_date"));
				dto.setGenre(rs.getString("genre"));
				dto.setMovieDescription(rs.getString("movie_description"));
				dto.setRating(rs.getDouble("rating"));
				dto.setEndDate(rs.getDate("end_date"));
				dto.setCountry(rs.getString("country"));
				dto.setMovieImg(rs.getString("movie_img"));

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
	public List<MovieInfoDto> getElseMovieData2() {
		List<MovieInfoDto> elisttwo = new ArrayList<MovieInfoDto>();

		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "SELECT * FROM MOVIE_INFO order by rating desc LIMIT 16 OFFSET 3";

		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				MovieInfoDto dto = new MovieInfoDto();

				dto.setMovieId(rs.getString("movie_id"));
				dto.setMovieTitle(rs.getString("movie_title"));
				dto.setRunningTime(rs.getInt("running_time"));
				dto.setViewingRating(rs.getString("viewing_rating"));
				dto.setDirector(rs.getString("director"));
				dto.setCast(rs.getString("cast"));
				dto.setBookingRate(rs.getDouble("booking_rate"));
				dto.setReleaseDate(rs.getDate("release_date"));
				dto.setGenre(rs.getString("genre"));
				dto.setMovieDescription(rs.getString("movie_description"));
				dto.setRating(rs.getDouble("rating"));
				dto.setEndDate(rs.getDate("end_date"));
				dto.setCountry(rs.getString("country"));
				dto.setMovieImg(rs.getString("movie_img"));

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
	public List<MovieInfoDto> getThreeMovieDataChk() {
		List<MovieInfoDto> listchk = new ArrayList<MovieInfoDto>();

		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "SELECT * FROM MOVIE_INFO WHERE RELEASE_DATE <= curdate() ORDER BY BOOKING_RATE DESC LIMIT 3";

		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				MovieInfoDto dto = new MovieInfoDto();

				dto.setMovieId(rs.getString("movie_id"));
				dto.setMovieTitle(rs.getString("movie_title"));
				dto.setRunningTime(rs.getInt("running_time"));
				dto.setViewingRating(rs.getString("viewing_rating"));
				dto.setDirector(rs.getString("director"));
				dto.setCast(rs.getString("cast"));
				dto.setBookingRate(rs.getDouble("booking_rate"));
				dto.setReleaseDate(rs.getDate("release_date"));
				dto.setGenre(rs.getString("genre"));
				dto.setMovieDescription(rs.getString("movie_description"));
				dto.setRating(rs.getDouble("rating"));
				dto.setEndDate(rs.getDate("end_date"));
				dto.setCountry(rs.getString("country"));
				dto.setMovieImg(rs.getString("movie_img"));

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
	public List<MovieInfoDto> getElseMovieDataChk() {
		List<MovieInfoDto> elistchk = new ArrayList<MovieInfoDto>();

		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "SELECT * FROM MOVIE_INFO WHERE RELEASE_DATE <= curdate() ORDER BY BOOKING_RATE DESC LIMIT 16 OFFSET 3";

		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				MovieInfoDto dto = new MovieInfoDto();

				dto.setMovieId(rs.getString("movie_id"));
				dto.setMovieTitle(rs.getString("movie_title"));
				dto.setRunningTime(rs.getInt("running_time"));
				dto.setViewingRating(rs.getString("viewing_rating"));
				dto.setDirector(rs.getString("director"));
				dto.setCast(rs.getString("cast"));
				dto.setBookingRate(rs.getDouble("booking_rate"));
				dto.setReleaseDate(rs.getDate("release_date"));
				dto.setGenre(rs.getString("genre"));
				dto.setMovieDescription(rs.getString("movie_description"));
				dto.setRating(rs.getDouble("rating"));
				dto.setEndDate(rs.getDate("end_date"));
				dto.setCountry(rs.getString("country"));
				dto.setMovieImg(rs.getString("movie_img"));

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
	public List<MovieInfoDto> getThreeMovieDataChk2() {
		List<MovieInfoDto> listtwochk = new ArrayList<MovieInfoDto>();

		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "SELECT * FROM MOVIE_INFO WHERE RELEASE_DATE <= curdate() ORDER BY rating DESC LIMIT 3";

		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				MovieInfoDto dto = new MovieInfoDto();

				dto.setMovieId(rs.getString("movie_id"));
				dto.setMovieTitle(rs.getString("movie_title"));
				dto.setRunningTime(rs.getInt("running_time"));
				dto.setViewingRating(rs.getString("viewing_rating"));
				dto.setDirector(rs.getString("director"));
				dto.setCast(rs.getString("cast"));
				dto.setBookingRate(rs.getDouble("booking_rate"));
				dto.setReleaseDate(rs.getDate("release_date"));
				dto.setGenre(rs.getString("genre"));
				dto.setMovieDescription(rs.getString("movie_description"));
				dto.setRating(rs.getDouble("rating"));
				dto.setEndDate(rs.getDate("end_date"));
				dto.setCountry(rs.getString("country"));
				dto.setMovieImg(rs.getString("movie_img"));

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
	public List<MovieInfoDto> getElseMovieDataChk2() {
		List<MovieInfoDto> elisttwochk = new ArrayList<MovieInfoDto>();

		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "SELECT * FROM MOVIE_INFO WHERE RELEASE_DATE <= curdate() ORDER BY rating DESC LIMIT 16 OFFSET 3";

		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				MovieInfoDto dto = new MovieInfoDto();

				dto.setMovieId(rs.getString("movie_id"));
				dto.setMovieTitle(rs.getString("movie_title"));
				dto.setRunningTime(rs.getInt("running_time"));
				dto.setViewingRating(rs.getString("viewing_rating"));
				dto.setDirector(rs.getString("director"));
				dto.setCast(rs.getString("cast"));
				dto.setBookingRate(rs.getDouble("booking_rate"));
				dto.setReleaseDate(rs.getDate("release_date"));
				dto.setGenre(rs.getString("genre"));
				dto.setMovieDescription(rs.getString("movie_description"));
				dto.setRating(rs.getDouble("rating"));
				dto.setEndDate(rs.getDate("end_date"));
				dto.setCountry(rs.getString("country"));
				dto.setMovieImg(rs.getString("movie_img"));

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
	public List<MovieInfoDto> getThreeMovieSchedule() {
		List<MovieInfoDto> listschedule = new ArrayList<MovieInfoDto>();

		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "SELECT * FROM MOVIE_INFO WHERE RELEASE_DATE > curdate() ORDER BY booking_rate DESC LIMIT 3";

		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				MovieInfoDto dto = new MovieInfoDto();

				dto.setMovieId(rs.getString("movie_id"));
				dto.setMovieTitle(rs.getString("movie_title"));
				dto.setRunningTime(rs.getInt("running_time"));
				dto.setViewingRating(rs.getString("viewing_rating"));
				dto.setDirector(rs.getString("director"));
				dto.setCast(rs.getString("cast"));
				dto.setBookingRate(rs.getDouble("booking_rate"));
				dto.setReleaseDate(rs.getDate("release_date"));
				dto.setGenre(rs.getString("genre"));
				dto.setMovieDescription(rs.getString("movie_description"));
				dto.setRating(rs.getDouble("rating"));
				dto.setEndDate(rs.getDate("end_date"));
				dto.setCountry(rs.getString("country"));
				dto.setMovieImg(rs.getString("movie_img"));

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

	// 메인페이지 상영예정작 예매순 4위 ~ 19위
	public List<MovieInfoDto> mainMovieSchedule() {
		List<MovieInfoDto> mainlistschedule = new ArrayList<MovieInfoDto>();

		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "SELECT * FROM MOVIE_INFO ORDER BY BOOKING_RATE DESC LIMIT 16 OFFSET 3";

		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				MovieInfoDto dto = new MovieInfoDto();

				dto.setMovieId(rs.getString("movie_id"));
				dto.setMovieTitle(rs.getString("movie_title"));
				dto.setRunningTime(rs.getInt("running_time"));
				dto.setViewingRating(rs.getString("viewing_rating"));
				dto.setDirector(rs.getString("director"));
				dto.setCast(rs.getString("cast"));
				dto.setBookingRate(rs.getDouble("booking_rate"));
				dto.setReleaseDate(rs.getDate("release_date"));
				dto.setGenre(rs.getString("genre"));
				dto.setMovieDescription(rs.getString("movie_description"));
				dto.setRating(rs.getDouble("rating"));
				dto.setEndDate(rs.getDate("end_date"));
				dto.setCountry(rs.getString("country"));
				dto.setMovieImg(rs.getString("movie_img"));

				mainlistschedule.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		return mainlistschedule;
	}

	// 상영예정작 예매순 날짜별
	public List<MovieInfoDto> getElseMovieSchedule() {
		List<MovieInfoDto> elistschedule = new ArrayList<MovieInfoDto>();

		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "SELECT * FROM MOVIE_INFO WHERE RELEASE_DATE > curdate() order by release_date";

		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				MovieInfoDto dto = new MovieInfoDto();

				dto.setMovieId(rs.getString("movie_id"));
				dto.setMovieTitle(rs.getString("movie_title"));
				dto.setRunningTime(rs.getInt("running_time"));
				dto.setViewingRating(rs.getString("viewing_rating"));
				dto.setDirector(rs.getString("director"));
				dto.setCast(rs.getString("cast"));
				dto.setBookingRate(rs.getDouble("booking_rate"));
				dto.setReleaseDate(rs.getDate("release_date"));
				dto.setGenre(rs.getString("genre"));
				dto.setMovieDescription(rs.getString("movie_description"));
				dto.setRating(rs.getDouble("rating"));
				dto.setEndDate(rs.getDate("end_date"));
				dto.setCountry(rs.getString("country"));
				dto.setMovieImg(rs.getString("movie_img"));

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

	// movie_id에 대한 dto 반환
	public MovieInfoDto getData(String movieId) {
		MovieInfoDto dto = new MovieInfoDto();
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "SELECT * FROM MOVIE_INFO WHERE MOVIE_ID = ?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, movieId);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				dto.setMovieId(rs.getString("movie_id"));
				dto.setMovieTitle(rs.getString("movie_title"));
				dto.setRunningTime(rs.getInt("running_time"));
				dto.setViewingRating(rs.getString("viewing_rating"));
				dto.setDirector(rs.getString("director"));
				dto.setCast(rs.getString("cast"));
				dto.setBookingRate(rs.getDouble("booking_rate"));
				dto.setReleaseDate(rs.getDate("release_date"));
				dto.setGenre(rs.getString("genre"));
				dto.setMovieDescription(rs.getString("movie_description"));
				dto.setRating(rs.getDouble("rating"));
				dto.setEndDate(rs.getDate("end_date"));
				dto.setCountry(rs.getString("country"));
				dto.setMovieImg(rs.getString("movie_img"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		return dto;
	}

	public List<MovieInfoDto> getAllMovies() {
		List<MovieInfoDto> list = new ArrayList<>();

		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;

		String sql="select * from MOVIE_INFO order by movie_id";

		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();

			while(rs.next())
			{
				MovieInfoDto dto = new MovieInfoDto();
				dto.setMovieId(rs.getString("movie_id"));
				dto.setMovieTitle(rs.getString("movie_title"));
				dto.setRunningTime(rs.getInt("running_time"));
				dto.setViewingRating(rs.getString("viewing_rating"));
				dto.setDirector(rs.getString("director"));
				dto.setCast(rs.getString("cast"));
				dto.setBookingRate(rs.getDouble("booking_rate"));
				dto.setReleaseDate(rs.getDate("release_date"));
				dto.setGenre(rs.getString("genre"));
				dto.setMovieDescription(rs.getString("movie_description"));
				dto.setRating(rs.getDouble("rating"));
				dto.setEndDate(rs.getDate("end_date"));
				dto.setCountry(rs.getString("country"));
				dto.setMovieImg(rs.getString("movie_img"));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		return list;
	}

	public int getMovieCount() {
    Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
    
		String sql = "select count(*) from MOVIE_INFO";
		int count = 0;

		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt(1);
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		return count;
	}

	//페이지
	public List<MovieInfoDto> getList(int start,int perPage)
	{
		List<MovieInfoDto> list=new ArrayList<>();
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;

		String sql="select * from MOVIE_INFO order by movie_id desc limit ?,?";

		try {
			pstmt=conn.prepareStatement(sql);

			pstmt.setInt(1, start);
			pstmt.setInt(2, perPage);

			rs=pstmt.executeQuery();

			while(rs.next())
			{
				MovieInfoDto dto = new MovieInfoDto();
				dto.setMovieId(rs.getString("movie_id"));
				dto.setMovieTitle(rs.getString("movie_title"));
				dto.setRunningTime(rs.getInt("running_time"));
				dto.setViewingRating(rs.getString("viewing_rating"));
				dto.setDirector(rs.getString("director"));
				dto.setCast(rs.getString("cast"));
				dto.setBookingRate(rs.getDouble("booking_rate"));
				dto.setReleaseDate(rs.getDate("release_date"));
				dto.setGenre(rs.getString("genre"));
				dto.setMovieDescription(rs.getString("movie_description"));
				dto.setRating(rs.getDouble("rating"));
				dto.setEndDate(rs.getDate("end_date"));
				dto.setCountry(rs.getString("country"));
				dto.setMovieImg(rs.getString("movie_img"));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}

		return list;
	}

	public void deleteMovie(String movieId){
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;

		String sql="delete from movie_info where movie_id=?";

		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, movieId);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("e = " + e);
		}finally {
			db.dbClose(pstmt, conn);
		}
	}


	// 영화 추가
	public void insertMovie(MovieInfoDto dto){
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;

		String sql = "INSERT INTO movie_info " +
				"(movie_title, running_time, viewing_rating, director, cast, booking_rate, " +
				"release_date, genre, movie_description, rating, end_date, country, movie_img) " +
				"VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, dto.getMovieTitle());
			pstmt.setInt(2, dto.getRunningTime());
			pstmt.setString(3, dto.getViewingRating());
			pstmt.setString(4, dto.getDirector());
			pstmt.setString(5, dto.getCast());
			pstmt.setDouble(6, dto.getBookingRate());
			pstmt.setDate(7, dto.getReleaseDate());
			pstmt.setString(8, dto.getGenre());
			pstmt.setString(9, dto.getMovieDescription());
			pstmt.setDouble(10, dto.getRating());
			pstmt.setDate(11, dto.getEndDate());
			pstmt.setString(12, dto.getCountry());
			pstmt.setString(13, dto.getMovieImg());

			pstmt.executeUpdate();
        } catch (SQLException e) {
			System.out.println("e = " + e);
        } finally {
			db.dbClose(pstmt, conn);
		}
    }

	// 영화 수정
	public void updateMovie(MovieInfoDto dto){
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;

		String sql = "UPDATE movie_info SET " +
				"movie_title=?, running_time=?, viewing_rating=?, director=?, cast=?, booking_rate=?, " +
				"release_date=?, genre=?, movie_description=?, rating=?, end_date=?, country=?" +
//				", movie_img=? " +
				"WHERE movie_id=?";

        try {
            pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, dto.getMovieTitle());
			pstmt.setInt(2, dto.getRunningTime());
			pstmt.setString(3, dto.getViewingRating());
			pstmt.setString(4, dto.getDirector());
			pstmt.setString(5, dto.getCast());
			pstmt.setDouble(6, dto.getBookingRate());
			pstmt.setDate(7, dto.getReleaseDate());
			pstmt.setString(8, dto.getGenre());
			pstmt.setString(9, dto.getMovieDescription());
			pstmt.setDouble(10, dto.getRating());
			pstmt.setDate(11, dto.getEndDate());
			pstmt.setString(12, dto.getCountry());
//			pstmt.setString(13, dto.getMovieImg());
			pstmt.setString(13, dto.getMovieId());
//			pstmt.setString(14, dto.getMovieId());

			pstmt.executeUpdate();
        } catch (SQLException e) {
			System.out.println("e = " + e);
        } finally {
			db.dbClose(pstmt, conn);
		}

	}


  public void updateMovieBookingRate(String movie_id, double br) {
    Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String updateSql = "UPDATE MOVIE_INFO SET RATING = ? WHERE MOVIE_ID = ?";

		try {
			pstmt = conn.prepareStatement(updateSql);
			pstmt.setDouble(1, br);
			pstmt.setString(2, movie_id);
			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
	}


	public List<MovieInfoDto> getMoviesByTitle(String title) {
		List<MovieInfoDto> list=new ArrayList<>();
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;

		String sql="select * from MOVIE_INFO WHERE movie_title LIKE ? order by movie_id";

		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, "%"+title+"%");
			rs=pstmt.executeQuery();
			while(rs.next())
			{
				MovieInfoDto dto = new MovieInfoDto();
				dto.setMovieId(rs.getString("movie_id"));
				dto.setMovieTitle(rs.getString("movie_title"));
				dto.setRunningTime(rs.getInt("running_time"));
				dto.setViewingRating(rs.getString("viewing_rating"));
				dto.setDirector(rs.getString("director"));
				dto.setCast(rs.getString("cast"));
				dto.setBookingRate(rs.getDouble("booking_rate"));
				dto.setReleaseDate(rs.getDate("release_date"));
				dto.setGenre(rs.getString("genre"));
				dto.setMovieDescription(rs.getString("movie_description"));
				dto.setRating(rs.getDouble("rating"));
				dto.setEndDate(rs.getDate("end_date"));
				dto.setCountry(rs.getString("country"));
				dto.setMovieImg(rs.getString("movie_img"));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		return list;
	}
	public List<MovieInfoDto> getListMoviesByTitle(String title,int start,int perPage) {
		List<MovieInfoDto> list=new ArrayList<>();
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;

		String sql="select * from MOVIE_INFO WHERE movie_title LIKE ? order by movie_id desc limit ?,?";

		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, "%"+title+"%");
			pstmt.setInt(2, start);
			pstmt.setInt(3, perPage);
			rs=pstmt.executeQuery();
			while(rs.next())
			{
				MovieInfoDto dto = new MovieInfoDto();
				dto.setMovieId(rs.getString("movie_id"));
				dto.setMovieTitle(rs.getString("movie_title"));
				dto.setRunningTime(rs.getInt("running_time"));
				dto.setViewingRating(rs.getString("viewing_rating"));
				dto.setDirector(rs.getString("director"));
				dto.setCast(rs.getString("cast"));
				dto.setBookingRate(rs.getDouble("booking_rate"));
				dto.setReleaseDate(rs.getDate("release_date"));
				dto.setGenre(rs.getString("genre"));
				dto.setMovieDescription(rs.getString("movie_description"));
				dto.setRating(rs.getDouble("rating"));
				dto.setEndDate(rs.getDate("end_date"));
				dto.setCountry(rs.getString("country"));
				dto.setMovieImg(rs.getString("movie_img"));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		return list;
	}

	public List<MovieInfoDto> getMoviesByDirector(String director) {
		List<MovieInfoDto> list=new ArrayList<>();
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;

		String sql="select * from MOVIE_INFO WHERE director LIKE ? order by movie_id";

		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, "%"+director+"%");
			rs=pstmt.executeQuery();
			while(rs.next())
			{
				MovieInfoDto dto = new MovieInfoDto();
				dto.setMovieId(rs.getString("movie_id"));
				dto.setMovieTitle(rs.getString("movie_title"));
				dto.setRunningTime(rs.getInt("running_time"));
				dto.setViewingRating(rs.getString("viewing_rating"));
				dto.setDirector(rs.getString("director"));
				dto.setCast(rs.getString("cast"));
				dto.setBookingRate(rs.getDouble("booking_rate"));
				dto.setReleaseDate(rs.getDate("release_date"));
				dto.setGenre(rs.getString("genre"));
				dto.setMovieDescription(rs.getString("movie_description"));
				dto.setRating(rs.getDouble("rating"));
				dto.setEndDate(rs.getDate("end_date"));
				dto.setCountry(rs.getString("country"));
				dto.setMovieImg(rs.getString("movie_img"));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		return list;
	}
	public List<MovieInfoDto> getListMoviesByDirector(String director,int start,int perPage) {
		List<MovieInfoDto> list=new ArrayList<>();
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;

		String sql="select * from MOVIE_INFO WHERE director LIKE ? order by movie_id desc limit ?,?";

		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, "%"+director+"%");
			pstmt.setInt(2, start);
			pstmt.setInt(3, perPage);
			rs=pstmt.executeQuery();
			while(rs.next())
			{
				MovieInfoDto dto = new MovieInfoDto();
				dto.setMovieId(rs.getString("movie_id"));
				dto.setMovieTitle(rs.getString("movie_title"));
				dto.setRunningTime(rs.getInt("running_time"));
				dto.setViewingRating(rs.getString("viewing_rating"));
				dto.setDirector(rs.getString("director"));
				dto.setCast(rs.getString("cast"));
				dto.setBookingRate(rs.getDouble("booking_rate"));
				dto.setReleaseDate(rs.getDate("release_date"));
				dto.setGenre(rs.getString("genre"));
				dto.setMovieDescription(rs.getString("movie_description"));
				dto.setRating(rs.getDouble("rating"));
				dto.setEndDate(rs.getDate("end_date"));
				dto.setCountry(rs.getString("country"));
				dto.setMovieImg(rs.getString("movie_img"));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		return list;
	}

	public List<MovieInfoDto> getMoviesByActor(String actor) {
		List<MovieInfoDto> list=new ArrayList<>();
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;

		String sql="select * from MOVIE_INFO WHERE cast LIKE ? order by movie_id";

		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, "%"+actor+"%");
			rs=pstmt.executeQuery();
			while(rs.next())
			{
				MovieInfoDto dto = new MovieInfoDto();
				dto.setMovieId(rs.getString("movie_id"));
				dto.setMovieTitle(rs.getString("movie_title"));
				dto.setRunningTime(rs.getInt("running_time"));
				dto.setViewingRating(rs.getString("viewing_rating"));
				dto.setDirector(rs.getString("director"));
				dto.setCast(rs.getString("cast"));
				dto.setBookingRate(rs.getDouble("booking_rate"));
				dto.setReleaseDate(rs.getDate("release_date"));
				dto.setGenre(rs.getString("genre"));
				dto.setMovieDescription(rs.getString("movie_description"));
				dto.setRating(rs.getDouble("rating"));
				dto.setEndDate(rs.getDate("end_date"));
				dto.setCountry(rs.getString("country"));
				dto.setMovieImg(rs.getString("movie_img"));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		return list;
	}

	public List<MovieInfoDto> getListMoviesByActor(String actor,int start,int perPage) {
		List<MovieInfoDto> list=new ArrayList<>();
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;

		String sql="select * from MOVIE_INFO WHERE cast LIKE ? order by movie_id desc limit ?,?";

		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, "%"+actor+"%");
			pstmt.setInt(2, start);
			pstmt.setInt(3, perPage);
			rs=pstmt.executeQuery();
			while(rs.next())
			{
				MovieInfoDto dto = new MovieInfoDto();
				dto.setMovieId(rs.getString("movie_id"));
				dto.setMovieTitle(rs.getString("movie_title"));
				dto.setRunningTime(rs.getInt("running_time"));
				dto.setViewingRating(rs.getString("viewing_rating"));
				dto.setDirector(rs.getString("director"));
				dto.setCast(rs.getString("cast"));
				dto.setBookingRate(rs.getDouble("booking_rate"));
				dto.setReleaseDate(rs.getDate("release_date"));
				dto.setGenre(rs.getString("genre"));
				dto.setMovieDescription(rs.getString("movie_description"));
				dto.setRating(rs.getDouble("rating"));
				dto.setEndDate(rs.getDate("end_date"));
				dto.setCountry(rs.getString("country"));
				dto.setMovieImg(rs.getString("movie_img"));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		return list;
	}

	public List<MovieInfoDto> getMoviesByAllData(String data) {
		List<MovieInfoDto> list=new ArrayList<>();
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;

		String sql="select * from MOVIE_INFO WHERE movie_title LIKE ? or  cast LIKE ? or " +
				"director LIKE ? order by movie_id";

		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, "%"+data+"%");
			pstmt.setString(2, "%"+data+"%");
			pstmt.setString(3, "%"+data+"%");
			rs=pstmt.executeQuery();
			while(rs.next())
			{
				MovieInfoDto dto = new MovieInfoDto();
				dto.setMovieId(rs.getString("movie_id"));
				dto.setMovieTitle(rs.getString("movie_title"));
				dto.setRunningTime(rs.getInt("running_time"));
				dto.setViewingRating(rs.getString("viewing_rating"));
				dto.setDirector(rs.getString("director"));
				dto.setCast(rs.getString("cast"));
				dto.setBookingRate(rs.getDouble("booking_rate"));
				dto.setReleaseDate(rs.getDate("release_date"));
				dto.setGenre(rs.getString("genre"));
				dto.setMovieDescription(rs.getString("movie_description"));
				dto.setRating(rs.getDouble("rating"));
				dto.setEndDate(rs.getDate("end_date"));
				dto.setCountry(rs.getString("country"));
				dto.setMovieImg(rs.getString("movie_img"));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		return list;
	}

	public List<MovieInfoDto> getListMoviesByAllData(String data,int start,int perPage) {
		List<MovieInfoDto> list=new ArrayList<>();
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;

		String sql="select * from MOVIE_INFO WHERE movie_title LIKE ? or  cast LIKE ? or " +
				"director LIKE ? order by movie_id desc limit ?,?";

		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, "%"+data+"%");
			pstmt.setString(2, "%"+data+"%");
			pstmt.setString(3, "%"+data+"%");
			pstmt.setInt(4, start);
			pstmt.setInt(5, perPage);
			rs=pstmt.executeQuery();
			while(rs.next())
			{
				MovieInfoDto dto = new MovieInfoDto();
				dto.setMovieId(rs.getString("movie_id"));
				dto.setMovieTitle(rs.getString("movie_title"));
				dto.setRunningTime(rs.getInt("running_time"));
				dto.setViewingRating(rs.getString("viewing_rating"));
				dto.setDirector(rs.getString("director"));
				dto.setCast(rs.getString("cast"));
				dto.setBookingRate(rs.getDouble("booking_rate"));
				dto.setReleaseDate(rs.getDate("release_date"));
				dto.setGenre(rs.getString("genre"));
				dto.setMovieDescription(rs.getString("movie_description"));
				dto.setRating(rs.getDouble("rating"));
				dto.setEndDate(rs.getDate("end_date"));
				dto.setCountry(rs.getString("country"));
				dto.setMovieImg(rs.getString("movie_img"));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		return list;
	}


    
  
}

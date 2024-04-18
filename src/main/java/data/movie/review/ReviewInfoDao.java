package data.movie.review;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import data.movie.chart.MovieImgDto;
import db.mysql.DbConnect;

public class ReviewInfoDao {

	DbConnect db = new DbConnect();

	// 해당영화의 리뷰 리스트 불러오기 ( member_info와 조인 ) - 최신순
	public List<ReviewInfoDto> getReviewList(String movie_id) {
		List<ReviewInfoDto> rlist = new ArrayList<ReviewInfoDto>();

		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "SELECT REVIEW_INFO.REVIEW_ID, REVIEW_INFO.MEMBER_ID, REVIEW_INFO.MOVIE_ID, MEMBER_INFO.USER_PHOTO, MEMBER_INFO.USERNAME, REVIEW_INFO.REVIEW_CONTENT, REVIEW_INFO.REVIEW_DATE, REVIEW_INFO.LIKES, REVIEW_INFO.RATING\r\n"
				+ "FROM REVIEW_INFO JOIN MEMBER_INFO ON REVIEW_INFO.MEMBER_ID = MEMBER_INFO.MEMBER_ID\r\n"
				+ "WHERE REVIEW_INFO.MOVIE_ID = ? ORDER BY REVIEW_ID DESC";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, movie_id);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				ReviewInfoDto dto = new ReviewInfoDto();
				dto.setReviewId(rs.getString("REVIEW_ID"));
				dto.setId(rs.getString("MEMBER_ID"));
				dto.setMovieId(rs.getString("MOVIE_ID"));
				dto.setReviewContent(rs.getString("REVIEW_CONTENT"));
				dto.setReviewDate(rs.getTimestamp("REVIEW_DATE"));
				dto.setLikes(rs.getInt("LIKES"));
				dto.setRating(rs.getDouble("RATING"));
				dto.setUsername(rs.getString("USERNAME"));
				dto.setUserPhoto(rs.getString("USER_PHOTO"));
				rlist.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}

		return rlist;
	}

	// 해당영화의 리뷰 리스트 불러오기 ( member_info와 조인 ) - 좋아요순
	public List<ReviewInfoDto> getReviewListLikes(String movie_id) {
		List<ReviewInfoDto> rlist = new ArrayList<ReviewInfoDto>();

		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "SELECT REVIEW_INFO.REVIEW_ID, REVIEW_INFO.MEMBER_ID, REVIEW_INFO.MOVIE_ID, MEMBER_INFO.USER_PHOTO, MEMBER_INFO.USERNAME, REVIEW_INFO.REVIEW_CONTENT, REVIEW_INFO.REVIEW_DATE, REVIEW_INFO.LIKES, REVIEW_INFO.RATING\r\n"
				+ "FROM REVIEW_INFO JOIN MEMBER_INFO ON REVIEW_INFO.MEMBER_ID = MEMBER_INFO.MEMBER_ID\r\n"
				+ "WHERE REVIEW_INFO.MOVIE_ID = ? ORDER BY LIKES DESC";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, movie_id);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				ReviewInfoDto dto = new ReviewInfoDto();
				dto.setReviewId(rs.getString("REVIEW_ID"));
				dto.setId(rs.getString("MEMBER_ID"));
				dto.setMovieId(rs.getString("MOVIE_ID"));
				dto.setReviewContent(rs.getString("REVIEW_CONTENT"));
				dto.setReviewDate(rs.getTimestamp("REVIEW_DATE"));
				dto.setLikes(rs.getInt("LIKES"));
				dto.setRating(rs.getDouble("RATING"));
				dto.setUsername(rs.getString("USERNAME"));
				dto.setUserPhoto(rs.getString("USER_PHOTO"));
				rlist.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}

		return rlist;
	}

	// insert
	public void insertReview(ReviewInfoDto dto) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "INSERT INTO REVIEW_INFO VALUES(NULL,?,?,?,NOW(),0,?)";

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getMovieId());
			pstmt.setString(3, dto.getReviewContent());
			pstmt.setDouble(4, dto.getRating());

			pstmt.execute();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}

	}

	// 좋아요 1 증가
	public void incrementLikes(String reviewId) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;

		String sql = "UPDATE REVIEW_INFO SET LIKES = LIKES + 1 WHERE REVIEW_ID = ?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, reviewId);

			pstmt.executeUpdate();

		} catch (SQLException e) {
			// 오류 처리
			e.printStackTrace();
		} finally {
			db.dbClose(null, pstmt, conn);
		}
	}

	// 좋아요 1 감소
	public void decrementLikes(String reviewId) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;

		String sql = "UPDATE REVIEW_INFO SET LIKES = LIKES - 1 WHERE REVIEW_ID = ?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, reviewId);

			pstmt.executeUpdate();

		} catch (SQLException e) {
			// 오류 처리
			e.printStackTrace();
		} finally {
			db.dbClose(null, pstmt, conn);
		}
	}

	// like 반환
	public int getLikesCount(String review_id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int likesCount = 0;

		try {
			conn = db.getConnection();
			String sql = "SELECT LIKES FROM REVIEW_INFO WHERE REVIEW_ID = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, review_id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				likesCount = rs.getInt("LIKES");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}

		return likesCount;
	}

	// paging list
	// 1.전체갯수반환
	public int getTotalCount(String movie_id) {
		int total = 0;

		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "SELECT COUNT(*) FROM REVIEW_INFO WHERE MOVIE_ID = ?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, movie_id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				total = rs.getInt(1);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}

		return total;
	}

	// 2.부분조회(startnum부터 page갯수만큼 반환) - 최신순
	public List<ReviewInfoDto> getPagingList(String movie_id, int startNum, int perPage) {
		List<ReviewInfoDto> list = new ArrayList<ReviewInfoDto>();

		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "SELECT REVIEW_INFO.REVIEW_ID, REVIEW_INFO.MEMBER_ID, REVIEW_INFO.MOVIE_ID, MEMBER_INFO.USER_PHOTO, MEMBER_INFO.USERNAME, REVIEW_INFO.REVIEW_CONTENT, REVIEW_INFO.REVIEW_DATE, REVIEW_INFO.LIKES, REVIEW_INFO.RATING\r\n"
				+ "FROM REVIEW_INFO JOIN MEMBER_INFO ON REVIEW_INFO.MEMBER_ID = MEMBER_INFO.MEMBER_ID \r\n"
				+ "WHERE REVIEW_INFO.MOVIE_ID = ? ORDER BY REVIEW_ID DESC LIMIT ?, ?";

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, movie_id);
			pstmt.setInt(2, startNum);
			pstmt.setInt(3, perPage);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				ReviewInfoDto dto = new ReviewInfoDto();

				dto.setReviewId(rs.getString("REVIEW_ID"));
				dto.setId(rs.getString("MEMBER_ID"));
				dto.setMovieId(rs.getString("MOVIE_ID"));
				dto.setReviewContent(rs.getString("REVIEW_CONTENT"));
				dto.setReviewDate(rs.getTimestamp("REVIEW_DATE"));
				dto.setLikes(rs.getInt("LIKES"));
				dto.setRating(rs.getDouble("RATING"));
				dto.setUsername(rs.getString("USERNAME"));
				dto.setUserPhoto(rs.getString("USER_PHOTO"));

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

	// 2.부분조회(startnum부터 page갯수만큼 반환) - 좋아요순
	public List<ReviewInfoDto> getPagingListLike(String movie_id, int startNum, int perPage) {
		List<ReviewInfoDto> list = new ArrayList<ReviewInfoDto>();

		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "SELECT REVIEW_INFO.REVIEW_ID, REVIEW_INFO.MEMBER_ID, REVIEW_INFO.MOVIE_ID, MEMBER_INFO.USER_PHOTO, MEMBER_INFO.USERNAME, REVIEW_INFO.REVIEW_CONTENT, REVIEW_INFO.REVIEW_DATE, REVIEW_INFO.LIKES, REVIEW_INFO.RATING\r\n"
				+ "FROM REVIEW_INFO JOIN MEMBER_INFO ON REVIEW_INFO.MEMBER_ID = MEMBER_INFO.MEMBER_ID\r\n"
				+ "WHERE REVIEW_INFO.MOVIE_ID = ? ORDER BY LIKES DESC LIMIT ?, ?";

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, movie_id);
			pstmt.setInt(2, startNum);
			pstmt.setInt(3, perPage);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				ReviewInfoDto dto = new ReviewInfoDto();

				dto.setReviewId(rs.getString("REVIEW_ID"));
				dto.setId(rs.getString("MEMBER_ID"));
				dto.setMovieId(rs.getString("MOVIE_ID"));
				dto.setReviewContent(rs.getString("REVIEW_CONTENT"));
				dto.setReviewDate(rs.getTimestamp("REVIEW_DATE"));
				dto.setLikes(rs.getInt("LIKES"));
				dto.setRating(rs.getDouble("RATING"));
				dto.setUsername(rs.getString("USERNAME"));
				dto.setUserPhoto(rs.getString("USER_PHOTO"));

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

	// 평점 계산
	public double updateMovieBookingRate(String movie_id) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String selectSql = "SELECT AVG(RATING) AS avgRating FROM REVIEW_INFO WHERE MOVIE_ID = ?";

		double avgRating = 0;

		try {
			pstmt = conn.prepareStatement(selectSql);
			pstmt.setString(1, movie_id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				avgRating = rs.getDouble("avgRating");

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		return avgRating;
	}

}

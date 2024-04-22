package data.movie.review;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import db.mysql.DbConnect;



public class ReviewLikeDao {

	DbConnect db = new DbConnect();

	//로그인한 id가 좋아요 누르면 insert
	public void insertLike(ReviewLikeDto dto) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "INSERT INTO REVIEW_LIKE VALUES(NULL,?,?)";

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, dto.getReviewId());
			pstmt.setString(2, dto.getId());

			pstmt.execute();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}

	}

	public ReviewLikeDto getData(String reviewId) {
		ReviewLikeDto dto = new ReviewLikeDto();

		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from REVIEW_LIKE where REVIEW_ID=?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, reviewId);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				dto.setLikeId(rs.getString("like_id"));
				dto.setReviewId(rs.getString("review_id"));
				dto.setId(rs.getString("member_id"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		return dto;
	}
	
	public boolean getLikeData(String reviewId, String id) {
		boolean ok = false;
		
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from REVIEW_LIKE where REVIEW_ID=? and MEMBER_ID=?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, reviewId);
			pstmt.setString(2, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				ok=true;
				//System.out.println("좋아요 누른거 확인");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		return ok;	
	}

	// 삭제
	public void likeDelete(String reviewId, String id) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;

		String sql = "delete from REVIEW_LIKE where REVIEW_ID=? and MEMBER_ID=?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, reviewId);
			pstmt.setString(2, id);
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
	}

}

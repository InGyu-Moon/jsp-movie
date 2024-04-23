package data.inform.inquiry;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import db.mysql.DbConnect;

public class InquiryDao {
	DbConnect db = new DbConnect();

	// insert
	public void Inquiry_insert(InquiryDto dto) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;

		String sql = "insert into inquiry values (null,?,?,?,?,?,null)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getMemberId());
			pstmt.setString(2, dto.getOption());
			pstmt.setString(3, dto.getTitle());
			pstmt.setString(4, dto.getContent());
			pstmt.setString(5, dto.getAttachment());
			pstmt.execute();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
	}

	// 모든 문의 가져오기
	public List<InquiryDto> selectAllInquity() {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from INQUIRY order by inquiry_id desc";
		List<InquiryDto> list = new ArrayList<InquiryDto>();

		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				System.out.println("selectAllInquity success");
				InquiryDto inquiry = new InquiryDto();
				inquiry.setInquiryId(rs.getInt("inquiry_id"));
				inquiry.setMemberId(rs.getInt("member_id"));
				inquiry.setOption(rs.getString("inquiry_option"));
				inquiry.setTitle(rs.getString("title"));
				inquiry.setContent(rs.getString("content"));
				inquiry.setAttachment(rs.getString("attachment"));
				inquiry.setAnswer(rs.getString("answer")); // 답변에 대한 컬럼 추가됨

				list.add(inquiry);

			}

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		return list;
	}

	// 문의 상세
	public InquiryDto getInquity(int inquiryId) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from INQUIRY where inquiry_id=?";
		InquiryDto inquiry = new InquiryDto();

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, inquiryId);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				System.out.println("get Inquity success");
				inquiry.setInquiryId(rs.getInt("inquiry_id"));
				inquiry.setMemberId(rs.getInt("member_id"));
				inquiry.setOption(rs.getString("inquiry_option"));
				inquiry.setTitle(rs.getString("title"));
				inquiry.setContent(rs.getString("content"));
				inquiry.setAttachment(rs.getString("attachment"));
				inquiry.setAnswer(rs.getString("answer")); // 답변에 대한 컬럼 추가됨

			}

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		return inquiry;
	}

	// count
	public int getCountInquiry() {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select count(*) from INQUIRY";
		int count = 0;

		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				count = rs.getInt(1);
			}

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		return count;
	}

	// 답변 insert -> 쿼리는 조건문 때문에 update로 해야함
	public void insertAnswer(int inquiryId, String answer) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;

		String sql = "update INQUIRY set answer=? where inquiry_id=?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, answer);
			pstmt.setInt(2, inquiryId);

			int result = pstmt.executeUpdate();

			if (result > 0)
				System.out.println("답변 insert success");
			else
				System.out.println("답변 insert error");

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}

	}

	// 1:1 문의 수정 -> 멤버가 작성한 제목과 내용은 냅둔 나머지
	public void updateAnswer(int inquiryId, String option, String answer) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;

		String sql = "update INQUIRY set answer=?,inquiry_option=? where inquiry_id=?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, answer);
			pstmt.setString(2, option);
			pstmt.setInt(3, inquiryId);

			int result = pstmt.executeUpdate();

			if (result > 0)
				System.out.println("1:1 문의 수정 success");
			else
				System.out.println("1:1 문의 수정 error");

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}

	}

	// delete
	public void deleteAnswer(int inquiryId) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;

		String sql = "delete from INQUIRY where inquiry_id=?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, inquiryId);

			int result = pstmt.executeUpdate();

			if (result > 0)
				System.out.println("답변 delete success");
			else
				System.out.println("답변 delete error");

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}

	}

}

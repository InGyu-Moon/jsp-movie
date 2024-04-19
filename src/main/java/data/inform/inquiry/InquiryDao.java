package data.inform.inquiry;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import db.mysql.DbConnect;

public class InquiryDao {
	DbConnect db = new DbConnect();

	// insert
	public void Inquiry_insert(InquiryDto dto) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;

		String sql = "insert into inquiry values (null,null,?,?,?,?,null)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getInquiry_option());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getAttachment());
			pstmt.execute();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
	}
}

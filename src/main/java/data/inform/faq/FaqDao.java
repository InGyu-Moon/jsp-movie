package data.inform.faq;

import java.sql.Connection;
import java.sql.PreparedStatement;

import data.user.member.MemberDto;
import db.mysql.DbConnect;

public class FaqDao {
	DbConnect db = new DbConnect();
	
	// insert 
	public void insertFaq(FaqDto faq) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		
		String sql = "insert into FAQ value (null,?,?,?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, faq.getCategory());
			pstmt.setString(2, faq.getQuestion());
			pstmt.setString(3, faq.getAnswer());
			
			int result = pstmt.executeUpdate();
			if(result > 0) System.out.println("FAQ insert success");
			else System.out.println("FAQ insert error");
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
		
	}
}

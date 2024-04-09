package data.inform.faq;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

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
	
	// select all 
	public List<FaqDto> getAllFaq() {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from FAQ order by faq_id desc";
		List<FaqDto> faqs = new ArrayList<FaqDto>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				FaqDto faq = new FaqDto();
				faq.setFaqId(rs.getInt("faq_id"));
				faq.setCategory(rs.getString("category"));
				faq.setQuestion(rs.getString("question"));
				faq.setAnswer(rs.getString("answer"));
				
				faqs.add(faq);
			}
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		return faqs;
	}
	
	// count 
	public int getCountFaq() {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select count(*) from FAQ";
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
	
	
	// delete 
	public void deleteFaq(int faqId) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		
		String sql = "delete from FAQ where faq_id=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, faqId);
			
			int result = pstmt.executeUpdate();
			
			if(result>0) System.out.println("delete FAQ success");
			else System.out.println("delete FAQ error");
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			db.dbClose( pstmt, conn);
		}

	}

	// get FAQ 
	public FaqDto getFaq(int faqId) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from FAQ where faq_id=?";
		FaqDto faq = new FaqDto();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, faqId);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				faq.setFaqId(rs.getInt("faq_id"));
				faq.setCategory(rs.getString("category"));
				faq.setQuestion(rs.getString("question"));
				faq.setAnswer(rs.getString("answer"));
			}
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		return faq;
	}

	
	// update 
	public void updateFaq(FaqDto faq) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		
		String sql = "update FAQ set category=?,question=?,answer=? where faq_id=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, faq.getCategory());
			pstmt.setString(2, faq.getQuestion());
			pstmt.setString(3, faq.getAnswer());
			pstmt.setInt(4, faq.getFaqId());
			
			int result = pstmt.executeUpdate();
			
			if(result>0) System.out.println("update FAQ success");
			else System.out.println("update FAQ error");
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			db.dbClose( pstmt, conn);
		}

	}

}

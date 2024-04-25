package data.user.nonmember;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import db.mysql.DbConnect;

public class NonMemberDao {
	DbConnect db = new DbConnect();
	
	// 비회원 insert 성공 여부
	public boolean insertNonMember(NonMemberDto nonMember) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		
		String sql = "insert into NON_MEMBER_INFO value (null,?,?,?,?)";
		boolean ok = false;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setDate(1, nonMember.getBirthdate());
			pstmt.setString(2, nonMember.getPhoneNumber());
			pstmt.setInt(3, nonMember.getVerificationCode());
			pstmt.setString(4, nonMember.getPassword());
			
			int result = pstmt.executeUpdate();
			if(result > 0) {
				System.out.println("nonMember insert success");
				ok = true;
			}
			else System.out.println("nonMember insert error");
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
		return ok;
	}
	
	// 비회원 존재 체크
	public boolean checkNonMember(NonMemberDto nonMember) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from NON_MEMBER_INFO where birthdate=? and phone_number=? and password=?";
		boolean ok = false;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setDate(1, nonMember.getBirthdate());
			pstmt.setString(2, nonMember.getPhoneNumber());
			pstmt.setString(3, nonMember.getPassword());
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				System.out.println("nonMember reservation chekc success");
				ok = true;
			}
			else System.out.println("nonMember reservation chekc error");
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
		return ok;
	}
	
	
	// 비회원 정보 가져옴
	public NonMemberDto getNonMember() {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from NON_MEMBER_INFO where birthdate=? and phone_number=? and password=?";
		NonMemberDto nonMember = new NonMemberDto();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setDate(1, nonMember.getBirthdate());
			pstmt.setString(2, nonMember.getPhoneNumber());
			pstmt.setString(3, nonMember.getPassword());
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				System.out.println("get nonMember success");
				nonMember.setId(rs.getInt("non_member_id"));
				nonMember.setBirthdate(rs.getDate("birthdate"));
				nonMember.setPhoneNumber(rs.getString("phone_number"));
				nonMember.setVerificationCode(rs.getInt("verification_code"));
				nonMember.setPassword(rs.getString("password"));
			}
			else System.out.println("get nonMember error");
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
		return nonMember;
	}
	
	
	
}

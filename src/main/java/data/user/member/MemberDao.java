package data.user.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import db.mysql.DbConnectLocal;

public class MemberDao {
	DbConnectLocal db = new DbConnectLocal();
	
	// insert 
	public void insertMember(MemberDto member) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		
		String sql = "insert into MEMBER_INFO value (null,?,?,?,?,?,?,?,?,? )";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getUserName());
			pstmt.setString(2, member.getPassword());
			pstmt.setString(3, member.getName());
			pstmt.setString(4, member.getGender().toString()); // 보통 String 쓴다는데 좀 더 조사 해볼 것
			pstmt.setString(5, member.getEmail());
			pstmt.setDate(6, member.getBirthdate());
			pstmt.setString(7, member.getAddress());
			pstmt.setString(8, member.getPhoneNumber());
			pstmt.setString(9, member.getUserPhoto());
			
			int result = pstmt.executeUpdate();
			if(result > 0) System.out.println("member insert success");
			else System.out.println("member insert error");
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
		
	}
	
	// id 중복 체크
	public int isIdCheck(String userName) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select count(*) from MEMBER_INFO where username=?";
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userName);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getInt(1)==1) 
					result=1;
			}
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		return result;
	}
	
	// login check
	public boolean isCheckLogin(String userName, String password) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from MEMBER_INFO where username=? and password=?";
		boolean check = false;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userName);
			pstmt.setString(2, password);
			
			rs = pstmt.executeQuery();
			if(rs.next()) check=true;
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		return check;
	
	}
	
	
	
	
}

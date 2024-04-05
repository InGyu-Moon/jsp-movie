package data.user.nonmember;

import java.sql.Connection;
import java.sql.PreparedStatement;

import db.mysql.DbConnectLocal;

public class NonMemberDao {
	DbConnectLocal db = new DbConnectLocal();
	
	// 비회원 insert 
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
	
	
	
}

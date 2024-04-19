package data.movie.reservation;

import java.sql.Connection;
import java.sql.PreparedStatement;

import db.mysql.DbConnect;
import data.user.member.MemberDto;

public class ReservationDao {
	DbConnect db = new DbConnect();
	
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
	
}

package data.user.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.mysql.DbConnect;

public class MemberDao {
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
			pstmt.setString(4, member.getGender()); // 보통 String 쓴다는데 좀 더 조사 해볼 것
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

	// 전체 회원 목록 조회
	public List<MemberDto> getAllMembers()
	{
		List<MemberDto> list = new ArrayList<>();

		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;

		String sql="select * from MEMBER_INFO order by member_id";

		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();

			while(rs.next())
			{
				MemberDto dto = new MemberDto();
				dto.setId(rs.getInt("member_id"));
				dto.setUserName(rs.getString("username"));
				dto.setPassword(rs.getString("password"));
				dto.setName(rs.getString("name"));
				dto.setGender(rs.getString("gender"));
				dto.setEmail(rs.getString("email"));
				dto.setBirthdate(rs.getDate("birthdate"));
				dto.setAddress(rs.getString("address"));
				dto.setPhoneNumber(rs.getString("phone_number"));
				dto.setUserPhoto(rs.getString("user_photo"));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		return list;
	}

	//페이지
	public List<MemberDto> getList(int start,int perPage)
	{
		List<MemberDto> list=new ArrayList<>();
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;

		String sql="select * from MEMBER_INFO order by member_id desc limit ?,?";

		try {
			pstmt=conn.prepareStatement(sql);

			pstmt.setInt(1, start);
			pstmt.setInt(2, perPage);

			rs=pstmt.executeQuery();

			while(rs.next())
			{
				MemberDto dto = new MemberDto();
				dto.setId(rs.getInt("member_id"));
				dto.setUserName(rs.getString("username"));
				dto.setPassword(rs.getString("password"));
				dto.setName(rs.getString("name"));
				dto.setGender(rs.getString("gender"));
				dto.setEmail(rs.getString("email"));
				dto.setBirthdate(rs.getDate("birthdate"));
				dto.setAddress(rs.getString("address"));
				dto.setPhoneNumber(rs.getString("phone_number"));
				dto.setUserPhoto(rs.getString("user_photo"));
				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}

		return list;
	}

	public MemberDto getMemberById(String memberId) {
		MemberDto dto = new MemberDto();

		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from MEMBER_INFO where MEMBER_ID=?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberId);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				dto.setId(rs.getInt("member_id"));
				dto.setUserName(rs.getString("username"));
				dto.setPassword(rs.getString("password"));
				dto.setName(rs.getString("name"));
				dto.setGender(rs.getString("gender"));
				dto.setEmail(rs.getString("email"));
				dto.setBirthdate(rs.getDate("birthdate"));
				dto.setAddress(rs.getString("address"));
				dto.setPhoneNumber(rs.getString("phone_number"));
				dto.setUserPhoto(rs.getString("user_photo"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		return dto;
	}

	public void deleteMember(String memberId){
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;

		String sql="delete from member_info where member_id=?";

		try {
			pstmt=conn.prepareStatement(sql);

			pstmt.setString(1, memberId);
			pstmt.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}

	}

	
}

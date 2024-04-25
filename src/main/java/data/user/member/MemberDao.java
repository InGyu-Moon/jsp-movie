package data.user.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import data.inform.inquiry.InquiryDto;
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
			pstmt.setString(4, member.getGender().toString()); // 보통 String 쓴다는데 좀 더 조사 해볼 것
			pstmt.setString(5, member.getEmail());
			pstmt.setDate(6, member.getBirthdate());
			pstmt.setString(7, member.getAddress());
			pstmt.setString(8, member.getPhoneNumber());
			pstmt.setString(9, member.getUserPhoto());

			int result = pstmt.executeUpdate();
			if (result > 0)
				System.out.println("member insert success");
			else
				System.out.println("member insert error");

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}

	}

	// 회원이 1:1 문의 등록함
	public void questionInquiryByMember(InquiryDto inquiry, int memberId) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;

		String sql = "insert into INQUIRY value (null,?,?,?,?,?,null)";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memberId);
			pstmt.setString(2, inquiry.getOption().toString()); // 문의 옵션 enum 타입
			pstmt.setString(3, inquiry.getTitle());
			pstmt.setString(4, inquiry.getContent());
			pstmt.setString(5, inquiry.getAttachment());

			int result = pstmt.executeUpdate();
			if (result > 0)
				System.out.println("member 문의 insert success");
			else
				System.out.println("member 문의 insert error");

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
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
			if (rs.next()) {
				if (rs.getInt(1) == 1)
					result = 1;
			}

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
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
			if (rs.next())
				check = true;

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		return check;

	}

	// 전체 회원 목록 조회
	public List<MemberDto> getAllMembers() {
		List<MemberDto> list = new ArrayList<>();

		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from MEMBER_INFO order by member_id";

		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				MemberDto dto = new MemberDto();
				dto.setId(rs.getInt("member_id"));
				dto.setUserName(rs.getString("username"));
				dto.setPassword(rs.getString("password"));
				dto.setName(rs.getString("name"));
				dto.setGender(Gender.valueOf(rs.getString("gender"))); // 문자열을 Gender 열거형으로 변환
				dto.setEmail(rs.getString("email"));
				dto.setBirthdate(rs.getDate("birthdate"));
				dto.setAddress(rs.getString("address"));
				dto.setPhoneNumber(rs.getString("phone_number"));
				dto.setUserPhoto(rs.getString("user_photo"));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		return list;
	}

	// 페이지
	public List<MemberDto> getList(int start, int perPage) {
		List<MemberDto> list = new ArrayList<>();
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from MEMBER_INFO order by member_id desc limit ?,?";

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, start);
			pstmt.setInt(2, perPage);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				MemberDto dto = new MemberDto();
				dto.setId(rs.getInt("member_id"));
				dto.setUserName(rs.getString("username"));
				dto.setPassword(rs.getString("password"));
				dto.setName(rs.getString("name"));
				dto.setGender(Gender.valueOf(rs.getString("gender")));
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
		} finally {
			db.dbClose(rs, pstmt, conn);
		}

		return list;
	}

	// get Member by id
	public MemberDto getMemberById(int memberId) {
		MemberDto dto = new MemberDto();

		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from MEMBER_INFO where MEMBER_ID=?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memberId);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				dto.setId(rs.getInt("member_id"));
				dto.setUserName(rs.getString("username"));
				dto.setPassword(rs.getString("password"));
				dto.setName(rs.getString("name"));
				dto.setGender(Gender.valueOf(rs.getString("gender")));
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

	// get memberId by username
	public int getMemberIdByUsername(String username) {
		int memberId = -1;

		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select MEMBER_ID from MEMBER_INFO where USERNAME=?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, username);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				memberId = rs.getInt("MEMBER_ID");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		return memberId;
	}

	// delete
	public void deleteMember(int memberId) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;

		String sql = "delete from MEMBER_INFO where member_id=?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memberId);

			int result = pstmt.executeUpdate();
			if (result > 0)
				System.out.println("member delete success");
			else
				System.out.println("member delete error");

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}

	}

	// count
	public int getCountMember() {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select count(*) from MEMBER_INFO";
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

	// update
	public void updateMember(MemberDto member) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;

		String sql = "update MEMBER_INFO "
				+ "set username=?,password=?,name=?,gender=?,email=?,birthdate=?,address=?,phone_number=? "
				+ "where member_id=?";

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
			pstmt.setInt(9, member.getId());

			int result = pstmt.executeUpdate();
			if (result > 0)
				System.out.println("member update success");
			else
				System.out.println("member update error");

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}

	}

	// 프로필update
	public void updateProfile(MemberDto member) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;

		String sql = "update MEMBER_INFO "
				+ "set username = ?, user_photo = ? "
				+ "where member_id=?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getUserName());
			pstmt.setString(2, member.getUserPhoto());
			pstmt.setInt(3, member.getId());

			int result = pstmt.executeUpdate();
			if (result > 0)
				System.out.println("profile update success");
			else
				System.out.println("profile update error");

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}

	}

	public List<MemberDto> getMembersByUserName(String userName) {
		List<MemberDto> list = new ArrayList<>();

		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="SELECT * FROM MEMBER_INFO WHERE username LIKE ? ORDER BY member_id";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, "%"+userName+"%");
			rs=pstmt.executeQuery();
			while(rs.next())
			{
				MemberDto dto = new MemberDto();
				dto.setId(rs.getInt("member_id"));
				dto.setUserName(rs.getString("username"));
				dto.setPassword(rs.getString("password"));
				dto.setName(rs.getString("name"));
				dto.setGender(Gender.valueOf(rs.getString("gender"))); // 문자열을 Gender 열거형으로 변환
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
	public List<MemberDto> getListByUserName(String userName,int start,int perPage) {
		List<MemberDto> list = new ArrayList<>();
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from MEMBER_INFO where username LIKE ? order by member_id desc limit ?,?";

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, "%"+userName+"%");
			pstmt.setInt(2, start);
			pstmt.setInt(3, perPage);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				MemberDto dto = new MemberDto();
				dto.setId(rs.getInt("member_id"));
				dto.setUserName(rs.getString("username"));
				dto.setPassword(rs.getString("password"));
				dto.setName(rs.getString("name"));
				dto.setGender(Gender.valueOf(rs.getString("gender")));
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
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		return list;
	}

	public List<MemberDto> getMembersByName(String name) {
		List<MemberDto> list = new ArrayList<>();

		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="SELECT * FROM MEMBER_INFO WHERE name LIKE ? ORDER BY member_id";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, "%"+name+"%");
			rs=pstmt.executeQuery();
			while(rs.next())
			{
				MemberDto dto = new MemberDto();
				dto.setId(rs.getInt("member_id"));
				dto.setUserName(rs.getString("username"));
				dto.setPassword(rs.getString("password"));
				dto.setName(rs.getString("name"));
				dto.setGender(Gender.valueOf(rs.getString("gender"))); // 문자열을 Gender 열거형으로 변환
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
	public List<MemberDto> getListByName(String name,int start,int perPage) {
		List<MemberDto> list = new ArrayList<>();
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from MEMBER_INFO where name LIKE ? order by member_id desc limit ?,?";

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, "%"+name+"%");
			pstmt.setInt(2, start);
			pstmt.setInt(3, perPage);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				MemberDto dto = new MemberDto();
				dto.setId(rs.getInt("member_id"));
				dto.setUserName(rs.getString("username"));
				dto.setPassword(rs.getString("password"));
				dto.setName(rs.getString("name"));
				dto.setGender(Gender.valueOf(rs.getString("gender")));
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
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		return list;
	}

	public List<MemberDto> getMembersByUserNameAndName(String data) {
		List<MemberDto> list = new ArrayList<>();

		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="SELECT * FROM MEMBER_INFO WHERE username LIKE ? or name LIKE ? ORDER BY member_id";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, "%"+data+"%");
			pstmt.setString(2, "%"+data+"%");
			rs=pstmt.executeQuery();
			while(rs.next())
			{
				MemberDto dto = new MemberDto();
				dto.setId(rs.getInt("member_id"));
				dto.setUserName(rs.getString("username"));
				dto.setPassword(rs.getString("password"));
				dto.setName(rs.getString("name"));
				dto.setGender(Gender.valueOf(rs.getString("gender"))); // 문자열을 Gender 열거형으로 변환
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

	public List<MemberDto> getListByUserNameAndName(String data,int start,int perPage) {
		List<MemberDto> list = new ArrayList<>();
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from MEMBER_INFO WHERE username LIKE ? or name LIKE ? order by member_id desc limit ?,?";

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, "%"+data+"%");
			pstmt.setString(2, "%"+data+"%");
			pstmt.setInt(3, start);
			pstmt.setInt(4, perPage);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				MemberDto dto = new MemberDto();
				dto.setId(rs.getInt("member_id"));
				dto.setUserName(rs.getString("username"));
				dto.setPassword(rs.getString("password"));
				dto.setName(rs.getString("name"));
				dto.setGender(Gender.valueOf(rs.getString("gender")));
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
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		return list;
	}

	
}

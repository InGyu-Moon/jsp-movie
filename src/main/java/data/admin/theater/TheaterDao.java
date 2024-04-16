package data.admin.theater;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import data.user.member.Gender;
import data.user.member.MemberDto;
import db.mysql.DbConnect;

public class TheaterDao {
	DbConnect db = new DbConnect();

	
	// insert
    public void insertTheater(TheaterDto theater){
        Connection conn = db.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String sql = "insert into THEATER_INFO values (null,?,?,?,?,?,?,?,?,?)";

        try {
            pstmt=conn.prepareStatement(sql);
            pstmt.setString(1,theater.getRegion().name());
            pstmt.setString(2,theater.getBranch());
            pstmt.setString(3,theater.getNumberOfScreens());
            pstmt.setString(4,theater.getTotalTheaterScreens());
            pstmt.setString(5,theater.getAddress());
            pstmt.setString(6,theater.getTheaterPhoneNumber());
            pstmt.setInt(7,theater.getIs4D());
            pstmt.setInt(8,theater.getIsIMAX());
            pstmt.setString(9,theater.getImg());
            
            int result = pstmt.executeUpdate();
            if (result>0) System.out.println("insertTheater success");
            else System.out.println("insertTheater error");
            
            
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }finally {
            db.dbClose(rs,pstmt,conn);
        }
        
    }
    
    
    // get Theater
    public TheaterDto getTheater(String id){
    	Connection conn = db.getConnection();
    	PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	
    	String sql = "select * from THEATER_INFO where theater_id=?";
    	TheaterDto theater = new TheaterDto();
    	
    	try {
    		pstmt=conn.prepareStatement(sql);
    		pstmt.setString(1, id);
    		rs = pstmt.executeQuery();
    		
    		if(rs.next()) {
    			theater.setTheaterId(String.valueOf(rs.getInt("theater_id")));
    			theater.setRegion(Region.valueOf(rs.getString("region")));
    			theater.setBranch(rs.getString("branch"));
    			theater.setNumberOfScreens(String.valueOf(rs.getInt("number_of_screens")));
    			theater.setTotalTheaterScreens(String.valueOf(rs.getInt("total_theater_seats")));
    			theater.setAddress(rs.getString("address"));
    			theater.setTheaterPhoneNumber(rs.getString("theater_phone_number"));
    			theater.setIs4D(rs.getInt("is_4d"));
    			theater.setIsIMAX(rs.getInt("is_imax"));
    			theater.setImg(rs.getString("img"));
    			
    		} else {
    			System.out.println("get Theater ERROR");
    		}
    		
    	} catch (SQLException e) {
    		throw new RuntimeException(e);
    	}finally {
    		db.dbClose(rs,pstmt,conn);
    	}
    	return theater;
    }
    
    
    // select ALL
    public List<TheaterDto> selectAllTheater(){
    	Connection conn = db.getConnection();
    	PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	
    	String sql = "select * from THEATER_INFO order by theater_id desc";
    	List<TheaterDto> list = new ArrayList<TheaterDto>();
    	
    	try {
    		pstmt=conn.prepareStatement(sql);
    		rs = pstmt.executeQuery();
    		
    		while(rs.next()) {
    			TheaterDto theater = new TheaterDto();
    			theater.setTheaterId(String.valueOf(rs.getInt("theater_id")));
    			theater.setRegion(Region.valueOf(rs.getString("region")));
    			theater.setBranch(rs.getString("branch"));
    			theater.setNumberOfScreens(String.valueOf(rs.getInt("number_of_screens")));
    			theater.setTotalTheaterScreens(String.valueOf(rs.getInt("total_theater_seats")));
    			theater.setAddress(rs.getString("address"));
    			theater.setTheaterPhoneNumber(rs.getString("theater_phone_number"));
    			theater.setIs4D(rs.getInt("is_4d"));
    			theater.setIsIMAX(rs.getInt("is_imax"));
    			theater.setImg(rs.getString("img"));
    			
    			list.add(theater);
    		}
    		
    	} catch (SQLException e) {
    		throw new RuntimeException(e);
    	}finally {
    		db.dbClose(rs,pstmt,conn);
    	}
    	return list;
    }
    
    
    // select Region
    public List<TheaterDto> selectRegion(String region){
    	Connection conn = db.getConnection();
    	PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	
    	String sql = "select * from THEATER_INFO where region=? order by region";
    	List<TheaterDto> list = new ArrayList<TheaterDto>();
    	
    	try {
    		pstmt=conn.prepareStatement(sql);
    		pstmt.setString(1, region);
    		rs = pstmt.executeQuery();
    		
    		while(rs.next()) {
    			TheaterDto theater = new TheaterDto();
    			theater.setTheaterId(String.valueOf(rs.getInt("theater_id")));
    			theater.setRegion(Region.valueOf(rs.getString("region")));
    			theater.setBranch(rs.getString("branch"));
    			theater.setNumberOfScreens(String.valueOf(rs.getInt("number_of_screens")));
    			theater.setTotalTheaterScreens(String.valueOf(rs.getInt("total_theater_seats")));
    			theater.setAddress(rs.getString("address"));
    			theater.setTheaterPhoneNumber(rs.getString("theater_phone_number"));
    			theater.setIs4D(rs.getInt("is_4d"));
    			theater.setIsIMAX(rs.getInt("is_imax"));
    			theater.setImg(rs.getString("img"));
    			
    			list.add(theater);
    		}
    		
    	} catch (SQLException e) {
    		throw new RuntimeException(e);
    	}finally {
    		db.dbClose(rs,pstmt,conn);
    	}
    	return list;
    }
    
    
    // select Region && Branch
    public List<TheaterDto> selectRegionAndBranch(String region, String branch){
    	Connection conn = db.getConnection();
    	PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	
    	String sql = "select * from THEATER_INFO where region=? and branch like ?";
    	List<TheaterDto> list = new ArrayList<TheaterDto>();
    	
    	try {
    		pstmt=conn.prepareStatement(sql);
    		pstmt.setString(1, region);
    		pstmt.setString(2, "%"+branch+"%");
    		rs = pstmt.executeQuery();
    		
    		while(rs.next()) {
    			TheaterDto theater = new TheaterDto();
    			theater.setTheaterId(String.valueOf(rs.getInt("theater_id")));
    			theater.setRegion(Region.valueOf(rs.getString("region")));
    			theater.setBranch(rs.getString("branch"));
    			theater.setNumberOfScreens(String.valueOf(rs.getInt("number_of_screens")));
    			theater.setTotalTheaterScreens(String.valueOf(rs.getInt("total_theater_seats")));
    			theater.setAddress(rs.getString("address"));
    			theater.setTheaterPhoneNumber(rs.getString("theater_phone_number"));
    			theater.setIs4D(rs.getInt("is_4d"));
    			theater.setIsIMAX(rs.getInt("is_imax"));
    			theater.setImg(rs.getString("img"));
    			
    			list.add(theater);
    		}
    		
    	} catch (SQLException e) {
    		throw new RuntimeException(e);
    	}finally {
    		db.dbClose(rs,pstmt,conn);
    	}
    	return list;
    }
    
    
    // search Branch
    public List<TheaterDto> searchBranch(String branch){
    	Connection conn = db.getConnection();
    	PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	
    	String sql = "select * from THEATER_INFO where branch like ?";
    	List<TheaterDto> list = new ArrayList<TheaterDto>();
    	
    	try {
    		pstmt=conn.prepareStatement(sql);
    		pstmt.setString(1, "%"+branch+"%");
    		rs = pstmt.executeQuery();
    		
    		while(rs.next()) {
    			TheaterDto theater = new TheaterDto();
    			theater.setTheaterId(String.valueOf(rs.getInt("theater_id")));
    			theater.setRegion(Region.valueOf(rs.getString("region")));
    			theater.setBranch(rs.getString("branch"));
    			theater.setNumberOfScreens(String.valueOf(rs.getInt("number_of_screens")));
    			theater.setTotalTheaterScreens(String.valueOf(rs.getInt("total_theater_seats")));
    			theater.setAddress(rs.getString("address"));
    			theater.setTheaterPhoneNumber(rs.getString("theater_phone_number"));
    			theater.setIs4D(rs.getInt("is_4d"));
    			theater.setIsIMAX(rs.getInt("is_imax"));
    			theater.setImg(rs.getString("img"));
    			
    			list.add(theater);
    		}
    		
    	} catch (SQLException e) {
    		throw new RuntimeException(e);
    	}finally {
    		db.dbClose(rs,pstmt,conn);
    	}
    	return list;
    }
    

	// count 
	public int getCountTheater() {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select count(*) from THEATER_INFO";
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
	

	//페이징
	public List<TheaterDto> getPagingList(int start,int perPage)
	{
		List<TheaterDto> list=new ArrayList<>();
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;

		String sql="select * from THEATER_INFO order by theater_id desc limit ?,?";

		try {
			pstmt=conn.prepareStatement(sql);

			pstmt.setInt(1, start);
			pstmt.setInt(2, perPage);

			rs=pstmt.executeQuery();

			while(rs.next())
			{
				TheaterDto theater = new TheaterDto();
    			theater.setTheaterId(String.valueOf(rs.getInt("theater_id")));
    			theater.setRegion(Region.valueOf(rs.getString("region")));
    			theater.setBranch(rs.getString("branch"));
    			theater.setNumberOfScreens(String.valueOf(rs.getInt("number_of_screens")));
    			theater.setTotalTheaterScreens(String.valueOf(rs.getInt("total_theater_seats")));
    			theater.setAddress(rs.getString("address"));
    			theater.setTheaterPhoneNumber(rs.getString("theater_phone_number"));
    			theater.setIs4D(rs.getInt("is_4d"));
    			theater.setIsIMAX(rs.getInt("is_imax"));
    			theater.setImg(rs.getString("img"));
    			
    			list.add(theater);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}

		return list;
	}

	// delete
	public void deleteTheater(String theaterId){
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;

		String sql="delete from THEATER_INFO where theater_id=?";

		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, theaterId);

			int result = pstmt.executeUpdate();
			if(result>0) System.out.println("theater delete success");
			else System.out.println("theater delete error");
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}

	}
	
	
	// update
	public void updateTheater(TheaterDto theater){
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="update THEATER_INFO set region=?,branch=?,number_of_screens=?,total_theater_seats=?,address=?,"
				+ "theater_phone_number=?,is_imax=?,is_4d=?"
				+ " where theater_id=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, theater.getRegion().name());
			pstmt.setString(2, theater.getBranch());
			pstmt.setString(3, theater.getNumberOfScreens());
			pstmt.setString(4, theater.getTotalTheaterScreens());
			pstmt.setString(5, theater.getAddress());
			pstmt.setString(6, theater.getTheaterPhoneNumber());
			pstmt.setInt(7, theater.getIs4D());
			pstmt.setInt(8, theater.getIsIMAX());
			pstmt.setString(9, theater.getTheaterId());
			
			int result = pstmt.executeUpdate();
			if(result>0) System.out.println("theater update success");
			else System.out.println("theater update error");
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
		
	}
	
	
    
}

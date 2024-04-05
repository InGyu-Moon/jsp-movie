package data.movie.movieinfo;

import java.sql.Connection;
import java.sql.PreparedStatement;

import db.mysql.DbConnectLocal;

public class MovieDao {
	public static final String rootUrl = "http://www.cgv.co.kr"; // 영화메인
	DbConnectLocal db = new DbConnectLocal();
	
	// 영화 이름과 상세 링크만 저장 
	public void insertTitleAndLink(String title, String detailLink) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		
		String sql = "insert into MOVIE_INFO (movie_id,movie_title,movie_detail_link) value (null,?,?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, title);
			pstmt.setString(2, detailLink);
			
			int result = pstmt.executeUpdate();
			if(result > 0) System.out.println("movie title and link insert success");
			else System.out.println("movie title and link  insert error");
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
		
	}
	
	
	
}

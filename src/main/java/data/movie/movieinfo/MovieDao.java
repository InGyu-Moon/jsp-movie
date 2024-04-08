package data.movie.movieinfo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.Iterator;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import db.mysql.DbConnect;

public class MovieDao {
	public static final String rootUrl = "http://www.cgv.co.kr"; // 영화메인
	DbConnect db = new DbConnect();
	
	// 영화 이름과 상세 링크만 저장 
	public void insertTitleAndLink() { //String crawlingTitle, String crawlingDetailLink
		
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		
		String sql = "insert into MOVIE_INFO values (null,?,120,'12세 이용가','감독','배우진','18.8','2024-04-10','애니매이션','영화소개','5.0','2024-05-01','나라',?)";
		String crawlingUrl = "http://www.cgv.co.kr/movies/";  // 크롤링할 CGV 웹사이트의 URL => 현재 상영작만 보기 체크됨
		
		Document doc = null;  // HTML 문서를 저장할 변수 초기화

        try {
            doc = Jsoup.connect(crawlingUrl).get();  // Jsoup을 사용하여 URL에 연결하고 HTML 문서를 가져옴
        } catch (Exception e) {
            e.printStackTrace();  // 연결 중 예외가 발생한 경우 예외 정보를 출력
        }

        // HTML 문서에서 "div.sect-movie-chart" 클래스를 가진 요소들을 선택하여 Elements 객체로 저장
        Elements elements = doc.select("div.sect-movie-chart"); // 19개

        Iterator<Element> title = elements.select("strong.title").iterator(); // 영화제목
        Iterator<Element> movieDetailLink = elements.select("div.box-image > a").iterator(); // 영화상세 링크

        // Iterator를 사용하여 순위와 제목을 반복적으로 출력
        while (title.hasNext()) {
            Element titleElement = title.next();
            Element movieDetailLinkElement = movieDetailLink.next();

            String titleText = titleElement.text();
            String detailLink = rootUrl + movieDetailLinkElement.attr("href");

            System.out.println("영화이름: " + titleText + "\n영화상세링크:" + detailLink);
            System.out.println("------------------------------");

            //-----------------------------------------------------------------------------------------------
            // 각각 영화에 대한 데이터 db에 저장
            try {
    			pstmt = conn.prepareStatement(sql);
    			pstmt.setString(1, titleText);
    			pstmt.setString(2, detailLink);
    			
    			int result = pstmt.executeUpdate();
    			if(result > 0) System.out.println("movie title and link insert success");
    			else System.out.println("movie title and link  insert error");
    			
    		}catch(Exception ex) {
    			ex.printStackTrace();
    		}
    		
        }
        db.dbClose(pstmt, conn);
		
		
	}
	
	// 영화 상세 페이지에 들어가 해당 영화 데이터를 저장함
	public void insertMovieDetailData() { 
		
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		
		String sql = "insert into MOVIE_INFO values (null,?,120,'12세 이용가','감독','배우진','18.8','2024-04-10','애니매이션','영화소개','5.0','2024-05-01','나라',?)";
		String crawlingUrl = "http://www.cgv.co.kr/movies/";  // 크롤링할 CGV 웹사이트의 URL => 현재 상영작만 보기 체크됨
		
		Document doc = null;  // HTML 문서를 저장할 변수 초기화

        try {
            doc = Jsoup.connect(crawlingUrl).get();  // Jsoup을 사용하여 URL에 연결하고 HTML 문서를 가져옴
        } catch (Exception e) {
            e.printStackTrace();  // 연결 중 예외가 발생한 경우 예외 정보를 출력
        }

        // HTML 문서에서 "div.sect-movie-chart" 클래스를 가진 요소들을 선택하여 Elements 객체로 저장
        Elements elements = doc.select("div.sect-movie-chart"); // 19개

        Iterator<Element> title = elements.select("strong.title").iterator(); // 영화제목
        Iterator<Element> movieDetailLink = elements.select("div.box-image > a").iterator(); // 영화상세 링크

        // Iterator를 사용하여 순위와 제목을 반복적으로 출력
        while (title.hasNext()) {
            Element titleElement = title.next();
            Element movieDetailLinkElement = movieDetailLink.next();

            String titleText = titleElement.text();
            String detailLink = rootUrl + movieDetailLinkElement.attr("href");

            System.out.println("영화이름: " + titleText + "\n영화상세링크:" + detailLink);
            System.out.println("------------------------------");

            //-----------------------------------------------------------------------------------------------
            // 각각 영화에 대한 데이터 db에 저장
            try {
    			pstmt = conn.prepareStatement(sql);
    			pstmt.setString(1, titleText);
    			pstmt.setString(2, detailLink);
    			
    			int result = pstmt.executeUpdate();
    			if(result > 0) System.out.println("movie title and link insert success");
    			else System.out.println("movie title and link  insert error");
    			
    		}catch(Exception ex) {
    			ex.printStackTrace();
    		}
    		
        }
        db.dbClose(pstmt, conn);
		
		
	}
	
	
	
}

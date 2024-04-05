<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="org.jsoup.*" %>
<%@ page import="org.jsoup.nodes.Document" %>
<%@ page import="org.jsoup.nodes.Element" %>
<%@ page import="org.jsoup.select.Elements" %>
<%@ page import="data.movie.movieinfo.MovieDto" %>
<%@ page import="data.movie.movieinfo.MovieDao" %>


<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%
	request.setCharacterEncoding("utf-8");
	
	String rootUrl = "http://www.cgv.co.kr";
	String crawlingUrl = "http://www.cgv.co.kr/movies/";  // 크롤링할 CGV 웹사이트의 URL => 현재 상영작만 보기 체크됨
	
	Document doc = null;  // HTML 문서를 저장할 변수 초기화
	
	try {
	    doc = Jsoup.connect(crawlingUrl).get();  // Jsoup을 사용하여 URL에 연결하고 HTML 문서를 가져옴
	} catch (Exception e) {
	    e.printStackTrace();  // 연결 중 예외가 발생한 경우 예외 정보를 출력
	}
	
	// HTML 문서에서 "div.sect-movie-chart" 클래스를 가진 요소들을 선택하여 Elements 객체로 저장
	Elements elements = doc.select("div.sect-movie-chart");
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
	
	    MovieDto movieInfo = new MovieDto();
	    movieInfo.setMovieTitle(titleText);
	    movieInfo.setMovieDetailLink(detailLink);
	    
	    MovieDao dao = new MovieDao();
	    dao.insertTitleAndLink(titleText, detailLink);
	    
	    
	}
	System.out.println("========================================================\n");
	
	
	response.sendRedirect("reservationForm.jsp");
	
%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.user.nonmember.NonMemberDao"%>
<%@page import="data.user.nonmember.NonMemberDto"%>
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../include/header.html"></jsp:include>
<%
	request.setCharacterEncoding("utf-8");
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

	NonMemberDao dao = new NonMemberDao();
	NonMemberDto nonMember = dao.getNonMember();
	//String birthdate = sdf.format()

%>
<body>
	<div id="wrap">
		<div class="log nonReservationForm">
			<div class="center">
				<h2><strong>MY(비회원) 예매내역</strong></h2><br>
				<div style="background-color: black; height:50px;">
					<p style="color:white; padding: 15px 0px 0px 15px">
						비회원으로 예매 시 상영원 기준 2일 간의 예매 내역만 조회할 수 있습니다.
					</p>
				</div>
				<br>
				<label>예매번호&nbsp;:&nbsp;00000000</label>
				<table border="1">
			        <tr>
			            <td rowspan="7" width="400">
							<img src="../img/movie_img/test/.jpg" />
						</td>
			            <td colspan="2"><b>영화제모옥이 좀 길어야 이쁠듯</b></td>
			        </tr>
			        <tr>
			            <th>관람극장</th>
			            <td>두 번째 열의 두 번째 행</td>
			        </tr>
			        <tr>
			            <th>관람일시</th>
			            <td>두 번째 열의 세 번째 행</td>
			        </tr>
			        <tr>
			            <th>상영관</th>
			            <td>두 번째 열의 네 번째 행</td>
			        </tr>
			        <tr>
			            <th>관람인원</th>
			            <td>두 번째 열의 다섯 번째 행</td>
			        </tr>
			        <tr>
			            <th>관람좌석</th>
			            <td>두 번째 열의 여섯 번째 행</td>
			        </tr>
			        <tr>
			            <th>매수</th>
			            <td>두 번째 열의 일곱 번째 행</td>
			        </tr>
			    </table>
			</div>
		</div>
	</div>

	<jsp:include page="../include/footer.html"></jsp:include>
	<script type="text/javascript">
		
	</script>
</body>
</html>
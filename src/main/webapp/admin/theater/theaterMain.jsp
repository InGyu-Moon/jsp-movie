<%@page import="data.admin.theater.TheaterDto"%>
<%@page import="data.admin.theater.TheaterDao"%>
<%@ page import="data.inform.notice.NoticeDao" %>
<%@ page import="data.inform.notice.NoticeDto" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" %>
<%
	request.setCharacterEncoding("utf-8");

	TheaterDao dao = new TheaterDao();
	int count = dao.getCountTheater();

	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
%>
<%
	//전체갯수
	int totalCount=count;
	int perPage=10; //한페이지당 보여질 글의 갯수
	int perBlock=5; //한블럭당 보여질 페이지 갯수
	int startNum; //db에서 가져올 글의 시작번호(mysql은 첫글이0번,오라클은 1번);
	int startPage; //각블럭당 보여질 시작페이지
	int endPage; //각블럭당 보여질 끝페이지
	int currentPage;//현재페이지
	int totalPage; //총페이지수
	int no; //각페이지당 출력할 시작번호

	//현재페이지 읽는데 단 null일경우는 1페이지로 준다
	if(request.getParameter("currentPage")==null)
		currentPage=1;
	else
		currentPage=Integer.parseInt(request.getParameter("currentPage"));

	//총페이지수 구한다
	//총글갯수/한페이지당보여질갯수로 나눔(7/5=1)
	//나머지가 1이라도 있으면 무조건 1페이지 추가(1+1=2페이지가 필요)
	totalPage=totalCount/perPage+(totalCount%perPage==0?0:1);

	//각블럭당 보여질 시작페이지
	//perBlock=5일경우 현재페이지가 1~5일경우 시작페이지가1,끝페이지가 5
	//현재가 13일경우 시작:11 끝:15
	startPage=(currentPage-1)/perBlock*perBlock+1;
	endPage=startPage+perBlock-1;

	//총페이지가 23일경우 마지막블럭은 끝페이지가 25가 아니라 23
	if(endPage>totalPage)
		endPage=totalPage;

	//각페이지에서 보여질 시작번호
	//1페이지:0, 2페이지:5 3페이지: 10.....
	startNum=(currentPage-1)*perPage;

	//각페이지당 출력할 시작번호 구하기
	//총글개수가 23, 1페이지:23 2페이지:183페이지:13
	no=totalCount-(currentPage-1)*perPage;

	//페이지에서 보여질 글만 가져오기
	List<TheaterDto> list = dao.getPagingList(startNum, perPage);
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Dongle&family=Gaegu&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@100..900&family=Noto+Serif+KR&display=swap"
		rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
	<title>공지사항</title>
	<style type="text/css">
		a{
			text-decoration: none; /* 링크의 밑줄 제거 */
			color: inherit; /* 링크의 색상 제거 */
		}
		.table-custom th:nth-child(1) {
			width: 5%; /* 1 / 22.4 * 100% */
		}
		.table-custom th:nth-child(2) {
			width: 15%; /* 3 / 22.4 * 100% */
		}
		.table-custom th:nth-child(3) {
			width: 16.07%; /* 3.5 / 22.4 * 100% */
		}
		.table-custom th:nth-child(4) {
			width: 4.46%; /* 1.2 / 22.4 * 100% */
		}
		.table-custom th:nth-child(5) {
			width: 7.82%; /* 2.2 / 22.4 * 100% */
		}
		.table-custom th:nth-child(6) {
			width: 22.32%; /* 5 / 22.4 * 100% */
		}
		.table-custom th:nth-child(7) {
			width: 22.32%; /* 5 / 22.4 * 100% */
		}
		.table-custom th:nth-child(8) {
			width: 11%; /* 2.5 / 22.4 * 100% */
		}
		.table-custom th:nth-child(9) {
			width: 13%; /* 새로운 너비에 맞게 조정 */
		}


		.table-custom {
			text-align: center;
		}

		.table-custom p {
			margin-left: 20px; /* 원하는 만큼의 여백 설정 */
		}

		.table-custom th:nth-child(1),
		.table-custom td:nth-child(1) {
			text-align: center;
		}

		.search-wrap {
			display: flex; /* 입력란과 버튼을 수평으로 배치합니다. */
			width: 80%; /* 부모 요소의 너비 설정 */
		}

		#search {
			width: 65%; /* 입력란의 너비 설정 */
		}

		.btn-dark {
			width: 20%; /* 버튼의 너비 설정 */
			margin-left: 10px;
		}

		.center{
			display:flex;
			width:100%
		}
		.container-side{
			width: 20%;
		}
		
		.table-custom th,
		.table-custom td {
			text-align: center;
		}

	</style>
<script type="text/javascript">

$(document).on("click", ".btnDetail", function(){ // $(document).ready(function(){에서 안 먹힘
	var theaterId = $(this).val();
	 	alert("id : "+theaterId);
	 	location.href="adminMainPage.jsp?curr=theater/theaterUpdateForm.jsp?theaterId="+theaterId;
});


$(document).ready(function(){
	// 전체체크 클릭 시 체크값 얻어서 모든 체크값에 전달
	$(".th-check").click(function(){
		// 전체 체크값 얻기
		var chk=$(this).is(":checked"); // th-check 체크박스 체크 상태를 확인
		console.log(chk);
	
		//전체체크값을 글앞에 체크에 일괄 전달하기
		$(".check").prop("checked",chk);
	});
	
	//선택삭제 버튼 클릭 시 삭제
	$(".btndel").click(function(){
	
		var len=$(".check:checked").length;
		console.log(len);
	
		if(len==0){
			alert("최소 1개이상의 글을 선택해 주세요");
		}else{
	
			if(confirm("선택한 항목을 삭제하시겠습니까?")){
				//체크된 곳의 value값(num)얻기
				var n="";
				$(".check:checked").each(function(idx){
					n+=$(this).val()+",";
				});
	
				//마지막 컴마 제거
				n=n.substring(0,n.length-1);
	
				//삭제파일로 전송
				//location.href="?curr=theater/theaterDelete.jsp?theaterId="+n;
				$.ajax({
					type:"post",
					dataType:"html",
					url:"theater/theaterDelete.jsp",
					data:{"theaterId":n},
					success:function(){
						alert("삭제되었습니다.");
						location.reload();//새로고침
					}
				});
			}
		}
	}); // 삭제버튼 클릭 시
	
	// region 셀렉트 박스의 값이 변경될 때 이벤트 처리
	$("select[name='region']").change(function(){
		// 이전에 있던 데이터를 모두 삭제
		$(".selectList").empty();
		
		var startNum = <%= startNum %>; // JSP 표현식을 사용하여 JSP 변수의 값을 가져옵니다.
		var perPage = <%= perPage %>; // JSP 표현식을 사용하여 JSP 변수의 값을 가져옵니다.
		// 선택된 지역 값 가져오기
		var selectedRegion = $(this).val();
		
		console.log("선택된 지역:", selectedRegion);
		console.log("넘어온 startNum와 perPage:", startNum,perPage);
		
		if(selectedRegion==="전체"){
			location.reload();//새로고침
		}
		$.ajax({
			type:"post",
			dataType:"json",
			url:"theater/theaterRegionList.jsp",
			data:{"region":selectedRegion,"startNum":startNum,"perPage":perPage},
			success:function(data){
				console.log("넘어온 데이터", data);
				// 결과값의 총 수 계산
				var totalCount = data.length;
				// 결과값의 총 수를 #countSpan 요소에 넣어줌
				$("#countSpan").text("총 " + totalCount);
							
				// 데이터가 없으면 안내 메시지만 출력
				if(data.length === 0) {
					$(".selectList").append("<tr><td colspan='8' align='center'><b>선택된 지역에 대한 영화관이 없습니다.</b></td></tr>");
				} else {
					// 받아온 데이터를 이용하여 동적으로 HTML 생성 및 추가
					$.each(data,function(index,item){
						console.log(index,item)
						var theaterId = item.theaterId;
						var region = item.region;
						var branch = item.branch;
						var numberOfScreens = item.numberOfScreens;
						var totalTheaterSeats = item.totalTheaterSeats;
						var address = item.address;
						var theaterPhoneNumber = item.theaterPhoneNumber;
						var is = "";
						if(item.isIMAX===1)is+="IMAX,";
						if(item.is4D===1)is+="4D";
						// 생성한 HTML을 테이블에 추가
						var newRow = "<tr>" +
						"<td><input type='checkbox' class='check' value='" + theaterId + "'></td>" +
						"<td><input type='text' readonly id='region' class='form-control-plaintext' value='" + region + "'></td>" +
						"<td><input type='text' readonly id='branch' class='form-control-plaintext' value='" + branch + "'></td>" +
						"<td><input type='text' readonly id='numberOfscreens' class='form-control-plaintext' value='" + numberOfScreens + "'></td>" +
						"<td><input type='text' readonly id='totalOfscreens' class='form-control-plaintext' value='" + totalTheaterSeats + "'></td>" +
						"<td><input type='text' readonly id='address' class='form-control-plaintext' value='" + address + "'></td>" +
						"<td><input type='text' readonly id='theaterPhonNumber' class='form-control-plaintext' value='" + theaterPhoneNumber + "'></td>" +
						"<td><input type='text' readonly id='screens' class='form-control-plaintext' value='" + is + "'></td>" +
						"<td><button type='button' class='btn btn-outline-warning btn-sm btnDetail' value='" + theaterId + "' style='width:70px;'>수정</button></td>" +
						"</tr>";
						// 생성한 HTML을 테이블에 추가
						$(".selectList").append(newRow);
					});
				}
			},
			error:function(request,status,error){        
				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);       
	 		}
		});
	});// region 데이터 리스트
	
	
	// 검색버튼을 클릭 시
	$("#search").click(function() {
		// 이전에 있던 데이터를 모두 삭제
		$(".selectList").empty();
		
		// searchContent의 값을 가져와서 변수에 저장합니다.
		var searchText = $("input[name='searchContent']").val();
		 
		// searchText가 빈 문자열이 아닌 경우에만 작업을 수행합니다.
		if (searchText !== "") {
			// 초기화할 지역 선택 셀렉트 박스의 값을 지정합니다.
	        $("select[name='region']").val("지역");
			
			// 가져온 값을 콘솔에 출력하여 확인합니다.
			console.log("검색어:", searchText); // 지점
			
			$.ajax({
				type:"post",
				dataType:"json",
				url:"theater/theaterBranchList.jsp",
				data:{"branch":searchText},
				success:function(data){
					console.log("넘어온 데이터", data);
					// 결과값의 총 수 계산
					var totalCount = data.length;
					// 결과값의 총 수를 #countSpan 요소에 넣어줌
					$("#countSpan").text("총 " + totalCount);
								
					// 데이터가 없으면 안내 메시지만 출력
					if(data.length === 0) {
						$(".selectList").append("<tr><td colspan='8' align='center'><b>선택된 지역에 대한 영화관이 없습니다.</b></td></tr>");
					} else {
						// 받아온 데이터를 이용하여 동적으로 HTML 생성 및 추가
						$.each(data,function(index,item){
							console.log(index,item)
							var theaterId = item.theaterId;
							var region = item.region;
							var branch = item.branch;
							var numberOfScreens = item.numberOfScreens;
							var totalTheaterSeats = item.totalTheaterSeats;
							var address = item.address;
							var theaterPhoneNumber = item.theaterPhoneNumber;
							var is = "";
							if(item.isIMAX===1)is+="IMAX,";
							if(item.is4D===1)is+="4D";
							// 생성한 HTML을 테이블에 추가
							var newRow = "<tr>" +
							"<td><input type='checkbox' class='check' value='" + theaterId + "'></td>" +
							"<td><input type='text' readonly id='region' class='form-control-plaintext' value='" + region + "'></td>" +
							"<td><input type='text' readonly id='branch' class='form-control-plaintext' value='" + branch + "'></td>" +
							"<td><input type='text' readonly id='numberOfscreens' class='form-control-plaintext' value='" + numberOfScreens + "'></td>" +
							"<td><input type='text' readonly id='totalOfscreens' class='form-control-plaintext' value='" + totalTheaterSeats + "'></td>" +
							"<td><input type='text' readonly id='address' class='form-control-plaintext' value='" + address + "'></td>" +
							"<td><input type='text' readonly id='theaterPhonNumber' class='form-control-plaintext' value='" + theaterPhoneNumber + "'></td>" +
							"<td><input type='text' readonly id='screens' class='form-control-plaintext' value='" + is + "'></td>" +
							"<td><button type='button' class='btn btn-outline-warning btn-sm btnDetail' value='" + theaterId + "' style='width:70px;'>수정</button></td>" +
							"</tr>";
							// 생성한 HTML을 테이블에 추가
							$(".selectList").append(newRow);
						});
					}
				},
				error:function(request,status,error){        
					console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);       
		 		}
			});
		}else {
			// searchText가 빈 문자열인 경우, 사용자에게 알림을 표시할 수 있습니다.
			console.log("검색어가 유효하지 않습니다.");
			// 예를 들어, 사용자에게 경고창을 표시하는 등의 작업을 수행할 수 있습니다.
		}
	});
	
});
</script>
</head>

<body>

<div class="container-rightside" style="width: 80%;">
	<h2 style="margin-bottom: 50px">극장 관리</h2>
	<hr style="margin-bottom: 30px">
<div class="container">
	<div class="container d-flex justify-content-between align-items-center">
		<div>
			<button type="button" class="btn btn-outline-danger ml-2 btndel">선택삭제</button>
			<button type="button" class="btn btn-outline-info ml-2"
					onclick="location.href='?curr=theater/theaterAddForm.jsp'">생성</button>
		</div>
		<span><small id="countSpan">총 <%=count %></small></span>
	</div>

	<!-- 공지 검색 -->
	<br>
	<div class="container">
		<div class="search-window">
			<form action="#" method="post">
				<!-- <div class="search-wrap"> -->
					<!-- <input id="search" class="form-control" type="search" name="" placeholder="검색어를 입력해주세요">
					<button type="submit" class="btn btn-dark">검색</button> -->
					<select name="region" class="form-select" style="width:170px; float: left;">
						<option value="지역" selected disabled>지역</option>
						<option value="전체">전체</option>
						<option value="서울">서울</option>
						<option value="경기">경기</option>
						<option value="인천">인천</option>
						<option value="강원">강원</option>
						<option value="대전_충청">대전/충청</option>
						<option value="대구">대구</option>
						<option value="부산_울산">부산/울산</option>
						<option value="경상">경상</option>
						<option value="광주_전라_제주">광주/전라/제주</option>
					</select>
					<input type="text" name="searchContent" class="form-control" style="float: left; width:400px; margin-left: 50px;" placeholder="지점을 검색해주세요." >
					<button type="button" id="search" class="btn btn-outline-dark" style="float: left; width:80px; margin-left: 5px;">검색</button>
			 <br> 
				<!-- </div> -->
			</form>
			<br>
		</div>
	</div>

	<!-- 공지 목록 -->
	<div class="container">
		<table class="table table-bordered table-hover table-custom">
			<thead class="table-light">
				<tr>
					<th><input type="checkbox" class="th-check"></th>
					<th>지역</th>
					<th>지점</th>
					<th>상영관수</th>
					<th>총 좌석수</th>
					<th>상세주소</th>
					<th>전화번호</th>
					<th>스크린여부</th>
					<th>기타</th>
				</tr>
			</thead>
			<tbody class="selectList">
			<%
			if(count==0){
			%>
				<tr>
					<td colspan="8" align="center">
						<b>선택된 지역에 대한 영화관이 없습니다.</b>
					</td>
				</tr>
			<%	
			}else{
				for(TheaterDto theater : list){
				%>
				<tr>
					<td><input type="checkbox" class="check" value="<%=theater.getTheaterId() %>"></td>
					<td><input type="text" readonly id="region" class="form-control-plaintext" value="<%=theater.getRegion() %>"></td>
					<td><input type="text" readonly id="branch" class="form-control-plaintext" value="<%=theater.getBranch() %>"></td>
					<td><input type="text" readonly id="numberOfscreens" class="form-control-plaintext" value="<%=theater.getNumberOfScreens() %>"></td>
					<td><input type="text" readonly id="totalOfscreens" class="form-control-plaintext" value="<%=theater.getTotalTheaterScreens() %>"></td>
					<td><input type="text" readonly id="address" class="form-control-plaintext" value="<%=theater.getAddress() %>"></td>
					<td><input type="text" readonly id="theaterPhonNumber" class="form-control-plaintext" value="<%=theater.getTheaterPhoneNumber() %>"></td>
					<%
					String is = "";
					if(theater.getIsIMAX()==1){is+="IMAX,";}
					if(theater.getIs4D()==1){is+="4D";}
					%>
					<td><input type="text" readonly id="screens" class="form-control-plaintext" value="<%=is%>"></td>
					<td><button type="button" class="btn btn-outline-warning btn-sm btnDetail" value="<%=theater.getTheaterId() %>" style="width:70px;">수정</button></td>
				</tr>
				<%
				}%>
			</tbody>
		</table>
			<%
			}
			%>
	</div>

	<!-- 페이지 번호 출력 -->
	<div style="width: 580px; text-align: center; margin: 50px 100px;">
		
		<ul class="pagination justify-content-center">
		<%
		//이전
		if(startPage>1)
		{%>
			<li class="page-item ">
			 <a class="page-link" href="../admin/adminMainPage.jsp?curr=theater/theaterMain.jsp?currentPage=<%=startPage-1%>" style="color: black;">이전</a>
			</li>
		<%}
		for(int pp=startPage;pp<=endPage;pp++)
		{
			if(pp==currentPage)
			{%>
				<li class="page-item active">
				<a class="page-link" href="../admin/adminMainPage.jsp?curr=theater/theaterMain.jsp?currentPage=<%=pp%>"><%=pp %></a>
				</li>
			<%}else
			{%>
				<li class="page-item">
				<a class="page-link" href="../admin/adminMainPage.jsp?curr=theater/theaterMain.jsp?currentPage=<%=pp%>"><%=pp %></a>
				</li>
			<%}
		}
		
		//다음
		if(endPage<totalPage)
		{%>
			<li class="page-item">
				<a class="page-link" href="../admin/adminMainPage.jsp?curr=theater/theaterMain.jsp?currentPage=<%=endPage+1%>" style="color: black;">
					다음
				</a>
			</li>
		<%}
		%>
		</ul>
	</div>

</div>
</div>
</body>
</html>
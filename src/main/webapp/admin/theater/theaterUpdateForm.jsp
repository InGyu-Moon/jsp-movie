<%@page import="data.admin.theater.TheaterDto"%>
<%@page import="data.admin.theater.TheaterDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Dongle&family=Gaegu&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@100..900&family=Noto+Serif+KR&display=swap"
          rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <title>Insert title here</title>
    <script type="text/javascript">
    

    </script>
</head>
<%
    String theaterId = request.getParameter("theaterId");
	System.out.println("theaterUpdateForm.jsp id : "+theaterId);
    
	TheaterDao dao = new TheaterDao();
	TheaterDto dto = dao.getTheater(theaterId);
    

%>
<body>
<h2 style="margin-bottom: 50px">극장 정보 수정</h2>
<hr style="margin-bottom: 30px">
<div>
    
	<form action="theater/theaterUpdateAction.jsp" method="post">
		<input type="hidden" name="theaterId" value="<%=dto.getTheaterId() %>" >
		<table class="table" style="width: 80%;">
			<tr style="background-color: #99aaff">
				<th style="width: 30%; text-align: center; background-color: #99aaff;">구분</th>
        		<th style="width: 70%; text-align: center; background-color: #99aaff;">정보</td>
			</tr>
			<tr>
				<th style="width: 30%; text-align: center;">지역</th>
        		<td style="width: 70%;">
        			<select name="region" class="form-select" style="width:170px;">
                    	<option value="서울" <%=dto.getRegion().equals("서울")?"selected":"" %> >서울</option>
                    	<option value="경기" <%=dto.getRegion().equals("서울")?"selected":"" %> >경기</option>
                    	<option value="인천" <%=dto.getRegion().equals("서울")?"selected":"" %> >인천</option>
                    	<option value="강원" <%=dto.getRegion().equals("서울")?"selected":"" %> >강원</option>
                    	<option value="대전_충청" <%=dto.getRegion().equals("서울")?"selected":"" %> >대전/충청</option>
                    	<option value="대구" <%=dto.getRegion().equals("서울")?"selected":"" %> >대구</option>
                    	<option value="부산_울산" <%=dto.getRegion().equals("서울")?"selected":"" %> >부산/울산</option>
                    	<option value="경상" <%=dto.getRegion().equals("서울")?"selected":"" %> >경상</option>
                    	<option value="광주_전라_제주" <%=dto.getRegion().equals("서울")?"selected":"" %> >광주/전라/제주</option>
                    </select>
        		</td>
			</tr>
			<tr>
				<th style="width: 30%; text-align: center;">지점</th>
        		<td style="width: 70%;">
        			<input type="text" class="form-control" name="branch" value="<%=dto.getBranch() %>">
        		</td>
			</tr>
			<tr>
				<th style="width: 30%; text-align: center;">상영관수</th>
        		<td style="width: 70%;">
        			<input type="text" class="form-control" name=numbarOfScreens value="<%=dto.getNumberOfScreens() %>">
       			</td>
			</tr>
			<tr>
				<th style="width: 30%; text-align: center;">총 좌석수</th>
        		<td style="width: 70%;">
        			<input type="text" class="form-control" name="total" value="<%=dto.getTotalTheaterScreens() %>">
       			</td>
			</tr>
			<tr>
				<th style="width: 30%; text-align: center;">상세주소</th>
        		<td style="width: 70%;">
        			<input type="text" class="form-control" name="address" value="<%=dto.getAddress() %>">
       			</td>
			</tr>
			<tr>
				<th style="width: 30%; text-align: center;">상영관 전화번호</th>
        		<td style="width: 70%;">
        			<input type="text" class="form-control" name="phoneNumber" value="<%=dto.getTheaterPhoneNumber() %>">
        		</td>
			</tr>
			<tr>
				<th style="width: 30%; text-align: center;">스크린 여부</th>
        		<td style="width: 70%;">
        			<%
        				String is4d="";
        				String isImax="";
        				if(dto.getIs4D()==1){is4d="4D";}
        				if(dto.getIsIMAX()==1){isImax="IMAX";}
        			%>
        			<input type="text" class="form-control" name="is" value="<%=is4d %>, <%=isImax %>"><br>
        		</td>
			</tr>
			<tr>
				<th style="width: 30%; text-align: center;">상영관이미지</th>
        		<td style="width: 70%;" class="">
					<input type="file">
        		</td>
			</tr>
			
			
		</table><br>
		<div style="float: right; margin-right: 20%;">
			<input type="submit" class="btn btn-outline-warning" value="수정">&nbsp;
			<a type="button" class="btn btn-outline-danger" href="theater/theater.jsp?memberId=<%=dto.getTheaterId()%>">삭제</a>&nbsp;
			<button class="btn btn-outline-success" onclick="history.back()">목록</button>
	    </div>
	</form>
	

</body>
</html>
</body>
</html>
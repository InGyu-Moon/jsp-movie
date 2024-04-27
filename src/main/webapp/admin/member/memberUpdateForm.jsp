<%@page import="data.user.member.Gender"%>
<%@ page import="data.user.member.MemberDao" %>
<%@ page import="data.user.member.MemberDto" %>
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
    $(document).ready(function() {
        // email_selected select 요소의 값이 변경될 때 이벤트 처리
        $("#email_selected").change(function() {
            // 선택된 option의 값(value) 가져오기
            var selectedValue = $(this).val();
            
            // 만약 선택된 값이 "직접입력"이라면
            if (selectedValue === "직접입력") {
                // email2 input 요소를 활성화하여 수정 가능하도록 변경
                $("input[name='lastEmail']").prop("readonly", false).val(""); // value 속성 변경
            } else {
                // 선택된 값이 "직접입력"이 아니라면
                // email2 input 요소를 비활성화하고, 빈 값으로 설정
                $("input[name='lastEmail']").prop("readonly", true).val(selectedValue); // value 속성 변경
            }
        });
    });

    </script>
</head>
<%
    int memberId = Integer.parseInt(request.getParameter("memberId"));
	System.out.println("mamberUpdateAction id : "+memberId);
    MemberDao dao = new MemberDao();
    MemberDto dto = dao.getMemberById(memberId);
    
    String gender = "";
    if (dto.getGender() != null) {
        gender = dto.getGender().name();
    }
    
    String str = dto.getEmail();
    String firstEmail = "";
    String lastEmail = "";
    if (str != null) {
        String[] parts = str.split("@");

        // "@" 기준으로 분할된 첫 번째 부분
        firstEmail = parts[0];

        // "@" 기준으로 분할된 두 번째 부분
        lastEmail = parts[1];
        
        System.out.println(firstEmail+"@"+lastEmail);
    }
    
    if(dto.getUserName()==null){
        System.out.println(dto.getUserName());
%>
<script>
    alert("존재하지 않는 회원입니다.");
    history.back();
</script>
<%
    }
%>
<body>
<h2 style="margin-bottom: 50px">회원 정보 수정</h2>
<hr style="margin-bottom: 30px">
<div>
    <%
        if(dto.getUserPhoto() != null){
    %>
    <img src="<%= dto.getUserPhoto() %>" alt="프로필 사진" width="150" height="150">
    <%
    }else{
    %>
    <!-- 디폴트 이미지 출력 -->
    <img src="../../img/회원.png" alt="프로필 사진" width="150" height="150">
    <%
        }

    %>
    <br>
	<form action="member/memberUpdateAction.jsp" method="post">
		<input type="hidden" name="memberId" value="<%=dto.getId() %>" >
		<table class="table" style="width: 80%;">
			<tr style="background-color: #99aaff">
				<th style="width: 30%; text-align: center; background-color: #99aaff;">구분</th>
        		<th style="width: 70%; text-align: center; background-color: #99aaff;">정보</td>
			</tr>
			<tr>
				<th style="width: 30%; text-align: center;">사용자명</th>
        		<td style="width: 70%;">
        			<input type="text" class="form-control" name="userName" value="<%=dto.getUserName() %>">
        		</td>
			</tr>
			<tr>
				<th style="width: 30%; text-align: center;">비밀번호</th>
        		<td style="width: 70%;">
        			<input type="text" class="form-control" name="password" value="<%=dto.getPassword() %>">
        		</td>
			</tr>
			<tr>
				<th style="width: 30%; text-align: center;">이름</th>
        		<td style="width: 70%;">
        			<input type="text" class="form-control" name="name" value="<%=dto.getName() %>">
       			</td>
			</tr>
			<tr>
				<th style="width: 30%; text-align: center;">생년월일</th>
        		<td style="width: 70%;">
        			<input type="date" name="birthdate" value="<%=dto.getBirthdate() %>">
       			</td>
			</tr>
			<tr>
				<th style="width: 30%; text-align: center;">성별</th>
        		<td style="width: 70%;">
        			<input type="radio" name="gender" value="Male" <%=gender.equals("Male")?"checked":"" %>>&nbsp;남성&nbsp;
        			<input type="radio" name="gender" value="Female" <%=gender.equals("Female")?"checked":"" %>>&nbsp;여성&nbsp;
        			<input type="radio" name="gender" value="Other" <%=gender.equals("Other")?"checked":"" %>>&nbsp;비공개&nbsp;
       			</td>
			</tr>
			<tr>
				<th style="width: 30%; text-align: center;">이메일</th>
        		<td style="width: 70%;">
        			<input type="text" class="form-control" name="firstEmail" value="<%=firstEmail %>"
        					style="width:150px; float: left;">
        			<label style="float: left;" ><strong>@</strong></label>
        			<input type="text" class="form-control" name="lastEmail" value="<%=lastEmail %>"
        					style="width:180px; float: left; margin-right: 10px;">
        			<select id="email_selected" class="form-select" style="width:100px;float: left;">
						<option class="select" value="" selected>선택</option>
						<option class="select" value="naver.com" >네이버</option>
						<option class="select" value="daum.net" >다음</option>
						<option class="select" value="gmail.com" >구글</option>
						<option class="select" value="직접입력" >직접입력</option>
					</select>
        		</td>
			</tr>
			<tr>
				<th style="width: 30%; text-align: center;">기존주소</th>
        		<td style="width: 70%;">
        			<input type="text" class="form-control" name="address" value="<%=dto.getAddress() %>"><br>
        		</td>
			</tr>
			<tr>
				<th style="width: 30%; text-align: center;">변경주소</th>
        		<td style="width: 70%;" class="" name="address">
        			<label for="sample6_postcode" class="form-label" style="float: left;">우편번호 :&nbsp;&nbsp; </label>
        			<input type="text" id="sample6_postcode" class="form-control" style="width:40%; float: left;" name="address0" required="required" placeholder="우편번호">
					<input type="button" onclick="sample6_execDaumPostcode()" class="btn btn-outline-secondary" style="margin-left: 10px;" value="우편번호 찾기"><br>
					<input type="text" id="sample6_address" placeholder="주소" class="form-control" style="margin-top: 10px;" name="address1" ><br>
					<input type="text" id="sample6_detailAddress" class="form-control" style="width:45%; float: left;" name="address2" placeholder="상세주소">
					<input type="text" id="sample6_extraAddress" class="form-control" style="width:45%; float: left; margin-left:10px; " name="address3" placeholder="참고항목">
        		</td>
			</tr>
			<tr>
				<th style="width: 30%; text-align: center;">핸드폰번호</th>
        		<td style="width: 70%;">
        			<input type="text" class="form-control" name="phone_number" value="<%=dto.getPhoneNumber() %>">
       			</td>
			</tr>
			
			
		</table><br>
		<div style="float: right; margin-right: 20%;">
			<input type="submit" class="btn btn-outline-warning" value="수정">&nbsp;
			<a type="button" class="btn btn-outline-danger" href="member/memberDelete.jsp?memberId=<%=dto.getId()%>">삭제</a>&nbsp;
			<button class="btn btn-outline-success" onclick="location.href='member/memberMain.jsp'">목록</button>
	    </div>
	</form>
	
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	    function sample6_execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수
	
	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }
	
	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                    // 조합된 참고항목을 해당 필드에 넣는다.
	                    document.getElementById("sample6_extraAddress").value = extraAddr;
	                
	                } else {
	                    document.getElementById("sample6_extraAddress").value = '';
	                }
	
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('sample6_postcode').value = data.zonecode;
	                document.getElementById("sample6_address").value = addr;
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("sample6_detailAddress").focus();
	            }
	        }).open();
	    }
	</script>

</body>
</html>
</body>
</html>
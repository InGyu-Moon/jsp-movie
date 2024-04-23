<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
            rel="stylesheet">
    <link
            href="https://fonts.googleapis.com/css2?family=Dongle&family=Gaegu&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@100..900&family=Noto+Serif+KR&display=swap"
            rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <title>FAQ</title>
    <style type="text/css">
    </style>
</head>
<body>

<div class="center">

    <div class="container-rightside" style="width: 80%;">
        <h2 style="margin-bottom: 50px">극장 추가</h2>
        <hr style="margin-bottom: 30px">

        <div class="container">
            <form action="theater/theaterInsert.jsp" method="post">
                <div class="row mb-3">
                    <label for="title" class="col-sm-1 col-form-label"><strong>지역</strong></label>
                    <div class="col-sm-2">
                        <select class="form-select" aria-label="Default select example" name="region">
                            <option value="서울" selected>서울</option>
                            <option value="경기">경기</option>
                            <option value="강원">강원</option>
                            <option value="대전_충청">대전/충청</option>
                            <option value="대구">대구</option>
                            <option value="부산_울산">부산/울산</option>
                            <option value="경상">경상</option>
                            <option value="광주_전라_제주">광주/전라/제주</option>
                        </select>
                    </div>
                </div>
                <div class="mb-3">
                    <label for="title" class="form-label"><strong>지점 이름</strong></label>
                    <input type="text" class="form-control" id="branch" style="width:400px;"
                           name="branch" maxlength="100" required="required" placeholder="위에 선택한 지역에 지점을 작성해주세요" >
                </div>
                <div class="mb-3" style="float: left; margin-right: 50px;">
                    <label for="content" class="form-label"><strong>총 상영관 수</strong></label>
                    <input type="text" class="form-control" id="numberOfScreens"
                              name="numberOfScreens" style="width:100px;" placeholder="상영관수">
                </div>
                <div class="mb-3" >
                    <label for="content" class="form-label"><strong>총 좌석수</strong></label>
                    <input type="text" class="form-control" id="totalTheaterSeats"
                              name="totalTheaterSeats" style="width:100px;" placeholder="좌석수">
                </div>
                <div class="mb-3">
                    <label for="content" class="form-label"><strong>극장 전화번호</strong></label>
                    <input type="text" class="form-control" id="theaterPhoneNumber"  style="width:400px;"
                              name="theaterPhoneNumber" placeholder="극장 전화번호">
                </div>
                <div class="mb-3">
                    <label for="content" class="form-label"><strong>극장 주소</strong></label>
                    <div class="row">
				    <div class="col-md-6">
				      <div class="form-group mb-2">
				        <div class="input-group">
				          <input type="text" class="form-control" id="sample6_postcode" name="address0" required="required" placeholder="우편번호">
				          <div class="input-group-append">
				            <button class="btn btn-outline-secondary" type="button" onclick="sample6_execDaumPostcode()"
				            		style="margin-left: 20px;">우편번호 찾기</button>
				          </div>
				        </div>
				      </div>
				    </div>
				  </div>
				  <div class="row">
				    <div class="col-md-6">
				      <div class="form-group mt-2">
				        <input type="text" class="form-control" id="sample6_address" placeholder="주소" name="address1">
				      </div>
				    </div>
				  </div>
				  <div class="row">
				    <div class="col-md-6">
				      <div class="form-group  mt-3">
				        <input type="text" class="form-control" id="sample6_detailAddress" name="address2" placeholder="상세주소">
				      </div>
				    </div>
				    <div class="col-md-6">
				      <div class="form-group mt-3">
				        <input type="text" class="form-control" id="sample6_extraAddress" name="address3" placeholder="참고항목">
				      </div>
				    </div>
				  </div>
				</div>
                </div>
                <div class="mb-3">
				    <label for="content" class="form-label"><strong>스크린 종류</strong></label><br>
				    <div class="form-check form-check-inline">
				        <input class="form-check-input" type="checkbox" id="is_4D" name="is_4D">
				        <label class="form-check-label" for="is_4D">4D</label>
				    </div>
				    <div class="form-check form-check-inline">
				        <input class="form-check-input" type="checkbox" id="is_IMAX" name="is_IMAX">
				        <label class="form-check-label" for="is_IMAX">IMAX</label>
				    </div>
				</div>
                <br>
                <button type="submit" class="btn btn-outline-primary" >등록</button>
            </form>
        </div>


    </div>
</div>

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
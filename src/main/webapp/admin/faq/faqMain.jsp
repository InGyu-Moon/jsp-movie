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
   <title>FAQ</title>
   <style type="text/css">
	a{
		text-decoration: none; /* 링크의 밑줄 제거 */
		color: inherit; /* 링크의 색상 제거 */
	}
	.table-custom th:nth-child(1) {
	    width: 10%; /* 1 / (1 + 3 + 6) * 100% */
	}
	
	.table-custom th:nth-child(2) {
	    width: 20%; /* 3 / (1 + 3 + 6) * 100% */
	}
	
	.table-custom th:nth-child(3) {
	    width: 70%; /* 6 / (1 + 3 + 6) * 100% */
	}
	
	.table-custom th:nth-child(2),
	.table-custom td:nth-child(2) {
	    text-align: center;
	}
	
	.table-custom th:nth-child(3),
	.table-custom td:nth-child(3) {
	    text-align: left;
	} 
	
	.table-custom p {
	    margin-left: 20px; /* 원하는 만큼의 여백 설정 */
	}
	
	.table-custom th:nth-child(1),
	.table-custom td:nth-child(1) {
    text-align: center;
	}
	
   </style>
</head>
<body>
<h2 style="margin-bottom: 50px">FAQ</h2>
<hr style="margin-bottom: 30px">

<div class="container">
  
	<div class="container d-flex justify-content-between align-items-center">
	    <div>
	        <button type="button" class="btn btn-outline-danger">전체선택</button>
	        <button type="button" class="btn btn-danger ml-2">선택삭제</button>
	    </div>
	    <span><small>총 5개</small></span>
	</div>
	
    <!-- board seach area -->
    <br>
       <div class="container">
		    <div class="search-window">
		        <form action="#">
		            <div class="search-wrap" style="width: 80%;">
		                <input id="search" class="form-control" type="search" name="" placeholder="검색어를 입력해주세요." style="width: 70%">
		                <button type="submit" class="btn btn-dark" style="width: 30%;">검색</button>
		            </div>
		        </form>
		    </div>
		</div>
   
  <!-- board list area -->
     <div class="container">
         <table class="table table-bordered table-hover table-custom">
             <thead>
             <tr>
             	<thead class="table-light">
	             	<th><input type="checkbox"></th>
	                <th>구분</th>
	                <th>질문</th>
                </thead>
             </tr>
             </thead>
             <tbody>
             <tr>
             	<td><input type="checkbox"></td>
                 <td>영화관 이용</td>
                 <th>
                   <a href="#!"><strong>Q.</strong> 소방/경찰 할인은 어떻게 받나요?</a>
                   <p>
                   <br>
                   <strong>A.</strong>
                		<br>
                   	[경찰할인] 경찰 & 해양경찰 소속 공무원 고객님들에게 할인 혜택을 제공하고 있습니다.<br><br>
			■ 대상 : 경찰관 및 경찰청(해양경찰청 포함) 소속 공무원, 의무경찰, 신임경찰교육생, 민간해양구조대, 국민방제대, 구조협회<br>
			■ 2D 영화 : 주중 9,000원 / 주말 10,000원 관람 (동반 3인)<br>
			■ 3D 영화 : 주중 10,000원 / 주말 11,000원 관람 (동반 3인)<br>
			■ 매점 콤보 세트 : 2,000원 할인(더블콤보 4,000원 할인)<br>
			<br>
			※ 현장 할인 적용방법<br>
			 - 경찰청(해양경찰청) 소속 신분증 제시 시 적용<br>
			 - 의무경찰 휴가증, 외출증 제시 시 적용<br>
			 - 구조협회, 해양구조대, 국민방제대 회원증 제시 시 적용<br>
			<br>
			※ 온라인 예매 방법<br>
			 - 결제단계 시 [제휴포인트/할인] - [경찰할인] 선택 시 적용 가능<br>
			<br>
			※ 타인의 신분증 제시 시 입장에 제한이 있을 수 있으므로, 반드시 입장하시는 당사자 본인의 신분증을 지참해주시기 바랍니다. (온라인 예매 시에도 동일 정책 적용)<br>
			<br>
			※ 유의사항<br>
			- 4D, 샤롯데관 등 스페셜관은 할인대상에 포함되지 않습니다.<br>
			- 기타할인과 중복 할인 불가합니다.<br>
			- 본 이벤트의 혜택은 일부 영화관에서 사용 불가합니다.<br><br>
			[소방할인] 2023년 12월 31일부 소방공무원 할인 제휴가 종료되어 2024년부 할인 적용이 불가능합니다. 이후 좋은 기회를 통해 찾아뵙겠습니다. 감사합니다.
                   </p>
                 </th>
             </tr>

             <tr>
             	<td><input type="checkbox"></td>
                 <td>영화관 이용</td>
                 <th>
                  <a href="#!"><strong>Q.</strong> 군인 할인은 어떻게 받나요?</a>
                 	<p>
                  <br>
                  <strong>A.</strong>
                 	<br>
                  	[군인할인] 군인 고객님들에게 할인 혜택을 제공하고 있습니다.<br>
				■ 대상 : 대한민국 군장변(ROTC, 사관생도, 부사관후보생, 상근예비역, 간부포함) / 대한민국 예비군 1~2년차 / 국방부 공,군무원, 한국 국방연구원, 병무청 전직원 / 방위사업청, 방위산업기술지원센터, 국방과학연구소 전직원 / 20년 이상 복무 후 전역한 예비역, 군인공제회 전직원 / 사회복무요원, 병역명문가 병역 이행자 및 가족 / 주한미군, 한국전 참전국 주한군인, 국방부 공무직<br>
				■ 2D 영화 : 주중 9,000원 / 주말 10,000원 관람 (동반 3인)<br>
				■ 3D 영화 : 주중 10,000원 / 주말 11,000원 관람 (동반 3인)<br>
				■ 매점 콤보 세트 : 2,000원 할인(더블콤보 4,000원 할인)<br>
				&nbsp;&nbsp;&nbsp;* 일부 영화관에 따라 매점혜택 적용 불가<br><br>
				※ 현장 할인 적용방법<br>
				- 병사 : 휴가증, 외박/외출증 제시 시 적용<br>
				- 부사관 후보생 : 외박/외출증 제시 시 적용<br>
				- 현역간부 : 공무원증 제시 시 적용<br>
				- 사관생도/ROTC : 사관생도증, 학군사관후보생증 제시 시 적용<br>
				- 예비군(1~2년차) : 24년 예비군 교육훈련 필증 및 신분증 제시 시 적용<br>
				- 방위사업청 / 방위산업기술지원센터 / 국방과학 연구소 / 국방기술품질원 / 국방연구원병무청 / 군인공제회 : 소속기관 신분증 제시 시 적용<br>
				- 병역명문가 : 병역명문가증 및 가족관계 증명서 제시 시 적용<br>
				- 20년 이상 복무 전역한 예비역 : 군인연금증, 군인연금카드 제시 시 적용<br>
				- 국방부 공무직 : 공무원증 제시 시 적용<br><br>
				※ 온라인 예매 방법<br>
				- 결제단계 시 [제휴포인트/할인] - [군인할인] 선택 시 적용 가능<br><br>
				※ 타인의 신분증 제시 시 입장에 제한이 있을 수 있으므로, 반드시 입장하시는 당사자 본인의 신분증을 지참해주시기 바랍니다. (온라인 예매 시에도 동일 정책 적용)
				<br><br>
				※ 유의사항<br>
				- 4D, 샤롯데관 등 스페셜관은 할인대상에 포함되지 않습니다.<br>
				- 기타할인과 중복 할인 불가합니다.<br>
				- 본 이벤트의 혜택은 일부 영화관에서 사용 불가합니다.(전주송천) 
                  </p>
                 </th>
             </tr>

             <tr>
             	<td><input type="checkbox"></td>
                 <td>이벤트</td>
                 <th>
                 	<a href="#!"><strong>Q.</strong> 1+1 관람권은 어떻게 사용하나요?</a>
                 	<p>
                 	<br>
                 	<strong>A.</strong>
                 	<br>
                 	2인 예매 시 사용 가능하며, 1인 요금으로 2인이 관람할 수 있는 할인권입니다.<br>
			※ 2인 예매 시에 한하여 적용이 가능하며, 1인 예매시 안타깝게도 사용이 불가능합니다.<br>
                 </p>
                 </th>
             </tr>
             
             <tr>
             	<td><input type="checkbox"></td>
                 <td>혜택</td>
                 <th>
                 	<a href="#!"><strong>Q.</strong> 통신사 혜택은 어떻게 이용하나요?</a>
                 	<p>
                 	<br>
                 	<strong>A.</strong>
                 	<br>
                 	각 통신사 멤버십 홈페이지, 모바일앱에서 예매 가능합니다.
                 </p>
                 </th>
             </tr>
             
             <tr>
             	<td><input type="checkbox"></td>
                 <td>전체</td>
                 <th>
                 	<a href="#!"><strong>Q.</strong> 할인권을 다운 받았는데 영화 결제 시 사용가능한 할인권이 없습니다.</a>
                 	<p>
                 	<br>
                 	<strong>A.</strong>
                 	<br>
                 	할인권 사용 유형과 관람을 희망하시는 영화의 유형이 일치하는 할인권에 한하여 확인 및 적용이 가능합니다.<br><br>
			보유하신 할인권의 정보 확인을 통해 적용가능한 상영관 및 좌석 유형 확인이 가능합니다.<br><br>
			※ 할인권 상세정보 확인 방법<br>
			[마이] →  [쿠폰함] →  쿠폰 선택 시 상세정보(상영관, 영화명, 영화구분, 사용처 등) 확인 가능
                 </p>
                 </th>
             </tr>
             
             </tbody>
         </table>
    </div>

</div>

<script type="text/javascript">
$(document).ready(function(){
 	// 페이지 로드 시 슬라이드를 닫습니다.
    $('.table-bordered a').parent().find('p').slideUp();

 	// 각각의 a 태그에 대해 클릭 이벤트를 설정합니다.
    $('.table-bordered a').click(function(e){
        // 기본 동작을 막습니다. => 링크를 막음
        e.preventDefault();
        // 클릭된 a 태그의 부모인 th를 선택합니다.
        var parent = $(this).parent();
        // 형제 요소인 p 태그를 찾아서 슬라이드 토글 애니메이션을 수행합니다.
        parent.find('p').slideToggle();
    });
 	
 	// 체크박스를 클릭했을 때
    $('.table-custom th input[type="checkbox"]').click(function() {
        // 체크박스가 체크되었는지 확인
        var isChecked = $(this).prop('checked');
        
        // 체크박스가 속한 열의 모든 체크박스에 대해 상태 변경
        $(this).closest('table').find('tbody td input[type="checkbox"]').prop('checked', isChecked);
    });
});
</script>

</body>
</html>
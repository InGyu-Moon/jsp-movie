<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="data.reservation.ReservationDao" %>
<%@ page import="data.reservation.ReservationDto" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
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

                    //체크된 곳의 value값(num)얻기
                    var n="";
                    $(".check:checked").each(function(idx){
                        n+=$(this).val()+",";
                    });

                    console.log(n);

                    //마지막 컴마 제거
                    n=n.substring(0,n.length-1);
                    console.log(n);

                    //삭제파일로 전송
                    // location.href="member/memberDelete.jsp?selectMemberId="+n;
                }
            })

        });
    </script>
</head>
<%
    ReservationDao dao = new ReservationDao();
    MemberDao memberDao = new MemberDao();
//    List<ReservationDto> list = dao.getAllReservationInfo();
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 HH:mm:ss");
%>
<%
    int totalCount=dao.getCount();
    int perPage=5; //한페이지당 보여질 글의 갯수
    int perBlock=5; //한블럭당 보여질 페이지 갯수
    int startNum; //db에서 가져올 글의 시작번호(mysql은 첫글이0번,오라클은 1번);
    int startPage; //각블럭당 보여질 시작페이지
    int endPage; //각블럭당 보여질 끝페이지
    int currentPage;  //현재페이지
    int totalPage; //총페이지수
    int no; //각페이지당 출력할 시작번호

    //현재페이지 읽는데 단 null일경우는 1페이지로 준다
    if(request.getParameter("currentPage")==null)
        currentPage=1;
    else
        currentPage=Integer.parseInt(request.getParameter("currentPage"));


    totalPage=totalCount/perPage+(totalCount%perPage==0?0:1);
    startPage=(currentPage-1)/perBlock*perBlock+1;
    endPage=startPage+perBlock-1;

    if(endPage>totalPage)
        endPage=totalPage;

    startNum=(currentPage-1)*perPage;
    no=totalCount-(currentPage-1)*perPage;
    List<ReservationDto> list=dao.getList(startNum, perPage);
%>
<body>
<div class="center">
    <div class="container-rightside" style="width: 80%;">
        <h2 style="margin-bottom: 50px">예약/결제 관리</h2>
        <hr style="margin-bottom: 30px">
        <form class="d-flex" method="post" action="adminMainPage.jsp?curr=reservation/reservationMain.jsp" style="margin-bottom: 30px">
            <select class="form-select" name="searchType" style="width: 110px;">
                <option value="all" selected>전체</option>
                <option value="test1">test1</option>
                <option value="test2">test2</option>
            </select>
            <input type="text" class="form-control" name="data" placeholder="검색어" style="margin-left: 30px;margin-right: 30px; width: 280px;">
            <button type="submit" class="btn btn-outline-primary">조회</button>
        </form>

        <table class="table table-bordered" style="width: 800px">
            <!-- <caption align="top"><b>전체 회원 명단</b></caption> -->
            <div class="header-container">
                <div class="title">
                    <b>전체 결제 목록</b>
                </div>
                <div class="count">
                    <span style="margin-right: 25px;"><small>총 <%=totalCount%></small></span>
                </div>
            </div>

            <tr class="table-success" align="center">
                <th width="80">결제번호</th>
                <th width="180">아이디</th>
                <th width="300">결제시간</th>
                <th width="150">결제상태</th>
                <th width="100">기타</th>
            </tr>
            <%
                for(ReservationDto dto :list){
            %>
            <tr align="center">
                <td>
                    <%=dto.getReservationId()%>
                </td>
                <td>
                    <%
                        String result;
                        if (dto.getMemberId() != null) {
                            MemberDto member = memberDao.getMemberById(Integer.parseInt(dto.getMemberId()));
                            result=member.getUserName();
                        }else result = "비회원";
                    %>
                    <%=result%>
                </td>
                <td>
                    <%=sdf.format(dto.getPaymentTime())%>
                </td>
                <td>
                    <%
                        String str;
                        if(dto.getPaymentStatus().equals("Completed")) str="결제완료";
                        else if (dto.getPaymentStatus().equals("Pending")) str="결제중";
                        else if (dto.getPaymentStatus().equals("Cancelled")) str="취소";
                        else str="결제 오류";
                    %>
                    <%=str%>
                </td>
                <td>
                    <a href="adminMainPage.jsp?curr=reservation/reservationDetail.jsp?reservationId=<%=dto.getReservationId()%>" type="button"
                       id="btnDetail" class="btn btn-sm btn-outline-success">상세</a>
                </td>
            <tr>
                    <%
		        }
		    %>

        </table>


        <!-- 페이지 번호 출력 -->
        <div style="width: 580px; text-align: center; margin: 50px 100px;">

            <ul class="pagination justify-content-center">
                <%
                    //이전
                    if(startPage>1)
                    {%>
                <li class="page-item ">
                    <a class="page-link" href="../admin/adminMainPage.jsp?curr=reservation/reservationMain.jsp?currentPage=<%=startPage-1%>" style="color: black;">이전</a>
                </li>
                <%}
                    for(int pp=startPage;pp<=endPage;pp++)
                    {
                        if(pp==currentPage)
                        {%>
                <li class="page-item active">
                    <a class="page-link" href="../admin/adminMainPage.jsp?curr=reservation/reservationMain.jsp?currentPage=<%=pp%>"><%=pp %></a>
                </li>
                <%}else
                {%>
                <li class="page-item">
                    <a class="page-link" href="../admin/adminMainPage.jsp?curr=reservation/reservationMain.jsp?currentPage=<%=pp%>"><%=pp %></a>
                </li>
                <%}
                }

                    //다음
                    if(endPage<totalPage)
                    {%>
                <li class="page-item">
                    <a  class="page-link" href="../admin/adminMainPage.jsp?curr=reservation/reservationMain.jsp?currentPage=<%=endPage+1%>"
                        style="color: black;">다음</a>
                </li>
                <%}
                %>

            </ul>


        </div>



    </div>
</div>
</body>
</html>
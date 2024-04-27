<%@ page import="data.inform.notice.NoticeDao" %>
<%@ page import="data.inform.notice.NoticeDto" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
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
    <title>공지사항</title>
    <style type="text/css">
        a{
            text-decoration: none; /* 링크의 밑줄 제거 */
            color: inherit; /* 링크의 색상 제거 */
        }
        .table-custom th:nth-child(1) {
            width: 10%; /* 1 / (1 + 3 + 6) * 100% */
        }
        .table-custom th:nth-child(2) {
            width: 15%; /* 3 / (1 + 3 + 6) * 100% */
        }
        .table-custom th:nth-child(3) {
            width: 50%; /* 6 / (1 + 3 + 6) * 100% */
        }
        .table-custom th:nth-child(4) {
            width: 25%; /* 6 / (1 + 3 + 6) * 100% */
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

    </style>
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

                    if(confirm("선택한 항목을 삭제하시겠습니까?")){
                        //체크된 곳의 value값(num)얻기
                        var n="";
                        $(".check:checked").each(function(idx){
                            n+=$(this).val()+",";
                        });

                        //마지막 컴마 제거
                        n=n.substring(0,n.length-1);

                        //삭제파일로 전송
                        location.href="notice/noticeDelete.jsp?noticeId="+n;
                    }
                }
            })

        });
    </script>
</head>
<body>
<%
    request.setCharacterEncoding("utf-8");

    NoticeDao dao = new NoticeDao();
    List<NoticeDto> noticeDtoList = dao.getAllNotices();
    int count = dao.getNoticeCount();

    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
%>

<div class="container-rightside" style="width: 80%;">
    <h2 style="margin-bottom: 50px">공지사항</h2>
    <hr style="margin-bottom: 30px">
<div class="container">
    <div class="container d-flex justify-content-between align-items-center">
        <div>
            <button type="button" class="btn btn-outline-danger ml-2 btndel">선택삭제</button>
            <button type="button" class="btn btn-outline-info ml-2"
                    onclick="location.href='?curr=notice/noticeAddForm.jsp'">생성</button>
        </div>
        <span><small>총 <%=count %></small></span>
    </div>

    <!-- 공지 검색 -->
    <br>
    <div class="container">
        <div class="search-window">
            <form action="#" method="post">
                <div class="search-wrap">
                    <input id="search" class="form-control" type="search" name="" placeholder="검색어를 입력해주세요;">
                    <button type="submit" class="btn btn-dark">검색</button>
                </div>
            </form>
            <br>
        </div>
    </div>

    <!-- 공지 목록 -->
    <div class="container">
        <table class="table table-bordered table-hover table-custom">
            <thead>
            <tr>
                <thead class="table-light">
                <th><input type="checkbox" class="th-check"></th>
                <th>구분</th>
                <th style="text-align: center;">제목</th>
                <th style="text-align: center;">등록일</th>
                </thead>
            </tr>
            </thead>
            <tbody>
            <%
                for(NoticeDto noticeDto : noticeDtoList) {
            %>
            <tr>
                <td><input type="checkbox" class="check" value="<%=noticeDto.getNoticeId() %>"></td>
                <td><%=noticeDto.getCategory() %></td>
                <td>
                    <a href="adminMainPage.jsp?curr=notice/noticeDetail.jsp?noticeId=<%=noticeDto.getNoticeId()%>"><%=noticeDto.getTitle() %></a>
                </td>
                <td>
                    <%=sdf.format(noticeDto.getRegisteredDate())%>
                </td>
            </tr>
            <%
                }
            %>
            </tbody>
        </table>
    </div>








</div>
</div>
</body>
</html>
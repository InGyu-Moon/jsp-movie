<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="data.user.member.MemberDto"%>
<%@page import="data.user.member.MemberDao"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Gowun+Dodum&family=IBM+Plex+Sans+KR&display=swap"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
</head>
<body>
	<%
	// 회원 ID 가져오기
	int memberId = Integer.parseInt(request.getParameter("memberId"));
	
	String realPath = getServletContext().getRealPath("memPhoto");
	System.out.println(realPath);
	int uploadsize = 1024 * 1024 * 5;

	MultipartRequest multi = null;

	multi = new MultipartRequest(request, realPath, uploadsize, "utf-8", new DefaultFileRenamePolicy());

	MemberDao dao = new MemberDao();

	MemberDto oldDto = dao.getMemberById(memberId);

	MemberDto dto = new MemberDto();
	dto.setId(Integer.parseInt(multi.getParameter("memberId")));
	dto.setUserName(multi.getParameter("nick_name"));
	String photo = multi.getFilesystemName("profile_upload_file");

	if (photo == null) {
	    dto.setUserPhoto(oldDto.getUserPhoto());
	} else {
	    dto.setUserPhoto("memPhoto/" + photo);
	}

	dao.updateProfile(dto);

	response.sendRedirect("myProfileEdit.jsp");
	%>
	<script type="text/javascript">
		alert("프로필이 성공적으로 업데이트되었습니다.");
	    window.location.href = "myProfileEdit.jsp";
	</script>
</body>
</html>
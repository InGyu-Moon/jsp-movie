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
			<h2 style="margin-bottom: 50px">FAQ 추가</h2>
			<hr style="margin-bottom: 30px">

			<div class="container">
				<h2>게시판 글쓰기</h2>
				<form action="faq/faqInsert.jsp" method="post">
					<div class="row mb-3">
						<label for="title" class="col-sm-1 col-form-label"><strong>구분</strong></label>
						<div class="col-sm-2">
							<select class="form-select" aria-label="Default select example" name="category">
								<option value="전체" selected>전체</option>
								<option value="영화관">영화관</option>
								<option value="이벤트">이벤트</option>
								<option value="혜택">혜택</option>
							</select>
						</div>
					</div>
					<div class="mb-3">
						<label for="title" class="form-label"><strong>Q. 질문</strong></label> 
						<input type="text" class="form-control" id="question"
							name="question" maxlength="100" required="required" placeholder="질문 작성"
							pattern=".{4,100}">
						<!-- pattern=".{4,100}" : 4글자 이상 100글자 이하 -->
					</div>
					<div class="mb-3">
						<label for="content" class="form-label"><strong>A. 답변</strong></label>
						<textarea class="form-control" rows="5" id="answer"
							name="answer" placeholder="내용 작성"></textarea>
					</div>
					<button type="submit" class="btn btn-outline-primary" >등록</button>
				</form>
			</div>


		</div>
	</div>

	<script type="text/javascript">
		
	</script>

</body>
</html>
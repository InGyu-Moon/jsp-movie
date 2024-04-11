<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../include/header.html"></jsp:include>
<body>
	<div id="wrap">
		<div class="ticket">
			<div class="center">
				<div class="region">
					<div class="line">
						<div class="main">
							<div class="top">
								<div class="title">자주가는 극장</div>
								<div class="favorite">
									<div class="block">
										<a href="javascript:;"> <span>1</span>
										</a>
									</div>
									<div class="block">
										<a href="javascript:;"> <span>2</span>
										</a>
									</div>
									<div class="block">
										<a href="javascript:;"> <span>3</span>
										</a>
									</div>
									<div class="block">
										<a href="javascript:;"> <span>4</span>
										</a>
									</div>
									<div class="block">
										<a href="javascript:;"> <span>5</span>
										</a>
									</div>
									<a class="btn" href="javascript:;"> <span></span> <span></span>
									</a>

								</div>
							</div>
							<div class="category">
								<ul>
									<li class="active"><a href="javascript:;">서울</a></li>
									<li><a href="javascript:;">경기</a></li>
								</ul>
							</div>
							<div class="body">
								<div class="list view">
									<ul>
										<li><a href="javascript:;">강남</a></li>
										<li><a href="javascript:;">강변</a></li>
									</ul>
								</div>
								<div class="list">
									<ul>
										<li><a href="javascript:;">경기광주</a></li>
										<li><a href="javascript:;">고양백석</a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="theater_text">
					<div class="hr">
						<div>
							<hr>
							<hr>
						</div>

						<div class="title">
							<span>THEATER</span>
						</div>
					</div>

					<div class="theater">
						<div class="theater-tit">
							<span>text</span>
						</div>
						<div class="theater_img">
							<div class="text">
								<div class="location">
									<p>location</p>
								</div>
								<div class="phone">
									<span>phone</span>
								</div>
								<div class="seat">
									<span>seat</span>/<span>seat</span>
								</div>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../include/footer.html"></jsp:include>
	<script type="text/javascript">
		$("title").text("극장")
	</script>
</body>
</html>
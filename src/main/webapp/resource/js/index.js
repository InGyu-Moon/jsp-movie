
//메인 비디오
$(".index .pop_btn.n_01").click(function() {
	$(".index .pop_up.n_01").show();

});
$(".index .pop_btn.n_02").click(function() {
	$(".index .pop_up.n_02").show();

});
$(".index .pop_btn.n_03").click(function() {
	$(".index .pop_up.n_03").show();

});
$(".index .pop_btn.n_04").click(function() {
	$(".index .pop_up.n_04").show();

});
$(".index .pop_btn.n_05").click(function() {
	$(".index .pop_up.n_05").show();

});

$(".index .pop_up .video .btn").click(function() {
	$(".index .pop_up").hide();

});
$(".index .pop_up .dimd").click(function() {
	$(".index .pop_up").hide();

});

//메인 탭
$(".index .chart .top ul li").on('click', function() {
	$(this).addClass('active').siblings().removeClass('active');
	var idx = $(this).index();
	$(this).parents(".chart").find(".box").removeClass("view");
	$(this).parents(".chart").find(".box").eq(idx).addClass("view");
	$(this).parents(".chart").find(".link").removeClass("view");
	$(this).parents(".chart").find(".link").eq(idx).addClass("view");
});

//극장 지역 탭
$(".ticket .region .line .main .category ul li").on('click', function() {
	$(this).addClass('active').siblings().removeClass('active');
	var idx = $(this).index();
	$(this).parents(".main").find(".list").removeClass("view");
	$(this).parents(".main").find(".list").eq(idx).addClass("view");
});

//극장 날짜 탭
$(".ticket .schedule .swiper-slide").on('click', function() {
	$(this).addClass('border').siblings().removeClass('border');
});


//상단 고정 배너
$(".top_banner .btn").click(function() {
	$(this).parent(".top_banner").addClass("active");
	$("header#header").addClass("active");
	$("#wrap").addClass("active");
});


//헤더 active
var header_nav = $('header#header .nav').offset();


$(window).scroll(function() {
	if ($(window).scrollTop() > header_nav.top) {
		$("header#header").addClass("scroll");
		$("header#header .nav nav ul li.active").addClass("scroll");
		$("svg.header_search").attr("fill", "white");
	} else {
		$("header#header .flex .logo").removeClass("active");
		$("header#header .nav nav ul li.active").removeClass("scroll");
		$("header#header").removeClass("scroll");
		$("svg.header_search").attr("fill", "black");
	}
});


//탑버튼
$('.top_btn').hide();
$(window).scroll(function() {
	if ($(this).scrollTop() > 200) {
		$(".top_btn").fadeIn(200);
		setTimeout(function() {
			$(".top_btn .link").addClass("active");
		}, 400);
	} else {
		$('.top_btn').fadeOut(200);
	}
});

//탑버튼
$(".top_btn .btn").click(function() {
	$('html, body').animate({
		scrollTop: 0
	}, 600);
	return false;
});




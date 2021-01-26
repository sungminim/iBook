<%@ page contentType="text/html;charset=utf-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>대림대학교</title>
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
<meta name="format-detection" content="telephone=no" />

<link rel="stylesheet" type="text/css" href="/daelim/type/common/css/common.css" />
<link rel="stylesheet" type="text/css" href="/daelim/type/KOR_A/css/intro.css" />

<!--[if lt IE 9]>
<script src="/daelim/type/common/js/html5shiv.js"></script>
<![endif]-->

<script type="text/javascript" src="/daelim/type/common/js/jquery-2.2.1.min.js"></script>

<link rel="stylesheet" type="text/css" href="/daelim/type/common/js/slick/slick.css"/><!-- 슬라이더 -->
<script type="text/javascript" src="/daelim/type/common/js/slick/slick.min.js"></script><!-- 슬라이더 -->
<script type="text/javascript" src="/daelim/type/common/js/slick/slick.acc.js"></script><!-- 슬라이더 -->

<link rel="stylesheet" type="text/css" href="/daelim/type/common/js/mCustomScrollbar/jquery.mCustomScrollbar.css" /><!-- 커스텀스크롤 -->
<script type="text/javascript" src="/daelim/type/common/js/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.js"></script><!-- 커스텀스크롤 -->

<script>
var calByte = {
	getByteLength : function(s) {
		if (s == null || s.length == 0) {
			return 0;
		}
		var size = 0;
		for ( var i = 0; i < s.length; i++) {
			size += this.charByteSize(s.charAt(i));
		}
		return size;
	},
	cutByteLength : function(s, len) {
		if (s == null || s.length == 0) {
			return 0;
		}
		var size = 0;
		var rIndex = s.length;
		for ( var i = 0; i < s.length; i++) {
			size += this.charByteSize(s.charAt(i));
			if( size == len ) {
				rIndex = i + 1;
				break;
			} else if( size > len ) {
				rIndex = i;
				break;
			}
		}
		return s.substring(0, rIndex);
	},
	charByteSize : function(ch) {
		if (ch == null || ch.length == 0) {
			return 0;
		}
		var charCode = ch.charCodeAt(0);
		if (charCode <= 0x00007F) {
			return 1;
		} else if (charCode <= 0x0007FF) {
			return 2;
		} else if (charCode <= 0x00FFFF) {
			return 3;
		} else {
			return 4;
		}
	}
};

$(function(){
	function layoutChange(){
		// footer
		if($(window).width() >= 1024){
			if(window.innerHeight < 916){
				$("footer").addClass('fixed');
			}else{
				$("footer").removeClass('fixed');
			}
		}else{
			$("footer").addClass('fixed');
		}

		//left banner
		if($(window).width() < 1700){
			$("html, body").css("overflow", "hidden");
			$(".ct_bnr").addClass('on');
		}else{
			$(".ct_bnr").removeClass('on');
			$("html, body").css("overflow", "hidden");
		}
		$(".ct_bnr .bnrWrap .btn_mClose").click(function(){
			$(".ct_bnr").removeClass('on');
			$("html, body").css("overflow", "");
		});

		//썸네일 말줄임
		$("#introIndex #contents .ct_thumb .unit>a .tit").each(function(){
		    /* var length = 8; //표시할 글자수 정하기
		    $(this).each(function(){
		        if($(this).text().length >= length){
		            $(this).text( $(this).text().substr(0,length) + '...' );  //지정한 글자수 이후 표시할 텍스트(...)
		        }
		    }); */
		    var cutByte = 25; //표시할 바이트수 정하기
		    $(this).each(function(){
		        if(calByte.getByteLength( $(this).text() ) >= cutByte){
		            $(this).text( calByte.cutByteLength( $(this).text(), cutByte ) + '...' );  //지정한 바이트수 이후 표시할 텍스트(...)
		        }
		    });

		});

		$("#introIndex #contents .ct_thumb .unit>a .tit_on").each(function(){
			/* var length = 38; //표시할 글자수 정하기
			$(this).each(function(){
				if($(this).text().length >= length){
					$(this).text( $(this).text().substr(0,length) + '...' );  //지정한 글자수 이후 표시할 텍스트(...)
				}
			}); */
			var cutByte = 50; //표시할 바이트수 정하기
			$(this).each(function(){
				if(calByte.getByteLength( $(this).text() ) >= cutByte){
					$(this).text( calByte.cutByteLength( $(this).text(), cutByte ) + '...' );  //지정한 바이트수 이후 표시할 텍스트(...)
				}
			});
		});

		var slickThumb = {
    		infinite: true,
    		slidesToShow: 1,
    		slidesToScroll: 1,
    		arrows: true,
    		dots: false,
    		focusOnSelect: true,
    		swipeToSlide : true,
			variableWidth: true
    	}

		//썸네일 변환
		function thumbChange(){
			if($(window).width() > 1299){
				$("#introIndex #contents .ct_thumb .list").mCustomScrollbar('update');
				$("#introIndex #contents .ct_thumb .list").slick('destroy');
			}else{
				$("#introIndex #contents .ct_thumb .list").mCustomScrollbar('destroy');
				$("#introIndex #contents .ct_thumb .list").slick(slickThumb);
			}
		}

		//all list
		$("#introIndex header .btn_allList").click(function(){
			$("#pop_allList").addClass('on');
			$("html, body").css("overflow", "hidden");
		});
		$("#pop_allList .btn_popClose").click(function(){
			$("#pop_allList").removeClass('on');
			$("html, body").css("overflow", "");
		});
	}

	$("#pop_allList .allList ul").mCustomScrollbar();

	$(window).bind('load resize', function(){
		layoutChange(); // footer fixed
		thumbChange(); // thumb 형태변환
	});
});
</script>
</head>
<body>

<div id="introIndex">
	<header>
		<h1>
			<a href="#none">
				<img src="/daelim/type/KOR_A/img/intro/logo.png" alt="대림대학교 DAELIM UNIVERSITY COLLEGE" />
				<span><img src="/daelim/type/KOR_A/img/intro/m/logo.png" alt="대림대학교 DAELIM UNIVERSITY COLLEGE" /></span>
			</a>
		</h1>

		<span class="util">
			<button type="button" class="btn_allList">전체편성표</button>
		</span>
	</header>

	<article id="contents">

		<div class="ct_major">
			<!-- 대표이미지일때 -->
			<div class="typeImg">
				<a href="#none" class="btn_play">
					<img src="/daelim/type/KOR_A/img/intro/thumb_major.jpg" alt="자동차의 미래 영상 대표이미지" />
					<span><img src="/daelim/type/KOR_A/img/intro/m/thumb_major.jpg" alt="자동차의 미래 영상 대표이미지" /></span>
				</a>
				<strong class="tit">
					<span class="titWrap">
						<span class="mark">NOW</span>
						AI와 미래모빌리티 포럼
					</span>
				</strong>
			</div>

			<!-- //대표이미지일때 -->

			<!-- 영상일때 -->
			<div class="typeMovie" style="display:none;">
				<video width="100%" height="533px" controls="">
					<source src="https://www.daelim.ac.kr/resources/hme/video/2017PR.mp4" type="video/mp4">
				</video>
			</div>
			<!-- //영상일때 -->
		</div>

		<div class="ct_thumb">
			<div class="list">
				<div class="unit">
					<img src="/daelim/type/KOR_A/img/intro/thumb_img_s01.png" alt="대림대 홍보영상 영상 대표이미지" />
					<a href="#none">
						<span class="titWrap">
							<span class="tit">대림대학교 ㅣ 대림대 공식 홍보영상(3분) Daelim University College</span>
							<span class="tit_on">대림대학교 ㅣ 대림대 공식 홍보영상(3분) Daelim University College</span>
						</span>
					</a>
				</div>
				<div class="unit">
					<span class="mark">NOW</span>
					<img src="/daelim/type/KOR_A/img/intro/thumb_img_s02.png" alt="자동차의 미래 영상 대표이미지" />
					<a href="#none">
						<span class="titWrap">
							<span class="tit">[대림대 브이로그] 가끔은 실수해도 돼. 누구든 그랬으니까(전과생의 하루 브이로그)</span>
							<span class="tit_on">[대림대 브이로그] 가끔은 실수해도 돼. 누구든 그랬으니까(전과생의 하루 브이로그)</span>
						</span>
					</a>
				</div>
				<div class="unit">
					<img src="/daelim/type/KOR_A/img/intro/thumb_img_s03.png" alt="대동제 축하공연 영상 대표이미지" />
					<a href="#none">
						<span class="titWrap">
							<span class="tit">[대림대 브이로그] 대학생 감성 브이로그, 졸업학기의 일주일|VLOG|A day of university student, 홍보대사, 해외연수, 안양일번가, 댄스동아리, 대학축제</span>
							<span class="tit_on">[대림대 브이로그] 대학생 감성 브이로그, 졸업학기의 일주일|VLOG|A day of university student, 홍보대사, 해외연수, 안양일번가, 댄스동아리, 대학축제</span>
						</span>
					</a>
				</div>
				<div class="unit">
					<img src="/daelim/type/KOR_A/img/intro/thumb_img_s04.png" alt="카트라이더 결승 영상 대표이미지" />
					<a href="#none">
						<span class="titWrap">
							<span class="tit">대림대학교에서 요즘 강의 어떻게 하는지 궁금하시죠? 음향 영상 공부하고 싶으세요?? 방송음향영상학부가 어떤 곳인지 알려드릴게요</span>
							<span class="tit_on">대림대학교에서 요즘 강의 어떻게 하는지 궁금하시죠? 음향 영상 공부하고 싶으세요?? 방송음향영상학부가 어떤 곳인지 알려드릴게요</span>
						</span>
					</a>
				</div>
				<div class="unit">
					<img src="/daelim/type/KOR_A/img/intro/thumb_img_s05.png" alt="학과 브이로그 영상 대표이미지" />
					<a href="#none">
						<span class="titWrap">
							<span class="tit">김도헌 대림대교수</span>
							<span class="tit_on">김도헌 대림대교수</span>
						</span>
					</a>
				</div>
				<div class="unit">
					<img src="/daelim/type/KOR_A/img/intro/thumb_img_s01.png" alt="대림대 홍보영상 영상 대표이미지" />
					<a href="#none">
						<span class="titWrap">
							<span class="tit">대림대학교 ㅣ 대림대 공식 홍보영상(3분) Daelim University College</span>
							<span class="tit_on">대림대학교 ㅣ 대림대 공식 홍보영상(3분) Daelim University College</span>
						</span>
					</a>
				</div>
				<div class="unit">
					<span class="mark">NOW</span>
					<img src="/daelim/type/KOR_A/img/intro/thumb_img_s02.png" alt="자동차의 미래 영상 대표이미지" />
					<a href="#none">
						<span class="titWrap">
							<span class="tit">[대림대 브이로그] 가끔은 실수해도 돼. 누구든 그랬으니까(전과생의 하루 브이로그)</span>
							<span class="tit_on">[대림대 브이로그] 가끔은 실수해도 돼. 누구든 그랬으니까(전과생의 하루 브이로그)</span>
						</span>
					</a>
				</div>
				<div class="unit">
					<img src="/daelim/type/KOR_A/img/intro/thumb_img_s03.png" alt="대동제 축하공연 영상 대표이미지" />
					<a href="#none">
						<span class="titWrap">
							<span class="tit">[대림대 브이로그] 대학생 감성 브이로그, 졸업학기의 일주일|VLOG|A day of university student, 홍보대사, 해외연수, 안양일번가, 댄스동아리, 대학축제</span>
							<span class="tit_on">[대림대 브이로그] 대학생 감성 브이로그, 졸업학기의 일주일|VLOG|A day of university student, 홍보대사, 해외연수, 안양일번가, 댄스동아리, 대학축제</span>
						</span>
					</a>
				</div>
				<div class="unit">
					<img src="/daelim/type/KOR_A/img/intro/thumb_img_s04.png" alt="카트라이더 결승 영상 대표이미지" />
					<a href="#none">
						<span class="titWrap">
							<span class="tit">대림대학교에서 요즘 강의 어떻게 하는지 궁금하시죠? 음향 영상 공부하고 싶으세요?? 방송음향영상학부가 어떤 곳인지 알려드릴게요</span>
							<span class="tit_on">대림대학교에서 요즘 강의 어떻게 하는지 궁금하시죠? 음향 영상 공부하고 싶으세요?? 방송음향영상학부가 어떤 곳인지 알려드릴게요</span>
						</span>
					</a>
				</div>
				<div class="unit">
					<img src="/daelim/type/KOR_A/img/intro/thumb_img_s05.png" alt="학과 브이로그 영상 대표이미지" />
					<a href="#none">
						<span class="titWrap">
							<span class="tit">김도헌 대림대교수</span>
							<span class="tit_on">김도헌 대림대교수</span>
						</span>
					</a>
				</div>
			</div>
		</div>

		<div class="ct_bnr"><div class="bnrWrap">
			<!--
			<div class="top">
				<img src="/daelim/type/KOR_A/img/intro/ctBnr_tit.png" alt="입학이 취업이다!" />
			</div>
			<div class="txtGrp">
				<div class="grp">
					<strong class="tit">2020학년도 후기편입학 원서접수</strong>
					<ul class="list_dotBlue">
						<li>
							<b>원서접수 및 서류제출</b>
							20.07.13(월) ~ 08.03(월) 15:00까지
						</li>
						<li>
							<b>면접일시</b>
							20.08.06(목)
						</li>
						<li>
							<b>합격자발표</b>
							20.08.13(목) 10:00 예정
						</li>
						<li>
							<b>등록금납부기간</b>
							20.08.17(월) ~ 08.18(화) 16:00까지
						</li>
						<li>
							<b>충원합격자발료 및 등록기간</b>
							20.08.19(수) ~ 08.21(화) 16:00까지
						</li>
					</ul>
				</div>

				<div class="grp">
					<strong class="tit">2021학년도 신입생 전형일정(접수)</strong>
					<ul class="list_dotBlue typeRow">
						<li>
							<b>수시1차</b>
							2020.09.23(수) ~ 10.03(화)
						</li>
						<li>
							<b>수시2차</b>
							2020.11.23(월) ~ 12.07(화)
						</li>
						<li>
							<b>정시</b>
							2021.01.07(목) ~ 01.18(월)
						</li>
					</ul>
				</div>

				<div class="btn_area">
					<a href="#none" class="btn_bnr">전체일정보기</a>
				</div>
			</div>-->

			<a href="#none"><img src="/daelim/type/KOR_A/img/intro/ct_bnr01.png" alt="" /></a>
			<button type="button" class="btn_mClose">닫기</button>
		</div></div>

		<div class="btm_bnr">
			<ul>
				<li><a href="#none"><span>학생포털시스템</span></a></li>
				<li><a href="#none"><span>입학홈페이지</span></a></li>
				<li><a href="#none"><span>합격예측서비스</span></a></li>
				<li><a href="#none"><span>대림대학교 홈페이지</span></a></li>
			</ul>
		</div>
	</article>

	<!-- 전체편성표 팝업 -->
	<article id="pop_allList">
		<a href="#none" class="logo"><img src="/daelim/type/KOR_A/img/intro/logo.png" alt="대림대학교 DAELIM UNIVERSITY COLLEGE" /></a>
		<div class="allList">
			<ul>
				<li>
					<span class="img"><img src="/daelim/type/KOR_A/img/intro/thumb_all_01.png" alt="" /></span>
					<p class="txt">
						<strong>대림대학교 면접 꿀팁 총정리!! <span class="time">00:20</span></strong>
						안녕하세요? 에이스대림입니다. 대림대학교 면접을 준비하고 있다면?<br />
						2020학년도 면접을 준비하고 있는 예비 대림인들을 위한 면접 꿀팁 가득!!
					</p>
					<span class="tag">
						<em># daelim&apos;s pick</em>
					</span>
				</li>
				<li>
					<span class="img"><img src="/daelim/type/KOR_A/img/intro/thumb_all_02.png" alt="" /></span>
					<p class="txt">
						<strong>AI와 미래모빌리티 포럼 <span class="time">00:20:30</span></strong>
						인공지능과 미래 모빌리티 포럼을 개최하였습니다.<br />
						인공지능과 미래 모빌리티 포럼을 개최하였습니다.<br />
						인공지능과 미래 모빌리티 포럼을 개최하였습니다.<br />
						인공지능과 미래 모빌리티 포럼을 개최하였습니다.
						글로벌 경쟁력을 위하여 대학이 추구할 교육 및 연구 방향을 모색하였다.
						인공지능과 미래 모빌리티 포럼을 개최하였습니다.<br />
						인공지능과 미래 모빌리티 포럼을 개최하였습니다.<br />
						글로벌 경쟁력을 위하여 대학이 추구할 교육 및 연구 방향을 모색하였다.
						인공지능과 미래 모빌리티 포럼을 개최하였습니다.
						인공지능과 미래 모빌리티 포럼을 개최하였습니다.<br />
						글로벌 경쟁력을 위하여 대학이 추구할 교육 및 연구 방향을 모색하였다.
						인공지능과 미래 모빌리티 포럼을 개최하였습니다.<br />
						글로벌 경쟁력을 위하여 대학이 추구할 교육 및 연구 방향을 모색하였다.
					</p>
					<span class="tag">
						<em># news</em>
					</span>
				</li>
				<li>
					<span class="img"><img src="/daelim/type/KOR_A/img/intro/thumb_all_03.png" alt="" /></span>
					<p class="txt">
						<strong>항공서비스과 일상 브이로그 <span class="time">00:20</span></strong>
						항공과 VLOG(졸업사진 촬영, 홍보영상 촬영, 첫 브이로그)<br />
						학교 가기 전 준비과정부터 항공서비스과의 졸업사진과 홍보영상까지의 과정을 담은 영상
					</p>
					<span class="tag">
						<em># people</em>
					</span>
				</li>
				<li>
					<span class="img"><img src="/daelim/type/KOR_A/img/intro/thumb_all_04.png" alt="" /></span>
					<p class="txt">
						<strong>대림대학교 임곡대동제 <span class="time">00:20</span></strong>
						늦게 도착하여 무대가 돌출 무대인걸 몰랐습니다.<br />
						마지막곡 기다리다는 끊어 찍어서 개별영상 올릴때 같이 올리도록 하겠습니다!
					</p>
					<span class="tag">
						<em># daelim&apos;s pick</em>
					</span>
				</li>
				<li>
					<span class="img"><img src="/daelim/type/KOR_A/img/intro/thumb_all_01.png" alt="" /></span>
					<p class="txt">
						<strong>대림대학교 면접 꿀팁 총정리!! <span class="time">00:20</span></strong>
						안녕하세요? 에이스대림입니다. 대림대학교 면접을 준비하고 있다면?<br />
						2020학년도 면접을 준비하고 있는 예비 대림인들을 위한 면접 꿀팁 가득!!
					</p>
					<span class="tag">
						<em># daelim&apos;s pick</em>
					</span>
				</li>
				<li>
					<span class="img"><img src="/daelim/type/KOR_A/img/intro/thumb_all_02.png" alt="" /></span>
					<p class="txt">
						<strong>AI와 미래모빌리티 포럼 <span class="time">00:20</span></strong>
						인공지능과 미래 모빌리티 포럼을 개최하였습니다.<br />
						글로벌 경쟁력을 위하여 대학이 추구할 교육 및 연구 방향을 모색하였다.
					</p>
					<span class="tag">
						<em># news</em>
					</span>
				</li>
			</ul>
		</div>
		<button type="button" class="btn_popClose">닫기</button>
	</article>
	<!-- //전체편성표 팝업 -->

	<footer>
		<p class="copyright">Copyright© Daelim University College. <br />All rights reserved.</p>
	</footer>
</div>

</body>
</html>

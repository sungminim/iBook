
$(function(){
	//공통
	$(".board_area .fileArea>p").each(function(){
		var downTitle = $(this).find('a').text();
		$(this).find('a').attr('title', downTitle + ' [다운로드]');
	});

	$(".board_area td>.hasArea").each(function(){
		if($(this).find('a').length < 1){
			$(this).parent('td').css("padding","0");
		}
	});


	// view share box
	/* 개발단에서 소스 copy해서 사용중 / 퍼블페이지 확인시엔 주석 해제 */
	/*
	function shareBox_act(){
		if($("#dim").attr("class") == "popup"){
			$("#dim").removeClass("popup");
		}else{
			$("#dim").addClass("popup");
		}
	}

	$(".shareArea .btn_share").click(function(){
		$(this).toggleClass('on');
		$(".shareArea .shareBox").toggle();
		shareBox_act()
	});


	$(".shareArea .shareBox li>a").click(function(){
		$(".shareArea .shareBox").toggle();
		shareBox_act()
	});

	$("div#dim").click(function(){
		$(this).removeClass("on");
		$(".shareArea .shareBox").toggle();
	});

	$(window).resize(function(){
		if($(".shareArea .shareBox").css('display') == 'block'){
			$(".shareArea .shareBox").toggle();
			shareBox_act()
		}
	});
	*/

	//faq
	$(".lineList_ul.typeFaq dl>dt>button").click(function(){
		if($(this).parent('dt').attr('class') != 'on'){
			$(".lineList_ul.typeFaq dl dt button").attr("title", "답변 닫힘");
			$(".lineList_ul.typeFaq dl dt").removeClass('on');
			$(".lineList_ul.typeFaq dl dd").removeClass('on').slideUp(200).removeAttr("tabindex");

			$(this).attr("title", "답변 열림");
			$(this).parent('dt').addClass('on');
			$(this).parent('dt').next().addClass('on').slideDown(200).attr("tabindex","0");
		}
	});
	$(".lineList_tb.typeFaq td>button").click(function(){
		if(!$(this).parent('td').hasClass('on')){
			$(".lineList_tb.typeFaq td>button").attr("title", "답변 닫힘");
			$(".lineList_tb.typeFaq td").removeClass('on');
			$(".lineList_tb.typeFaq .typeFaqA>td").removeClass('on');
			$(".lineList_tb.typeFaq .typeFaqA>td .faqA_wrap").slideUp(200).removeAttr("tabindex");

			$(this).attr("title", "답변 열림");
			$(this).parent('td').addClass('on');
			$(this).parents('tr').next('.typeFaqA').children('td').addClass('on');
			$(this).parents('tr').next('.typeFaqA').find('.faqA_wrap').slideDown(200).attr("tabindex","0");
		}
	});

	//thumb이미지비율
	function galleryRate(){
		$(".typeGalleryList .photo a>img").css({
			"height": Math.floor($(".typeGalleryList .photo a").width() * 0.70)
		});

		$(".typeGallery .photo a>img").css({
			"height": Math.floor($(".typeGallery .photo a").width() * 0.70)
		});

		$(".typeGallery.typePdf .photo a>img").css({
			"height": Math.floor($(".typeGallery.typePdf .photo a").width() * 1.18)
		});

		if(window.innerWidth > 560){
			if($(".lineList_ul.typeGallery li>span").hasClass('mark_categ')){
				$(".lineList_ul.typeGallery li").css({
					"height": Math.floor($(".typeGallery .photo").height() + 155)
				});
			}else{
				$(".lineList_ul.typeGallery li").css({
					"height": Math.floor($(".typeGallery .photo").height() + 135)
				});
			}
		}else{
			$(".lineList_ul.typeGallery li").css({
				"height": ""
			});
		}


	}

	//팝업
	function popLoc(){
		/*if($(window).width() > 1041){
			var popW = -($(".pop_wrap .pop_ct").width() / 2)
			var popH = -($(".pop_wrap .pop_ct").height() / 2)
			$(".pop_wrap .pop_ct").css({
				"margin-top": popH,
				"margin-left": popW
			})
		}else{
			$(".pop_wrap .pop_ct").css({
				"margin-top": "",
				"margin-left": ""
			})
		}*/
		var popW = -($(".pop_wrap .pop_ct").width() / 2) - 40
		var popH = -($(".pop_wrap .pop_ct").height() / 2)
		$(".pop_wrap .pop_ct").css({
			"margin-top": popH,
			"margin-left": popW
		})
	}

	$(window).bind('load resize', function(){
		popLoc(); // 팝업위치
		galleryRate(); // 썸네일 이미지 비율 /* 190616수정 추가 */
	});

	//custom scroll
	$(".lineList_v .view_movie .movie_caption .txt").mCustomScrollbar();
	if($(".lineList_v .view_movie .movie_caption .txt").hasClass("mCS_no_scrollbar")){
		$(".lineList_v .view_movie .movie_caption .txt").attr("tabindex","0");
	}

	// 121927 수정
	// if($(window).width() > 1041){
	// 	$('.lineList_ul .mark_categ').each(function(){
	// 		$(this).each(function(){
	// 			if($(this).text().length >= 7){
	// 				$(this).css('top','42%');
	// 			}
	// 		})
	// 	});

	// 	$('.lineList_ul.typeFaq dt .mark_categ').each(function(){
	// 		$(this).each(function(){
	// 			if($(this).text().length >= 7){
	// 				$(this).css('top','50%');
	// 			}
	// 		})
	// 	})

	// }
});

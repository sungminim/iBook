$(function(){
    var owl = $(".owl-prod");

    owl.on("initialized.owl.carousel", function (event) {
        
        var itemCount = event.item.count; // 슬라이더 총 갯수
        var size = event.page.size; // 현재 슬라이더 순서
        var dragLength = 100 / (itemCount / size);
        var curItem = event.item.index + 1;

        $("#range").ionRangeSlider({
            type: "single",
            min: 1,
            max: itemCount - (size - 1),
            keyboard: true,
            step: 1,
            onChange: function (data) {
                owlTo = data.from - 1;
                owl.trigger("to.owl.carousel", [owlTo, 500, true]);
            }
        });

        $(".irs-slider.single").css("width", dragLength + "%");

        $('.bookSec').removeClass('typeZoom');
        $('.owl-carousel .owl-item img').removeClass('zoomIn');

        $('.num').html('' + curItem + ' of ' + itemCount + '');
    });

    owl.owlCarousel({
        loop: false,
        autoWidth: false,
        center: true,
        nav: true,
        dots: true,
        margin: 10,
        autoHeight:true,
        items: 1
    });


    owl.on("translate.owl.carousel", function (event) {
        $('.bookSec').removeClass('typeZoom');
        $('.owl-carousel .owl-item img').removeClass('zoomIn');
    });

    owl.on("dragged.owl.carousel changed.owl.carousel", function (event) {
        var itemCount = event.item.count;
        var size = event.page.size;
        var curItem = event.item.index + 1;
        var dragLength = 100 / (itemCount / size);
        $("#range").data("ionRangeSlider").update({
            from: curItem
        });
        $(".irs-slider.single").css("width", dragLength + "%");

        $('.bookSec').removeClass('typeZoom');
        $('.owl-carousel .owl-item img').removeClass('zoomIn');

        $('.num').html('' + curItem + ' of ' + itemCount + '');
    });

    owl.on("resized.owl.carousel", function (event) {
        var itemCount = event.item.count;
        var size = event.page.size;
        var curItem = event.item.index + 1;
        var dragLength = 100 / (itemCount / size);
        $("#range")
            .data("ionRangeSlider")
            .update({
            max: itemCount - (size - 1),
            from: curItem
            });
        $(".irs-slider.single").css("width", dragLength + "%");

        $('.bookSec').removeClass('typeZoom');
        $('.owl-carousel .owl-item img').removeClass('zoomIn');
    });

    $('.owl-carousel .owl-item img').click(function(){
        if($(this).hasClass('zoomIn')) {
            $(this).removeClass('zoomIn');
            $(this).parents('.bookSec').removeClass('typeZoom');
        } else {
            var imgH = $(this).height();
            console.log(imgH);
            $(this).addClass('zoomIn');
            $(this).parents('.bookSec').addClass('typeZoom');
            $(".rangesliderOwl").removeClass('fixed');
        }
    })

    var totalItems = $('.item').length;
    var currentIndex = $('.owl-item.active').index() + 1;

    $('.num').html('' + currentIndex + ' of ' + totalItems + '');

    
    function areaLimit(){
        if(window.innerWidth >= 1041){
            if(window.innerHeight < 900){
                $(".rangesliderOwl").removeClass('fixed');
            }else{
                $(".rangesliderOwl").addClass('fixed');
            }
        }else{
            $(".rangesliderOwl").removeClass('fixed');
        }
    }

    $(window).bind('load resize', function(){
        areaLimit();
    });
    
})
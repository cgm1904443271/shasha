$(function () {
    $('.home').width(innerWidth)
    var swiper = new Swiper('.swiper-container', {
        nextButton: '.swiper-button-next',
        pagination: '.swiper-pagination',
        prevButton: '.swiper-button-prev',
        paginationClickable: true,
        spaceBetween: 30,
        centeredSlides: true,
        autoplay: 2500,
        autoplayDisableOnInteraction: false
    });
})
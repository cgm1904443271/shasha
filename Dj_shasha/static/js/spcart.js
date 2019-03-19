// $(function () {
//     $('.quxiao').click(function () {
//     console.log('123')
//     $('.num').hide()
// })
// })
$(function () {
    $('.jia').click(function () {
        request_data={
            'goodid':$(this).attr('data-goodid')
        }
        var that =$(this)
        $.get('/shasha/showcart',request_data,function (response) {
            if (response.status==1){
                that.prev().prev().prev().html('数量：'+response.number)
                $('.items-quantity').html(response.sums)
                $('.ui-cart-total').html(response.prices)
            }


    })
    })

    $('.jian').click(function () {
        request_data={
            'goodid':$(this).attr('data-goodid')
        }
        var that =$(this)
        $.get('/shasha/subcart',request_data,function (response) {
            if (response.status==1){
                that.prev().prev().html('数量：'+response.number)
            }
            $('.items-quantity').html(response.sums)
            $('.ui-cart-total').html(response.prices)
    })
    })
})


$(function () {
    $('.pay').click(function () {
        request_data={
            'goodid':$(this).attr('data-goodid')
        }
        var that = $(this)
        $.get('/shasha/pay',request_data,function (response) {
            if (response.selection==1){
                that.removeClass('paytb').addClass('pay')
                $('.ui-cart-total').html(response.price1)
                $('.items-quantity').html(response.num1)
            }else {
                that.removeClass('pay').addClass('paytb')
                $('.ui-cart-total').html(response.price1)
                $('.items-quantity').html(response.num1)
            }

        })
    })
})

$(function () {
    var payall = $('.payall')
    payall.click(function () {
        $.get('/shasha/payall',function (response) {
            if (response.selectionall==1){
                $(this).removeClass('paytb').addClass('payall')
                $('.paytb').removeClass('paytb').addClass('pay')
                $('.items-quantity').html(response.numn)
                $('.ui-cart-total').html(response.pricec)
            }else {
                $(this).removeClass('payall').addClass('paytb')
                $('.pay').removeClass('pay').addClass('paytb')
                $('.items-quantity').html(0)
                $('.ui-cart-total').html(0)
            }
        })
    })
})
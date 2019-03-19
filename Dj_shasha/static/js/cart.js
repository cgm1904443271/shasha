$(function () {

        // var a=$('.action-quantity-input').val()
        //     if (a<=0){
        //         $('.action-quantity-input').prev().hide()
        //     }else if (a==1){
        //         $('.action-quantity-input').prev().show()
        //     }


    //加操作
        $(function () {
            $('.btn-increase').click(function () {
                var that=$(this)
                request_data = {
                    'goodid':$(this).attr('data-goodid')
                }
                $.get('/shasha/showcart/',request_data,function (response) {
                    if (response) {
                        // console.log (response)
                        if (response.status == 1) {
                            that.prev().html(response.number)

                            that.prev().show()
                            that.prev().prev().show()
                        }else{
                        $(window).attr(location,'/shasha/login/')
                    }
                    }
                })
            })
        })

        //减操作

        $(function () {
            $('.btn-decrease').click(function () {
                var that=$(this)
                request_data = {
                    'goodid':$(this).attr('data-goodid')
                }
                $.get('/shasha/subcart/',request_data,function (response) {
                    // console.log (response)
                    if (response.number>0){
                        that.next().html(response.number)
                    } else {
                        that.next().hide()
                        that.hide()
                    }
                })
            })
        })
    // $.get('/shasha/subcart/',request_data,function (response) {
    //         if (response.number>0){
    //             $('.action-quantity-input').show()
    //             $('.action-quantity-input').prev().show()
    //         }
    // })

    })


//加入购物车

// $(function () {
//     var y = $('.btn-decrease').next()
//
//     $('.btn').click(function () {
//         var x = $('.btn-decrease')
//         x.hide()
//         x.next().hide()
//     })
//
//
// })
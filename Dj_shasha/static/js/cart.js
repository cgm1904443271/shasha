$(function () {

        // var a=$('.action-quantity-input').val()
        //     if (a<=0){
        //         $('.action-quantity-input').prev().hide()
        //     }else if (a==1){
        //         $('.action-quantity-input').prev().show()
        //     }


    //加操作
    var num=0
        $(function () {
            $('.btn-increase').click(function () {

                    num++
                    console.log(num)
                    $(this).prev().html(num)
                // request_data = {
                //     'goodid':$(this).attr('data-goodid')
                // }
                // $.get('/shasha/showcart/',request_data,function (response) {
                //     if (response) {
                //         // console.log (response)
                //         if (response.status == 1) {
                //             that.prev().html(response.number)
                //
                //             that.prev().show()
                //             that.prev().prev().show()
                //         }else{
                //         $(window).attr(location,'/shasha/login/')
                //     }
                //     }
                // })
            })
        })

        //减操作

        $(function () {
            $('.btn-decrease').click(function () {
                num--
                    if (num<=0){
                        num=0
                        $(this).next().html(num)
                    }

        //         var that=$(this)
        //         request_data = {
        //             'goodid':$(this).attr('data-goodid')
        //         }
        //         $.get('/shasha/subcart/',request_data,function (response) {
        //             // console.log (response)
        //             if (response.number>0){
        //                 that.next().html(response.number)
        //             } else {
        //                 that.next().hide()
        //                 that.hide()
        //             }
        //         })
            })

        })
    // $.get('/shasha/subcart/',request_data,function (response) {
    //         if (response.number>0){
    //             $('.action-quantity-input').show()
    //             $('.action-quantity-input').prev().show()
    //         }
    // })
        $(function () {
            $('.add-cart').click(function () {
                    request_data = {
                        'goodid':$(this).attr('data-goodid'),
                        'num':num
                    }
           $.get('/shasha/addcart/',request_data,function (response) {
               if (response.status==1){
                   $('.action-quantity-input').html(0)

               }
               $('.kkk').html(response.numbers)
           })
                num=0

            })
        })


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
//         request_data = {
//                         'goodid':goodid,
//                         'num':number
//                     }
//            $.get('/shasha/addcart/',request_data,function (response) {
//                if (response.status==1){
//                    $('.action-quantity-input').html(response.number)
//                }
//            })
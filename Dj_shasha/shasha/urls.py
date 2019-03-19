from django.conf.urls import url

from shasha import views

urlpatterns=[
    url(r'^index/$',views.index,name='index'),
    url(r'^register/$',views.register,name='register'),
    url(r'^login/$',views.login,name='login'),
    url(r'^logout/$',views.logout,name='logout'),
    url(r'^jump/(\d+)$',views.jump,name='jump'),
    url(r'^showcart/$',views.showcart,name='showcart'),
    url(r'^subcart/$',views.subcart,name='subcart'),
    url(r'^addcart/$',views.addcart,name='addcart'),
    url(r'^payy/$',views.payy,name='payy'),
    url(r'^payall/$',views.payall,name='payall'),
    # url(r'^spcart/$',views.spcart,name='spcart'),
    url(r'^cart/$',views.cart,name='cart'),
    url(r'^generateorder/$',views.generateorder,name='generateorder'),
    url(r'^orderlist/$',views.orderlist,name='orderlist'),
    url(r'^orderdetail/(\d+)$',views.orderdetail,name='orderdetail'),

    #测试接口
    url(r'^returnurl/$',views.returnurl,name='returnurl'),#支付成功后客户端的页面显示
    url(r'^appnotifyurl/$',views.app_notify_url,name='app_notify_url'),#支付成功后服务器订单的处理
    url(r'^pay/$',views.pay,name='pay'),
]
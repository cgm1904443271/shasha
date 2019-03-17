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
    # url(r'^spcart/$',views.spcart,name='spcart'),
    url(r'^cart/$',views.cart,name='cart'),
]
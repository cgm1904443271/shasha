import hashlib
import random
import time

from django.http import JsonResponse
from django.shortcuts import render, redirect

# Create your views here.
from shasha.models import Img, User, Goods, Cart, Order, OrderGoods


def index(request):
    imgs=Img.objects.all()
    goods=Goods.objects.all()


    token=request.session.get('token')
    user=None
    if token:
        user=User.objects.filter(token=token)
        user=user.first()

        return render(request,'index.html',context={'imgs':imgs,'msg':'已登录','goods':goods})
    else:
        return render(request,'index.html',context={'imgs':imgs,'goods':goods})

def genareter_tooken():
    temp = str(time.time()) + str(random.random())
    md5 = hashlib.md5()
    md5.update(temp.encode('utf-8'))
    return md5.hexdigest()


def register(request):
    if request.method=='GET':
        return render(request ,'register.html')
    elif request.method=='POST':
        user=User()
        user.username=request.POST.get('username')
        user.password=request.POST.get('password')
        user.token=genareter_tooken()
        user.save()

        response=redirect('shasha:index')
        request.session['token']=user.token
        return response



def login(request):
    if request.method=='GET':
        return render(request,'login.html')
    elif request.method=='POST':
        username = request.POST.get('username')
        password = request.POST.get('password')

        users=User.objects.filter(username=username)

        if users.exists():
            user=users.first()
            if user.password==password:
                user.token=genareter_tooken()
                user.save()
                request.session['token']=user.token
                response = redirect('shasha:index')


                return response
            else:
                return render(request, 'login.html',context={'err':'密码错误'})
        else:
            return render(request, 'login.html',context={'err1':'账号输入有误'})


def logout(request):
    request.session.flush()

    return redirect('shasha:index')


def jump(request,a):
    good=Goods.objects.get(pk=a)
    token = request.session.get('token')
    if token:
        yyy = True
        user = User.objects.get(token=token)
        carts = Cart.objects.filter(user=user).filter(goods=good).first()
        if carts:
            num = carts.number
            return render(request, 'Product Details.html', context={'good': good, 'num': num, 'yyy': yyy})
        else:
            num = '0'
            return render(request, 'Product Details.html', context={'good': good,'num':num,'yyy':yyy})
    else:
        return render(request,'Product Details.html',context={'good':good})


def showcart(request):
    token = request.session.get('token')
    if token:
        goodid = request.GET.get('goodid')
        user = User.objects.get(token=token)
        goods = Goods.objects.get(pk=goodid)

        carts = Cart.objects.filter(user=user).filter(goods=goods)
        if carts.exists():
            cart=carts.first()
            cart.number +=1
            cart.save()
        else:
            cart = Cart()
            cart.user=user
            cart.goods=goods
            cart.number=1
            cart.save()

        response_data={
            'msg':'111',
            'number':cart.number,
            'status':1
        }

        return JsonResponse(response_data)
    else:
        return render(request,'login.html')



def subcart(request):
    goodid = request.GET.get('goodid')
    token = request.session.get('token')
    if token:
        user = User.objects.get(token=token)
        goods = Goods.objects.get(pk=goodid)

        cart = Cart.objects.filter(user=user).filter(goods=goods).first()

        cart.number -=1
        num = cart.number
        if num <=0:
            num=0
        cart.number=num
        cart.save()


    response_data={
        'msg':'111',
        'number':cart.number,
    }


    return JsonResponse(response_data)




def cart(request):
    token = request.session.get('token')


    if token:
        user = User.objects.get(token=token)
        cartss = Cart.objects.filter(user=user)
        carts=[]
        for item in cartss:
            if item.number>0:
                carts.append(item)
        numbers=0
        price=0
        for i in range(len(carts)):
            cart=carts[i]
            m=cart.number
            p = float(cart.goods.price)*int(m)
            numbers +=m
            price +=p
            goodid = cart.goods.id


        return render(request, 'Shopping Cart.html', context={
            'carts': carts,
            'price':price,
            'number':numbers,
        })
    else:
        return render(request,'login.html')


def generate_number():
    temp =str(random.randrange(1000,10000))+str(random.randrange(1000,10000))

    return temp


def generateorder(request):
    token = request.session.get('token')
    user = User.objects.get(token=token)

    order = Order()
    order.user = user
    order.order_number = generate_number()
    order.save()

    carts = user.cart_set.filter(number__gt=0)
    if carts.exists():
        for cart in carts:
            orderGoods = OrderGoods()
            orderGoods.order = order
            orderGoods.goods = cart.goods
            orderGoods.number = cart.number
            orderGoods.save()

            cart.delete()


        return render(request,'ordertail.html',context={'order':order})
    else:
        return render(request,'Shopping Cart.html')


def orderlist(request):
    token = request.session.get('token')
    user = User.objects.get(token=token)
    orders = user.order_set.all()
    return render(request, 'orderlist.html',context={
        'orders':orders
    })




def orderdetail(request,order_number):
    order = Order.objects.get(order_number=order_number)

    return render(request,'ordertail.html',context={'order':order})
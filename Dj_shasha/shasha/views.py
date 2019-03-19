import hashlib
import random
import time

from django.http import JsonResponse
from django.shortcuts import render, redirect

# Create your views here.
# from shasha.alipay import alipay
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

        return render(request, 'Product Details.html', context={'good': good,'yyy': yyy})

    else:
        return render(request,'Product Details.html',context={'good':good})


def addcart(request):
    token = request.session.get('token')
    if token:
        num = request.GET.get('num')
        goodid = request.GET.get('goodid')
        user = User.objects.get(token=token)
        goods = Goods.objects.get(pk=goodid)

        carts = Cart.objects.filter(user=user).filter(goods=goods)
        if carts.exists():
            cart=carts.first()
            cart.number+=int(num)
            cart.save()
        else:
            cart = Cart()
            cart.user=user
            cart.goods=goods
            cart.number=num
            cart.save()

        cartss = Cart.objects.all()
        numbers=0
        for item in cartss:
            numbers+=item.number

        response_data={
            'msg':'111',
            'number':cart.number,
            'status':1,
            'numbers':numbers
        }

        return JsonResponse(response_data)
    else:
        return render(request,'login.html')


def showcart(request):
        goodid = request.GET.get('goodid')
        goods = Goods.objects.get(pk=goodid)
        token = request.session.get('token')
        user = User.objects.get(token=token)
        cart = Cart.objects.filter(user=user).filter(goods=goods).first()
        cart.number+=1
        cart.save()

        cartss = Cart.objects.filter(user=user)
        carts = []
        for item in cartss:
            if item.number > 0:
                carts.append(item)

        price = 0
        sums=0
        for i in range(len(carts)):
            card1 = carts[i]
            sun = card1.number
            sums+=sun
            p = float(card1.goods.price) * int(sun)
            price += p

        response_data={
            'msg':'111',
            'number':cart.number,
            'status':1,
            'prices':price,
            'sums':sums
        }

        return JsonResponse(response_data)




def subcart(request):
    goodid = request.GET.get('goodid')
    goods = Goods.objects.get(pk=goodid)
    token = request.session.get('token')
    user = User.objects.get(token=token)

    cart = Cart.objects.filter(goods=goods).filter(user=user).first()
    cart.number -= 1
    cart.save()
    if cart.number<=0:
        cart.number=0
        cart.save()

    cartss = Cart.objects.filter(user=user)
    carts = []
    for item in cartss:
        if item.number > 0:
            carts.append(item)

    price = 0
    sums = 0
    for i in range(len(carts)):
        card1 = carts[i]
        sun = card1.number
        sums += sun
        p = float(card1.goods.price) * int(sun)
        price += p

    response_data = {
        'msg': '111',
        'number': cart.number,
        'status': 1,
        'prices': price,
        'sums': sums
    }

    return JsonResponse(response_data)


def pay(request):
    token = request.session.get('token')
    user = User.objects.get(token=token)
    goodid = request.GET.get('goodid')
    goods = Goods.objects.get(pk=goodid)

    cart = Cart.objects.filter(user=user).filter(goods=goods).first()
    if cart.selection==1:
        cart.selection=0
        cart.save()
    else:
        cart.selection=1
        cart.save()
    carts = Cart.objects.filter(user=user)
    price = 0
    num = 0
    for item in carts:
        if item.selection==1:
            price+=float(item.goods.price)*int(item.number)
            num+=item.number



    response_data={
        'selection':cart.selection,
        'price1':price,
        'num1':num
    }

    return JsonResponse(response_data)


def payall(request):
    token = request.session.get('token')
    user = User.objects.get(token=token)

    carts = Cart.objects.filter(user=user)
    p=0
    n=0
    for cart in carts:
        if cart.selectionall==1:
            cart.selection = 0
            cart.selectionall =0
            n += cart.number
            p += float(cart.goods.price) * int(cart.number)
            cart.save()
            selectionall = cart.selectionall
        else:
            cart.selection = 1
            cart.selectionall = 1
            n += cart.number
            p += float(cart.goods.price) * int(cart.number)
            cart.save()
            selectionall = cart.selectionall

    response_data={
        'selectionall':selectionall,
        'numn':n,
        'pricec':p
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
    if token:
        user = User.objects.get(token=token)
        order = Order()
        order.user = user
        order.order_number = generate_number()
        order.save()

        carts = user.cart_set.all()
        if carts.exists():
            for cart in carts:
                if cart.number==0:
                    cart.delete()

                elif cart.selection==0:
                    cart.delete()
                else:

                    orderGoods = OrderGoods()
                    orderGoods.order = order
                    orderGoods.goods = cart.goods
                    orderGoods.number = cart.number
                    orderGoods.save()

                    cart.delete()

            return render(request,'ordertail.html',context={'order':order})
        else:
            return render(request,'Shopping Cart.html')
    else:
        return redirect('shasha:login')


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


def returnurl(request):
    return render(request,'orderlist.html')


def app_notify_url(request):
    print('支付成功')
    return JsonResponse({'msg':'success'})


# def pay(request):
#     # print(request.GET.get('orderid'))
#     orderid = request.GET.get('orderid')
#     order = Order.objects.get(pk=orderid)
#
#     sum = 0
#     for orderGoods in order.ordergoods_set.all():
#         sum += orderGoods.goods.price*orderGoods.number
#
#     sum = float(sum)
#     #支付地址信息
#     data = alipay.direct_pay(
#         subject='口红 [10000]->[100]', # 显示标题
#         out_trade_no=order.order_number, # shasha订单号
#         total_amount=sum, #支付金额
#         return_url="http://47.100.99.45/shasha/returnurl/",
#     )
#     #支付地址
#     alipay_url ='https://openapi.alipaydev.com/gateway.do?{data}'.format(data=data)
#
#     response_data={
#         'msg':'调用支付接口',
#         'alipayurl':alipay_url,
#         'status':1
#     }
#
#     return JsonResponse(response_data)



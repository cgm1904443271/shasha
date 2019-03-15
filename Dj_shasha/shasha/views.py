import hashlib
import random
import time

from django.shortcuts import render, redirect

# Create your views here.
from shasha.models import Img, User


def index(request):
    imgs=Img.objects.all()

    return render(request,'index.html',context={'imgs':imgs})

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


                return redirect('shasha:index')
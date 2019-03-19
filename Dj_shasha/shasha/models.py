from django.db import models

# Create your models here.
class Img(models.Model):
    name=models.CharField(max_length=50)
    path=models.CharField(max_length=256)

    class Meta:
        db_table='ss_img'


class User(models.Model):
    username=models.CharField(max_length=100)
    password=models.CharField(max_length=100)
    token = models.CharField(max_length=255)

    class Meta:
        db_table='ss_user'

class Goods(models.Model):
    name = models.CharField(max_length=100)
    img_path=models.CharField(max_length=255)
    gid = models.CharField(max_length=20)
    price = models.IntegerField()
    market = models.IntegerField()
    region = models.CharField(max_length=255)
    longname = models.CharField(max_length=255)

    class Meta:
        db_table='ss_goods'


class Cart(models.Model):
    user = models.ForeignKey(User)
    goods = models.ForeignKey(Goods)
    number = models.IntegerField()
    selection = models.IntegerField(default=1)


    class Meta:
        db_table='ss_cart'


class Order(models.Model):
    user = models.ForeignKey(User)
    createtime = models.DateTimeField(auto_now_add=True)
    updatetime = models.DateTimeField(auto_now=True)
    status = models.IntegerField(default=0)
    order_number = models.CharField(max_length=255)

    class Meta:
        db_table='ss_order'


class OrderGoods(models.Model):
    order = models.ForeignKey(Order)
    goods = models.ForeignKey(Goods)
    number = models.IntegerField()

    class Meta:
        db_table='ss_ordergood'





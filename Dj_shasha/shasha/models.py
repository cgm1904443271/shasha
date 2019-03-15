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


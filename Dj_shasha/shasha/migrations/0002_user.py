# -*- coding: utf-8 -*-
# Generated by Django 1.11.4 on 2019-03-14 12:46
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('shasha', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='User',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('username', models.CharField(max_length=100)),
                ('password', models.CharField(max_length=100)),
                ('token', models.CharField(max_length=255)),
            ],
            options={
                'db_table': 'ss_user',
            },
        ),
    ]

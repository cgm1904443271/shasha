# -*- coding: utf-8 -*-
# Generated by Django 1.11.4 on 2019-03-16 02:32
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('shasha', '0002_auto_20190315_0352'),
    ]

    operations = [
        migrations.CreateModel(
            name='Cart',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('number', models.IntegerField()),
                ('goods', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='shasha.Goods')),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='shasha.User')),
            ],
            options={
                'db_table': 'ss_cart',
            },
        ),
    ]

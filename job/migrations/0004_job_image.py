# Generated by Django 3.2.5 on 2021-09-25 23:47

from django.db import migrations, models
import job.models


class Migration(migrations.Migration):

    dependencies = [
        ('job', '0003_auto_20210925_1842'),
    ]

    operations = [
        migrations.AddField(
            model_name='job',
            name='image',
            field=models.ImageField(blank=True, null=True, upload_to=job.models.upload_img),
        ),
    ]

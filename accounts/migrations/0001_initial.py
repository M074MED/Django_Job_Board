# Generated by Django 3.2.5 on 2021-09-28 21:52

import accounts.models
from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion
import location_field.models.plain
import phonenumber_field.modelfields


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='Profile',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('image', models.ImageField(blank=True, null=True, upload_to=accounts.models.upload_img)),
                ('phone_number', phonenumber_field.modelfields.PhoneNumberField(max_length=128, region='EG')),
                ('city', models.CharField(blank=True, max_length=25, null=True)),
                ('location', location_field.models.plain.PlainLocationField(blank=True, max_length=63, null=True)),
                ('user', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
    ]
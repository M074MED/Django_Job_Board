# Generated by Django 3.2.5 on 2021-09-24 13:23

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('job', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='job',
            name='job_type',
            field=models.CharField(choices=[('Full-time', 'Full-time'), ('Part-time', 'Part-time')], default='Full-time', max_length=20),
        ),
    ]

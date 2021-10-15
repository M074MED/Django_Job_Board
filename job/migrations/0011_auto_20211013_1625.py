# Generated by Django 3.2.5 on 2021-10-13 14:25

from django.db import migrations, models
import job.models


class Migration(migrations.Migration):

    dependencies = [
        ('job', '0010_auto_20210930_1755'),
    ]

    operations = [
        migrations.RenameField(
            model_name='apply',
            old_name='Job',
            new_name='job',
        ),
        migrations.AlterField(
            model_name='apply',
            name='cv',
            field=models.FileField(blank=True, null=True, upload_to=job.models.upload_cv),
        ),
    ]
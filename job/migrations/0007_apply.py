# Generated by Django 3.2.5 on 2021-09-26 14:05

from django.db import migrations, models
import django.db.models.deletion
import job.models


class Migration(migrations.Migration):

    dependencies = [
        ('job', '0006_job_slug'),
    ]

    operations = [
        migrations.CreateModel(
            name='Apply',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=50)),
                ('email', models.EmailField(max_length=254)),
                ('website', models.URLField(blank=True, null=True)),
                ('cv', models.FileField(upload_to=job.models.upload_cv)),
                ('cover_letter', models.TextField(blank=True, max_length=500, null=True)),
                ('applied_at', models.DateTimeField(auto_now=True)),
                ('Job', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='job.job')),
            ],
        ),
    ]

# Generated by Django 3.2.5 on 2021-09-24 13:19

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Job',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(max_length=100)),
                ('description', models.TextField(blank=True, null=True)),
                ('job_type', models.CharField(blank=True, choices=[('Full-time', 'Full-time'), ('Part-time', 'Part-time')], max_length=20, null=True)),
                ('published_on', models.DateTimeField(auto_now=True)),
                ('vacancy', models.IntegerField(default=1)),
                ('salary', models.DecimalField(blank=True, decimal_places=2, max_digits=6, null=True)),
                ('experience', models.IntegerField(default=1)),
            ],
        ),
    ]
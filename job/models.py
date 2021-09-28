from django.db import models
from django.utils.text import slugify
from django.contrib.auth.models import User


# Create your models here.


def upload_img(instance, filename):
    image_name, extension = filename.split('.')
    return f'images/jobs/{instance.id}.{extension}'


class Job(models.Model):
    job_types = [('Full-time', 'Full-time'), ('Part-time', 'Part-time')]
    owner = models.ForeignKey(User, on_delete=models.CASCADE)
    title = models.CharField(max_length=100)
    image = models.ImageField(upload_to=upload_img, null=True, blank=True)
    description = models.TextField(null=True, blank=True)
    job_type = models.CharField(max_length=20, default='Full-time', choices=job_types)
    published_on = models.DateTimeField(auto_now=True)
    vacancy = models.IntegerField(default=1)
    salary = models.IntegerField(default=0)
    experience = models.IntegerField(default=1)
    category = models.ForeignKey('Category', on_delete=models.PROTECT, null=True, blank=True)

    # for url
    slug = models.SlugField(null=True, blank=True)

    def save(self, *args, **kwargs):  # over riding save method
        self.slug = slugify(self.title)
        super(Job, self).save(*args, **kwargs)

    def __str__(self):
        return self.title


class Category(models.Model):
    name = models.CharField(max_length=20)

    def __str__(self):
        return self.name


def upload_cv(instance, filename):
    cv_name, extension = filename.split('.')
    return f'apply/cvs/{instance.name}.{extension}'


class Apply(models.Model):
    Job = models.ForeignKey(Job, on_delete=models.CASCADE)
    name = models.CharField(max_length=50)
    email = models.EmailField()
    website = models.URLField(null=True, blank=True)
    cv = models.FileField(upload_to=upload_cv)
    cover_letter = models.TextField(max_length=500, null=True, blank=True)
    applied_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.name

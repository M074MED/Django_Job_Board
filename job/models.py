from django.db import models

# Create your models here.


class Job(models.Model):
    job_types = [('Full-time', 'Full-time'), ('Part-time', 'Part-time')]
    title = models.CharField(max_length=100)
    description = models.TextField(null=True, blank=True)
    job_type = models.CharField(max_length=20, default='Full-time', choices=job_types)
    published_on = models.DateTimeField(auto_now=True)
    vacancy = models.IntegerField(default=1)
    salary = models.DecimalField(decimal_places=2, max_digits=6, null=True, blank=True)
    experience = models.IntegerField(default=1)

    def __str__(self):
        return self.title

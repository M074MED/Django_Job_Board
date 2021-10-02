from django.db import models
from phonenumber_field.modelfields import PhoneNumberField

# Create your models here.


class Info(models.Model):
    address = models.CharField(max_length=50)
    phone_number = PhoneNumberField(region='EG')
    email = models.EmailField(max_length=50)

    def __str__(self):
        return self.email

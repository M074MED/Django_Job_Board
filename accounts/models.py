from django.conf import settings
from django.contrib.auth.models import User
from django.db import models
from phonenumber_field.modelfields import PhoneNumberField
from location_field.models.plain import PlainLocationField
from django.db.models.signals import post_save
from django.dispatch import receiver
from rest_framework.authtoken.models import Token

# Create your models here.


def upload_img(instance, filename):
    image_name, extension = filename.split('.')
    return f'images/accounts/profiles/{instance.user.username}.{extension}'


class Profile(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    image = models.ImageField(upload_to=upload_img, null=True, blank=True)
    phone_number = PhoneNumberField(region='EG', null=True, blank=True)
    city = models.CharField(max_length=25, null=True, blank=True)  # TODO
    location = PlainLocationField(based_fields=['city'], zoom=7, null=True, blank=True)

    def __str__(self):
        return f'{self.user}'


@receiver(post_save, sender=settings.AUTH_USER_MODEL)
def create_user_profile_and_token(sender, instance, created, **kwargs):
    if created:
        Profile.objects.create(user=instance)
        Token.objects.create(user=instance)

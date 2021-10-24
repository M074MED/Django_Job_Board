from django.contrib import admin
from .models import *


class ProfileAdmin(admin.ModelAdmin):
    list_display = ['__str__', 'full_name', 'city']
    list_filter = ['city']

    @staticmethod
    def full_name(profile):
        return f'{profile.user.first_name} {profile.user.last_name}'


# Register your models here.
admin.site.register(Profile, ProfileAdmin)

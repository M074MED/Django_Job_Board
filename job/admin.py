from django.contrib import admin
from .models import *


admin.site.site_header = 'Job Board Admin Panel'
admin.site.site_title = 'Job Board Admin Panel'


class JobAdmin(admin.ModelAdmin):
    exclude = ['slug']
    list_display = ['title', 'owner', 'job_type', 'published_on', 'salary', 'category']
    list_editable = ['job_type', 'category']
    list_filter = ['job_type', 'salary', 'category', 'experience', 'published_on']
    search_fields = ['title', 'description']


class CategoryAdmin(admin.ModelAdmin):
    search_fields = ['name']


class ApplyAdmin(admin.ModelAdmin):
    list_display = ['__str__', 'user', 'job', 'applied_at']
    list_filter = ['user', 'job', 'applied_at']
    search_fields = ['first_name', 'last_name']


# Register your models here.
admin.site.register(Job, JobAdmin)
admin.site.register(Category, CategoryAdmin)
admin.site.register(Apply, ApplyAdmin)

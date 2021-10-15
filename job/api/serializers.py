from rest_framework import serializers
from job.models import Job, Apply


class JobSerializer(serializers.ModelSerializer):
    owner = serializers.SerializerMethodField('get_username_from_owner')
    category = serializers.SerializerMethodField('get_category_name_from_category')

    class Meta:
        model = Job
        fields = ['title',
                  'image',
                  'description',
                  'job_type',
                  'published_on',
                  'vacancy',
                  'salary',
                  'experience',
                  'owner',
                  'category']

    @staticmethod
    def get_username_from_owner(job):
        username = job.owner.username
        return username

    @staticmethod
    def get_category_name_from_category(job):
        category_name = job.category
        return str(category_name)


class ApplySerializer(serializers.ModelSerializer):
    class Meta:
        model = Apply
        fields = ['first_name', 'last_name', 'email', 'website', 'cv', 'cover_letter']

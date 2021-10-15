from rest_framework import serializers
from contact.models import Info


class ContactSerializer(serializers.ModelSerializer):
    class Meta:
        model = Info
        fields = ['address', 'phone_number', 'email']

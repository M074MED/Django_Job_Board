from django import forms
from .models import Apply, Job


class ApplyForm(forms.ModelForm):
    class Meta:
        model = Apply
        fields = ['first_name', 'last_name', 'email', 'website', 'cv', 'cover_letter']


class AddJobForm(forms.ModelForm):
    class Meta:
        model = Job
        fields = '__all__'
        exclude = ('owner', 'slug')

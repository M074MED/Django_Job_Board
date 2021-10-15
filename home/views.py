from django.shortcuts import render
from job.models import Job

# Create your views here.


def home(request):
    all_jobs = Job.objects.all()
    return render(request, 'home/index.html', {'jobs': all_jobs})


def about(request):
    return render(request, 'about/about.html')

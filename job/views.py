from django.shortcuts import render, redirect
from .models import *
from django.core.paginator import Paginator
from .forms import ApplyForm, AddJobForm
# Create your views here.


def jobs(request):
    all_jobs = Job.objects.all()
    paginator = Paginator(all_jobs, 6)  # Show 6 jobs per page.

    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)
    context = {'jobs': page_obj,
               'jobs_number': paginator.count}
    return render(request, 'jobs.html', context)


def job_details(request, slug):
    job_detail = Job.objects.get(slug=slug)

    if request.method == 'POST' and 'apply' in request.POST:
        data = ApplyForm(request.POST, request.FILES)
        if data.is_valid():
            form = data.save(commit=False)
            form.Job = job_detail
            form.save()

    context = {'job': job_detail, 'apply_form': ApplyForm}
    return render(request, 'job_details.html', context)


def add_job(request):
    if request.method == 'POST':
        data = AddJobForm(request.POST, request.FILES)
        if data.is_valid():
            form = data.save(commit=False)
            form.owner = request.user
            form.save()
            return redirect('jobs')
    return render(request, 'add_job.html', {'add_job_form': AddJobForm})

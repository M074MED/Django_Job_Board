from django.contrib.auth.decorators import login_required
from django.shortcuts import render, redirect, get_object_or_404
from .filters import JobFilter
from .models import *
from django.core.paginator import Paginator
from .forms import ApplyForm, AddJobForm


# Create your views here.
def jobs(request):
    all_jobs = Job.objects.all()

    # Filters
    filter_ = JobFilter(request.GET, queryset=all_jobs)
    all_jobs = filter_.qs

    paginator = Paginator(all_jobs, 6)  # Show 6 jobs per page.

    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)
    context = {'jobs': page_obj,
               'jobs_number': paginator.count,
               'filter': filter_,
               }
    return render(request, 'job/jobs.html', context)


def job_details(request, id, slug):
    job_detail = get_object_or_404(Job, id=id, slug=slug)

    if request.method == 'POST' and 'apply_job' in request.POST:
        data = ApplyForm(request.POST, request.FILES)
        if data.is_valid():
            form = data.save(commit=False)
            form.job = job_detail
            form.user = request.user
            form.save()
            return redirect('job:apply_done')
    else:
        try:
            data = ApplyForm(instance=request.user)
        except AttributeError:
            data = ApplyForm()

    context = {'job': job_detail, 'apply_form': data}
    return render(request, 'job/job_details.html', context)


def apply_done(request):
    return render(request, 'job/apply_done.html')


@login_required
def add_job(request):
    if request.method == 'POST' and 'add_job' in request.POST:
        data = AddJobForm(request.POST, request.FILES)
        if data.is_valid():
            form = data.save(commit=False)
            form.owner = request.user
            form.save()
            return redirect('job:jobs')
    return render(request, 'job/add_job.html', {'add_job_form': AddJobForm})

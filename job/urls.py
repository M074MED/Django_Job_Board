from django.urls import path
from . import views

app_name = 'job'

urlpatterns = [
    path('', views.jobs, name="jobs"),
    path('add_job', views.add_job, name="add_job"),
    path('apply_done', views.apply_done, name="apply_done"),
    path('<int:id>_<str:slug>', views.job_details, name="job_details"),
]

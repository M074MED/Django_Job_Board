from django.urls import path
from . import views


urlpatterns = [
    path('', views.jobs, name="jobs"),
    path('add_job', views.add_job, name="add_job"),
    path('apply_done', views.apply_done, name="apply_done"),
    path('<str:slug>', views.job_details, name="job_details"),
]

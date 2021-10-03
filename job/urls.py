from django.urls import path
from . import views
from . import api


urlpatterns = [
    path('', views.jobs, name="jobs"),
    path('add_job', views.add_job, name="add_job"),
    path('apply_done', views.apply_done, name="apply_done"),
    path('<str:slug>', views.job_details, name="job_details"),

    # api
    path('api/jobs', api.job_list_api, name="job_list_api"),
    path('api/job_details/<int:id>', api.job_details, name="job_details_api"),

    # class based views / generic views
    path('api/v2/jobs', api.JobListApi.as_view(), name="JobListApi"),
    path('api/v2/job_details/<int:id>', api.JobDetails.as_view(), name="JobDetails"),
]

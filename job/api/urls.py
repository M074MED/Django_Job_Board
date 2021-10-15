from django.urls import path
from . import views

app_name = 'job'

urlpatterns = [
    # function based views
    path('', views.job_list_api, name="job_list_api"),
    path('add_job', views.add_job, name='add_job_api'),
    path('<int:id>_<str:slug>', views.job_details, name="job_details_api"),
    path('<int:id>_<str:slug>/apply', views.apply, name="apply_job_api"),

    # class based views / generic views
    path('v2', views.JobListApi.as_view(), name="JobListApi"),
    path('v2/<int:id>_<str:slug>', views.JobDetails.as_view(), name="JobDetails"),
]

from .serializers import JobSerializer
from .models import Job
from rest_framework.response import Response
from rest_framework.decorators import api_view
from rest_framework import generics


@api_view(['GET'])
def job_list_api(request):
    all_jobs = Job.objects.all()
    data = JobSerializer(all_jobs, many=True).data
    return Response({'data': data})


@api_view(['GET'])
def job_details(request, id):
    job = Job.objects.get(id=id)
    data = JobSerializer(job).data
    return Response({'job_details': data})


# class based views / generic views
class JobListApi(generics.ListCreateAPIView):
    queryset = Job.objects.all()
    serializer_class = JobSerializer


class JobDetails(generics.RetrieveUpdateDestroyAPIView):
    queryset = Job.objects.all()
    lookup_field = 'id'
    serializer_class = JobSerializer

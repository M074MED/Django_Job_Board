from django.shortcuts import get_object_or_404
from django_filters.rest_framework import DjangoFilterBackend
from rest_framework.pagination import PageNumberPagination
from job.filters import JobFilter
from .serializers import *
from job.models import Job, Apply
from rest_framework.response import Response
from rest_framework.decorators import api_view, permission_classes, authentication_classes
from rest_framework.permissions import IsAuthenticated
from rest_framework.authentication import BasicAuthentication, SessionAuthentication
from rest_framework import generics, status


@api_view(['GET'])
@permission_classes([IsAuthenticated])
def job_list_api(request):
    try:
        all_jobs = Job.objects.all()
    except Job.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)

    data = JobSerializer(all_jobs, many=True).data
    return Response({'jobs': data})


@api_view(['POST'])
@authentication_classes([SessionAuthentication, BasicAuthentication])
@permission_classes([IsAuthenticated])
def add_job(request):
    job = Job(owner=request.user)
    if request.method == 'POST':
        serializer = JobSerializer(job, data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


@api_view(['GET'])
@permission_classes([IsAuthenticated])
def job_details(request, slug, id):
    job = get_object_or_404(Job, slug=slug, id=id)
    data = JobSerializer(job).data
    return Response({'job_details': data})


@api_view(['POST'])
@authentication_classes([SessionAuthentication, BasicAuthentication])
@permission_classes([IsAuthenticated])
def apply(request, id, slug):
    job = get_object_or_404(Job, id=id, slug=slug)
    apply_job = Apply(user=request.user, job=job)
    if request.method == 'POST':
        serializer = ApplySerializer(apply_job, data=request.data)
        data = {}
        if serializer.is_valid():
            serializer.save()
            data['success'] = "Thank you for applying. " \
                              "We will email you instructions to complete your application. " \
                              "If they haven't arrived in a few minutes, check your spam folder."
            return Response(data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


# class based views / generic views
class JobListApi(generics.ListAPIView):
    permission_classes = [IsAuthenticated]
    queryset = Job.objects.all()
    serializer_class = JobSerializer
    pagination_class = PageNumberPagination
    filter_backends = [DjangoFilterBackend]
    filterset_class = JobFilter


class JobDetails(generics.RetrieveUpdateDestroyAPIView):
    permission_classes = [IsAuthenticated]
    queryset = Job.objects.all()
    lookup_field = 'id'
    serializer_class = JobSerializer

from django.contrib.auth import authenticate, login
from django.contrib.auth.models import User
from django.shortcuts import get_object_or_404
from rest_framework.authentication import BasicAuthentication, SessionAuthentication
from rest_framework.decorators import api_view, authentication_classes, permission_classes
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from rest_framework import status
from accounts.models import Profile
from rest_framework.authtoken.models import Token
from accounts.api.serializers import (
                                        ProfileSerializer,
                                        UserSerializer,
                                        SignUpSerializer,
                                        PasswordChangeSerializer,
                                        PasswordResetSerializer,
                                    )


@api_view(['GET'])
# @authentication_classes([SessionAuthentication, BasicAuthentication])
@permission_classes([IsAuthenticated])
def profile(request):
    profile = get_object_or_404(Profile, user=request.user)
    user = get_object_or_404(User, id=request.user.id)
    data = {}
    user_serializer = UserSerializer(user)
    profile_serializer = ProfileSerializer(profile)
    data['profile'] = {**user_serializer.data, **profile_serializer.data}
    token = get_object_or_404(Token, user=user).key
    data['token'] = token
    return Response(data, status=status.HTTP_201_CREATED)


@api_view(['PUT'])
# @authentication_classes([SessionAuthentication, BasicAuthentication])
@permission_classes([IsAuthenticated])
def edit_profile(request):
    profile = get_object_or_404(Profile, user=request.user)
    user = get_object_or_404(User, id=request.user.id)
    data = {}
    if request.method == 'PUT':
        user_serializer = UserSerializer(user, data=request.data)
        profile_serializer = ProfileSerializer(profile, data=request.data)
        if user_serializer.is_valid() and profile_serializer.is_valid():
            user_serializer.save()
            profile_serializer.save()
            data['Response'] = 'update successful'
            data['profile'] = [user_serializer.data, profile_serializer.data]
            return Response(data, status=status.HTTP_201_CREATED)
        elif not user_serializer.is_valid():
            return Response(user_serializer.errors, status=status.HTTP_400_BAD_REQUEST)
        return Response(profile_serializer.errors, status=status.HTTP_400_BAD_REQUEST)


@api_view(['POST'])
def sign_up(request):
    if request.method == 'POST':
        serializer = SignUpSerializer(data=request.data)
        data = {}
        if serializer.is_valid():
            serializer.save()
            username = serializer.cleaned_data['username']
            password = serializer.cleaned_data['password2']
            user = authenticate(username=username, password=password)
            login(request, user)
            data['Response'] = 'sign up successful'
            user = get_object_or_404(User, id=request.user.id)
            user_serializer = UserSerializer(user)
            data['user'] = user_serializer.data
            token = get_object_or_404(Token, user=user).key
            data['token'] = token
            return Response(data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


@api_view(['PUT'])
# @authentication_classes([SessionAuthentication, BasicAuthentication])
@permission_classes([IsAuthenticated])
def password_change(request):
    if request.method == 'PUT':
        serializer = PasswordChangeSerializer(user=request.user, data=request.data)
        data = {}
        if serializer.is_valid():
            serializer.save()
            data['Response'] = 'The password has been changed!'
            return Response(data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


@api_view(['POST'])
def password_reset(request):
    if request.method == 'POST':
        serializer = PasswordResetSerializer(data=request.data)
        data = {}
        if serializer.is_valid():
            serializer.save(domain_override="jobboard.pythonanywhere.com")  # domain_override= the domain of the website
            data['Response'] = "We've emailed you instructions for setting your password. " \
                               "If they haven't arrived in a few minutes, check your spam folder."
            return Response(data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

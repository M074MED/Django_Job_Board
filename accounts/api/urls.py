from django.urls import path
from . import views
from rest_framework.authtoken.views import obtain_auth_token

app_name = 'accounts'

urlpatterns = [
    path('sign_up', views.sign_up, name="sign_up_api"),
    path('login', obtain_auth_token, name="login_api"),
    path('profile/', views.profile, name="profile_api"),
    path('profile/edit', views.edit_profile, name="edit_profile_api"),
]

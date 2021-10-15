from django.urls import path
from . import views

app_name = 'accounts'

urlpatterns = [
    path('sign_up', views.sign_up, name="sign_up"),
    path('profile/', views.profile, name="profile"),
    path('profile/edit', views.edit_profile, name="edit_profile"),
]

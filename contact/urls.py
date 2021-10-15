from django.urls import path
from . import views

app_name = 'contact'

urlpatterns = [
    path('', views.contact, name="contact"),
    path('message_sent', views.message_sent, name="message_sent"),
]

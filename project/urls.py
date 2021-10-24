"""project URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include
from django.conf import settings
from django.conf.urls.static import static


urlpatterns = [
    # Themes APP URL
    path('grappelli/', include('grappelli.urls')),

    # Django URLs
    path('accounts/', include('django.contrib.auth.urls')),
    path('admin/', admin.site.urls),

    # My URLs
    path('', include('home.urls', namespace='home')),
    path('jobs/', include('job.urls', namespace='job')),
    path('contact/', include('contact.urls', namespace='contact')),
    path('accounts/', include('accounts.urls', namespace='accounts')),

    # My API URLs
    path('api-auth/', include('rest_framework.urls')),
    path('api/jobs/', include('job.api.urls', namespace='job_api')),
    path('api/contact/', include('contact.api.urls', namespace='contact_api')),
    path('api/accounts/', include('accounts.api.urls', namespace='accounts_api')),

] + static(settings.STATIC_URL, document_root=settings.STATIC_ROOT) +\
    static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)


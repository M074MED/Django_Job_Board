from django.conf import settings
from django.core.mail import send_mail
from django.shortcuts import render, redirect
from .models import Info
# Create your views here.


def contact(request):
    info = Info.objects.last()

    if request.method == 'POST' and 'send_message' in request.POST:
        name = request.POST['name']
        subject = request.POST['subject']
        user_email = request.POST['email']
        message = f'{request.POST["message"]} \nName: {name} \nEmail: {user_email}'
        send_mail(
            subject,
            message,
            user_email,
            [settings.EMAIL_HOST_USER],
            fail_silently=False,
        )
        return redirect('contact:message_sent')

    return render(request, 'contact.html', {'info': info})


def message_sent(request):
    return render(request, 'message_sent.html')

from rest_framework.decorators import api_view, permission_classes
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from rest_framework import status
from contact.models import Info
from contact.api.serializers import ContactSerializer
from django.core.mail import send_mail
from django.conf import settings


@api_view(['GET', 'POST'])
@permission_classes([IsAuthenticated])
def contact(request):
    data = {}
    if request.method == 'GET':
        try:
            info = Info.objects.last()
        except Info.DoesNotExist:
            return Response(status=status.HTTP_404_NOT_FOUND)
        data['contact info'] = ContactSerializer(info).data
        return Response(data)

    if request.method == 'POST':
        name = request.POST['name']
        subject = request.POST['subject']
        user_email = request.POST['email']
        message = f'{request.POST["message"]} \nName: {name} \nEmail: {user_email}'
        if not user_email or not request.POST["message"]:
            data['fail'] = 'email and message are required'
            return Response(data)
        send_mail(
            subject,
            message,
            user_email,
            [settings.EMAIL_HOST_USER],
            fail_silently=False,
        )
        data['success'] = 'Thank you for messaging us. ' \
                          'We will reply to you as soon as possible.'
        return Response(data)
    return Response(status=status.HTTP_400_BAD_REQUEST)

from django.http import HttpResponse


# Create your views here.


def index(request):
    if request.method == 'GET':
        return HttpResponse("Feedback Home get request")
    elif request.method == 'POST':
        return HttpResponse(status=202)
    else:
        return HttpResponse(status=404)

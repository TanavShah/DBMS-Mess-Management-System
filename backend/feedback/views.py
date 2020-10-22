from django.http import HttpResponse


# Feedback Table is this
# id | date_time | student_id | title | description


def index(request):
    if request.method == 'GET':
        return get_feedback(request)
    elif request.method == 'POST':
        return post_feedback(request)
    else:
        return HttpResponse(status=404)


def get_feedback(request):
    # http://127.0.0.1:8000/feedback/?hostel=rajiv
    hostel = request.GET['hostel']
    return HttpResponse("Feedback Home get request " + hostel)


def post_feedback(request):
    return HttpResponse(status=202)

from django.http import HttpResponse
from django.db import connection
import json

# Feedback Table is this
# id | date_time | student_id | title | feedback_description

# http://127.0.0.1:8000/feedback/?hostel=rajiv
from rest_framework import status


def get_feedback(request):
    if request.method != 'GET':
        return HttpResponse(content='only get request allowed', status=status.HTTP_400_BAD_REQUEST)

    hostel = request.GET.get('hostel', None)
    if hostel is None:
        with connection.cursor() as cursor:
            cursor.execute("SELECT * FROM public.feedback")
            rows = cursor.fetchall()
    else:
        with connection.cursor() as cursor:
            cursor.execute("""
            SELECT id, date_time, student_id, title, feedback_description 
            FROM public.feedback INNER JOIN public.userdata 
            ON public.feedback.student_id=public.userdata.enrollment_no 
            WHERE LOWER(bhawan) LIKE LOWER(%s) ;
            """, (hostel,))
            rows = cursor.fetchall()

    result = []
    for row in rows:
        temp = {'id': row[0], 'date_time': str(row[1]), 'student_id': row[2], 'title': row[3],
                'feedback_description': row[4]}
        result.append(temp)

    json_data = json.dumps(result)
    return HttpResponse(json_data, content_type="application/json", status= status.HTTP_200_OK)


def add_feedback(request):
    if request.method != 'POST':
        return HttpResponse(content='only post request allowed', status=status.HTTP_400_BAD_REQUEST)

    student_id = request.POST.get('student_id', None)
    title = request.POST.get('title', None)
    feedback_description = request.POST.get('feedback_description', None)
    # raw_query = "INSERT INTO public.feedback (id , date_time, student_id, title, feedback_description) " \
    #             "VALUES (DEFAULT, NOW()::TIMESTAMP(0), '%s', '%s', '%s')" % (student_id, title, feedback_description)
    #
    # print(raw_query)
    if (student_id is None) or (title is None) or (feedback_description is None):
        return HttpResponse(content="all data not provided : student_id, title, feedback_description",
                            status=status.HTTP_400_BAD_REQUEST)

    with connection.cursor() as cursor:
        cursor.execute("""
        SELECT EXISTS( SELECT * FROM public.student WHERE enrollment_no = %s);
        """, (student_id,))
        row = cursor.fetchone()
    if not row[0]:
        return HttpResponse(content="student with this enrollment_no does not exists",
                            status=status.HTTP_400_BAD_REQUEST)

    with connection.cursor() as cursor:
        cursor.execute("""
        INSERT INTO public.feedback (id , date_time, student_id, title, feedback_description) 
        VALUES (DEFAULT, NOW()::TIMESTAMP(0), %s, %s, %s);
        """, (student_id, title, feedback_description))
    connection.commit()

    return HttpResponse(status= status.HTTP_200_OK)


def del_feedback(request):
    if request.method != 'POST':
        return HttpResponse(content='only post request allowed', status=status.HTTP_400_BAD_REQUEST)

    _id = request.POST.get('id', None)
    if _id is None:
        return HttpResponse(content="all data not provided : id", status=status.HTTP_400_BAD_REQUEST)

    try:
        _id = int(_id)
    except ValueError:
        return HttpResponse(content='id can not convert into int', status=status.HTTP_400_BAD_REQUEST)

    with connection.cursor() as cursor:
        cursor.execute("""
        DELETE FROM public.feedback WHERE id = %s ;
        """, (_id,))
    connection.commit()

    return HttpResponse(status= status.HTTP_200_OK)

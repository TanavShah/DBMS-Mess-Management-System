from django.http import HttpResponse
from django.db import connection
import json


# Feedback Table is this
# id | date_time | student_id | title | feedback_description

# http://127.0.0.1:8000/feedback/?hostel=rajiv
def get_feedback(request):
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
    return HttpResponse(json_data, content_type="application/json")


def add_feedback(request):
    student_id = request.POST.get('student_id', '1111')
    title = request.POST.get('title', 'review')
    feedback_description = request.POST.get('feedback_description', 'not good')
    # raw_query = "INSERT INTO public.feedback (id , date_time, student_id, title, feedback_description) " \
    #             "VALUES (DEFAULT, NOW()::TIMESTAMP(0), '%s', '%s', '%s')" % (student_id, title, feedback_description)
    #
    # print(raw_query)
    with connection.cursor() as cursor:
        cursor.execute("""
        INSERT INTO public.feedback (id , date_time, student_id, title, feedback_description) 
        VALUES (DEFAULT, NOW()::TIMESTAMP(0), %s, %s, %s);
        """, (student_id, title, feedback_description))
    connection.commit()

    return HttpResponse(status=202)


def del_feedback(request):
    _id = int(request.POST.get('id', 1))
    with connection.cursor() as cursor:
        cursor.execute("""
        DELETE FROM public.feedback WHERE id = %s ;
        """, (_id,))
    connection.commit()

    return HttpResponse(status=200)

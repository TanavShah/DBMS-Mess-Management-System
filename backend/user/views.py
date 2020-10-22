from django.http import HttpResponse
from django.db import connection
import json


# Create your views here.
def get_student(request):
    if request.method != 'GET':
        return HttpResponse(status=400)

    hostel = request.GET.get('hostel', None)
    enrollment_no = request.GET.get('enrollment_no', None)

    if hostel is not None:
        with connection.cursor() as cursor:
            cursor.execute("""
            SELECT public.student.enrollment_no , year_no, branch, email, full_name, phone_no, dateofbirth, bhawan
            FROM public.student INNER JOIN public.userdata
            ON public.student.enrollment_no = public.userdata.enrollment_no 
            WHERE LOWER(bhawan) LIKE LOWER(%s) ;
            """, (hostel,))

            rows = cursor.fetchall()

    elif enrollment_no is not None:
        with connection.cursor() as cursor:
            cursor.execute("""
            SELECT public.student.enrollment_no , year_no, branch, email, full_name, phone_no, dateofbirth, bhawan
            FROM public.student INNER JOIN public.userdata
            ON public.student.enrollment_no = public.userdata.enrollment_no
            WHERE public.student.enrollment_no = %s ;
            """, (enrollment_no,))

            rows = cursor.fetchall()

    else:
        with connection.cursor() as cursor:
            cursor.execute("""
            SELECT public.student.enrollment_no , year_no, branch, email, full_name, phone_no, dateofbirth, bhawan
            FROM public.student INNER JOIN public.userdata
            ON public.student.enrollment_no = public.userdata.enrollment_no
            """)

            rows = cursor.fetchall()

    result = []
    for row in rows:
        temp = {'enrollment_no': row[0], 'year_no':row[1],'branch': row[2], 'email': row[3], 'full_name': row[4],
                'phone_no': row[5], 'dateofbirth': str(row[6]), 'bhawan': row[7]}
        result.append(temp)

    json_data = json.dumps(result)
    return HttpResponse(json_data, content_type="application/json")


def add_student(request):
    if request.method != 'POST':
        return HttpResponse(status=400)
    return None


def update_student(request):
    if request.method != 'POST':
        return HttpResponse(status=400)
    return None


def get_worker(request):
    if request.method != 'GET':
        return HttpResponse(status=400)
    return None


def add_worker(request):
    if request.method != 'POST':
        return HttpResponse(status=400)
    return None


def update_worker(request):
    if request.method != 'POST':
        return HttpResponse(status=400)
    return None

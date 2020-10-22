from django.contrib import admin
from django.urls import path
from user import views

# 1. Add/update worker
# 2. Add/update student
# 5. View all students
# 6. View all workers


urlpatterns = [
    path('student/', views.get_student, name='get_student'),
    path('student/add/', views.add_student, name='add_student'),
    path('student/update/', views.update_student, name='update_student'),
    path('worker/', views.get_worker, name='get_worker'),
    path('worker/add/', views.add_worker, name='add_worker'),
    path('worker/update/', views.update_worker, name='update_worker'),
]

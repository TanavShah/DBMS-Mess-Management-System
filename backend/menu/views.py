from .serializers import MenuSerializer
from rest_framework.views import APIView
from rest_framework.parsers import JSONParser
from rest_framework.response import Response
from rest_framework import status
from datetime import datetime
from .models import Menu

# Create your views here.

class MenuByDay(APIView):
    def post(self, request):
        data = JSONParser().parse(request)
        date = data.get("menu_date", None)
        if not date:
            date = datetime.now()
        else:
            date = datetime.fromisoformat(date)
        menus = MenuSerializer.from_day(date)
        print(menus.data)
        return Response(menus.data)

class MenuAdd(APIView):
    def post(self, request):
        data = JSONParser().parse(request)
        data['menu_date'] = datetime.combine(datetime.fromisoformat(data['menu_date']).date(), datetime.min.time())
        menu = Menu(**data)
        menu.save()
        return Response("added successfully", status=status.HTTP_201_CREATED)

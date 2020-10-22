from .serializers import WastageSerializer
from rest_framework.views import APIView
from rest_framework.parsers import JSONParser
from rest_framework.response import Response
from rest_framework import status

# Create your views here.

class DailyWastageView(APIView):
    def post(self, request):
        data = JSONParser().parse(request)
        weekly_wastage = WastageSerializer.from_week_year(**data)
        return Response(weekly_wastage.data)

class DailyWastageAdd(APIView):
    def post(self, request):
        data = JSONParser().parse(request)
        wastage = WastageSerializer(data=data)
        print(wastage)
        if wastage.is_valid():
            wastage.save()
            return Response("Created successfully", status=status.HTTP_201_CREATED)
        return Response(wastage.errors, status=status.HTTP_400_BAD_REQUEST)


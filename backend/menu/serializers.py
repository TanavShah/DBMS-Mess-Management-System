from rest_framework import serializers
from datetime import datetime
from .models import Menu

class MenuSerializer(serializers.Serializer):
    menu_date = serializers.DateTimeField()
    title_id = serializers.IntegerField()
    items = serializers.ListField()
    title_name = serializers.CharField()
    start_time = serializers.TimeField()
    end_time = serializers.TimeField()

    @classmethod
    def from_day(cls, day: datetime):
        return cls(Menu.from_day(day), many=True)

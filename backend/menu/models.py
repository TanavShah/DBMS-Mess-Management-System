from django.db import connection
from datetime import datetime, timedelta, date

# Create your models here.

def get_date_range_from_week_year(week_no: int, year_no: int):
    first_day = datetime.strptime(f"{year_no}-W{week_no-1}-1", "%Y-W%W-%w").date()
    last_day = first_day + timedelta(days=6.9)
    return first_day, last_day

class Menu:
    def __init__(self, menu_date: datetime, title_name: str, items: list, **kwargs):
        self.menu_date = menu_date
        with connection.cursor() as cursor:
            cursor.execute("SELECT title_id, start_time, end_time FROM public.title WHERE title_name=%s", [title_name])
            self.title_id, self.start_time, self.end_time = cursor.fetchone()
        self.title_name = title_name
        self.items = items

    def save(self):
        with connection.cursor() as cursor:
            for item in self.items:
                cursor.execute("INSERT INTO public.menu VALUES (DEFAULT, %s, %s, %s)", [self.menu_date, self.title_id, item])
            connection.commit()

    @classmethod
    def from_day(cls, given_date: datetime):
        day = datetime.combine(given_date.date(), datetime.min.time())
        with connection.cursor() as cursor:
            cursor.execute("SELECT title_name, array_agg(item) FROM public.menu NATURAL JOIN public.title WHERE menu_date=%s GROUP BY title_name", [day])
            results = cursor.fetchall()
        menus = []
        for result in results:
            menus.append(cls(day,*result))
        return menus


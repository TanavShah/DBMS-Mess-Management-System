from django.db import connection

# Create your models here.


class Expense:

    def __init__(self, week_number: int, year_number: int, amount: float):
        self.week_number = week_number
        self.year_number = year_number
        self.amount = amount

    def save(self):
        with connection.cursor() as cursor:
            cursor.execute("INSERT INTO public.expense VALUES (%s, %s, %s)", [self.week_number, self.year_number, self.amount])
            connection.commit()

    @classmethod
    def from_week_year(cls, week_no: int, year_no: int):
        with connection.cursor() as cursor:
            cursor.execute("SELECT amount FROM public.expense WHERE (week_no = week_number AND year_no = year_number)")
            expense = cursor.fetchone()
            
        return cls(*expense)
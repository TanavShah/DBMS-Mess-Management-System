# DBMS-Mess-Management-System
A DBMS Project for Mess Management System.

To get the database working on your system, use the following commands:

```
sudo apt-get install postgresql
```

```
git clone https://github.com/TanavShah/DBMS-Mess-Management-System.git
```

```
git submodule init
```

```
git submodule update
```

```
cd DBMS-Mess-Management-System/postgres
```

```
sudo -u postgres createdb mess
```

```
sudo -u postgres psql -d mess < mess_dump.sql
```

```
sudo -u postgres psql -d mess
```

While working, if the submodule main has updated, run

```
git submodule update --remote
```

And then commit the required changed to the submodule folder and the `.gitmodules`

## API

### Feedback
#### GET
    GET : /feedback/
    query : none/hostel
#### ADD
    POST : /feedback/add/
    body : student_id, title, feedback_description
#### DEL
    POST : /feedback/del/
    body : id 

### STUDENT
#### GET
    GET : /user/student/
    query : none/enrollment_no/hostel
#### ADD
    POST : /user/student/add/
    body : enrollment_no, full_name, phone_no, date_of_birth(YYYY-MM-DD hh24:mm:ss), hostel, year_no, branch, email

### WORKERROLE
#### GET
    GET : /user/workerrole/
    query : none or worker_role
#### ADD
    POST : /user/workerrole/add/
    body : worker_role,salary,shift_start,shift_end(hh24:mm:ss)
#### DEL
    POST : /user/workerrole/del/
    body : worker_role
#### UPDATE
    POST : /user/workerrole/update/
    body : worker_role(required) , atleast one from (salary, shift_start, shift_end)
    
### WORKER
#### GET
    GET : /user/worker/
    query : none/hostel/enrollment_no
#### ADD
    POST : /worker/add/
    body : enrollment_no, full_name, phone_no, date_of_birth(YYYY-MM-DD hh24:mm:ss), hostel, worker_role
    
### LOGIN
    GET : /user/login/
    query : enrollment_no
    
### WASTAGE
#### GET
```markdown
Type : POST
Route : `/wastage/`

Request body:
{
    "week_number": int,
    "year_number": int,
}

example:

> curl -d '{"week_number":44, "year_number":2021}' "http://127.0.0.1:8000/wastage/"


Responses:
- 200 : Returns list of wastage entries for a particular week

sample response:

[] : if no result exists

[
    {
        "curr_date":"2020-10-20T00:00:00Z",
        "amount":100.2,
        "waste_weight":50.34
    },
    .
    .
    .
]
```

#### ADD
```markdown
Type : POST
Route : `/wastage/add`

Request body:
{
    "curr_date": datetime as a string format,
    "amount": float/double,
    "waste_weight": float/double
}

example:

> curl -d '{"curr_date":"2020-10-22T00:00:00Z","amount":100.2,"waste_weight":50.34}' "http://127.0.0.1:8000/wastage/add"

Responses:
- 200 : if entry is created successfully

- 400 :

1. if entry already exits

sample response:

"Wastage for this day already exists"

2. else if some entries are absent

sample response:

> curl -d '{}' "http://127.0.0.1:8000/wastage/add"

{"curr_date":["This field is required."],"amount":["This field is required."],"waste_weight":["This field is required."]}

```

### MENU
#### GET
```markdown
Type : GET
Route : `/menu/`

example:

> curl "http://127.0.0.1:8000/menu/"

Response:
- 200 list of entries for Lunch, Breakfast and Dinner (a dictionary for each) for the current date

example response:

[
    {
        "menu_date": "2020-10-23T00:00:00Z",
            "title_id": 3,
            "items": [
                "shikanji",
            "roti"
            ],
            "title_name": "Dinner",
            "start_time": "19:30:00",
            "end_time": "21:30:00"
    },
        .
        .
        .
]

Type : POST
Route : `/menu/`

Request body:
{
    "menu_date": datetime field
}

example:

> curl -d '{"menu_date": "2020-10-22"}' "http://127.0.0.1:8000/menu/"


Response:
- 200 list of entries for Lunch, Breakfast and Dinner (a dictionary for each) for the supplied date

example response:

[
    {
        "menu_date": "2020-10-23T00:00:00Z",
        "title_id": 3,
        "items": [
            "shikanji",
            "roti"
        ],
        "title_name": "Dinner",
        "start_time": "19:30:00",
        "end_time": "21:30:00"
    },
    .
    .
    .
]
```

#### ADD

```markdown
Type : POST
Route : `/menu/add`

Request body:
{
    "menu_date": datetime field for the day for which we are adding
    "title_name": "Lunch" or "Dinner" or "Breakfast"
    "items": [
        ...      : A list of items for that entry
    ]
}


example:

> curl -d '{"menu_date": "2020-10-21T00:13:01.387053", "title_name": "Dinner", "items": ["shikanji", "roti"]}' "http://127.0.0.1:8000/menu/add"

Responses:
- 200 : if entry is created successfully

- 400 :

if some entries are absent

sample response:

> curl -d '{"menu_date": "2020-10-21T00:13:01.387053", "title_name": "Dinner"}' "http://127.0.0.1:8000/menu/add"

{"items":["This field is required."]
```

### Expense
#### GET

```markdown
Type : POST
Route : `/expense/`

Request body:

{
  "week_number": int : week in the current year for the expense
  "year_number": int : year for the expense
}

example :

> curl -d '{"week_number": 43, "year_number": 2020}' "http://127.0.0.1:8000/expense/"

Responses:

- 200 : returns dictionary with week_number, year_number and amount

sample response:

{
    "week_number": 43,
    "year_number": 2020,
    "amount": 121.23           // float/double
}

if some fields are missing or there is no such entry

sample response:

{}
```

#### ADD

```markdown
Type : POST
Route : `/expense/add`

Request body:

{
    "week_number": int  // week for the expense in the supplied year
    "year_number": int  // year for the expense
    "amount": float/double   // expense amount
}

example:

> curl -d '{"week_number": 43, "year_number": 2020, "amount": 121.23}' "http://127.0.0.1:8000/expense/add"

Responses:

- 200 : entry is created successfully

- 400 :

1. if some field are missing:

> curl -d '{"week_number": 43, "year_number": 2020}' "http://127.0.0.1:8000/expense/add"

{"amount":["This field is required."]}

2. if entry already exists:

> curl -d '{"week_number": 43, "year_number": 2020, "amount": 121.23}' "http://127.0.0.1:8000/expense/add"

"Expense for this week and year already exists"

```

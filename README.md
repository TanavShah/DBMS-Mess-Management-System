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


## API 

### Feedback
#### GET
```
type : get
http://127.0.0.1:8000/feedback?hostel=Rajiv Bhawan
or
http://127.0.0.1:8000/feedback
return : 200 if successful
```
#### ADD
```
http://127.0.0.1:8000/feedback/add
type : post
body :
student_id : string,title : string, feedback_description : string
return : 200 if success
```
#### DEL
```
http://127.0.0.1:8000/feedback/del
type : post
body:
id : string
return : 200 if success
```

### STUDENT
#### GET
```
type : get
http://127.0.0.1:8000/user/student
http://127.0.0.1:8000/user/student?hostel=govind bhawan
http://127.0.0.1:8000/user/student?enrollment_no=18118080
return json response
```
#### ADD
```
type : post
http://127.0.0.1:8000/user/student/add
body :
enrollment_no,full_name,phone_no,date_of_birth,hostel,year_no,branch,email : all strings
return 200  if success
```

### WORKERROLE
#### GET
```
type : get
http://127.0.0.1:8000/user/workerrole
http://127.0.0.1:8000/user/workerrole?worker_role=cleaner
return json response
```
#### ADD
```
type : post
http://127.0.0.1:8000/user/workerrole/add
body :
worker_role,salary,shift_start,shift_end : all strings :: example : 'sweeper','5000','08:00:00','12:20:00' 
return 200  if success
```

### WORKER
#### GET
```
type : get
http://127.0.0.1:8000/user/worker
http://127.0.0.1:8000/user/worker?hostel=govind bhawan
http://127.0.0.1:8000/user/worker?enrollment_no=18118080
return json response
```
#### ADD
```
type : post
http://127.0.0.1:8000/user/worker/add
body :
enrollment_no,full_name,phone_no,date_of_birth,hostel,worker_role : all strings
return 200  if success
```

### LOGIN
```
http://127.0.0.1:8000/user/login?enrollment_no=18118080
```

### WASTAGE
#### GET
```markdown
Type : POST
Route : `/wastage/`

Request body:
{
	"week_no": int,
	"year_no": int,
}

example:

> curl -d '{"week_no":44, "year_no":2021}' "http://127.0.0.1:8000/wastage/"


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

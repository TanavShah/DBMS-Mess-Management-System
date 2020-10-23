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
http://127.0.0.1:8000/feedback/?hostel=Rajiv Bhawan
or
http://127.0.0.1:8000/feedback/
return : 200 if successful
```
#### ADD
```
http://127.0.0.1:8000/feedback/add/
type : post
body :
student_id : string,title : string, feedback_description : string
return : 202 if success
```
#### DEL
```
http://127.0.0.1:8000/feedback/del/
type : post
body:
id : string
return : 200 if success
```

### STUDENT
#### GET
```
type : get
http://127.0.0.1:8000/user/student/
or 
http://127.0.0.1:8000/user/student/?hostel=govind bhawan
or
http://127.0.0.1:8000/user/student/?enrollment_no=18118080
return json response
```
#### ADD
```
type : post
http://127.0.0.1:8000/user/student/add/
body :
enrollment_no,full_name,phone_no,date_of_birth,hostel,year_no,branch,email : all strings
return 202  if success
```

### WORKERROLE
#### GET
```
type : get
http://127.0.0.1:8000/user/workerrole/
return json response
```
#### ADD
```
type : post
http://127.0.0.1:8000/user/workerrole/add/
body :
worker_role,salary,shift_start,shift_end : all strings :: example : 'sweeper','5000','08:00:00','12:20:00' 
return 202  if success
```

### WORKER
#### GET
```
type : get
http://127.0.0.1:8000/user/worker/
or 
http://127.0.0.1:8000/user/worker/?hostel=govind bhawan
or
http://127.0.0.1:8000/user/worker/?enrollment_no=18118080
return json response
```
#### ADD
```
type : post
http://127.0.0.1:8000/user/worker/add/
body :
enrollment_no,full_name,phone_no,date_of_birth,hostel,worker_role : all strings
return 202  if success
```

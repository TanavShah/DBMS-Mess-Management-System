# DBMS-Mess-Management-System
A DBMS Project for Mess Management System.

To get the database working on your system, use the following commands:

```
sudo apt-get install postgresql
```

```
sudo -i -u postgres
```

```
git clone https://github.com/TanavShah/DBMS-Mess-Management-System.git
```

```
cd DBMS-Mess-Management-System
```

```
createdb mess
```

```
psql -d mess < mess_dump.sql
```

```
psql -d mess
```


## API 

### Feedback
#### GET
```
type : get
http://127.0.0.1:8000/feedback/?hostel='Rajiv Bhawan'
or
http://127.0.0.1:8000/feedback/
return : 200 if successful
```
#### ADD
```
http://127.0.0.1:8000/add/
type : post
body :
student_id : string,title : string, feedback_description : string
return : 202 if success
```
#### DEL
```
http://127.0.0.1:8000/del/
type : post
body:
id : string
return : 200 if success
```

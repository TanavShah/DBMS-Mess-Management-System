CREATE TABLE UserData (
        enrollment_no VARCHAR(20) NOT NULL,
        full_name VARCHAR(100) NOT NULL,
        phone_no VARCHAR(10) NOT NULL,
        date_of_birth TIMESTAMP NOT NULL,
        bhawan VARCHAR(50) NOT NULL,
        PRIMARY KEY (enrollment_no)
);

INSERT INTO UserData (enrollment_no, full_name, phone_no, date_of_birth, bhawan) VALUES ('18118080', 'Rajesh Kumar', '9985647291', '2000-09-18', 'Govind Bhawan'), ('54541287', 'Kamlesh Pandit', '9897561245', '1988-12-12', 'Rajendra Bhawan');

CREATE TABLE UserLogin(
        enrollment_no VARCHAR(20) NOT NULL,
        user_pass VARCHAR(100) NOT NULL,
        PRIMARY KEY(enrollment_no),
        FOREIGN KEY(enrollment_no)
            REFERENCES UserData(enrollment_no)
            ON DELETE CASCADE
);

INSERT INTO UserLogin(enrollment_no, user_pass) VALUES ('18118080', 'Pass_8080');
INSERT INTO UserLogin(enrollment_no, user_pass) VALUES ('54541287', 'Pass_1287');

CREATE TABLE Student (
        enrollment_no VARCHAR(20) NOT NULL,
        year_no INT NOT NULL,
        branch VARCHAR(100) NOT NULL,
        email VARCHAR(100) NOT NULL,
        PRIMARY KEY(enrollment_no),
        -- CONSTRAINT fk_enrollment_st
        FOREIGN KEY(enrollment_no)
            REFERENCES UserData(enrollment_no)
            ON DELETE CASCADE
);

INSERT INTO Student (enrollment_no, year_no, branch, email) VALUES ('18118080', 2018, 'Metallurgical Sciences', 'rajeshk@gmail.com');

CREATE TABLE WorkerRole (
        worker_role VARCHAR(100) NOT NULL,
        salary DOUBLE PRECISION NOT NULL,
        shift_start TIME(0) NOT NULL,
        shift_end TIME(0) NOT NULL,
        PRIMARY KEY (worker_role)
);

INSERT INTO WorkerRole (worker_role, salary, shift_start, shift_end) VALUES ('Cleaner', 12576.25, '07:30:00', '16:00:00');

CREATE TABLE Worker (
        enrollment_no VARCHAR(20) NOT NULL,
        worker_role VARCHAR(100) NOT NULL,
        -- CONSTRAINT fk_enrollment_w
        FOREIGN KEY(enrollment_no)
            REFERENCES UserData(enrollment_no)
            ON DELETE CASCADE,
        -- CONSTRAINT fk_worker_role
        FOREIGN KEY(worker_role)
            REFERENCES WorkerRole(worker_role)
            ON DELETE CASCADE         
);

INSERT INTO Worker (enrollment_no, worker_role) VALUES ('54541287', 'Cleaner');

CREATE TABLE Menu (
    menu_id SERIAL NOT NULL,
    menu_date TIMESTAMP NOT NULL,
    title_id INT NOT NULL,
    item TEXT NOT NULL,
    PRIMARY KEY (menu_id)
);

INSERT INTO Menu (menu_date, title_id, item) VALUES ('2016-06-22',1,'Food');

CREATE TABLE Title (
    title_id INT NOT NULL,
    title_name VARCHAR (100) NOT NULL,
    start_time TIME (0) NOT NULL,
    end_time TIME (0) NOT NULL,
    PRIMARY KEY (title_id)
);

INSERT INTO Title (title_id, title_name, start_time, end_time) VALUES (3,'Dinner','19:30:00','21:30:00');
INSERT INTO Title (title_id, title_name, start_time, end_time) VALUES (1,'Breakfast','08:00:00','09:30:00');
INSERT INTO Title (title_id, title_name, start_time, end_time) VALUES (2,'Lunch','12:30:00','14:30:00');

CREATE TABLE DailyWastage (
    curr_date TIMESTAMP NOT NULL,
    amount DOUBLE PRECISION NOT NULL,
    waste_weight DOUBLE PRECISION NOT NULL,
    PRIMARY KEY (curr_date)
);

INSERT INTO DailyWastage (curr_date, amount, waste_weight) VALUES ('2020-10-20',100.20, 50.34);

CREATE TABLE Expense (
    week_number INT NOT NULL,
    year_number INT NOT NULL,
    amount DOUBLE PRECISION NOT NULL,
    PRIMARY KEY (week_number, year_number)
);

INSERT INTO Expense (week_number, year_number, amount) VALUES (36,2020,120.36);

CREATE TABLE Feedback (
    id SERIAL NOT NULL,
    date_time TIMESTAMP NOT NULL,
    enrollment_no VARCHAR(20) NOT NULL,
    title VARCHAR (100) NOT NULL,
    feedback_description VARCHAR (1000) NOT NULL,
    PRIMARY KEY (id),
    -- CONSTRAINT fk_student_id
    FOREIGN KEY (enrollment_no) 
        REFERENCES Student(enrollment_no)
        ON DELETE CASCADE
);

INSERT INTO Feedback (date_time, enrollment_no, title, feedback_description) VALUES ('2020-10-20 20:00:00', '18118080', 'Review', 'Good Overall');

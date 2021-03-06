--
-- PostgreSQL database dump
--

-- Dumped from database version 12.4 (Ubuntu 12.4-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.4 (Ubuntu 12.4-0ubuntu0.20.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

ALTER TABLE ONLY public.worker DROP CONSTRAINT worker_worker_role_fkey;
ALTER TABLE ONLY public.worker DROP CONSTRAINT worker_enrollment_no_fkey;
ALTER TABLE ONLY public.userlogin DROP CONSTRAINT userlogin_enrollment_no_fkey;
ALTER TABLE ONLY public.student DROP CONSTRAINT student_enrollment_no_fkey;
ALTER TABLE ONLY public.feedback DROP CONSTRAINT feedback_student_id_fkey;
ALTER TABLE ONLY public.workerrole DROP CONSTRAINT workerrole_pkey;
ALTER TABLE ONLY public.userlogin DROP CONSTRAINT userlogin_pkey;
ALTER TABLE ONLY public.userdata DROP CONSTRAINT userdata_pkey;
ALTER TABLE ONLY public.title DROP CONSTRAINT title_pkey;
ALTER TABLE ONLY public.student DROP CONSTRAINT student_pkey;
ALTER TABLE ONLY public.menu DROP CONSTRAINT menu_pkey;
ALTER TABLE ONLY public.feedback DROP CONSTRAINT feedback_pkey;
ALTER TABLE ONLY public.expense DROP CONSTRAINT expense_pkey;
ALTER TABLE ONLY public.dailywastage DROP CONSTRAINT dailywastage_pkey;
ALTER TABLE public.menu ALTER COLUMN menu_id DROP DEFAULT;
ALTER TABLE public.feedback ALTER COLUMN id DROP DEFAULT;
DROP TABLE public.workerrole;
DROP TABLE public.worker;
DROP TABLE public.userlogin;
DROP TABLE public.userdata;
DROP TABLE public.title;
DROP TABLE public.student;
DROP SEQUENCE public.menu_menu_id_seq;
DROP TABLE public.menu;
DROP SEQUENCE public.feedback_id_seq;
DROP TABLE public.feedback;
DROP TABLE public.expense;
DROP TABLE public.dailywastage;
DROP EXTENSION plpgsql;
--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: dailywastage; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dailywastage (
    curr_date timestamp without time zone NOT NULL,
    amount double precision NOT NULL,
    waste_weight double precision NOT NULL
);


ALTER TABLE public.dailywastage OWNER TO postgres;

--
-- Name: expense; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.expense (
    week_number integer NOT NULL,
    year_number integer NOT NULL,
    amount double precision NOT NULL
);


ALTER TABLE public.expense OWNER TO postgres;

--
-- Name: feedback; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.feedback (
    id integer NOT NULL,
    date_time timestamp without time zone NOT NULL,
    enrollment_no character varying(20) NOT NULL,
    title character varying(100) NOT NULL,
    feedback_description character varying(1000) NOT NULL
);


ALTER TABLE public.feedback OWNER TO postgres;

--
-- Name: feedback_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.feedback_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.feedback_id_seq OWNER TO postgres;

--
-- Name: feedback_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.feedback_id_seq OWNED BY public.feedback.id;


--
-- Name: menu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.menu (
    menu_id integer NOT NULL,
    menu_date timestamp without time zone NOT NULL,
    title_id integer NOT NULL,
    item text NOT NULL
);


ALTER TABLE public.menu OWNER TO postgres;

--
-- Name: menu_menu_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.menu_menu_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.menu_menu_id_seq OWNER TO postgres;

--
-- Name: menu_menu_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.menu_menu_id_seq OWNED BY public.menu.menu_id;


--
-- Name: student; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.student (
    enrollment_no character varying(20) NOT NULL,
    year_no integer NOT NULL,
    branch character varying(100) NOT NULL,
    email character varying(100) NOT NULL
);


ALTER TABLE public.student OWNER TO postgres;

--
-- Name: title; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.title (
    title_id integer NOT NULL,
    title_name character varying(100) NOT NULL,
    start_time time(0) without time zone NOT NULL,
    end_time time(0) without time zone NOT NULL
);


ALTER TABLE public.title OWNER TO postgres;

--
-- Name: userdata; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.userdata (
    enrollment_no character varying(20) NOT NULL,
    full_name character varying(100) NOT NULL,
    phone_no character varying(10) NOT NULL,
    date_of_birth timestamp without time zone NOT NULL,
    bhawan character varying(50) NOT NULL
);


ALTER TABLE public.userdata OWNER TO postgres;

--
-- Name: userlogin; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.userlogin (
    enrollment_no character varying(20) NOT NULL,
    user_pass character varying(100) NOT NULL
);


ALTER TABLE public.userlogin OWNER TO postgres;

--
-- Name: worker; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.worker (
    enrollment_no character varying(20) NOT NULL,
    worker_role character varying(100) NOT NULL
);


ALTER TABLE public.worker OWNER TO postgres;

--
-- Name: workerrole; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.workerrole (
    worker_role character varying(100) NOT NULL,
    salary double precision NOT NULL,
    shift_start time(0) without time zone NOT NULL,
    shift_end time(0) without time zone NOT NULL
);


ALTER TABLE public.workerrole OWNER TO postgres;

--
-- Name: feedback id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.feedback ALTER COLUMN id SET DEFAULT nextval('public.feedback_id_seq'::regclass);


--
-- Name: menu menu_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu ALTER COLUMN menu_id SET DEFAULT nextval('public.menu_menu_id_seq'::regclass);


--
-- Data for Name: dailywastage; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.dailywastage VALUES ('2020-10-20 00:00:00', 100.2, 50.34);


--
-- Data for Name: expense; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.expense VALUES (36, 2020, 120.36);


--
-- Data for Name: feedback; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.feedback VALUES (3, '2020-10-20 20:00:00', '18118080', 'Review', 'Good Overall');


--
-- Data for Name: menu; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.menu VALUES (1, '2016-06-22 00:00:00', 1, 'Food');


--
-- Data for Name: student; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.student VALUES ('18118080', 2018, 'Metallurgical Sciences', 'rajeshk@gmail.com');


--
-- Data for Name: title; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.title VALUES (3, 'Dinner', '19:30:00', '21:30:00');
INSERT INTO public.title VALUES (1, 'Breakfast', '08:00:00', '09:30:00');
INSERT INTO public.title VALUES (2, 'Lunch', '12:30:00', '14:30:00');


--
-- Data for Name: userdata; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.userdata VALUES ('18118080', 'Rajesh Kumar', '9985647291', '2000-09-18 00:00:00', 'Govind Bhawan');
INSERT INTO public.userdata VALUES ('54541287', 'Kamlesh Pandit', '9897561245', '1988-12-12 00:00:00', 'Rajendra Bhawan');


--
-- Data for Name: userlogin; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.userlogin VALUES ('18118080', 'Pass_8080');
INSERT INTO public.userlogin VALUES ('54541287', 'Pass_1287');


--
-- Data for Name: worker; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.worker VALUES ('54541287', 'Cleaner');


--
-- Data for Name: workerrole; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.workerrole VALUES ('Cleaner', 12576.25, '07:30:00', '16:00:00');


--
-- Name: feedback_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.feedback_id_seq', 3, true);


--
-- Name: menu_menu_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.menu_menu_id_seq', 1, true);


--
-- Name: dailywastage dailywastage_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dailywastage
    ADD CONSTRAINT dailywastage_pkey PRIMARY KEY (curr_date);


--
-- Name: expense expense_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.expense
    ADD CONSTRAINT expense_pkey PRIMARY KEY (week_number, year_number);


--
-- Name: feedback feedback_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.feedback
    ADD CONSTRAINT feedback_pkey PRIMARY KEY (id);


--
-- Name: menu menu_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu
    ADD CONSTRAINT menu_pkey PRIMARY KEY (menu_id);


--
-- Name: student student_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_pkey PRIMARY KEY (enrollment_no);


--
-- Name: title title_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.title
    ADD CONSTRAINT title_pkey PRIMARY KEY (title_id);


--
-- Name: userdata userdata_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.userdata
    ADD CONSTRAINT userdata_pkey PRIMARY KEY (enrollment_no);


--
-- Name: userlogin userlogin_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.userlogin
    ADD CONSTRAINT userlogin_pkey PRIMARY KEY (enrollment_no);


--
-- Name: workerrole workerrole_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.workerrole
    ADD CONSTRAINT workerrole_pkey PRIMARY KEY (worker_role);


--
-- Name: feedback feedback_student_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.feedback
    ADD CONSTRAINT feedback_student_id_fkey FOREIGN KEY (enrollment_no) REFERENCES public.student(enrollment_no) ON DELETE CASCADE;


--
-- Name: student student_enrollment_no_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_enrollment_no_fkey FOREIGN KEY (enrollment_no) REFERENCES public.userdata(enrollment_no) ON DELETE CASCADE;


--
-- Name: userlogin userlogin_enrollment_no_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.userlogin
    ADD CONSTRAINT userlogin_enrollment_no_fkey FOREIGN KEY (enrollment_no) REFERENCES public.userdata(enrollment_no) ON DELETE CASCADE;


--
-- Name: worker worker_enrollment_no_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.worker
    ADD CONSTRAINT worker_enrollment_no_fkey FOREIGN KEY (enrollment_no) REFERENCES public.userdata(enrollment_no) ON DELETE CASCADE;


--
-- Name: worker worker_worker_role_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.worker
    ADD CONSTRAINT worker_worker_role_fkey FOREIGN KEY (worker_role) REFERENCES public.workerrole(worker_role) ON DELETE CASCADE;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--


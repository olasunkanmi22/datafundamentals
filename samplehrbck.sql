--
-- PostgreSQL database dump
--

-- Dumped from database version 11.17
-- Dumped by pg_dump version 11.15

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

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: countries; Type: TABLE; Schema: public; Owner: adminuser
--

CREATE TABLE public.countries (
    country_id character(2) NOT NULL,
    country_name character varying(40),
    region_id integer NOT NULL
);


ALTER TABLE public.countries OWNER TO adminuser;

--
-- Name: departments; Type: TABLE; Schema: public; Owner: adminuser
--

CREATE TABLE public.departments (
    department_id integer NOT NULL,
    department_name character varying(30) NOT NULL,
    location_id integer
);


ALTER TABLE public.departments OWNER TO adminuser;

--
-- Name: departments_department_id_seq; Type: SEQUENCE; Schema: public; Owner: adminuser
--

CREATE SEQUENCE public.departments_department_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.departments_department_id_seq OWNER TO adminuser;

--
-- Name: departments_department_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: adminuser
--

ALTER SEQUENCE public.departments_department_id_seq OWNED BY public.departments.department_id;


--
-- Name: dependents; Type: TABLE; Schema: public; Owner: adminuser
--

CREATE TABLE public.dependents (
    dependent_id integer NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    relationship character varying(25) NOT NULL,
    employee_id integer NOT NULL
);


ALTER TABLE public.dependents OWNER TO adminuser;

--
-- Name: dependents_dependent_id_seq; Type: SEQUENCE; Schema: public; Owner: adminuser
--

CREATE SEQUENCE public.dependents_dependent_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dependents_dependent_id_seq OWNER TO adminuser;

--
-- Name: dependents_dependent_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: adminuser
--

ALTER SEQUENCE public.dependents_dependent_id_seq OWNED BY public.dependents.dependent_id;


--
-- Name: employees; Type: TABLE; Schema: public; Owner: adminuser
--

CREATE TABLE public.employees (
    employee_id integer NOT NULL,
    first_name character varying(20),
    last_name character varying(25) NOT NULL,
    email character varying(100) NOT NULL,
    phone_number character varying(20),
    hire_date date NOT NULL,
    job_id integer NOT NULL,
    salary numeric(8,2) NOT NULL,
    manager_id integer,
    department_id integer
);


ALTER TABLE public.employees OWNER TO adminuser;

--
-- Name: employees_employee_id_seq; Type: SEQUENCE; Schema: public; Owner: adminuser
--

CREATE SEQUENCE public.employees_employee_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.employees_employee_id_seq OWNER TO adminuser;

--
-- Name: employees_employee_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: adminuser
--

ALTER SEQUENCE public.employees_employee_id_seq OWNED BY public.employees.employee_id;


--
-- Name: jobs; Type: TABLE; Schema: public; Owner: adminuser
--

CREATE TABLE public.jobs (
    job_id integer NOT NULL,
    job_title character varying(35) NOT NULL,
    min_salary numeric(8,2),
    max_salary numeric(8,2)
);


ALTER TABLE public.jobs OWNER TO adminuser;

--
-- Name: jobs_job_id_seq; Type: SEQUENCE; Schema: public; Owner: adminuser
--

CREATE SEQUENCE public.jobs_job_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.jobs_job_id_seq OWNER TO adminuser;

--
-- Name: jobs_job_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: adminuser
--

ALTER SEQUENCE public.jobs_job_id_seq OWNED BY public.jobs.job_id;


--
-- Name: locations; Type: TABLE; Schema: public; Owner: adminuser
--

CREATE TABLE public.locations (
    location_id integer NOT NULL,
    street_address character varying(40),
    postal_code character varying(12),
    city character varying(30) NOT NULL,
    state_province character varying(25),
    country_id character(2) NOT NULL
);


ALTER TABLE public.locations OWNER TO adminuser;

--
-- Name: locations_location_id_seq; Type: SEQUENCE; Schema: public; Owner: adminuser
--

CREATE SEQUENCE public.locations_location_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.locations_location_id_seq OWNER TO adminuser;

--
-- Name: locations_location_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: adminuser
--

ALTER SEQUENCE public.locations_location_id_seq OWNED BY public.locations.location_id;


--
-- Name: regions; Type: TABLE; Schema: public; Owner: adminuser
--

CREATE TABLE public.regions (
    region_id integer NOT NULL,
    region_name character varying(25)
);


ALTER TABLE public.regions OWNER TO adminuser;

--
-- Name: regions_region_id_seq; Type: SEQUENCE; Schema: public; Owner: adminuser
--

CREATE SEQUENCE public.regions_region_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.regions_region_id_seq OWNER TO adminuser;

--
-- Name: regions_region_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: adminuser
--

ALTER SEQUENCE public.regions_region_id_seq OWNED BY public.regions.region_id;


--
-- Name: departments department_id; Type: DEFAULT; Schema: public; Owner: adminuser
--

ALTER TABLE ONLY public.departments ALTER COLUMN department_id SET DEFAULT nextval('public.departments_department_id_seq'::regclass);


--
-- Name: dependents dependent_id; Type: DEFAULT; Schema: public; Owner: adminuser
--

ALTER TABLE ONLY public.dependents ALTER COLUMN dependent_id SET DEFAULT nextval('public.dependents_dependent_id_seq'::regclass);


--
-- Name: employees employee_id; Type: DEFAULT; Schema: public; Owner: adminuser
--

ALTER TABLE ONLY public.employees ALTER COLUMN employee_id SET DEFAULT nextval('public.employees_employee_id_seq'::regclass);


--
-- Name: jobs job_id; Type: DEFAULT; Schema: public; Owner: adminuser
--

ALTER TABLE ONLY public.jobs ALTER COLUMN job_id SET DEFAULT nextval('public.jobs_job_id_seq'::regclass);


--
-- Name: locations location_id; Type: DEFAULT; Schema: public; Owner: adminuser
--

ALTER TABLE ONLY public.locations ALTER COLUMN location_id SET DEFAULT nextval('public.locations_location_id_seq'::regclass);


--
-- Name: regions region_id; Type: DEFAULT; Schema: public; Owner: adminuser
--

ALTER TABLE ONLY public.regions ALTER COLUMN region_id SET DEFAULT nextval('public.regions_region_id_seq'::regclass);


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: adminuser
--

COPY public.countries (country_id, country_name, region_id) FROM stdin;
AR	Argentina	2
AU	Australia	3
BE	Belgium	1
BR	Brazil	2
CA	Canada	2
CH	Switzerland	1
CN	China	3
DE	Germany	1
DK	Denmark	1
EG	Egypt	4
FR	France	1
HK	HongKong	3
IL	Israel	4
IN	India	3
IT	Italy	1
JP	Japan	3
KW	Kuwait	4
MX	Mexico	2
NG	Nigeria	4
NL	Netherlands	1
SG	Singapore	3
UK	United Kingdom	1
US	United States of America	2
ZM	Zambia	4
ZW	Zimbabwe	4
\.


--
-- Data for Name: departments; Type: TABLE DATA; Schema: public; Owner: adminuser
--

COPY public.departments (department_id, department_name, location_id) FROM stdin;
1	Administration	1700
2	Marketing	1800
3	Purchasing	1700
4	Human Resources	2400
5	Shipping	1500
6	IT	1400
7	Public Relations	2700
8	Sales	2500
9	Executive	1700
10	Finance	1700
11	Accounting	1700
\.


--
-- Data for Name: dependents; Type: TABLE DATA; Schema: public; Owner: adminuser
--

COPY public.dependents (dependent_id, first_name, last_name, relationship, employee_id) FROM stdin;
1	Penelope	Gietz	Child	206
2	Nick	Higgins	Child	205
3	Ed	Whalen	Child	200
4	Jennifer	King	Child	100
5	Johnny	Kochhar	Child	101
6	Bette	De Haan	Child	102
7	Grace	Faviet	Child	109
8	Matthew	Chen	Child	110
9	Joe	Sciarra	Child	111
10	Christian	Urman	Child	112
11	Zero	Popp	Child	113
12	Karl	Greenberg	Child	108
13	Uma	Mavris	Child	203
14	Vivien	Hunold	Child	103
15	Cuba	Ernst	Child	104
16	Fred	Austin	Child	105
17	Helen	Pataballa	Child	106
18	Dan	Lorentz	Child	107
19	Bob	Hartstein	Child	201
20	Lucille	Fay	Child	202
21	Kirsten	Baer	Child	204
22	Elvis	Khoo	Child	115
23	Sandra	Baida	Child	116
24	Cameron	Tobias	Child	117
25	Kevin	Himuro	Child	118
26	Rip	Colmenares	Child	119
27	Julia	Raphaely	Child	114
28	Woody	Russell	Child	145
29	Alec	Partners	Child	146
30	Sandra	Taylor	Child	176
\.


--
-- Data for Name: employees; Type: TABLE DATA; Schema: public; Owner: adminuser
--

COPY public.employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, manager_id, department_id) FROM stdin;
100	Steven	King	steven.king@sqltutorial.org	515.123.4567	1987-06-17	4	24000.00	\N	9
101	Neena	Kochhar	neena.kochhar@sqltutorial.org	515.123.4568	1989-09-21	5	17000.00	100	9
102	Lex	De Haan	lex.de haan@sqltutorial.org	515.123.4569	1993-01-13	5	17000.00	100	9
103	Alexander	Hunold	alexander.hunold@sqltutorial.org	590.423.4567	1990-01-03	9	9000.00	102	6
104	Bruce	Ernst	bruce.ernst@sqltutorial.org	590.423.4568	1991-05-21	9	6000.00	103	6
105	David	Austin	david.austin@sqltutorial.org	590.423.4569	1997-06-25	9	4800.00	103	6
106	Valli	Pataballa	valli.pataballa@sqltutorial.org	590.423.4560	1998-02-05	9	4800.00	103	6
107	Diana	Lorentz	diana.lorentz@sqltutorial.org	590.423.5567	1999-02-07	9	4200.00	103	6
108	Nancy	Greenberg	nancy.greenberg@sqltutorial.org	515.124.4569	1994-08-17	7	12000.00	101	10
109	Daniel	Faviet	daniel.faviet@sqltutorial.org	515.124.4169	1994-08-16	6	9000.00	108	10
110	John	Chen	john.chen@sqltutorial.org	515.124.4269	1997-09-28	6	8200.00	108	10
111	Ismael	Sciarra	ismael.sciarra@sqltutorial.org	515.124.4369	1997-09-30	6	7700.00	108	10
112	Jose Manuel	Urman	jose manuel.urman@sqltutorial.org	515.124.4469	1998-03-07	6	7800.00	108	10
113	Luis	Popp	luis.popp@sqltutorial.org	515.124.4567	1999-12-07	6	6900.00	108	10
114	Den	Raphaely	den.raphaely@sqltutorial.org	515.127.4561	1994-12-07	14	11000.00	100	3
115	Alexander	Khoo	alexander.khoo@sqltutorial.org	515.127.4562	1995-05-18	13	3100.00	114	3
116	Shelli	Baida	shelli.baida@sqltutorial.org	515.127.4563	1997-12-24	13	2900.00	114	3
117	Sigal	Tobias	sigal.tobias@sqltutorial.org	515.127.4564	1997-07-24	13	2800.00	114	3
118	Guy	Himuro	guy.himuro@sqltutorial.org	515.127.4565	1998-11-15	13	2600.00	114	3
119	Karen	Colmenares	karen.colmenares@sqltutorial.org	515.127.4566	1999-08-10	13	2500.00	114	3
120	Matthew	Weiss	matthew.weiss@sqltutorial.org	650.123.1234	1996-07-18	19	8000.00	100	5
121	Adam	Fripp	adam.fripp@sqltutorial.org	650.123.2234	1997-04-10	19	8200.00	100	5
122	Payam	Kaufling	payam.kaufling@sqltutorial.org	650.123.3234	1995-05-01	19	7900.00	100	5
123	Shanta	Vollman	shanta.vollman@sqltutorial.org	650.123.4234	1997-10-10	19	6500.00	100	5
126	Irene	Mikkilineni	irene.mikkilineni@sqltutorial.org	650.124.1224	1998-09-28	18	2700.00	120	5
145	John	Russell	john.russell@sqltutorial.org	\N	1996-10-01	15	14000.00	100	8
146	Karen	Partners	karen.partners@sqltutorial.org	\N	1997-01-05	15	13500.00	100	8
176	Jonathon	Taylor	jonathon.taylor@sqltutorial.org	\N	1998-03-24	16	8600.00	100	8
177	Jack	Livingston	jack.livingston@sqltutorial.org	\N	1998-04-23	16	8400.00	100	8
178	Kimberely	Grant	kimberely.grant@sqltutorial.org	\N	1999-05-24	16	7000.00	100	8
179	Charles	Johnson	charles.johnson@sqltutorial.org	\N	2000-01-04	16	6200.00	100	8
192	Sarah	Bell	sarah.bell@sqltutorial.org	650.501.1876	1996-02-04	17	4000.00	123	5
193	Britney	Everett	britney.everett@sqltutorial.org	650.501.2876	1997-03-03	17	3900.00	123	5
200	Jennifer	Whalen	jennifer.whalen@sqltutorial.org	515.123.4444	1987-09-17	3	4400.00	101	1
201	Michael	Hartstein	michael.hartstein@sqltutorial.org	515.123.5555	1996-02-17	10	13000.00	100	2
202	Pat	Fay	pat.fay@sqltutorial.org	603.123.6666	1997-08-17	11	6000.00	201	2
203	Susan	Mavris	susan.mavris@sqltutorial.org	515.123.7777	1994-06-07	8	6500.00	101	4
204	Hermann	Baer	hermann.baer@sqltutorial.org	515.123.8888	1994-06-07	12	10000.00	101	7
205	Shelley	Higgins	shelley.higgins@sqltutorial.org	515.123.8080	1994-06-07	2	12000.00	101	11
206	William	Gietz	william.gietz@sqltutorial.org	515.123.8181	1994-06-07	1	8300.00	205	11
\.


--
-- Data for Name: jobs; Type: TABLE DATA; Schema: public; Owner: adminuser
--

COPY public.jobs (job_id, job_title, min_salary, max_salary) FROM stdin;
1	Public Accountant	4200.00	9000.00
2	Accounting Manager	8200.00	16000.00
3	Administration Assistant	3000.00	6000.00
4	President	20000.00	40000.00
5	Administration Vice President	15000.00	30000.00
6	Accountant	4200.00	9000.00
7	Finance Manager	8200.00	16000.00
8	Human Resources Representative	4000.00	9000.00
9	Programmer	4000.00	10000.00
10	Marketing Manager	9000.00	15000.00
11	Marketing Representative	4000.00	9000.00
12	Public Relations Representative	4500.00	10500.00
13	Purchasing Clerk	2500.00	5500.00
14	Purchasing Manager	8000.00	15000.00
15	Sales Manager	10000.00	20000.00
16	Sales Representative	6000.00	12000.00
17	Shipping Clerk	2500.00	5500.00
18	Stock Clerk	2000.00	5000.00
19	Stock Manager	5500.00	8500.00
\.


--
-- Data for Name: locations; Type: TABLE DATA; Schema: public; Owner: adminuser
--

COPY public.locations (location_id, street_address, postal_code, city, state_province, country_id) FROM stdin;
1400	2014 Jabberwocky Rd	26192	Southlake	Texas	US
1500	2011 Interiors Blvd	99236	South San Francisco	California	US
1700	2004 Charade Rd	98199	Seattle	Washington	US
1800	147 Spadina Ave	M5V 2L7	Toronto	Ontario	CA
2400	8204 Arthur St	\N	London	\N	UK
2500	Magdalen Centre, The Oxford Science Park	OX9 9ZB	Oxford	Oxford	UK
2700	Schwanthalerstr. 7031	80925	Munich	Bavaria	DE
\.


--
-- Data for Name: regions; Type: TABLE DATA; Schema: public; Owner: adminuser
--

COPY public.regions (region_id, region_name) FROM stdin;
1	Europe
2	Americas
3	Asia
4	Middle East and Africa
\.


--
-- Name: departments_department_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adminuser
--

SELECT pg_catalog.setval('public.departments_department_id_seq', 1, false);


--
-- Name: dependents_dependent_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adminuser
--

SELECT pg_catalog.setval('public.dependents_dependent_id_seq', 1, false);


--
-- Name: employees_employee_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adminuser
--

SELECT pg_catalog.setval('public.employees_employee_id_seq', 1, false);


--
-- Name: jobs_job_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adminuser
--

SELECT pg_catalog.setval('public.jobs_job_id_seq', 1, false);


--
-- Name: locations_location_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adminuser
--

SELECT pg_catalog.setval('public.locations_location_id_seq', 1, false);


--
-- Name: regions_region_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adminuser
--

SELECT pg_catalog.setval('public.regions_region_id_seq', 1, false);


--
-- Name: countries countries_pkey; Type: CONSTRAINT; Schema: public; Owner: adminuser
--

ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (country_id);


--
-- Name: departments departments_pkey; Type: CONSTRAINT; Schema: public; Owner: adminuser
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT departments_pkey PRIMARY KEY (department_id);


--
-- Name: dependents dependents_pkey; Type: CONSTRAINT; Schema: public; Owner: adminuser
--

ALTER TABLE ONLY public.dependents
    ADD CONSTRAINT dependents_pkey PRIMARY KEY (dependent_id);


--
-- Name: employees employees_pkey; Type: CONSTRAINT; Schema: public; Owner: adminuser
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (employee_id);


--
-- Name: jobs jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: adminuser
--

ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (job_id);


--
-- Name: locations locations_pkey; Type: CONSTRAINT; Schema: public; Owner: adminuser
--

ALTER TABLE ONLY public.locations
    ADD CONSTRAINT locations_pkey PRIMARY KEY (location_id);


--
-- Name: regions regions_pkey; Type: CONSTRAINT; Schema: public; Owner: adminuser
--

ALTER TABLE ONLY public.regions
    ADD CONSTRAINT regions_pkey PRIMARY KEY (region_id);


--
-- Name: countries countries_region_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: adminuser
--

ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_region_id_fkey FOREIGN KEY (region_id) REFERENCES public.regions(region_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: departments departments_location_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: adminuser
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT departments_location_id_fkey FOREIGN KEY (location_id) REFERENCES public.locations(location_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: dependents dependents_employee_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: adminuser
--

ALTER TABLE ONLY public.dependents
    ADD CONSTRAINT dependents_employee_id_fkey FOREIGN KEY (employee_id) REFERENCES public.employees(employee_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: employees employees_department_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: adminuser
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_department_id_fkey FOREIGN KEY (department_id) REFERENCES public.departments(department_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: employees employees_job_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: adminuser
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_job_id_fkey FOREIGN KEY (job_id) REFERENCES public.jobs(job_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: employees employees_manager_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: adminuser
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_manager_id_fkey FOREIGN KEY (manager_id) REFERENCES public.employees(employee_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: locations locations_country_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: adminuser
--

ALTER TABLE ONLY public.locations
    ADD CONSTRAINT locations_country_id_fkey FOREIGN KEY (country_id) REFERENCES public.countries(country_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--


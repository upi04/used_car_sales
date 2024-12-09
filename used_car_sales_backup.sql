--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 16.3

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

SET default_table_access_method = heap;

--
-- Name: ads; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ads (
    ad_id integer NOT NULL,
    product_id integer NOT NULL,
    ad_status character varying(20) DEFAULT 'active'::character varying,
    published_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.ads OWNER TO postgres;

--
-- Name: ads_ad_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ads_ad_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ads_ad_id_seq OWNER TO postgres;

--
-- Name: ads_ad_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ads_ad_id_seq OWNED BY public.ads.ad_id;


--
-- Name: bids; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bids (
    bid_id integer NOT NULL,
    product_id integer NOT NULL,
    user_id integer NOT NULL,
    bid_price numeric(12,2) NOT NULL,
    date_bid timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.bids OWNER TO postgres;

--
-- Name: bids_bid_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bids_bid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.bids_bid_id_seq OWNER TO postgres;

--
-- Name: bids_bid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bids_bid_id_seq OWNED BY public.bids.bid_id;


--
-- Name: locations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.locations (
    location_id integer NOT NULL,
    city character varying(50) NOT NULL,
    state character varying(50),
    country character varying(50) NOT NULL
);


ALTER TABLE public.locations OWNER TO postgres;

--
-- Name: locations_location_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.locations_location_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.locations_location_id_seq OWNER TO postgres;

--
-- Name: locations_location_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.locations_location_id_seq OWNED BY public.locations.location_id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    product_id integer NOT NULL,
    user_id integer NOT NULL,
    brand character varying(50) NOT NULL,
    model character varying(50) NOT NULL,
    price numeric(12,2) NOT NULL,
    location_id integer NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    year integer NOT NULL
);


ALTER TABLE public.products OWNER TO postgres;

--
-- Name: products_product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.products_product_id_seq OWNER TO postgres;

--
-- Name: products_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_product_id_seq OWNED BY public.products.product_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(50) NOT NULL,
    email character varying(100) NOT NULL,
    password character varying(255) NOT NULL,
    phone_number character varying(15),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_user_id_seq OWNER TO postgres;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: ads ad_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ads ALTER COLUMN ad_id SET DEFAULT nextval('public.ads_ad_id_seq'::regclass);


--
-- Name: bids bid_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bids ALTER COLUMN bid_id SET DEFAULT nextval('public.bids_bid_id_seq'::regclass);


--
-- Name: locations location_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.locations ALTER COLUMN location_id SET DEFAULT nextval('public.locations_location_id_seq'::regclass);


--
-- Name: products product_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN product_id SET DEFAULT nextval('public.products_product_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: ads; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ads (ad_id, product_id, ad_status, published_at) FROM stdin;
1	151	active	2023-01-01 10:00:00
2	152	active	2023-02-01 12:00:00
3	153	active	2023-03-01 14:00:00
4	154	active	2023-04-01 16:00:00
5	155	active	2023-05-01 18:00:00
6	156	active	2023-06-01 20:00:00
7	157	active	2023-07-01 22:00:00
8	158	active	2023-08-01 10:00:00
9	159	active	2023-09-01 12:00:00
10	160	active	2023-10-01 14:00:00
11	161	active	2023-11-01 16:00:00
12	162	active	2023-12-01 18:00:00
13	163	active	2024-01-01 20:00:00
14	164	active	2024-02-01 22:00:00
15	165	active	2024-03-01 10:00:00
16	166	active	2024-04-01 12:00:00
17	167	active	2024-05-01 14:00:00
18	168	active	2024-06-01 16:00:00
19	169	active	2024-07-01 18:00:00
20	170	active	2024-08-01 20:00:00
21	171	active	2024-09-01 22:00:00
22	172	active	2024-10-01 10:00:00
23	173	active	2024-11-01 12:00:00
24	174	active	2024-12-01 14:00:00
25	175	active	2025-01-01 16:00:00
26	176	active	2025-02-01 18:00:00
27	177	active	2025-03-01 20:00:00
28	178	active	2025-04-01 22:00:00
29	179	active	2025-05-01 10:00:00
30	180	active	2025-06-01 12:00:00
31	181	active	2025-07-01 14:00:00
32	182	active	2025-08-01 16:00:00
33	183	active	2025-09-01 18:00:00
34	184	active	2025-10-01 20:00:00
35	185	active	2025-11-01 22:00:00
36	186	active	2025-12-01 10:00:00
37	187	active	2026-01-01 12:00:00
38	188	active	2026-02-01 14:00:00
39	189	active	2026-03-01 16:00:00
40	190	active	2026-04-01 18:00:00
41	191	active	2026-05-01 20:00:00
42	192	active	2026-06-01 22:00:00
43	193	active	2026-07-01 10:00:00
44	194	active	2026-08-01 12:00:00
45	195	active	2026-09-01 14:00:00
46	196	active	2026-10-01 16:00:00
47	197	active	2026-11-01 18:00:00
48	198	active	2026-12-01 20:00:00
49	199	active	2027-01-01 22:00:00
50	200	active	2027-02-01 10:00:00
\.


--
-- Data for Name: bids; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bids (bid_id, product_id, user_id, bid_price, date_bid) FROM stdin;
1	151	1	210000000.00	2023-01-02 11:00:00
2	152	2	220000000.00	2023-02-02 13:00:00
3	153	3	230000000.00	2023-03-02 15:00:00
4	154	4	240000000.00	2023-04-02 17:00:00
5	155	5	250000000.00	2023-05-02 19:00:00
6	156	6	260000000.00	2023-06-02 21:00:00
7	157	7	270000000.00	2023-07-02 23:00:00
8	158	8	280000000.00	2023-08-02 10:00:00
9	159	9	290000000.00	2023-09-02 12:00:00
10	160	10	300000000.00	2023-10-02 14:00:00
11	161	11	310000000.00	2023-11-02 16:00:00
12	162	12	320000000.00	2023-12-02 18:00:00
13	163	13	330000000.00	2024-01-02 20:00:00
14	164	14	340000000.00	2024-02-02 22:00:00
15	165	15	350000000.00	2024-03-02 10:00:00
16	166	16	360000000.00	2024-04-02 12:00:00
17	167	17	370000000.00	2024-05-02 14:00:00
18	168	18	380000000.00	2024-06-02 16:00:00
19	169	19	390000000.00	2024-07-02 18:00:00
20	170	20	400000000.00	2024-08-02 20:00:00
21	171	21	410000000.00	2024-09-02 22:00:00
22	172	22	420000000.00	2024-10-02 10:00:00
23	173	23	430000000.00	2024-11-02 12:00:00
24	174	24	440000000.00	2024-12-02 14:00:00
25	175	25	450000000.00	2025-01-02 16:00:00
26	176	26	460000000.00	2025-02-02 18:00:00
27	177	27	470000000.00	2025-03-02 20:00:00
28	178	28	480000000.00	2025-04-02 22:00:00
29	179	29	490000000.00	2025-05-02 10:00:00
30	180	30	500000000.00	2025-06-02 12:00:00
31	181	31	510000000.00	2025-07-02 14:00:00
32	182	32	520000000.00	2025-08-02 16:00:00
33	183	33	530000000.00	2025-09-02 18:00:00
34	184	34	540000000.00	2025-10-02 20:00:00
35	185	35	550000000.00	2025-11-02 22:00:00
36	186	36	560000000.00	2025-12-02 10:00:00
37	187	37	570000000.00	2026-01-02 12:00:00
38	188	38	580000000.00	2026-02-02 14:00:00
39	189	39	590000000.00	2026-03-02 16:00:00
40	190	40	600000000.00	2026-04-02 18:00:00
41	191	41	610000000.00	2026-05-02 20:00:00
42	192	42	620000000.00	2026-06-02 22:00:00
43	193	43	630000000.00	2026-07-02 10:00:00
44	194	44	640000000.00	2026-08-02 12:00:00
45	195	45	650000000.00	2026-09-02 14:00:00
46	196	46	660000000.00	2026-10-02 16:00:00
47	197	47	670000000.00	2026-11-02 18:00:00
48	198	48	680000000.00	2026-12-02 20:00:00
49	199	49	690000000.00	2027-01-02 22:00:00
50	200	50	700000000.00	2027-02-02 10:00:00
51	12	40	151500000.00	2024-12-07 00:00:00
52	151	40	151500000.00	2024-12-07 00:00:00
53	60	60	167000000.00	2024-06-07 00:00:00
54	61	61	170000000.00	2024-05-07 00:00:00
55	62	62	175000000.00	2024-04-07 00:00:00
56	63	63	180000000.00	2024-03-07 00:00:00
57	64	64	185000000.00	2024-02-07 00:00:00
\.


--
-- Data for Name: locations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.locations (location_id, city, state, country) FROM stdin;
1	Jakarta	DKI Jakarta	Indonesia
2	Surabaya	Jawa Timur	Indonesia
3	Bandung	Jawa Barat	Indonesia
4	Medan	Sumatera Utara	Indonesia
5	Yogyakarta	DIY	Indonesia
6	Semarang	Jawa Tengah	Indonesia
7	Palembang	Sumatera Selatan	Indonesia
8	Makassar	Sulawesi Selatan	Indonesia
9	Denpasar	Bali	Indonesia
10	Malang	Jawa Timur	Indonesia
11	Batam	Kepulauan Riau	Indonesia
12	Banjarmasin	Kalimantan Selatan	Indonesia
13	Cirebon	Jawa Barat	Indonesia
14	Pekanbaru	Riau	Indonesia
15	Ambon	Maluku	Indonesia
16	Tangerang	Banten	Indonesia
17	Bekasi	Jawa Barat	Indonesia
18	Depok	Jawa Barat	Indonesia
19	Samarinda	Kalimantan Timur	Indonesia
20	Makasar	Sulawesi Selatan	Indonesia
21	Solo	Jawa Tengah	Indonesia
22	Surakarta	Jawa Tengah	Indonesia
23	Cilegon	Banten	Indonesia
24	Serang	Banten	Indonesia
25	Lombok	NTB	Indonesia
26	Pontianak	Kalimantan Barat	Indonesia
27	Balikpapan	Kalimantan Timur	Indonesia
28	Jayapura	Papua	Indonesia
29	Manado	Sulawesi Utara	Indonesia
30	Ambon	Maluku	Indonesia
31	Kupang	Nusa Tenggara Timur	Indonesia
32	Mataram	Nusa Tenggara Barat	Indonesia
33	Padang	Sumatera Barat	Indonesia
34	Palangkaraya	Kalimantan Tengah	Indonesia
35	Cimahi	Jawa Barat	Indonesia
36	Sleman	DIY	Indonesia
37	Indramayu	Jawa Barat	Indonesia
38	Karawang	Jawa Barat	Indonesia
39	Ponorogo	Jawa Timur	Indonesia
40	Kudus	Jawa Tengah	Indonesia
41	Jember	Jawa Timur	Indonesia
42	Tegal	Jawa Tengah	Indonesia
43	Rembang	Jawa Tengah	Indonesia
44	Pati	Jawa Tengah	Indonesia
45	Banda Aceh	Aceh	Indonesia
46	Lhokseumawe	Aceh	Indonesia
47	Sidoarjo	Jawa Timur	Indonesia
48	Sukabumi	Jawa Barat	Indonesia
49	Probolinggo	Jawa Timur	Indonesia
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (product_id, user_id, brand, model, price, location_id, created_at, year) FROM stdin;
1	1	Toyota	Avanza	200000000.00	1	2023-01-01 10:00:00	2018
2	2	Honda	CRV	250000000.00	2	2023-02-01 12:00:00	2017
3	3	Suzuki	Ertiga	180000000.00	3	2023-03-01 14:00:00	2020
4	4	Daihatsu	Xenia	150000000.00	4	2023-04-01 16:00:00	2016
5	5	Mitsubishi	Xpander	300000000.00	5	2023-05-01 11:00:00	2021
6	6	Honda	Civic	350000000.00	6	2023-06-01 10:00:00	2019
7	7	Toyota	Fortuner	600000000.00	7	2023-07-01 12:00:00	2020
8	8	Nissan	Navara	500000000.00	8	2023-08-01 13:00:00	2021
9	9	Mazda	CX-5	550000000.00	9	2023-09-01 14:00:00	2020
10	10	Ford	Ranger	450000000.00	10	2023-10-01 15:00:00	2019
11	11	Chevrolet	Trax	400000000.00	11	2023-11-01 16:00:00	2020
12	12	Hyundai	Tucson	375000000.00	12	2023-12-01 10:00:00	2018
13	13	BMW	X5	1200000000.00	13	2023-01-01 11:00:00	2021
14	14	Audi	Q5	1000000000.00	14	2023-02-01 12:00:00	2020
15	15	Mercedes-Benz	GLC	1100000000.00	15	2023-03-01 13:00:00	2021
16	16	Toyota	Innova	350000000.00	1	2023-04-01 14:00:00	2020
17	17	Honda	HR-V	400000000.00	2	2023-05-01 15:00:00	2019
18	18	Kia	Seltos	450000000.00	3	2023-06-01 16:00:00	2020
19	19	Ford	Ecosport	380000000.00	4	2023-07-01 10:00:00	2021
20	20	Mazda	3	450000000.00	5	2023-08-01 11:00:00	2020
21	21	Hyundai	Elantra	400000000.00	6	2023-09-01 12:00:00	2019
22	22	Nissan	Juke	350000000.00	7	2023-10-01 13:00:00	2021
23	23	Mitsubishi	Pajero Sport	650000000.00	8	2023-11-01 14:00:00	2020
24	24	Isuzu	D-Max	550000000.00	9	2023-12-01 15:00:00	2020
25	25	Toyota	Hilux	600000000.00	10	2023-01-01 11:00:00	2019
26	26	Honda	Accord	800000000.00	11	2023-02-01 12:00:00	2020
27	27	Volkswagen	Tiguan	750000000.00	12	2023-03-01 13:00:00	2021
28	28	Peugeot	3008	700000000.00	13	2023-04-01 14:00:00	2020
29	29	Mazda	CX-3	600000000.00	14	2023-05-01 15:00:00	2021
30	30	Honda	Odyssey	700000000.00	15	2023-06-01 16:00:00	2019
31	31	Nissan	X-Trail	650000000.00	1	2023-07-01 10:00:00	2020
32	32	Kia	Sportage	600000000.00	2	2023-08-01 11:00:00	2019
33	33	Toyota	Corolla	550000000.00	3	2023-09-01 12:00:00	2020
34	34	Chevrolet	Silverado	1000000000.00	4	2023-10-01 13:00:00	2021
35	35	Ford	Mustang	1200000000.00	5	2023-11-01 14:00:00	2020
36	36	Daihatsu	Terios	350000000.00	6	2023-12-01 15:00:00	2021
37	37	Suzuki	Swift	200000000.00	7	2023-01-01 10:00:00	2019
38	38	Toyota	Land Cruiser	1500000000.00	8	2023-02-01 11:00:00	2020
39	39	Mazda	MX-5	1200000000.00	9	2023-03-01 12:00:00	2020
40	40	BMW	3 Series	1000000000.00	10	2023-04-01 13:00:00	2021
41	41	Audi	A4	950000000.00	11	2023-05-01 14:00:00	2020
42	42	Hyundai	Santa Fe	850000000.00	12	2023-06-01 15:00:00	2021
43	43	Toyota	Prius	500000000.00	13	2023-07-01 16:00:00	2020
44	44	Kia	Rio	250000000.00	14	2023-08-01 10:00:00	2020
45	45	Suzuki	Baleno	230000000.00	15	2023-09-01 11:00:00	2021
46	46	Honda	Jazz	300000000.00	1	2023-10-01 12:00:00	2020
47	47	Nissan	Leaf	600000000.00	2	2023-11-01 13:00:00	2020
48	48	Mitsubishi	Lancer	500000000.00	3	2023-12-01 14:00:00	2020
49	49	Ford	F-150	1100000000.00	4	2023-01-01 11:00:00	2021
50	50	Honda	CR-V	650000000.00	5	2023-02-01 12:00:00	2022
51	2	Toyota	Camry	500000000.00	2	2024-12-01 12:00:00	2022
52	2	Honda	City	400000000.00	2	2024-11-25 14:00:00	2021
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (user_id, username, email, password, phone_number, created_at) FROM stdin;
1	john_doe	john.doe@example.com	password123	081234567890	2023-01-01 10:00:00
2	jane_smith	jane.smith@example.com	password456	081234567891	2023-02-01 12:00:00
3	jackson_brown	jackson.brown@example.com	password789	081234567892	2023-03-01 14:00:00
4	michael_jones	michael.jones@example.com	password101	081234567893	2023-04-01 16:00:00
5	emily_davis	emily.davis@example.com	password202	081234567894	2023-05-01 18:00:00
6	chris_wilson	chris.wilson@example.com	password303	081234567895	2023-06-01 20:00:00
7	lily_martin	lily.martin@example.com	password404	081234567896	2023-07-01 22:00:00
8	benjamin_lee	benjamin.lee@example.com	password505	081234567897	2023-08-01 10:00:00
9	olivia_harris	olivia.harris@example.com	password606	081234567898	2023-09-01 12:00:00
10	noah_garcia	noah.garcia@example.com	password707	081234567899	2023-10-01 14:00:00
11	mia_rodriquez	mia.rodriquez@example.com	password808	081234567910	2023-11-01 16:00:00
12	jack_smith	jack.smith@example.com	password909	081234567911	2023-12-01 18:00:00
13	lucas_martinez	lucas.martinez@example.com	password1010	081234567912	2023-01-01 20:00:00
14	hannah_jackson	hannah.jackson@example.com	password1111	081234567913	2023-02-01 22:00:00
15	david_white	david.white@example.com	password1212	081234567914	2023-03-01 10:00:00
16	ella_thompson	ella.thompson@example.com	password1313	081234567915	2023-04-01 12:00:00
17	james_robinson	james.robinson@example.com	password1414	081234567916	2023-05-01 14:00:00
18	sophia_lopez	sophia.lopez@example.com	password1515	081234567917	2023-06-01 16:00:00
19	william_clark	william.clark@example.com	password1616	081234567918	2023-07-01 18:00:00
20	ava_walker	ava.walker@example.com	password1717	081234567919	2023-08-01 20:00:00
21	henry_hall	henry.hall@example.com	password1818	081234567920	2023-09-01 22:00:00
22	mia_allen	mia.allen@example.com	password1919	081234567921	2023-10-01 10:00:00
23	samuel_young	samuel.young@example.com	password2020	081234567922	2023-11-01 12:00:00
24	ella_hernandez	ella.hernandez@example.com	password2121	081234567923	2023-12-01 14:00:00
25	jacob_kim	jacob.kim@example.com	password2222	081234567924	2023-01-01 16:00:00
26	chloe_carter	chloe.carter@example.com	password2323	081234567925	2023-02-01 18:00:00
27	daniel_diaz	daniel.diaz@example.com	password2424	081234567926	2023-03-01 20:00:00
28	isabella_evans	isabella.evans@example.com	password2525	081234567927	2023-04-01 22:00:00
29	aiden_brown	aiden.brown@example.com	password2626	081234567928	2023-05-01 10:00:00
30	grace_moore	grace.moore@example.com	password2727	081234567929	2023-06-01 12:00:00
31	zachary_taylor	zachary.taylor@example.com	password2828	081234567930	2023-07-01 14:00:00
32	ella_jackson	ella.jackson@example.com	password2929	081234567931	2023-08-01 16:00:00
33	leo_martinez	leo.martinez@example.com	password3030	081234567932	2023-09-01 18:00:00
34	madeline_gonzalez	madeline.gonzalez@example.com	password3131	081234567933	2023-10-01 20:00:00
35	jackson_lee	jackson.lee@example.com	password3232	081234567934	2023-11-01 22:00:00
36	sofia_king	sofia.king@example.com	password3333	081234567935	2023-12-01 10:00:00
37	aiden_scott	aiden.scott@example.com	password3434	081234567936	2023-01-01 12:00:00
38	lily_garcia	lily.garcia@example.com	password3535	081234567937	2023-02-01 14:00:00
39	sophie_lee	sophie.lee@example.com	password3636	081234567938	2023-03-01 16:00:00
40	mason_wilson	mason.wilson@example.com	password3737	081234567939	2023-04-01 18:00:00
41	baco	baco.wilson@example.com	password3637	081238567939	2023-04-01 18:00:00
42	oliver_taylor	oliver.taylor@example.com	password3838	081234567940	2023-05-01 20:00:00
43	lucy_lee	lucy.lee@example.com	password3939	081234567941	2023-06-01 22:00:00
44	matthew_moore	matthew.moore@example.com	password4040	081234567942	2023-07-01 10:00:00
45	madison_clark	madison.clark@example.com	password4141	081234567943	2023-08-01 12:00:00
46	charlotte_hall	charlotte.hall@example.com	password4242	081234567944	2023-09-01 14:00:00
47	joshua_jones	joshua.jones@example.com	password4343	081234567945	2023-10-01 16:00:00
48	victoria_smith	victoria.smith@example.com	password4444	081234567946	2023-01-01 22:00:00
49	scarlett_jones	scarlett.jones@example.com	password5050	081234567952	2023-05-01 16:00:00
50	austin_lee	austin.lee@example.com	password5151	081234567953	2023-06-01 18:00:00
\.


--
-- Name: ads_ad_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ads_ad_id_seq', 50, true);


--
-- Name: bids_bid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bids_bid_id_seq', 57, true);


--
-- Name: locations_location_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.locations_location_id_seq', 49, true);


--
-- Name: products_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_product_id_seq', 1, false);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_user_id_seq', 1, false);


--
-- Name: ads ads_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ads
    ADD CONSTRAINT ads_pkey PRIMARY KEY (ad_id);


--
-- Name: ads ads_product_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ads
    ADD CONSTRAINT ads_product_id_key UNIQUE (product_id);


--
-- Name: bids bids_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bids
    ADD CONSTRAINT bids_pkey PRIMARY KEY (bid_id);


--
-- Name: locations locations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.locations
    ADD CONSTRAINT locations_pkey PRIMARY KEY (location_id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (product_id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: products products_location_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_location_id_fkey FOREIGN KEY (location_id) REFERENCES public.locations(location_id);


--
-- Name: products products_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--


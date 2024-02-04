--
-- PostgreSQL database dump
--

-- Dumped from database version 10.10
-- Dumped by pg_dump version 14.10 (Homebrew)

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

--
-- Name: enum_orderInvoices_orderStatus; Type: TYPE; Schema: public; Owner: chizoba
--

CREATE TYPE public."enum_orderInvoices_orderStatus" AS ENUM (
    'Processing',
    'Shipped',
    'Delivered',
    'Cancelled'
);


ALTER TYPE public."enum_orderInvoices_orderStatus" OWNER TO chizoba;

--
-- Name: enum_orderInvoices_paymentStatus; Type: TYPE; Schema: public; Owner: chizoba
--

CREATE TYPE public."enum_orderInvoices_paymentStatus" AS ENUM (
    'Awaiting Authorization',
    'Paid',
    'Payment Failed'
);


ALTER TYPE public."enum_orderInvoices_paymentStatus" OWNER TO chizoba;

SET default_tablespace = '';

--
-- Name: SequelizeMeta; Type: TABLE; Schema: public; Owner: chizoba
--

CREATE TABLE public."SequelizeMeta" (
    name character varying(255) NOT NULL
);


ALTER TABLE public."SequelizeMeta" OWNER TO chizoba;

--
-- Name: billingInfos; Type: TABLE; Schema: public; Owner: chizoba
--

CREATE TABLE public."billingInfos" (
    id integer NOT NULL,
    "firstName" character varying(255),
    "lastName" character varying(255),
    email character varying(255),
    phone character varying(255),
    address character varying(255),
    city character varying(255),
    state character varying(255),
    zip integer,
    country character varying(255),
    "orderNotes" text,
    "cardNumber" character varying(255),
    "nameOnCard" character varying(255),
    "expiryDate" timestamp with time zone,
    cvv integer,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."billingInfos" OWNER TO chizoba;

--
-- Name: billingInfos_id_seq; Type: SEQUENCE; Schema: public; Owner: chizoba
--

CREATE SEQUENCE public."billingInfos_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."billingInfos_id_seq" OWNER TO chizoba;

--
-- Name: billingInfos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: chizoba
--

ALTER SEQUENCE public."billingInfos_id_seq" OWNED BY public."billingInfos".id;


--
-- Name: orderInvoices; Type: TABLE; Schema: public; Owner: chizoba
--

CREATE TABLE public."orderInvoices" (
    id integer NOT NULL,
    "orderId" character varying(255),
    "billingName" character varying(255),
    "paymentStatus" public."enum_orderInvoices_paymentStatus" DEFAULT 'Awaiting Authorization'::public."enum_orderInvoices_paymentStatus",
    total character varying(255),
    "paymentMethod" character varying(255),
    "orderStatus" public."enum_orderInvoices_orderStatus" DEFAULT 'Processing'::public."enum_orderInvoices_orderStatus",
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."orderInvoices" OWNER TO chizoba;

--
-- Name: orderInvoices_id_seq; Type: SEQUENCE; Schema: public; Owner: chizoba
--

CREATE SEQUENCE public."orderInvoices_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."orderInvoices_id_seq" OWNER TO chizoba;

--
-- Name: orderInvoices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: chizoba
--

ALTER SEQUENCE public."orderInvoices_id_seq" OWNED BY public."orderInvoices".id;


--
-- Name: billingInfos id; Type: DEFAULT; Schema: public; Owner: chizoba
--

ALTER TABLE ONLY public."billingInfos" ALTER COLUMN id SET DEFAULT nextval('public."billingInfos_id_seq"'::regclass);


--
-- Name: orderInvoices id; Type: DEFAULT; Schema: public; Owner: chizoba
--

ALTER TABLE ONLY public."orderInvoices" ALTER COLUMN id SET DEFAULT nextval('public."orderInvoices_id_seq"'::regclass);


--
-- Data for Name: SequelizeMeta; Type: TABLE DATA; Schema: public; Owner: chizoba
--

COPY public."SequelizeMeta" (name) FROM stdin;
20240201181242-create-billing-info.js
20240201182045-create-order-invoice.js
\.


--
-- Data for Name: billingInfos; Type: TABLE DATA; Schema: public; Owner: chizoba
--

COPY public."billingInfos" (id, "firstName", "lastName", email, phone, address, city, state, zip, country, "orderNotes", "cardNumber", "nameOnCard", "expiryDate", cvv, "createdAt", "updatedAt") FROM stdin;
1	Kennet	Boyd	ken@gmail.com	09037444474	N0 4, Benson Street	Ikeja	Lagos	103984	Nigeria	\N	10374472449588240047	Kennet Boyd	2025-06-10 01:00:00+01	123	2024-02-02 00:37:41.792+01	2024-02-02 00:37:41.792+01
2	Kennet	Boyd	ken@gmail.com	09037444474	N0 4, Benson Street	Ikeja	Lagos	103984	Nigeria	\N	10374472449588240047	Kennet Boyd	2025-06-10 01:00:00+01	123	2024-02-02 00:38:06.605+01	2024-02-02 00:38:06.605+01
3	Kennet	Boyd	ken@gmail.com	09037444474	N0 4, Benson Street	Ikeja	Lagos	103984	Nigeria	\N	10374472449588240047	Kennet Boyd	2025-06-10 01:00:00+01	123	2024-02-02 00:39:09.43+01	2024-02-02 00:39:09.43+01
4	Kennet	Boyd	ken@gmail.com	09037444474	N0 4, Benson Street	Ikeja	Lagos	103984	Nigeria	\N	10374472449588240047	Kennet Boyd	2025-06-10 01:00:00+01	123	2024-02-02 00:40:45.775+01	2024-02-02 00:40:45.775+01
5	Kennet	Boyd	ken@gmail.com	09037444474	N0 4, Benson Street	Ikeja	Lagos	103984	Nigeria	\N	10374472449588240047	Kennet Boyd	2025-06-10 01:00:00+01	123	2024-02-02 00:42:52.488+01	2024-02-02 00:42:52.488+01
6	Kennet	Boyd	ken@gmail.com	09037444474	N0 4, Benson Street	Ikeja	Lagos	103984	Nigeria	\N	10374472449588240047	Kennet Boyd	2025-06-10 01:00:00+01	123	2024-02-02 00:43:38.452+01	2024-02-02 00:43:38.452+01
7	Kennet	Boyd	ken@gmail.com	09037444474	N0 4, Benson Street	Ikeja	Lagos	103984	Nigeria	\N	10374472449588240047	Kennet Boyd	2025-06-10 01:00:00+01	123	2024-02-02 00:44:58.191+01	2024-02-02 00:44:58.191+01
8	Kennet	Boyd	ken@gmail.com	09037444474	N0 4, Benson Street	Ikeja	Lagos	103984	Nigeria	\N	10374472449588240047	Kennet Boyd	2025-06-10 01:00:00+01	123	2024-02-02 00:45:48.385+01	2024-02-02 00:45:48.385+01
9	Bernard	Onah	onahbernardchizoba@gmail.com	+2348101198488	Anglican junction, through Redeem junction Okpanam road, Asaba Delta state	Asaba	Delta State	320107	Nigeria	\N	4242 4242 4242	Onah Bernard Chizoba	2001-09-25 00:00:00+01	12	2024-02-04 11:39:31.711+01	2024-02-04 11:39:31.711+01
10	Bernard	Onah	onahbernardchizoba@gmail.com	08101198488	Anglican junction, through Redeem junction Okpanam road, Asaba Delta state	Asaba	Delta State	320107	Nigeria	\N	4242 4242 4242 4242	Kennet Boyd	2001-09-26 00:00:00+01	12	2024-02-04 11:41:17.887+01	2024-02-04 11:41:17.887+01
\.


--
-- Data for Name: orderInvoices; Type: TABLE DATA; Schema: public; Owner: chizoba
--

COPY public."orderInvoices" (id, "orderId", "billingName", "paymentStatus", total, "paymentMethod", "orderStatus", "createdAt", "updatedAt") FROM stdin;
1	230df026-22bf-4c6b-b0dd-89a2b5b38f11	Kennet Boyd	Paid	168	Credit Card	Delivered	2024-02-02 00:37:42.003+01	2024-02-02 00:37:42.003+01
2	5f04c388-69db-4fa4-90f0-8fa4568c5326	Kennet Boyd	Awaiting Authorization	168	Master Card	Processing	2024-02-02 00:38:06.764+01	2024-02-02 00:38:06.764+01
3	710b9c4e-f0d2-4f42-9f60-c02d55561dd9	Kennet Boyd	Paid	168	Visa Card	Shipped	2024-02-02 00:39:09.589+01	2024-02-02 00:39:09.589+01
4	d75c885a-5e9d-47ca-b16b-b137cf6fe4f8	Kennet Boyd	Payment Failed	168	Virtual Card	Cancelled	2024-02-02 00:40:45.851+01	2024-02-02 00:40:45.851+01
5	ba61a798-9c10-416d-bb7f-d4939c62c6d9	Kennet Boyd	Paid	218	Credit Card	Delivered	2024-02-02 00:42:52.594+01	2024-02-02 00:42:52.594+01
6	025908f0-2c88-4b71-9636-40e7e0e68086	Kennet Boyd	Awaiting Authorization	125	Credit Card	Processing	2024-02-02 00:43:38.527+01	2024-02-02 00:43:38.527+01
7	e66c09ca-5d37-4449-9103-5d7986a26994	Kennet Boyd	Paid	185	Master Card	Shipped	2024-02-02 00:44:58.423+01	2024-02-02 00:44:58.423+01
8	6bbd8ad7-7a6b-4578-b3b2-51d0752e83b5	Kennet Boyd	Payment Failed	115	Virtual Card	Cancelled	2024-02-02 00:45:48.538+01	2024-02-02 00:45:48.538+01
9	172094c3-699f-4a39-bde3-b480d214b575	Bernard Onah	Awaiting Authorization	115	Credit Card	Processing	2024-02-04 11:39:31.776+01	2024-02-04 11:39:31.776+01
10	bd9a14f3-1aeb-4efe-b022-4cb89cebc6ef	Bernard Onah	Awaiting Authorization	115	Credit Card	Processing	2024-02-04 11:41:17.903+01	2024-02-04 11:41:17.903+01
\.


--
-- Name: billingInfos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: chizoba
--

SELECT pg_catalog.setval('public."billingInfos_id_seq"', 10, true);


--
-- Name: orderInvoices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: chizoba
--

SELECT pg_catalog.setval('public."orderInvoices_id_seq"', 10, true);


--
-- Name: SequelizeMeta SequelizeMeta_pkey; Type: CONSTRAINT; Schema: public; Owner: chizoba
--

ALTER TABLE ONLY public."SequelizeMeta"
    ADD CONSTRAINT "SequelizeMeta_pkey" PRIMARY KEY (name);


--
-- Name: billingInfos billingInfos_pkey; Type: CONSTRAINT; Schema: public; Owner: chizoba
--

ALTER TABLE ONLY public."billingInfos"
    ADD CONSTRAINT "billingInfos_pkey" PRIMARY KEY (id);


--
-- Name: orderInvoices orderInvoices_pkey; Type: CONSTRAINT; Schema: public; Owner: chizoba
--

ALTER TABLE ONLY public."orderInvoices"
    ADD CONSTRAINT "orderInvoices_pkey" PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--


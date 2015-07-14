--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: additional_event_items; Type: TABLE; Schema: public; Owner: tennis_rails; Tablespace: 
--

CREATE TABLE additional_event_items (
    id integer NOT NULL,
    related_id integer,
    related_type character varying,
    event_id integer,
    amount integer DEFAULT 1,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.additional_event_items OWNER TO tennis_rails;

--
-- Name: additional_event_items_id_seq; Type: SEQUENCE; Schema: public; Owner: tennis_rails
--

CREATE SEQUENCE additional_event_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.additional_event_items_id_seq OWNER TO tennis_rails;

--
-- Name: additional_event_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tennis_rails
--

ALTER SEQUENCE additional_event_items_id_seq OWNED BY additional_event_items.id;


--
-- Name: categories; Type: TABLE; Schema: public; Owner: tennis_rails; Tablespace: 
--

CREATE TABLE categories (
    id integer NOT NULL,
    name character varying,
    ancestry character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    slug character varying,
    icon character varying
);


ALTER TABLE public.categories OWNER TO tennis_rails;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: tennis_rails
--

CREATE SEQUENCE categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categories_id_seq OWNER TO tennis_rails;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tennis_rails
--

ALTER SEQUENCE categories_id_seq OWNED BY categories.id;


--
-- Name: coach_profiles; Type: TABLE; Schema: public; Owner: tennis_rails; Tablespace: 
--

CREATE TABLE coach_profiles (
    id integer NOT NULL,
    description character varying,
    photo character varying,
    user_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.coach_profiles OWNER TO tennis_rails;

--
-- Name: coach_profiles_id_seq; Type: SEQUENCE; Schema: public; Owner: tennis_rails
--

CREATE SEQUENCE coach_profiles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.coach_profiles_id_seq OWNER TO tennis_rails;

--
-- Name: coach_profiles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tennis_rails
--

ALTER SEQUENCE coach_profiles_id_seq OWNED BY coach_profiles.id;


--
-- Name: coaches_courts; Type: TABLE; Schema: public; Owner: tennis_rails; Tablespace: 
--

CREATE TABLE coaches_courts (
    id integer NOT NULL,
    coach_id integer,
    court_id integer,
    price numeric(8,2) DEFAULT 0.0
);


ALTER TABLE public.coaches_courts OWNER TO tennis_rails;

--
-- Name: coaches_courts_id_seq; Type: SEQUENCE; Schema: public; Owner: tennis_rails
--

CREATE SEQUENCE coaches_courts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.coaches_courts_id_seq OWNER TO tennis_rails;

--
-- Name: coaches_courts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tennis_rails
--

ALTER SEQUENCE coaches_courts_id_seq OWNED BY coaches_courts.id;


--
-- Name: courts; Type: TABLE; Schema: public; Owner: tennis_rails; Tablespace: 
--

CREATE TABLE courts (
    id integer NOT NULL,
    name character varying,
    stadium_id integer,
    price numeric(8,2),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    change_price numeric(8,2)
);


ALTER TABLE public.courts OWNER TO tennis_rails;

--
-- Name: courts_id_seq; Type: SEQUENCE; Schema: public; Owner: tennis_rails
--

CREATE SEQUENCE courts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.courts_id_seq OWNER TO tennis_rails;

--
-- Name: courts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tennis_rails
--

ALTER SEQUENCE courts_id_seq OWNED BY courts.id;


--
-- Name: deposit_requests; Type: TABLE; Schema: public; Owner: tennis_rails; Tablespace: 
--

CREATE TABLE deposit_requests (
    id integer NOT NULL,
    wallet_id integer,
    status integer,
    amount numeric(8,2),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    data text
);


ALTER TABLE public.deposit_requests OWNER TO tennis_rails;

--
-- Name: deposit_requests_id_seq; Type: SEQUENCE; Schema: public; Owner: tennis_rails
--

CREATE SEQUENCE deposit_requests_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.deposit_requests_id_seq OWNER TO tennis_rails;

--
-- Name: deposit_requests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tennis_rails
--

ALTER SEQUENCE deposit_requests_id_seq OWNED BY deposit_requests.id;


--
-- Name: deposit_responses; Type: TABLE; Schema: public; Owner: tennis_rails; Tablespace: 
--

CREATE TABLE deposit_responses (
    id integer NOT NULL,
    deposit_request_id integer,
    status integer,
    data text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.deposit_responses OWNER TO tennis_rails;

--
-- Name: deposit_responses_id_seq; Type: SEQUENCE; Schema: public; Owner: tennis_rails
--

CREATE SEQUENCE deposit_responses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.deposit_responses_id_seq OWNER TO tennis_rails;

--
-- Name: deposit_responses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tennis_rails
--

ALTER SEQUENCE deposit_responses_id_seq OWNED BY deposit_responses.id;


--
-- Name: deposits; Type: TABLE; Schema: public; Owner: tennis_rails; Tablespace: 
--

CREATE TABLE deposits (
    id integer NOT NULL,
    wallet_id integer,
    status integer,
    amount numeric(8,2),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.deposits OWNER TO tennis_rails;

--
-- Name: deposits_id_seq; Type: SEQUENCE; Schema: public; Owner: tennis_rails
--

CREATE SEQUENCE deposits_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.deposits_id_seq OWNER TO tennis_rails;

--
-- Name: deposits_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tennis_rails
--

ALTER SEQUENCE deposits_id_seq OWNED BY deposits.id;


--
-- Name: event_changes; Type: TABLE; Schema: public; Owner: tennis_rails; Tablespace: 
--

CREATE TABLE event_changes (
    id integer NOT NULL,
    event_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    status integer,
    summary character varying,
    order_id integer
);


ALTER TABLE public.event_changes OWNER TO tennis_rails;

--
-- Name: event_changes_id_seq; Type: SEQUENCE; Schema: public; Owner: tennis_rails
--

CREATE SEQUENCE event_changes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.event_changes_id_seq OWNER TO tennis_rails;

--
-- Name: event_changes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tennis_rails
--

ALTER SEQUENCE event_changes_id_seq OWNED BY event_changes.id;


--
-- Name: events; Type: TABLE; Schema: public; Owner: tennis_rails; Tablespace: 
--

CREATE TABLE events (
    id integer NOT NULL,
    start timestamp without time zone,
    "end" timestamp without time zone,
    description character varying,
    court_id integer,
    order_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    recurrence_rule character varying,
    recurrence_exception character varying,
    recurrence_id integer,
    is_all_day boolean
);


ALTER TABLE public.events OWNER TO tennis_rails;

--
-- Name: events_id_seq; Type: SEQUENCE; Schema: public; Owner: tennis_rails
--

CREATE SEQUENCE events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.events_id_seq OWNER TO tennis_rails;

--
-- Name: events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tennis_rails
--

ALTER SEQUENCE events_id_seq OWNED BY events.id;


--
-- Name: options; Type: TABLE; Schema: public; Owner: tennis_rails; Tablespace: 
--

CREATE TABLE options (
    id integer NOT NULL,
    tax integer DEFAULT 5,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    feedback_email character varying
);


ALTER TABLE public.options OWNER TO tennis_rails;

--
-- Name: options_id_seq; Type: SEQUENCE; Schema: public; Owner: tennis_rails
--

CREATE SEQUENCE options_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.options_id_seq OWNER TO tennis_rails;

--
-- Name: options_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tennis_rails
--

ALTER SEQUENCE options_id_seq OWNED BY options.id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: tennis_rails; Tablespace: 
--

CREATE TABLE orders (
    id integer NOT NULL,
    user_id integer,
    total numeric(8,2),
    status integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    stadium_id integer,
    comment character varying,
    coach_id integer
);


ALTER TABLE public.orders OWNER TO tennis_rails;

--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: tennis_rails
--

CREATE SEQUENCE orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_id_seq OWNER TO tennis_rails;

--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tennis_rails
--

ALTER SEQUENCE orders_id_seq OWNED BY orders.id;


--
-- Name: pictures; Type: TABLE; Schema: public; Owner: tennis_rails; Tablespace: 
--

CREATE TABLE pictures (
    id integer NOT NULL,
    name character varying,
    imageable_id integer,
    imageable_type character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.pictures OWNER TO tennis_rails;

--
-- Name: pictures_id_seq; Type: SEQUENCE; Schema: public; Owner: tennis_rails
--

CREATE SEQUENCE pictures_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pictures_id_seq OWNER TO tennis_rails;

--
-- Name: pictures_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tennis_rails
--

ALTER SEQUENCE pictures_id_seq OWNED BY pictures.id;


--
-- Name: reviews; Type: TABLE; Schema: public; Owner: tennis_rails; Tablespace: 
--

CREATE TABLE reviews (
    id integer NOT NULL,
    reviewable_id integer,
    reviewable_type character varying,
    text text,
    user_id integer,
    verified boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    rating integer
);


ALTER TABLE public.reviews OWNER TO tennis_rails;

--
-- Name: reviews_id_seq; Type: SEQUENCE; Schema: public; Owner: tennis_rails
--

CREATE SEQUENCE reviews_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reviews_id_seq OWNER TO tennis_rails;

--
-- Name: reviews_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tennis_rails
--

ALTER SEQUENCE reviews_id_seq OWNED BY reviews.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: tennis_rails; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO tennis_rails;

--
-- Name: special_prices; Type: TABLE; Schema: public; Owner: tennis_rails; Tablespace: 
--

CREATE TABLE special_prices (
    id integer NOT NULL,
    start timestamp without time zone,
    "end" timestamp without time zone,
    price integer,
    is_sale boolean,
    court_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.special_prices OWNER TO tennis_rails;

--
-- Name: special_prices_id_seq; Type: SEQUENCE; Schema: public; Owner: tennis_rails
--

CREATE SEQUENCE special_prices_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.special_prices_id_seq OWNER TO tennis_rails;

--
-- Name: special_prices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tennis_rails
--

ALTER SEQUENCE special_prices_id_seq OWNED BY special_prices.id;


--
-- Name: stadia; Type: TABLE; Schema: public; Owner: tennis_rails; Tablespace: 
--

CREATE TABLE stadia (
    id integer NOT NULL,
    category_id integer,
    user_id integer,
    name character varying,
    phone character varying,
    description text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.stadia OWNER TO tennis_rails;

--
-- Name: stadia_id_seq; Type: SEQUENCE; Schema: public; Owner: tennis_rails
--

CREATE SEQUENCE stadia_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stadia_id_seq OWNER TO tennis_rails;

--
-- Name: stadia_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tennis_rails
--

ALTER SEQUENCE stadia_id_seq OWNED BY stadia.id;


--
-- Name: stadiums; Type: TABLE; Schema: public; Owner: tennis_rails; Tablespace: 
--

CREATE TABLE stadiums (
    id integer NOT NULL,
    category_id integer,
    user_id integer,
    name character varying,
    phone character varying,
    description text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    address character varying,
    latitude double precision DEFAULT 55.75,
    longitude double precision DEFAULT 37.61,
    slug character varying,
    status integer DEFAULT 0
);


ALTER TABLE public.stadiums OWNER TO tennis_rails;

--
-- Name: stadiums_id_seq; Type: SEQUENCE; Schema: public; Owner: tennis_rails
--

CREATE SEQUENCE stadiums_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stadiums_id_seq OWNER TO tennis_rails;

--
-- Name: stadiums_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tennis_rails
--

ALTER SEQUENCE stadiums_id_seq OWNED BY stadiums.id;


--
-- Name: static_pages; Type: TABLE; Schema: public; Owner: tennis_rails; Tablespace: 
--

CREATE TABLE static_pages (
    id integer NOT NULL,
    text text,
    title character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    slug character varying
);


ALTER TABLE public.static_pages OWNER TO tennis_rails;

--
-- Name: static_pages_id_seq; Type: SEQUENCE; Schema: public; Owner: tennis_rails
--

CREATE SEQUENCE static_pages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.static_pages_id_seq OWNER TO tennis_rails;

--
-- Name: static_pages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tennis_rails
--

ALTER SEQUENCE static_pages_id_seq OWNED BY static_pages.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: tennis_rails; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip inet,
    last_sign_in_ip inet,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    name character varying,
    role integer,
    type character varying,
    slug character varying,
    price numeric(8,2) DEFAULT 0.0,
    avatar character varying,
    status integer,
    phone character varying
);


ALTER TABLE public.users OWNER TO tennis_rails;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: tennis_rails
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO tennis_rails;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tennis_rails
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: wallets; Type: TABLE; Schema: public; Owner: tennis_rails; Tablespace: 
--

CREATE TABLE wallets (
    id integer NOT NULL,
    user_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.wallets OWNER TO tennis_rails;

--
-- Name: wallets_id_seq; Type: SEQUENCE; Schema: public; Owner: tennis_rails
--

CREATE SEQUENCE wallets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wallets_id_seq OWNER TO tennis_rails;

--
-- Name: wallets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tennis_rails
--

ALTER SEQUENCE wallets_id_seq OWNED BY wallets.id;


--
-- Name: withdrawal_requests; Type: TABLE; Schema: public; Owner: tennis_rails; Tablespace: 
--

CREATE TABLE withdrawal_requests (
    id integer NOT NULL,
    wallet_id integer,
    status integer,
    amount numeric(8,2),
    data text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.withdrawal_requests OWNER TO tennis_rails;

--
-- Name: withdrawal_requests_id_seq; Type: SEQUENCE; Schema: public; Owner: tennis_rails
--

CREATE SEQUENCE withdrawal_requests_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.withdrawal_requests_id_seq OWNER TO tennis_rails;

--
-- Name: withdrawal_requests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tennis_rails
--

ALTER SEQUENCE withdrawal_requests_id_seq OWNED BY withdrawal_requests.id;


--
-- Name: withdrawals; Type: TABLE; Schema: public; Owner: tennis_rails; Tablespace: 
--

CREATE TABLE withdrawals (
    id integer NOT NULL,
    wallet_id integer,
    status integer,
    amount numeric(8,2),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.withdrawals OWNER TO tennis_rails;

--
-- Name: withdrawals_id_seq; Type: SEQUENCE; Schema: public; Owner: tennis_rails
--

CREATE SEQUENCE withdrawals_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.withdrawals_id_seq OWNER TO tennis_rails;

--
-- Name: withdrawals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tennis_rails
--

ALTER SEQUENCE withdrawals_id_seq OWNED BY withdrawals.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tennis_rails
--

ALTER TABLE ONLY additional_event_items ALTER COLUMN id SET DEFAULT nextval('additional_event_items_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tennis_rails
--

ALTER TABLE ONLY categories ALTER COLUMN id SET DEFAULT nextval('categories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tennis_rails
--

ALTER TABLE ONLY coach_profiles ALTER COLUMN id SET DEFAULT nextval('coach_profiles_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tennis_rails
--

ALTER TABLE ONLY coaches_courts ALTER COLUMN id SET DEFAULT nextval('coaches_courts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tennis_rails
--

ALTER TABLE ONLY courts ALTER COLUMN id SET DEFAULT nextval('courts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tennis_rails
--

ALTER TABLE ONLY deposit_requests ALTER COLUMN id SET DEFAULT nextval('deposit_requests_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tennis_rails
--

ALTER TABLE ONLY deposit_responses ALTER COLUMN id SET DEFAULT nextval('deposit_responses_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tennis_rails
--

ALTER TABLE ONLY deposits ALTER COLUMN id SET DEFAULT nextval('deposits_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tennis_rails
--

ALTER TABLE ONLY event_changes ALTER COLUMN id SET DEFAULT nextval('event_changes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tennis_rails
--

ALTER TABLE ONLY events ALTER COLUMN id SET DEFAULT nextval('events_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tennis_rails
--

ALTER TABLE ONLY options ALTER COLUMN id SET DEFAULT nextval('options_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tennis_rails
--

ALTER TABLE ONLY orders ALTER COLUMN id SET DEFAULT nextval('orders_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tennis_rails
--

ALTER TABLE ONLY pictures ALTER COLUMN id SET DEFAULT nextval('pictures_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tennis_rails
--

ALTER TABLE ONLY reviews ALTER COLUMN id SET DEFAULT nextval('reviews_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tennis_rails
--

ALTER TABLE ONLY special_prices ALTER COLUMN id SET DEFAULT nextval('special_prices_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tennis_rails
--

ALTER TABLE ONLY stadia ALTER COLUMN id SET DEFAULT nextval('stadia_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tennis_rails
--

ALTER TABLE ONLY stadiums ALTER COLUMN id SET DEFAULT nextval('stadiums_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tennis_rails
--

ALTER TABLE ONLY static_pages ALTER COLUMN id SET DEFAULT nextval('static_pages_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tennis_rails
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tennis_rails
--

ALTER TABLE ONLY wallets ALTER COLUMN id SET DEFAULT nextval('wallets_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tennis_rails
--

ALTER TABLE ONLY withdrawal_requests ALTER COLUMN id SET DEFAULT nextval('withdrawal_requests_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tennis_rails
--

ALTER TABLE ONLY withdrawals ALTER COLUMN id SET DEFAULT nextval('withdrawals_id_seq'::regclass);


--
-- Data for Name: additional_event_items; Type: TABLE DATA; Schema: public; Owner: tennis_rails
--

COPY additional_event_items (id, related_id, related_type, event_id, amount, created_at, updated_at) FROM stdin;
1	3	User	23	4	2015-05-21 17:57:01.64514	2015-05-21 17:57:01.64514
2	3	User	24	1	2015-05-22 13:11:18.070379	2015-05-22 13:11:18.070379
3	3	User	25	1	2015-05-22 13:17:33.007757	2015-05-22 13:17:33.007757
4	3	User	26	1	2015-05-22 13:19:52.581077	2015-05-22 13:19:52.581077
7	3	User	44	1	2015-05-30 16:07:40.011691	2015-05-30 16:07:40.011691
8	3	User	45	1	2015-05-30 16:08:33.70611	2015-05-30 16:08:33.70611
9	3	User	46	1	2015-05-30 16:08:37.602029	2015-05-30 16:08:37.602029
10	3	User	47	1	2015-05-30 16:08:39.544919	2015-05-30 16:08:39.544919
11	3	User	48	1	2015-05-30 16:08:43.547349	2015-05-30 16:08:43.547349
12	3	User	49	1	2015-05-30 16:08:47.167276	2015-05-30 16:08:47.167276
13	3	User	50	1	2015-05-30 16:08:47.373099	2015-05-30 16:08:47.373099
14	3	User	51	1	2015-05-30 16:09:14.016649	2015-05-30 16:09:14.016649
15	3	User	52	2	2015-05-30 16:10:23.383341	2015-05-30 16:10:23.383341
19	3	User	59	1	2015-05-31 09:03:10.721115	2015-05-31 09:03:10.721115
21	18	User	72	1	2015-06-15 12:04:57.493186	2015-06-15 12:04:57.493186
22	18	User	73	1	2015-06-15 12:05:25.163484	2015-06-15 12:05:25.163484
25	18	User	76	1	2015-06-15 13:36:17.175039	2015-06-15 13:36:17.175039
26	18	User	77	2	2015-06-15 13:36:33.366242	2015-06-15 13:36:33.366242
27	18	User	78	2	2015-06-15 13:42:00.427494	2015-06-15 13:42:00.427494
29	18	User	82	4	2015-06-15 18:26:28.350019	2015-06-15 18:26:28.350019
30	18	User	83	2	2015-06-15 18:26:38.011518	2015-06-15 18:26:38.011518
33	21	User	133	1	2015-06-18 12:43:06.755137	2015-06-18 12:43:06.755137
\.


--
-- Name: additional_event_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tennis_rails
--

SELECT pg_catalog.setval('additional_event_items_id_seq', 33, true);


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: tennis_rails
--

COPY categories (id, name, ancestry, created_at, updated_at, slug, icon) FROM stdin;
3	Теннис	1	2015-05-03 18:40:05.682165	2015-05-03 18:40:05.682165	tennis	\N
4	Групповые занятия	\N	2015-05-03 18:40:05.688245	2015-05-03 18:40:05.688245	gruppovye-zanyatiya	\N
6	Фитнесс	\N	2015-05-03 18:40:05.696528	2015-05-03 18:40:05.696528	fitness	\N
1	Стадион	\N	2015-04-21 20:17:19.33967	2015-05-03 18:42:31.880587	stadion	\N
2	Футбол	1	2015-04-21 20:17:19.363482	2015-05-03 18:42:31.891341	futbol	\N
7	Сквош	1	2015-06-16 11:04:55.616825	2015-06-16 11:04:55.616825	skvosh	\N
\.


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tennis_rails
--

SELECT pg_catalog.setval('categories_id_seq', 7, true);


--
-- Data for Name: coach_profiles; Type: TABLE DATA; Schema: public; Owner: tennis_rails
--

COPY coach_profiles (id, description, photo, user_id, created_at, updated_at) FROM stdin;
1	\N	\N	3	2015-05-30 12:37:25.493609	2015-05-30 12:37:25.493609
2	\N	\N	\N	2015-05-30 12:46:20.847094	2015-05-30 12:46:20.847094
3	\N	\N	\N	2015-05-30 12:55:08.117087	2015-05-30 12:55:08.117087
5	\N	\N	\N	2015-05-30 13:13:00.657135	2015-05-30 13:13:00.657135
6	\N	\N	\N	2015-05-30 16:28:19.086283	2015-05-30 16:28:19.086283
7	\N	\N	\N	2015-05-30 16:28:51.639725	2015-05-30 16:28:51.639725
8	\N	\N	\N	2015-06-01 16:39:55.616835	2015-06-01 16:39:55.616835
9	\N	\N	\N	2015-06-01 16:42:04.033893	2015-06-01 16:42:04.033893
12	\N	\N	\N	2015-06-08 04:02:12.041722	2015-06-08 04:02:12.041722
13	\N	\N	\N	2015-06-09 14:24:15.149149	2015-06-09 14:24:15.149149
14	\N	\N	\N	2015-06-09 14:24:44.345954	2015-06-09 14:24:44.345954
16	\N	\N	\N	2015-06-15 11:58:38.239332	2015-06-15 11:58:38.239332
19	\N	\N	18	2015-06-15 12:03:57.069495	2015-06-15 12:03:57.069495
21	\N	\N	\N	2015-06-16 09:46:42.804956	2015-06-16 09:46:42.804956
26	\N	\N	\N	2015-06-16 10:17:38.264841	2015-06-16 10:17:38.264841
28	\N	\N	\N	2015-06-16 14:01:10.466878	2015-06-16 14:01:10.466878
29	\N	\N	\N	2015-06-16 14:01:51.290748	2015-06-16 14:01:51.290748
30	\N	\N	\N	2015-06-16 14:03:20.418729	2015-06-16 14:03:20.418729
31	\N	\N	\N	2015-06-16 14:03:26.96108	2015-06-16 14:03:26.96108
33	\N	\N	\N	2015-06-16 14:04:39.012851	2015-06-16 14:04:39.012851
34	Возраст: 51 год\r\nТренер категории профессионал по версии PTR\r\nСтаж с 1985 года\r\n\r\nУслуги:\r\nИндивидуальные тренировки, Сплит, организация турниров.\r\n	\N	18	2015-06-17 04:40:32.574283	2015-06-17 04:40:32.574283
35	индивидуально	\N	21	2015-06-18 12:53:49.525964	2015-06-18 12:53:49.525964
36	\N	\N	\N	2015-07-06 15:04:48.739835	2015-07-06 15:04:48.739835
37	\N	\N	\N	2015-07-06 15:05:56.512038	2015-07-06 15:05:56.512038
38	\N	\N	28	2015-07-06 15:06:57.809582	2015-07-06 15:06:57.809582
\.


--
-- Name: coach_profiles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tennis_rails
--

SELECT pg_catalog.setval('coach_profiles_id_seq', 38, true);


--
-- Data for Name: coaches_courts; Type: TABLE DATA; Schema: public; Owner: tennis_rails
--

COPY coaches_courts (id, coach_id, court_id, price) FROM stdin;
1	3	3	0.00
3	3	2	0.00
4	16	1	0.00
5	16	4	0.00
8	21	5	0.00
10	18	6	0.00
\.


--
-- Name: coaches_courts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tennis_rails
--

SELECT pg_catalog.setval('coaches_courts_id_seq', 10, true);


--
-- Data for Name: courts; Type: TABLE DATA; Schema: public; Owner: tennis_rails
--

COPY courts (id, name, stadium_id, price, created_at, updated_at, change_price) FROM stdin;
1	Первый	1	815.00	2015-04-21 20:17:19.445256	2015-04-25 13:23:00.378212	75.00
2	Второй	1	25.00	2015-04-21 20:17:19.452895	2015-04-25 13:23:00.380703	100.00
3	Основной	2	1000.00	2015-04-22 08:45:56.596532	2015-04-25 13:24:10.794481	150.00
4	третий корт	1	2000.00	2015-05-30 16:25:30.533551	2015-05-30 16:25:30.533551	75.00
6		7	\N	2015-06-16 14:30:02.417337	2015-06-16 14:30:02.417337	0.00
5	корт 1	7	500.00	2015-06-16 13:59:43.09042	2015-06-17 10:40:48.318822	10.00
\.


--
-- Name: courts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tennis_rails
--

SELECT pg_catalog.setval('courts_id_seq', 7, true);


--
-- Data for Name: deposit_requests; Type: TABLE DATA; Schema: public; Owner: tennis_rails
--

COPY deposit_requests (id, wallet_id, status, amount, created_at, updated_at, data) FROM stdin;
3	4	0	5000.00	2015-05-20 08:36:02.882179	2015-05-20 08:36:02.882179	\N
4	4	0	5000.00	2015-05-20 08:43:48.657909	2015-05-20 08:43:48.657909	\N
5	4	0	5000.00	2015-05-20 08:55:56.606619	2015-05-20 08:55:56.606619	\N
6	4	0	5000.00	2015-05-20 09:07:02.449318	2015-05-20 09:07:02.449318	\N
7	4	2	5000.00	2015-05-20 09:31:30.94144	2015-05-20 09:32:29.16958	\N
8	4	1	5000.00	2015-05-20 09:48:39.889	2015-05-20 09:49:29.831299	\N
1	4	1	5000.00	2015-05-18 15:04:25.125397	2015-05-20 18:13:09.979093	\N
2	4	1	5000.00	2015-05-18 16:03:50.068441	2015-05-20 18:13:10.41071	\N
9	8	1	5000.00	2015-05-21 17:52:19.887954	2015-05-21 17:53:00.303974	\N
10	4	0	5000.00	2015-05-22 13:34:38.965045	2015-05-22 13:34:38.965045	\N
11	4	0	5000.00	2015-05-25 08:09:54.362744	2015-05-25 08:09:54.362744	\N
12	4	0	5000.00	2015-05-30 07:58:59.901369	2015-05-30 07:58:59.901369	\N
13	13	0	5000.00	2015-06-01 09:54:34.397196	2015-06-01 09:54:34.397196	\N
14	14	0	5000.00	2015-06-01 10:56:56.422444	2015-06-01 10:56:56.422444	\N
16	4	0	5000.00	2015-06-16 08:28:54.861963	2015-06-16 08:28:54.861963	\N
17	4	0	5000.00	2015-06-17 10:58:45.825293	2015-06-17 10:58:45.825293	\N
\.


--
-- Name: deposit_requests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tennis_rails
--

SELECT pg_catalog.setval('deposit_requests_id_seq', 18, true);


--
-- Data for Name: deposit_responses; Type: TABLE DATA; Schema: public; Owner: tennis_rails
--

COPY deposit_responses (id, deposit_request_id, status, data, created_at, updated_at) FROM stdin;
1	7	\N	{"DateTime"=>"2015-05-20 09:32:34", "TransactionID"=>"43940093", "OrderId"=>"7", "Amount"=>"5000.00", "Currency"=>"RUB", "SecurityKey"=>"d26ee61a45bee1008c2637de94de594a", "OrderDescription"=>"Пополнение кошелька в системе BookingSports", "lang"=>"ru", "Provider"=>"Card", "PaymentAmount"=>"5000.00", "PaymentCurrency"=>"RUB", "CardHolder"=>"ANTON MURYGIN", "CardNumber"=>"************1111", "Country"=>"RU", "City"=>"Москва", "ECI"=>"6", "controller"=>"dashboard/payments", "action"=>"success"}	2015-05-20 09:32:29.160719	2015-05-20 09:32:29.160719
2	8	\N	{"DateTime":"2015-05-20 09:49:35","TransactionID":"43941359","OrderId":"8","Amount":"5000.00","Currency":"RUB","SecurityKey":"1b7a247c9cbef8635ce3211536715cf3","OrderDescription":"Пополнение кошелька в системе BookingSports","lang":"ru","Provider":"Card","PaymentAmount":"5000.00","PaymentCurrency":"RUB","CardHolder":"ANTON MUYR","CardNumber":"************1111","Country":"RU","City":"Москва","ECI":"6","controller":"dashboard/payments","action":"success"}	2015-05-20 09:49:29.823949	2015-05-20 09:49:29.823949
3	8	\N	{"DateTime":"2015-05-20 09:49:35","TransactionID":"43941359","OrderId":"8","Amount":"5000.00","Currency":"RUB","SecurityKey":"1b7a247c9cbef8635ce3211536715cf3","OrderDescription":"Пополнение кошелька в системе BookingSports","lang":"ru","Provider":"Card","PaymentAmount":"5000.00","PaymentCurrency":"RUB","CardHolder":"ANTON MUYR","CardNumber":"************1111","Country":"RU","City":"Москва","ECI":"6","controller":"dashboard/payments","action":"success"}	2015-05-20 09:51:59.269085	2015-05-20 09:51:59.269085
4	1	\N	{"DateTime":"2015-05-18 15:05:27","TransactionID":"43825721","OrderId":"1","Amount":"5000.00","Currency":"RUB","SecurityKey":"d4d9bcd04b79411b5a6fe9526829bbd8","OrderDescription":"Пополнение кошелька в системе BookingSports","lang":"ru","Provider":"Card","PaymentAmount":"5000.00","PaymentCurrency":"RUB","CardHolder":"ANT BUR","CardNumber":"************1111","Country":"RU","City":"Москва","ECI":"6","controller":"dashboard/payments","action":"success"}	2015-05-20 18:13:09.969364	2015-05-20 18:13:09.969364
5	2	\N	{"DateTime":"2015-05-18 16:04:30","TransactionID":"43829315","OrderId":"2","Amount":"5000.00","Currency":"RUB","SecurityKey":"7ef249098307d043838300c7d7ccc9f5","OrderDescription":"Пополнение кошелька в системе BookingSports","lang":"ru","Provider":"Card","PaymentAmount":"5000.00","PaymentCurrency":"RUB","CardHolder":"ANTON MUR","CardNumber":"************1111","Country":"RU","City":"Москва","ECI":"6","controller":"dashboard/payments","action":"success"}	2015-05-20 18:13:10.398736	2015-05-20 18:13:10.398736
6	9	\N	{"DateTime":"2015-05-21 17:53:06","TransactionID":"44039240","OrderId":"9","Amount":"5000.00","Currency":"RUB","SecurityKey":"0a9cbd172f530842418d91f96361ed65","OrderDescription":"Пополнение кошелька в системе BookingSports","lang":"ru","Provider":"Card","PaymentAmount":"5000.00","PaymentCurrency":"RUB","CardHolder":"ANTON MUR","CardNumber":"************1111","Country":"RU","City":"Москва","ECI":"6","controller":"payments","action":"success"}	2015-05-21 17:53:00.298318	2015-05-21 17:53:00.298318
\.


--
-- Name: deposit_responses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tennis_rails
--

SELECT pg_catalog.setval('deposit_responses_id_seq', 6, true);


--
-- Data for Name: deposits; Type: TABLE DATA; Schema: public; Owner: tennis_rails
--

COPY deposits (id, wallet_id, status, amount, created_at, updated_at) FROM stdin;
1	2	\N	815.00	2015-05-12 11:25:17.291822	2015-05-12 11:25:17.291822
2	5	\N	4000.00	2015-05-21 18:12:10.001207	2015-05-21 18:12:10.001207
3	3	\N	3200.00	2015-05-21 18:12:10.011697	2015-05-21 18:12:10.011697
4	5	\N	4000.00	2015-05-25 09:15:54.78834	2015-05-25 09:15:54.78834
5	5	\N	2000.00	2015-05-25 09:15:54.814963	2015-05-25 09:15:54.814963
6	2	\N	95.00	2015-05-31 07:00:08.860355	2015-05-31 07:00:08.860355
7	3	\N	3040.00	2015-05-31 07:00:08.869458	2015-05-31 07:00:08.869458
8	2	\N	95.00	2015-05-31 07:00:08.952833	2015-05-31 07:00:08.952833
9	3	\N	3040.00	2015-05-31 07:00:08.961305	2015-05-31 07:00:08.961305
10	2	\N	23.75	2015-05-31 09:05:32.953864	2015-05-31 09:05:32.953864
11	3	\N	760.00	2015-05-31 09:05:32.96408	2015-05-31 09:05:32.96408
12	4	\N	949999.05	2015-06-15 15:32:13.544221	2015-06-15 15:32:13.544221
13	5	\N	1900.00	2015-06-15 19:30:54.27	2015-06-15 19:30:54.27
14	18	\N	3800.00	2015-06-15 19:30:54.279663	2015-06-15 19:30:54.279663
15	5	\N	3800.00	2015-06-15 19:30:54.330533	2015-06-15 19:30:54.330533
16	18	\N	7600.00	2015-06-15 19:30:54.340677	2015-06-15 19:30:54.340677
17	20	\N	1900.00	2015-06-17 10:56:35.437835	2015-06-17 10:56:35.437835
18	20	\N	2850.00	2015-06-17 10:58:04.928273	2015-06-17 10:58:04.928273
\.


--
-- Name: deposits_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tennis_rails
--

SELECT pg_catalog.setval('deposits_id_seq', 18, true);


--
-- Data for Name: event_changes; Type: TABLE DATA; Schema: public; Owner: tennis_rails
--

COPY event_changes (id, event_id, created_at, updated_at, status, summary, order_id) FROM stdin;
1	10	2015-05-03 19:32:18.363339	2015-05-03 19:32:18.363339	0	{"id":10,"start":"2015-04-29T08:00:00.000Z","end":"2015-04-29T09:30:00.000Z","description":"Введите название","court_id":3,"order_id":8,"created_at":"2015-05-03T19:20:29.949Z","updated_at":"2015-05-03T19:32:18.325Z","recurrence_rule":"FREQ=WEEKLY;BYDAY=WE,SA","recurrence_exception":"","recurrence_id":null,"is_all_day":false}	\N
4	8	2015-05-03 19:34:15.485226	2015-05-03 19:34:15.485226	0	{"id":8,"start":"2015-04-16T17:00:00.000Z","end":"2015-04-29T17:30:00.000Z","description":"No title","court_id":3,"order_id":8,"created_at":"2015-04-28T18:01:35.714Z","updated_at":"2015-05-03T19:34:15.477Z","recurrence_rule":"FREQ=DAILY;INTERVAL=3","recurrence_exception":null,"recurrence_id":null,"is_all_day":false}	\N
5	8	2015-05-03 19:34:16.290244	2015-05-03 19:34:16.290244	0	{"id":8,"start":"2015-04-17T00:00:00.000Z","end":"2015-04-30T00:30:00.000Z","description":"No title","court_id":3,"order_id":8,"created_at":"2015-04-28T18:01:35.714Z","updated_at":"2015-05-03T19:34:16.270Z","recurrence_rule":"FREQ=DAILY;INTERVAL=3","recurrence_exception":null,"recurrence_id":null,"is_all_day":false}	\N
6	8	2015-05-03 19:34:18.438305	2015-05-03 19:34:18.438305	0	{"id":8,"start":"2015-04-19T07:30:00.000Z","end":"2015-05-02T08:00:00.000Z","description":"No title","court_id":3,"order_id":8,"created_at":"2015-04-28T18:01:35.714Z","updated_at":"2015-05-03T19:34:18.428Z","recurrence_rule":"FREQ=DAILY;INTERVAL=3","recurrence_exception":null,"recurrence_id":null,"is_all_day":false}	\N
7	19	2015-05-30 13:47:42.425808	2015-05-30 13:47:42.425808	\N	{"id":19,"start":"2015-05-13T08:30:00.000Z","end":"2015-05-13T09:00:00.000Z","description":"Стадион #2","court_id":1,"order_id":12,"created_at":"2015-05-11T13:42:19.639Z","updated_at":"2015-05-30T13:47:42.342Z","recurrence_rule":"FREQ=WEEKLY;BYDAY=TU,TH,FR","recurrence_exception":null,"recurrence_id":null,"is_all_day":false}	21
\.


--
-- Name: event_changes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tennis_rails
--

SELECT pg_catalog.setval('event_changes_id_seq', 8, true);


--
-- Data for Name: events; Type: TABLE DATA; Schema: public; Owner: tennis_rails
--

COPY events (id, start, "end", description, court_id, order_id, created_at, updated_at, recurrence_rule, recurrence_exception, recurrence_id, is_all_day) FROM stdin;
2	2015-04-25 09:30:00	2015-04-25 10:00:00	\N	1	2	2015-04-24 13:19:00.90889	2015-04-24 13:19:00.90889	\N	\N	\N	\N
3	2015-04-20 07:00:00	2015-04-20 09:30:00	\N	1	3	2015-04-25 06:47:49.573635	2015-04-25 06:47:49.573635	\N	\N	\N	\N
4	2015-04-22 06:30:00	2015-04-22 09:30:00	\N	1	4	2015-04-25 13:03:37.432331	2015-04-25 13:03:37.432331	\N	\N	\N	\N
73	2015-06-05 00:00:00	2015-06-05 00:00:00	345	3	43	2015-06-15 12:05:25.160961	2015-06-15 12:05:25.160961	FREQ=DAILY;COUNT=4	\N	\N	t
6	2015-04-21 14:30:00	2015-04-21 20:30:00	\N	1	6	2015-04-25 13:27:37.245152	2015-04-25 13:27:50.8864	\N	\N	\N	\N
72	2015-06-16 09:00:00	2015-06-16 10:00:00	Вадим Яковлев	3	42	2015-06-15 12:04:57.489288	2015-06-15 12:08:31.89205	FREQ=DAILY;INTERVAL=3;COUNT=10	20150616T090000Z;	\N	f
59	2015-05-27 09:30:00	2015-05-27 11:30:00	Занятие по боллу	2	29	2015-05-31 09:03:10.713697	2015-05-31 09:27:25.567431	\N	\N	\N	f
76	2015-06-15 07:30:00	2015-06-15 08:30:00	\N	3	45	2015-06-15 13:36:17.1709	2015-06-15 13:36:17.1709	FREQ=DAILY;COUNT=4	\N	\N	f
77	2015-06-16 07:30:00	2015-06-16 09:00:00	Вадим Яковлев	3	45	2015-06-15 13:36:33.358275	2015-06-15 13:36:33.358275	\N	\N	76	\N
134	2015-07-01 08:00:00	2015-07-01 09:00:00	Пользователь #1	5	66	2015-07-01 03:37:43.735602	2015-07-01 03:39:52.581257			\N	f
136	2015-07-08 10:00:00	2015-07-08 11:00:00	1	5	67	2015-07-06 14:44:37.296189	2015-07-06 14:44:37.296189	\N	\N	\N	f
138	2015-07-12 08:00:00	2015-07-12 08:30:00	\N	5	67	2015-07-06 14:45:02.53295	2015-07-06 14:45:02.53295	\N	\N	\N	f
101	2015-06-08 07:00:00	2015-06-08 08:00:00	Петров	1	56	2015-06-17 10:18:46.879438	2015-06-17 10:18:46.879438	FREQ=WEEKLY;UNTIL=20150808T070000Z;BYDAY=MO,WE,SA	\N	\N	f
102	2015-06-08 07:00:00	2015-06-08 08:00:00	Петров	1	56	2015-06-17 10:18:47.594853	2015-06-17 10:18:47.594853	FREQ=WEEKLY;UNTIL=20150808T070000Z;BYDAY=MO,WE,SA	\N	\N	f
103	2015-06-08 07:00:00	2015-06-08 08:00:00	Петров	1	56	2015-06-17 10:18:48.293475	2015-06-17 10:18:48.293475	FREQ=WEEKLY;UNTIL=20150808T070000Z;BYDAY=MO,WE,SA	\N	\N	f
106	2015-06-08 07:00:00	2015-06-08 08:00:00	Петров	1	56	2015-06-17 10:18:49.142915	2015-06-17 10:18:49.142915	FREQ=WEEKLY;UNTIL=20150808T070000Z;BYDAY=MO,WE,SA	\N	\N	f
108	2015-06-08 07:00:00	2015-06-08 08:00:00	Петров	1	56	2015-06-17 10:18:49.489797	2015-06-17 10:18:49.489797	FREQ=WEEKLY;UNTIL=20150808T070000Z;BYDAY=MO,WE,SA	\N	\N	f
111	2015-06-08 07:00:00	2015-06-08 08:00:00	Петров	1	56	2015-06-17 10:18:58.118151	2015-06-17 10:18:58.118151	FREQ=WEEKLY;UNTIL=20150808T070000Z;BYDAY=MO,WE,SA	\N	\N	f
114	2015-06-08 07:00:00	2015-06-08 08:00:00	Петров	1	56	2015-06-17 10:19:07.097668	2015-06-17 10:19:07.097668	FREQ=WEEKLY;UNTIL=20150808T070000Z;BYDAY=MO,WE,SA	\N	\N	f
19	2015-05-12 08:30:00	2015-05-12 09:00:00	\N	1	12	2015-05-11 13:42:19.639193	2015-05-11 13:42:19.639193	FREQ=WEEKLY;BYDAY=TU,TH,FR	\N	\N	f
117	2015-06-08 07:00:00	2015-06-08 08:00:00	Петров	1	56	2015-06-17 10:19:09.688511	2015-06-17 10:19:09.688511	FREQ=WEEKLY;UNTIL=20150808T070000Z;BYDAY=MO,WE,SA	\N	\N	f
119	2015-05-25 18:00:00	2015-05-25 19:30:00	\N	5	58	2015-06-17 10:47:14.081797	2015-06-17 10:47:14.081797	\N	\N	\N	f
124	2015-06-23 12:00:00	2015-06-23 12:30:00	\N	5	58	2015-06-17 10:51:51.557225	2015-06-17 10:51:51.557225	\N	\N	\N	f
133	2015-06-16 08:30:00	2015-06-16 09:00:00	\N	5	65	2015-06-18 12:43:06.751747	2015-06-18 12:43:06.751747	\N	\N	\N	f
28	2015-05-26 08:30:00	2015-05-26 09:00:00	\N	1	17	2015-05-25 09:02:42.648861	2015-05-25 09:02:42.648861	\N	\N	\N	f
29	2015-05-27 08:30:00	2015-05-27 09:00:00	\N	1	17	2015-05-25 09:02:51.160997	2015-05-25 09:02:51.160997	FREQ=WEEKLY;BYDAY=WE,FR,SA	\N	\N	f
30	2015-05-28 08:30:00	2015-05-28 09:00:00	\N	1	17	2015-05-25 09:04:12.159556	2015-05-25 09:04:12.159556	FREQ=WEEKLY;BYDAY=TU,WE,TH,FR,SA,SU	\N	\N	f
36	2015-05-25 08:00:00	2015-05-25 08:30:00	Иван Петров	2	20	2015-05-30 08:18:08.456073	2015-05-30 08:18:08.456073	FREQ=WEEKLY;BYDAY=MO,FR	\N	\N	f
52	2015-05-25 09:00:00	2015-05-25 10:30:00	Пользователь #12	2	24	2015-05-30 16:10:23.376563	2015-05-30 16:10:23.376563	\N	\N	51	\N
51	2015-05-25 09:00:00	2015-05-25 11:00:00	Пользователь #12	2	24	2015-05-30 16:09:14.012052	2015-05-30 16:10:23.454038	FREQ=DAILY;INTERVAL=2;UNTIL=20150731T083000Z	20150525T090000Z;	\N	f
5	2015-04-21 15:30:00	2015-04-21 21:00:00	\N	\N	5	2015-04-25 13:25:06.353824	2015-04-25 13:55:05.085168	\N	\N	\N	\N
11	2015-04-28 11:00:00	2015-04-28 12:00:00	Введите название	\N	9	2015-05-03 19:30:03.012913	2015-05-03 19:30:09.118059	FREQ=DAILY	20150429T110000Z;	\N	f
56	2015-05-26 09:00:00	2015-05-26 10:30:00	Пятнадцать	\N	26	2015-05-31 08:50:10.753327	2015-05-31 08:50:15.27089	\N	\N	\N	f
10	2015-04-29 08:00:00	2015-04-29 09:30:00	Введите название	\N	8	2015-05-03 19:20:29.949672	2015-05-03 19:32:18.325083	FREQ=WEEKLY;BYDAY=WE,SA		\N	f
44	2015-05-27 11:00:00	2015-05-27 13:00:00	Пользователь #12	\N	24	2015-05-30 16:07:39.924856	2015-05-30 16:07:43.591091	\N	\N	\N	f
12	2015-04-29 09:30:00	2015-04-29 11:00:00	Введите название	\N	9	2015-05-03 19:30:09.114045	2015-05-03 19:33:31.992639			11	f
45	2015-05-26 09:00:00	2015-05-26 09:30:00	\N	\N	24	2015-05-30 16:08:33.702232	2015-05-30 16:08:33.702232	FREQ=WEEKLY;BYDAY=TU,FR,SU	\N	\N	f
8	2015-04-19 07:30:00	2015-05-02 08:00:00	No title	\N	8	2015-04-28 18:01:35.714779	2015-05-03 19:34:18.42821	FREQ=DAILY;INTERVAL=3	\N	\N	f
18	2015-05-08 09:00:00	2015-05-08 09:30:00	\N	\N	9	2015-05-04 20:36:10.785301	2015-05-04 20:36:10.785301	FREQ=DAILY	\N	\N	f
23	2015-05-22 08:00:00	2015-05-22 12:00:00	\N	\N	14	2015-05-21 17:57:01.637327	2015-05-21 17:57:01.637327	\N	\N	\N	f
24	2015-05-19 09:30:00	2015-05-19 10:00:00	\N	\N	15	2015-05-22 13:11:18.063133	2015-05-22 13:11:18.063133	\N	\N	\N	f
25	2015-05-20 09:00:00	2015-05-20 11:30:00		\N	16	2015-05-22 13:17:32.954897	2015-05-22 13:17:35.132931	\N	\N	\N	f
26	2015-05-18 09:30:00	2015-05-18 10:00:00	\N	\N	15	2015-05-22 13:19:52.577696	2015-05-22 13:19:52.577696	\N	\N	\N	f
49	2015-05-26 09:00:00	2015-05-26 09:30:00	\N	\N	24	2015-05-30 16:08:47.1646	2015-05-30 16:08:47.1646	FREQ=WEEKLY;BYDAY=TU,FR,SU	\N	\N	f
50	2015-05-26 09:00:00	2015-05-26 09:30:00	\N	\N	24	2015-05-30 16:08:47.365544	2015-05-30 16:08:47.365544	FREQ=WEEKLY;BYDAY=TU,FR,SU	\N	\N	f
57	2015-05-27 09:30:00	2015-05-27 10:00:00	321	\N	27	2015-05-31 08:50:39.750896	2015-05-31 08:50:39.750896	\N	\N	\N	f
58	2015-05-28 09:30:00	2015-05-28 12:30:00	321	\N	28	2015-05-31 08:55:50.072789	2015-05-31 08:55:50.072789	\N	\N	\N	f
37	2015-05-26 08:30:00	2015-05-26 09:00:00	\N	\N	21	2015-05-30 08:20:38.251452	2015-05-30 08:20:38.251452	FREQ=DAILY;COUNT=4	\N	\N	f
38	2015-05-27 10:00:00	2015-05-27 11:00:00	\N	\N	21	2015-05-30 08:20:55.849149	2015-05-30 08:20:55.849149	FREQ=DAILY;COUNT=5	\N	\N	f
39	2015-05-27 10:00:00	2015-05-27 11:00:00	\N	\N	21	2015-05-30 08:20:59.165391	2015-05-30 08:20:59.165391	FREQ=DAILY;COUNT=5	\N	\N	f
46	2015-05-26 10:00:00	2015-05-26 10:30:00	Пользователь #12	\N	24	2015-05-30 16:08:37.599195	2015-05-30 16:11:02.379323	FREQ=WEEKLY;BYDAY=TU,FR,SU	\N	\N	f
47	2015-05-26 08:00:00	2015-05-26 08:30:00	Пользователь #12	\N	24	2015-05-30 16:08:39.537343	2015-05-30 16:11:03.865604	FREQ=WEEKLY;BYDAY=TU,FR,SU	\N	\N	f
48	2015-05-26 07:00:00	2015-05-26 07:30:00	Пользователь #12	\N	24	2015-05-30 16:08:43.539199	2015-05-30 16:11:06.24877	FREQ=WEEKLY;BYDAY=TU,FR,SU	\N	\N	f
61	2015-05-26 08:30:00	2015-05-26 09:00:00	Copa	3	31	2015-05-31 09:25:45.545511	2015-05-31 09:25:45.545511	\N	\N	\N	f
62	2015-05-28 08:30:00	2015-05-28 12:00:00	321	3	32	2015-05-31 09:26:07.55597	2015-05-31 09:26:13.673611	FREQ=DAILY;UNTIL=20150529T090000Z	\N	\N	f
78	2015-06-16 07:30:00	2015-06-16 09:00:00	Вадим Яковлев	3	45	2015-06-15 13:42:00.415129	2015-06-15 13:42:00.415129	\N	\N	76	\N
66	2016-01-27 00:00:00	2016-01-27 00:00:00	\N	1	36	2015-06-05 11:36:49.46674	2015-06-05 11:36:49.46674	FREQ=DAILY;UNTIL=20160127T000000Z	\N	\N	t
81	2015-06-16 08:00:00	2015-06-16 09:00:00	\N	1	48	2015-06-15 15:23:49.953283	2015-06-15 15:23:49.953283	FREQ=DAILY;COUNT=3	\N	\N	f
130	2015-06-15 11:00:00	2015-06-15 12:00:00	\N	1	62	2015-06-18 12:21:28.683453	2015-06-18 12:21:28.683453	\N	\N	\N	f
69	2015-06-08 08:00:00	2015-06-08 09:00:00	\N	1	39	2015-06-14 11:01:41.843516	2015-06-14 11:01:41.843516	FREQ=WEEKLY;COUNT=5;BYDAY=MO,WE,FR,SU	\N	\N	f
70	2015-06-09 10:00:00	2015-06-10 11:00:00	\N	1	40	2015-06-14 11:02:09.883095	2015-06-14 11:02:09.883095	FREQ=DAILY;COUNT=4	\N	\N	f
71	2015-06-15 10:30:00	2015-06-15 11:30:00	test	1	41	2015-06-15 08:05:00.487998	2015-06-15 08:09:49.146565	FREQ=DAILY;INTERVAL=2;COUNT=10	20150615T103000Z;	\N	f
83	2015-06-16 09:30:00	2015-06-16 10:30:00	Пользователь #4	3	49	2015-06-15 18:26:38.007581	2015-06-15 18:26:38.007581	\N	\N	82	\N
82	2015-06-17 09:30:00	2015-06-17 10:30:00	Пользователь #4	3	49	2015-06-15 18:26:28.344728	2015-06-15 18:26:38.048	FREQ=DAILY;COUNT=4	20150617T093000Z;	\N	f
100	2015-06-08 07:00:00	2015-06-08 08:00:00	Петров	1	56	2015-06-17 10:18:37.769896	2015-06-17 10:18:37.769896	FREQ=WEEKLY;UNTIL=20150808T070000Z;BYDAY=MO,WE,SA	\N	\N	f
104	2015-06-08 07:00:00	2015-06-08 08:00:00	Петров	1	56	2015-06-17 10:18:48.626985	2015-06-17 10:18:48.626985	FREQ=WEEKLY;UNTIL=20150808T070000Z;BYDAY=MO,WE,SA	\N	\N	f
105	2015-06-08 07:00:00	2015-06-08 08:00:00	Петров	1	56	2015-06-17 10:18:48.926254	2015-06-17 10:18:48.926254	FREQ=WEEKLY;UNTIL=20150808T070000Z;BYDAY=MO,WE,SA	\N	\N	f
107	2015-06-08 07:00:00	2015-06-08 08:00:00	Петров	1	56	2015-06-17 10:18:49.250323	2015-06-17 10:18:49.250323	FREQ=WEEKLY;UNTIL=20150808T070000Z;BYDAY=MO,WE,SA	\N	\N	f
109	2015-06-08 07:00:00	2015-06-08 08:00:00	Петров	1	56	2015-06-17 10:18:50.179435	2015-06-17 10:18:50.179435	FREQ=WEEKLY;UNTIL=20150808T070000Z;BYDAY=MO,WE,SA	\N	\N	f
110	2015-06-08 07:00:00	2015-06-08 08:00:00	Петров	1	56	2015-06-17 10:18:50.448687	2015-06-17 10:18:50.448687	FREQ=WEEKLY;UNTIL=20150808T070000Z;BYDAY=MO,WE,SA	\N	\N	f
112	2015-06-08 07:00:00	2015-06-08 08:00:00	Петров	1	56	2015-06-17 10:19:06.558918	2015-06-17 10:19:06.558918	FREQ=WEEKLY;UNTIL=20150808T070000Z;BYDAY=MO,WE,SA	\N	\N	f
113	2015-06-08 07:00:00	2015-06-08 08:00:00	Петров	1	56	2015-06-17 10:19:06.913386	2015-06-17 10:19:06.913386	FREQ=WEEKLY;UNTIL=20150808T070000Z;BYDAY=MO,WE,SA	\N	\N	f
115	2015-06-08 07:00:00	2015-06-08 08:00:00	Петров	1	56	2015-06-17 10:19:07.26336	2015-06-17 10:19:07.26336	FREQ=WEEKLY;UNTIL=20150808T070000Z;BYDAY=MO,WE,SA	\N	\N	f
116	2015-06-08 07:00:00	2015-06-08 08:00:00	Петров	1	56	2015-06-17 10:19:07.450384	2015-06-17 10:19:07.450384	FREQ=WEEKLY;UNTIL=20150808T070000Z;BYDAY=MO,WE,SA	\N	\N	f
120	2015-06-15 08:00:00	2015-06-15 09:00:00	\N	5	58	2015-06-17 10:47:50.180321	2015-06-17 10:47:50.180321	\N	\N	\N	f
121	2015-06-15 08:00:00	2015-06-15 09:00:00	\N	5	58	2015-06-17 10:47:56.843334	2015-06-17 10:47:56.843334	\N	\N	\N	f
122	2015-06-15 08:00:00	2015-06-15 09:00:00	123	5	58	2015-06-17 10:47:59.945236	2015-06-17 10:47:59.945236	\N	\N	\N	f
123	2015-06-23 07:00:00	2015-06-23 08:00:00	\N	5	58	2015-06-17 10:49:30.265247	2015-06-17 10:49:30.265247	\N	\N	\N	f
125	2015-06-16 07:30:00	2015-06-16 10:00:00	\N	5	58	2015-06-17 10:52:20.243201	2015-06-17 10:52:20.243201	\N	\N	\N	f
127	2015-06-23 19:00:00	2015-06-23 21:00:00	TestCustomer@tennis.ru	5	59	2015-06-17 10:54:59.475502	2015-06-17 10:55:11.834777			\N	f
128	2015-06-15 08:00:00	2015-06-15 09:00:00	\N	5	60	2015-06-17 10:57:41.408321	2015-06-17 10:57:41.408321	FREQ=DAILY;COUNT=6	\N	\N	f
129	2015-06-16 10:00:00	2015-06-16 10:30:00	\N	1	61	2015-06-18 12:20:47.455874	2015-06-18 12:20:47.455874	\N	\N	\N	f
132	2015-06-17 12:00:00	2015-06-17 13:00:00	иванов	1	64	2015-06-18 12:30:36.376457	2015-06-18 12:30:36.376457	\N	\N	\N	f
135	2015-07-08 08:30:00	2015-07-08 09:30:00	\N	5	67	2015-07-06 14:41:23.579493	2015-07-06 14:41:23.579493	\N	\N	\N	f
137	2015-07-08 10:00:00	2015-07-08 11:00:00	1	5	67	2015-07-06 14:44:38.880737	2015-07-06 14:44:38.880737	\N	\N	\N	f
\.


--
-- Name: events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tennis_rails
--

SELECT pg_catalog.setval('events_id_seq', 138, true);


--
-- Data for Name: options; Type: TABLE DATA; Schema: public; Owner: tennis_rails
--

COPY options (id, tax, created_at, updated_at, feedback_email) FROM stdin;
1	5	2015-05-29 21:16:55.226331	2015-05-29 21:17:25.592716	mibus32@gmail.com
\.


--
-- Name: options_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tennis_rails
--

SELECT pg_catalog.setval('options_id_seq', 1, true);


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: tennis_rails
--

COPY orders (id, user_id, total, status, created_at, updated_at, stadium_id, comment, coach_id) FROM stdin;
2	2	\N	\N	2015-04-24 13:19:00.905787	2015-04-24 13:19:00.905787	\N	\N	\N
3	2	\N	\N	2015-04-25 06:47:49.570509	2015-04-25 06:47:49.570509	\N	\N	\N
4	2	\N	\N	2015-04-25 13:03:37.427965	2015-04-25 13:03:37.427965	\N	\N	\N
5	5	\N	\N	2015-04-25 13:25:06.350823	2015-04-25 13:25:06.350823	\N	\N	\N
6	5	\N	\N	2015-04-25 13:27:37.242616	2015-04-25 13:27:37.242616	\N	\N	\N
8	2	\N	1	2015-04-28 18:01:35.698025	2015-05-03 19:27:45.126581	\N	\N	\N
9	2	\N	1	2015-05-03 19:30:02.999835	2015-05-05 08:12:11.065162	\N	\N	\N
12	2	\N	1	2015-05-11 13:42:19.600452	2015-05-12 11:25:17.298018	\N	\N	\N
14	8	\N	1	2015-05-21 17:57:01.540696	2015-05-21 18:12:10.020137	\N	\N	\N
15	2	\N	0	2015-05-22 13:11:18.033272	2015-05-22 13:11:18.033272	\N	\N	\N
16	8	\N	0	2015-05-22 13:17:32.937303	2015-05-22 13:17:32.937303	\N	\N	\N
17	5	\N	0	2015-05-25 09:02:42.627592	2015-05-25 09:02:42.627592	\N	\N	\N
20	2	\N	1	2015-05-30 08:18:08.452425	2015-05-30 08:18:08.452425	\N	\N	\N
21	2	\N	0	2015-05-30 08:20:38.239455	2015-05-30 08:20:38.239455	2	\N	\N
24	12	\N	0	2015-05-30 16:07:39.891615	2015-05-30 16:07:39.891615	\N	\N	\N
26	5	\N	1	2015-05-31 08:50:10.748011	2015-05-31 08:50:10.748011	\N	\N	\N
27	5	\N	1	2015-05-31 08:50:39.748497	2015-05-31 08:50:39.748497	\N	\N	\N
28	5	\N	1	2015-05-31 08:55:50.065695	2015-05-31 08:55:50.065695	\N	\N	\N
29	3	\N	1	2015-05-31 09:03:10.709709	2015-05-31 09:03:10.709709	\N	\N	\N
31	5	\N	1	2015-05-31 09:25:45.541137	2015-05-31 09:25:45.541137	\N	\N	\N
32	5	\N	1	2015-05-31 09:26:07.551753	2015-05-31 09:26:07.551753	\N	\N	\N
33	2	\N	1	2015-06-05 11:30:56.789516	2015-06-05 11:30:56.789516	\N	\N	\N
34	2	\N	1	2015-06-05 11:31:29.851211	2015-06-05 11:31:29.851211	\N	\N	\N
35	2	\N	1	2015-06-05 11:35:28.461945	2015-06-05 11:35:28.461945	\N	\N	\N
36	2	\N	1	2015-06-05 11:36:49.462231	2015-06-05 11:36:49.462231	\N	\N	\N
37	2	\N	1	2015-06-14 10:58:07.537599	2015-06-14 10:58:07.537599	\N	\N	\N
38	2	\N	1	2015-06-14 11:00:10.064525	2015-06-14 11:00:10.064525	\N	\N	\N
39	2	\N	1	2015-06-14 11:01:41.839319	2015-06-14 11:01:41.839319	\N	\N	\N
40	2	\N	1	2015-06-14 11:02:09.879758	2015-06-14 11:02:09.879758	\N	\N	\N
41	2	\N	1	2015-06-15 08:05:00.482365	2015-06-15 08:05:00.482365	\N	\N	\N
42	18	\N	1	2015-06-15 12:04:57.486242	2015-06-15 12:04:57.486242	\N	\N	\N
43	18	\N	1	2015-06-15 12:05:25.158674	2015-06-15 12:05:25.158674	\N	\N	\N
45	18	\N	0	2015-06-15 13:36:17.156248	2015-06-15 13:36:17.156248	2	\N	18
48	1	\N	0	2015-06-15 15:23:49.922493	2015-06-15 15:23:49.922493	1	\N	\N
49	4	\N	1	2015-06-15 18:26:28.328174	2015-06-15 19:30:54.355474	2	\N	18
54	20	\N	1	2015-06-16 14:30:45.026859	2015-06-16 14:30:45.026859	\N	\N	\N
55	20	\N	1	2015-06-16 14:31:12.252639	2015-06-16 14:31:12.252639	\N	\N	\N
56	3	\N	0	2015-06-17 10:18:37.742045	2015-06-17 10:18:37.742045	1	\N	\N
58	20	\N	0	2015-06-17 10:47:14.062977	2015-06-17 10:47:14.062977	7	\N	\N
60	4	\N	1	2015-06-17 10:57:41.394994	2015-06-17 10:58:04.940855	7	\N	\N
59	4	\N	3	2015-06-17 10:54:59.461462	2015-06-17 11:12:15.514903	7	свяжитесь с менежжером для уточнения даты переноса	\N
61	2	\N	1	2015-06-18 12:20:47.451163	2015-06-18 12:20:47.451163	\N	\N	\N
62	2	\N	1	2015-06-18 12:21:28.679387	2015-06-18 12:21:28.679387	\N	\N	\N
63	2	\N	1	2015-06-18 12:26:44.530876	2015-06-18 12:26:44.530876	\N	\N	\N
64	2	\N	1	2015-06-18 12:30:36.371933	2015-06-18 12:30:36.371933	\N	\N	\N
65	2	\N	0	2015-06-18 12:43:06.730229	2015-06-18 12:43:06.730229	7	\N	21
66	1	\N	0	2015-07-01 03:37:43.715026	2015-07-01 03:37:43.715026	7	\N	\N
67	24	\N	0	2015-07-06 14:41:23.549438	2015-07-06 14:41:23.549438	7	\N	\N
\.


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tennis_rails
--

SELECT pg_catalog.setval('orders_id_seq', 67, true);


--
-- Data for Name: pictures; Type: TABLE DATA; Schema: public; Owner: tennis_rails
--

COPY pictures (id, name, imageable_id, imageable_type, created_at, updated_at) FROM stdin;
3	______________2015-05-08___14.20.28.png	2	Stadium	2015-05-30 13:22:05.143829	2015-05-30 13:22:05.143829
4	Lokomotiv_Stadium_1.jpg	1	Stadium	2015-05-30 13:41:28.415776	2015-05-30 13:41:28.415776
5	photo_4693_7441381.jpg	1	Stadium	2015-05-30 13:42:09.078839	2015-05-30 13:42:09.078839
6	1434122151000.jpg	7	Stadium	2015-06-16 14:00:37.391193	2015-06-16 14:00:37.391193
7	IMG_20150529_122551.jpg	7	Stadium	2015-06-16 14:01:00.448918	2015-06-16 14:01:00.448918
8	1434122151000.jpg	7	Stadium	2015-06-16 14:28:38.769657	2015-06-16 14:28:38.769657
\.


--
-- Name: pictures_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tennis_rails
--

SELECT pg_catalog.setval('pictures_id_seq', 8, true);


--
-- Data for Name: reviews; Type: TABLE DATA; Schema: public; Owner: tennis_rails
--

COPY reviews (id, reviewable_id, reviewable_type, text, user_id, verified, created_at, updated_at, rating) FROM stdin;
1	2	Stadium	test	4	\N	2015-05-30 08:01:31.09247	2015-05-30 08:01:31.09247	4
\.


--
-- Name: reviews_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tennis_rails
--

SELECT pg_catalog.setval('reviews_id_seq', 1, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: tennis_rails
--

COPY schema_migrations (version) FROM stdin;
20150421162930
20150410203706
20150420080906
20150420082750
20150410203656
20150420082134
20150412093819
20150410203652
20150421101209
20150420104622
20150421003520
20150411210358
20150420132301
20150421120853
20150424182724
20150425095104
20150425114652
20150427064405
20150427142445
20150428140227
20150501203255
20150501204355
20150502195348
20150502195418
20150502195444
20150502195745
20150502200529
20150506112139
20150511083454
20150511083531
20150511083834
20150511084920
20150511084950
20150511093703
20150512084958
20150512095327
20150518120610
20150520104606
20150520105042
20150520140350
20150520161358
20150520161535
20150521085332
20150521152451
20150521154723
20150528083751
20150528084357
20150528092730
20150528130548
20150528131214
20150529170826
20150529193344
20150529200152
20150529204616
20150529205121
20150530114212
20150530114257
20150531071345
20150629190403
\.


--
-- Data for Name: special_prices; Type: TABLE DATA; Schema: public; Owner: tennis_rails
--

COPY special_prices (id, start, "end", price, is_sale, court_id, created_at, updated_at) FROM stdin;
1	2015-05-01 09:30:00	2015-11-30 22:00:00	2100	t	4	2015-05-30 16:26:29.976631	2015-05-30 16:27:09.573931
2	2015-05-30 16:00:00	2015-05-30 17:00:00	1000	t	4	2015-05-30 16:27:35.902191	2015-05-30 16:27:35.902191
3	2015-06-16 07:00:00	2015-07-16 09:00:00	500	t	5	2015-06-16 14:10:14.096012	2015-06-16 14:12:48.092823
5	2015-06-16 17:00:00	2015-06-16 21:00:00	900	f	5	2015-06-16 14:14:06.932718	2015-06-16 14:14:06.932718
4	2015-06-16 09:00:00	2015-06-16 17:00:00	700	f	5	2015-06-16 14:13:23.826652	2015-06-17 10:43:39.044569
\.


--
-- Name: special_prices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tennis_rails
--

SELECT pg_catalog.setval('special_prices_id_seq', 5, true);


--
-- Data for Name: stadia; Type: TABLE DATA; Schema: public; Owner: tennis_rails
--

COPY stadia (id, category_id, user_id, name, phone, description, created_at, updated_at) FROM stdin;
\.


--
-- Name: stadia_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tennis_rails
--

SELECT pg_catalog.setval('stadia_id_seq', 1, false);


--
-- Data for Name: stadiums; Type: TABLE DATA; Schema: public; Owner: tennis_rails
--

COPY stadiums (id, category_id, user_id, name, phone, description, created_at, updated_at, address, latitude, longitude, slug, status) FROM stdin;
2	2	5	Локомотив	+7(494)123-45-67	«Локомотив» - стадион чисто футбольный. Никаких беговых дорожек между полем и трибунами, только глубокий трехметровый ров. Он сделан для того, чтобы службам правопорядка не нужно было занимать несколько нижних рядов. Кстати, расстояние между рядами увеличено для удобства болельщиков.	2015-04-22 08:45:05.520193	2015-05-30 14:15:05.336941	Гольяновская улица, 2 строение 1, Москва, Россия, 105094	55.7758006426131345	37.7040749788284302	lokomotiv	1
1	2	2	Арена "Открытие"	+7(495)123-45-67	«Открытие Арена» — стадион в Москве в районе Покровское-Стрешнево, домашний стадион футбольного клуба «Спартак». Вместимость стадиона — 45 000 человек. Включён в список объектов, на которых пройдёт чемпионат мира по футболу 2018 года.	2015-04-21 20:17:19.402316	2015-06-06 17:11:00.293743	Кадашевская набережная, 32/2 строение 10, Москва, Россия, 115035	55.744690134914741	37.6236913198954426	arena-otkrytie	1
7	3	20	сербор	+7(985)444-48-45	открытый грунтовый корт	2015-06-16 13:56:13.825812	2015-06-17 10:40:48.311557	4-я Хорошевского Серебряного Бора линия, 19 корпус 5, Москва, Россия, 121614	55.776889355372667	37.4141001887619495	serbor	1
10	\N	\N	\N	\N	\N	2015-06-22 15:39:41.96527	2015-06-22 15:39:41.96527	\N	55.75	37.6099999999999994	\N	0
11	\N	25	\N	\N	\N	2015-06-22 15:39:42.155721	2015-06-22 15:39:42.155721	\N	55.75	37.6099999999999994	\N	0
12	\N	24	\N	\N	\N	2015-06-22 15:59:59.940277	2015-06-22 15:59:59.940277	\N	55.75	37.6099999999999994	\N	0
\.


--
-- Name: stadiums_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tennis_rails
--

SELECT pg_catalog.setval('stadiums_id_seq', 12, true);


--
-- Data for Name: static_pages; Type: TABLE DATA; Schema: public; Owner: tennis_rails
--

COPY static_pages (id, text, title, created_at, updated_at, slug) FROM stdin;
2	О нашем проекте	О сайте	2015-05-30 13:23:35.761531	2015-05-30 13:23:35.761531	o-sayte
3	Контактная форма для связи с нами	Обратная связь	2015-05-30 13:23:58.082376	2015-05-30 13:23:58.082376	obratnaya-svyaz
1	Информация о нас	О нас	2015-05-29 21:17:08.652618	2015-05-30 14:13:28.232631	o-nas
\.


--
-- Name: static_pages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tennis_rails
--

SELECT pg_catalog.setval('static_pages_id_seq', 4, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: tennis_rails
--

COPY users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at, name, role, type, slug, price, avatar, status, phone) FROM stdin;
28	iakovlev_vadim@gmail.com	$2a$10$TV3e3/DyuHXccVii0PVol.iqA7MrT79VmSWHKNrLFPUKDwVBMye5q	\N	\N	\N	1	2015-07-06 15:05:56.537405	2015-07-06 15:05:56.537405	83.220.239.210	83.220.239.210	2015-07-06 15:05:56.523965	2015-07-06 15:05:56.540952	\N	\N	Coach	\N	0.00	\N	\N	\N
8	mibus33@gmail.com	$2a$10$P0Tgpqm8e7Jrnqc1EDDSg.sRezHIeNDKr3AU55VNWEicyFq30Twza	\N	\N	\N	3	2015-06-15 07:19:10.824558	2015-05-22 13:17:21.253224	109.188.124.3	109.188.127.4	2015-05-21 17:52:12.549113	2015-06-15 07:19:10.831452	\N	\N	Customer	\N	0.00	\N	\N	\N
12	my@mail.ru	$2a$10$Yj86ShwFADrYnxKs/0LHyetUgpuD6Jepxknfmlwp/9aDqKWIKHDie	\N	\N	\N	1	2015-05-30 16:04:18.960053	2015-05-30 16:04:18.960053	79.104.6.172	79.104.6.172	2015-05-30 16:04:18.920729	2015-05-30 16:04:18.961839	\N	\N	Customer	\N	0.00	\N	\N	\N
27	silverdjr2015@mail.ru	$2a$10$iEB6zNwTcG5vQIuuOElAoub3E38AACbPs95v2d8pf2EgyekVRSVHO	\N	\N	\N	1	2015-07-03 04:03:43.468131	2015-07-03 04:03:43.468131	178.140.153.8	178.140.153.8	2015-07-03 04:03:43.452613	2015-07-03 04:03:43.46983	\N	\N	Customer	\N	0.00	\N	\N	\N
13	testonline2014@mail.ru	$2a$10$Rg24sD0Gt9s0X3agneXvguU3GzuUbHOW/nfB9Q5ht4Cx4nkrlz3pS	\N	\N	\N	1	2015-06-01 09:53:57.614437	2015-06-01 09:53:57.614437	89.106.175.186	89.106.175.186	2015-06-01 09:53:57.555095	2015-06-01 09:53:57.616587	\N	\N	Customer	\N	0.00	\N	\N	\N
14	dum12@yandex.ru	$2a$10$YgTTte5Cqytj5LFyTuPSUe62GhMurmSWwqib23sfL/We9QyzZ4nM6	\N	\N	\N	1	2015-06-01 10:56:50.431623	2015-06-01 10:56:50.431623	85.143.106.103	85.143.106.103	2015-06-01 10:56:50.41894	2015-06-01 10:56:50.433869	\N	\N	Customer	\N	0.00	\N	\N	\N
1	admin@tennis.ru	$2a$10$EUIVKj0lpf4T13fi2bG4NeIbj.jNDgcrisExDteUOiboW0W52eG8S	\N	\N	\N	38	2015-07-06 16:31:56.658106	2015-07-06 16:28:50.710618	83.220.238.15	83.220.238.15	2015-04-21 20:17:18.746536	2015-07-06 16:31:56.661642	\N	\N	Admin	\N	0.00	\N	\N	\N
26	iakovlev.vadim@opentennis.ru	$2a$10$iH57kT4GsxmykDh5vKMMW.HQUU6.GdWHlUec5jyuXxZfNK3RGsdzy	\N	\N	\N	1	2015-06-24 13:36:38.942762	2015-06-24 13:36:38.942762	77.236.234.250	77.236.234.250	2015-06-24 13:36:38.904437	2015-06-24 13:36:38.944552	\N	\N	Customer	\N	0.00	\N	\N	\N
3	testcoach@tennis.ru	$2a$10$PJqLHSqm47MZhGnEpUB3COHtK2sK9eC.xuFn5YBvUxey03zOMqhjG	\N	\N	\N	15	2015-06-17 10:16:28.042929	2015-06-11 10:53:04.567367	77.236.234.250	85.21.143.191	2015-04-21 20:17:19.096418	2015-06-17 10:19:37.29516	Супер тренер	\N	Coach	trener-3	800.00	______________2015-05-19___11.16.16.png	\N	\N
25	silverbor@mail.ru	$2a$10$Lx9L7KOr0E73Awgvt0mlh.54UnNKi6H/E0hneXGKm.wO1hKVFnffq	\N	\N	\N	3	2015-07-01 02:08:15.547765	2015-06-22 15:46:10.12093	178.140.153.8	195.189.120.16	2015-06-22 15:39:42.004015	2015-07-01 02:08:15.55385	\N	\N	StadiumUser	\N	0.00	\N	\N	\N
5	mibus32@gmail.com	$2a$10$85bzW491pvtntU2oo1Ugi.Ob.emhuG0J7JdIwk/LsPUJKs1myPkCC	\N	\N	\N	7	2015-06-10 15:24:48.733555	2015-05-31 08:49:53.847967	109.188.124.19	109.188.126.45	2015-04-22 08:44:04.251623	2015-06-10 15:24:48.736924	\N	\N	StadiumUser	\N	0.00	\N	\N	\N
21	iakovlev.trener@gmail.com	$2a$10$11UMKDz.tIKTegUWIHNu/u9NSE1yGyjLJlFHVjeODnQwrV7v2hjPq	\N	\N	\N	3	2015-06-18 12:52:42.91152	2015-06-18 12:51:50.901946	37.110.8.16	37.110.8.16	2015-06-16 14:03:54.410245	2015-06-18 12:53:49.523277	Яковлев Вадим	\N	Coach	yakovlev-vadim	2000.00	\N	\N	+7(905)534-34-00
22	mail@mail.ru	$2a$10$WfoT05iF1tPa6klTSYWc7e9r1PX2BeyoOAvYnqEhH.WspmZtfRi.O	\N	\N	\N	1	2015-06-17 10:22:35.201517	2015-06-17 10:22:35.201517	77.236.234.250	77.236.234.250	2015-06-17 10:22:35.1808	2015-06-17 10:22:35.203492	\N	\N	Customer	\N	0.00	\N	\N	\N
18	iakovlev.vadim@gmail.com	$2a$10$d0no3VVOrlut/XaPfT/PduW3OKU7CtYlufvWE.qNp8As4eJSCr.3y	64b4be58f35c1797c2b47f17820ee8da2561219f34611c12eb7ce8ceecda862c	2015-06-28 09:25:06.407573	\N	8	2015-07-01 02:13:28.574207	2015-06-22 13:22:27.374149	178.140.153.8	77.236.234.250	2015-06-15 11:58:38.250368	2015-07-01 02:13:28.579917	Вадим Яковлев	\N	Coach	trener-18	2000.00	vadim.jpg	\N	+79055343400
20	trener.yakovlev@opentennis.ru	$2a$10$31AkM2LIARRr9VwH6f.7O.zHXxqla7t.VzfD1eYhAduVPoJOZ2FCe	\N	\N	\N	4	2015-06-17 11:11:36.777104	2015-06-17 11:08:34.128002	77.236.234.250	77.236.234.250	2015-06-16 13:55:59.102066	2015-06-17 11:11:36.780303		\N	StadiumUser	13aae819-c1fd-4287-9a8d-a5b6ae56871f	0.00	\N	\N	
4	testcustomer@tennis.ru	$2a$10$Q/VluNaZwbLEAjZTKP/dj.pdyHH3wYFD6VrqWSX7cBLwLQiDtl/kG	\N	\N	\N	35	2015-06-17 16:24:49.717088	2015-06-17 13:27:29.378658	158.181.253.178	85.21.143.191	2015-04-21 20:17:19.265399	2015-06-17 16:24:49.721332	TestCustomer@tennis.ru	\N	Customer	testcustomer-tennis-ru	0.00	\N	\N	
24	silverbor2015@mail.ru	$2a$10$XrvScRd7./FHwAm/S70ua.uLPH2BofsiBwXNJvKIV.a2ARmIXzkfG	\N	\N	\N	5	2015-07-06 14:40:30.440528	2015-07-05 05:18:01.728641	83.220.237.69	83.220.238.33	2015-06-22 13:17:06.464739	2015-07-06 14:50:46.971571	\N	\N	StadiumUser	\N	0.00	\N	\N	\N
2	tennisradar@tennis.ru	$2a$10$fegBnqM2QunUq5kX1qpb8eIi9hMfXOdy/sIKZH59D9pL/G3siqC2e	\N	\N	\N	48	2015-07-01 18:23:22.980255	2015-06-18 12:28:50.444194	109.188.124.13	37.110.8.16	2015-04-21 20:17:18.939844	2015-07-01 18:23:22.98311	\N	\N	StadiumUser	\N	0.00	\N	\N	\N
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tennis_rails
--

SELECT pg_catalog.setval('users_id_seq', 28, true);


--
-- Data for Name: wallets; Type: TABLE DATA; Schema: public; Owner: tennis_rails
--

COPY wallets (id, user_id, created_at, updated_at) FROM stdin;
1	1	2015-04-21 20:17:18.777336	2015-04-21 20:17:18.777336
3	3	2015-04-21 20:17:19.099426	2015-04-21 20:17:19.099426
27	27	2015-07-03 04:03:43.460359	2015-07-03 04:03:43.460359
28	28	2015-07-06 15:05:56.530199	2015-07-06 15:05:56.530199
4	4	2015-04-21 20:17:19.269365	2015-05-04 19:07:16.110123
2	2	2015-04-21 20:17:18.943028	2015-05-05 08:12:11.054131
5	5	2015-04-22 08:44:04.274535	2015-05-05 08:12:11.060573
8	8	2015-05-21 17:52:12.603226	2015-05-21 17:52:12.603226
12	12	2015-05-30 16:04:18.935827	2015-05-30 16:04:18.935827
13	13	2015-06-01 09:53:57.582825	2015-06-01 09:53:57.582825
14	14	2015-06-01 10:56:50.424688	2015-06-01 10:56:50.424688
18	18	2015-06-15 11:58:38.255584	2015-06-15 11:58:38.255584
20	20	2015-06-16 13:55:59.106164	2015-06-16 13:55:59.106164
21	21	2015-06-16 14:03:54.415959	2015-06-16 14:03:54.415959
22	22	2015-06-17 10:22:35.190171	2015-06-17 10:22:35.190171
24	24	2015-06-22 13:17:06.471045	2015-06-22 13:17:06.471045
25	25	2015-06-22 15:39:42.016103	2015-06-22 15:39:42.016103
26	26	2015-06-24 13:36:38.925314	2015-06-24 13:36:38.925314
\.


--
-- Name: wallets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tennis_rails
--

SELECT pg_catalog.setval('wallets_id_seq', 28, true);


--
-- Data for Name: withdrawal_requests; Type: TABLE DATA; Schema: public; Owner: tennis_rails
--

COPY withdrawal_requests (id, wallet_id, status, amount, data, created_at, updated_at) FROM stdin;
\.


--
-- Name: withdrawal_requests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tennis_rails
--

SELECT pg_catalog.setval('withdrawal_requests_id_seq', 1, false);


--
-- Data for Name: withdrawals; Type: TABLE DATA; Schema: public; Owner: tennis_rails
--

COPY withdrawals (id, wallet_id, status, amount, created_at, updated_at) FROM stdin;
1	2	\N	815.00	2015-05-12 11:25:17.264864	2015-05-12 11:25:17.264864
2	8	\N	7200.00	2015-05-21 18:12:09.940353	2015-05-21 18:12:09.940353
3	4	\N	4000.00	2015-05-25 09:15:54.761889	2015-05-25 09:15:54.761889
4	4	\N	2000.00	2015-05-25 09:15:54.801632	2015-05-25 09:15:54.801632
5	4	\N	3300.00	2015-05-31 07:00:08.785547	2015-05-31 07:00:08.785547
6	4	\N	3300.00	2015-05-31 07:00:08.920751	2015-05-31 07:00:08.920751
7	4	\N	825.00	2015-05-31 09:05:32.896674	2015-05-31 09:05:32.896674
8	4	\N	6000.00	2015-06-15 19:30:54.170691	2015-06-15 19:30:54.170691
9	4	\N	12000.00	2015-06-15 19:30:54.304855	2015-06-15 19:30:54.304855
10	4	\N	2000.00	2015-06-17 10:56:35.415072	2015-06-17 10:56:35.415072
11	4	\N	3000.00	2015-06-17 10:58:04.867688	2015-06-17 10:58:04.867688
\.


--
-- Name: withdrawals_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tennis_rails
--

SELECT pg_catalog.setval('withdrawals_id_seq', 11, true);


--
-- Name: additional_event_items_pkey; Type: CONSTRAINT; Schema: public; Owner: tennis_rails; Tablespace: 
--

ALTER TABLE ONLY additional_event_items
    ADD CONSTRAINT additional_event_items_pkey PRIMARY KEY (id);


--
-- Name: categories_pkey; Type: CONSTRAINT; Schema: public; Owner: tennis_rails; Tablespace: 
--

ALTER TABLE ONLY categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: coach_profiles_pkey; Type: CONSTRAINT; Schema: public; Owner: tennis_rails; Tablespace: 
--

ALTER TABLE ONLY coach_profiles
    ADD CONSTRAINT coach_profiles_pkey PRIMARY KEY (id);


--
-- Name: coaches_courts_pkey; Type: CONSTRAINT; Schema: public; Owner: tennis_rails; Tablespace: 
--

ALTER TABLE ONLY coaches_courts
    ADD CONSTRAINT coaches_courts_pkey PRIMARY KEY (id);


--
-- Name: courts_pkey; Type: CONSTRAINT; Schema: public; Owner: tennis_rails; Tablespace: 
--

ALTER TABLE ONLY courts
    ADD CONSTRAINT courts_pkey PRIMARY KEY (id);


--
-- Name: deposit_requests_pkey; Type: CONSTRAINT; Schema: public; Owner: tennis_rails; Tablespace: 
--

ALTER TABLE ONLY deposit_requests
    ADD CONSTRAINT deposit_requests_pkey PRIMARY KEY (id);


--
-- Name: deposit_responses_pkey; Type: CONSTRAINT; Schema: public; Owner: tennis_rails; Tablespace: 
--

ALTER TABLE ONLY deposit_responses
    ADD CONSTRAINT deposit_responses_pkey PRIMARY KEY (id);


--
-- Name: deposits_pkey; Type: CONSTRAINT; Schema: public; Owner: tennis_rails; Tablespace: 
--

ALTER TABLE ONLY deposits
    ADD CONSTRAINT deposits_pkey PRIMARY KEY (id);


--
-- Name: event_changes_pkey; Type: CONSTRAINT; Schema: public; Owner: tennis_rails; Tablespace: 
--

ALTER TABLE ONLY event_changes
    ADD CONSTRAINT event_changes_pkey PRIMARY KEY (id);


--
-- Name: events_pkey; Type: CONSTRAINT; Schema: public; Owner: tennis_rails; Tablespace: 
--

ALTER TABLE ONLY events
    ADD CONSTRAINT events_pkey PRIMARY KEY (id);


--
-- Name: options_pkey; Type: CONSTRAINT; Schema: public; Owner: tennis_rails; Tablespace: 
--

ALTER TABLE ONLY options
    ADD CONSTRAINT options_pkey PRIMARY KEY (id);


--
-- Name: orders_pkey; Type: CONSTRAINT; Schema: public; Owner: tennis_rails; Tablespace: 
--

ALTER TABLE ONLY orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: pictures_pkey; Type: CONSTRAINT; Schema: public; Owner: tennis_rails; Tablespace: 
--

ALTER TABLE ONLY pictures
    ADD CONSTRAINT pictures_pkey PRIMARY KEY (id);


--
-- Name: reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: tennis_rails; Tablespace: 
--

ALTER TABLE ONLY reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (id);


--
-- Name: special_prices_pkey; Type: CONSTRAINT; Schema: public; Owner: tennis_rails; Tablespace: 
--

ALTER TABLE ONLY special_prices
    ADD CONSTRAINT special_prices_pkey PRIMARY KEY (id);


--
-- Name: stadia_pkey; Type: CONSTRAINT; Schema: public; Owner: tennis_rails; Tablespace: 
--

ALTER TABLE ONLY stadia
    ADD CONSTRAINT stadia_pkey PRIMARY KEY (id);


--
-- Name: stadiums_pkey; Type: CONSTRAINT; Schema: public; Owner: tennis_rails; Tablespace: 
--

ALTER TABLE ONLY stadiums
    ADD CONSTRAINT stadiums_pkey PRIMARY KEY (id);


--
-- Name: static_pages_pkey; Type: CONSTRAINT; Schema: public; Owner: tennis_rails; Tablespace: 
--

ALTER TABLE ONLY static_pages
    ADD CONSTRAINT static_pages_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: tennis_rails; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: wallets_pkey; Type: CONSTRAINT; Schema: public; Owner: tennis_rails; Tablespace: 
--

ALTER TABLE ONLY wallets
    ADD CONSTRAINT wallets_pkey PRIMARY KEY (id);


--
-- Name: withdrawal_requests_pkey; Type: CONSTRAINT; Schema: public; Owner: tennis_rails; Tablespace: 
--

ALTER TABLE ONLY withdrawal_requests
    ADD CONSTRAINT withdrawal_requests_pkey PRIMARY KEY (id);


--
-- Name: withdrawals_pkey; Type: CONSTRAINT; Schema: public; Owner: tennis_rails; Tablespace: 
--

ALTER TABLE ONLY withdrawals
    ADD CONSTRAINT withdrawals_pkey PRIMARY KEY (id);


--
-- Name: index_additional_event_items_on_event_id; Type: INDEX; Schema: public; Owner: tennis_rails; Tablespace: 
--

CREATE INDEX index_additional_event_items_on_event_id ON additional_event_items USING btree (event_id);


--
-- Name: index_additional_event_items_on_related_type_and_related_id; Type: INDEX; Schema: public; Owner: tennis_rails; Tablespace: 
--

CREATE INDEX index_additional_event_items_on_related_type_and_related_id ON additional_event_items USING btree (related_type, related_id);


--
-- Name: index_categories_on_ancestry; Type: INDEX; Schema: public; Owner: tennis_rails; Tablespace: 
--

CREATE INDEX index_categories_on_ancestry ON categories USING btree (ancestry);


--
-- Name: index_coach_profiles_on_user_id; Type: INDEX; Schema: public; Owner: tennis_rails; Tablespace: 
--

CREATE INDEX index_coach_profiles_on_user_id ON coach_profiles USING btree (user_id);


--
-- Name: index_coaches_courts_on_coach_id; Type: INDEX; Schema: public; Owner: tennis_rails; Tablespace: 
--

CREATE INDEX index_coaches_courts_on_coach_id ON coaches_courts USING btree (coach_id);


--
-- Name: index_coaches_courts_on_court_id; Type: INDEX; Schema: public; Owner: tennis_rails; Tablespace: 
--

CREATE INDEX index_coaches_courts_on_court_id ON coaches_courts USING btree (court_id);


--
-- Name: index_courts_on_stadium_id; Type: INDEX; Schema: public; Owner: tennis_rails; Tablespace: 
--

CREATE INDEX index_courts_on_stadium_id ON courts USING btree (stadium_id);


--
-- Name: index_deposit_requests_on_wallet_id; Type: INDEX; Schema: public; Owner: tennis_rails; Tablespace: 
--

CREATE INDEX index_deposit_requests_on_wallet_id ON deposit_requests USING btree (wallet_id);


--
-- Name: index_deposit_responses_on_deposit_request_id; Type: INDEX; Schema: public; Owner: tennis_rails; Tablespace: 
--

CREATE INDEX index_deposit_responses_on_deposit_request_id ON deposit_responses USING btree (deposit_request_id);


--
-- Name: index_deposits_on_wallet_id; Type: INDEX; Schema: public; Owner: tennis_rails; Tablespace: 
--

CREATE INDEX index_deposits_on_wallet_id ON deposits USING btree (wallet_id);


--
-- Name: index_event_changes_on_event_id; Type: INDEX; Schema: public; Owner: tennis_rails; Tablespace: 
--

CREATE INDEX index_event_changes_on_event_id ON event_changes USING btree (event_id);


--
-- Name: index_event_changes_on_order_id; Type: INDEX; Schema: public; Owner: tennis_rails; Tablespace: 
--

CREATE INDEX index_event_changes_on_order_id ON event_changes USING btree (order_id);


--
-- Name: index_events_on_court_id; Type: INDEX; Schema: public; Owner: tennis_rails; Tablespace: 
--

CREATE INDEX index_events_on_court_id ON events USING btree (court_id);


--
-- Name: index_events_on_order_id; Type: INDEX; Schema: public; Owner: tennis_rails; Tablespace: 
--

CREATE INDEX index_events_on_order_id ON events USING btree (order_id);


--
-- Name: index_orders_on_coach_id; Type: INDEX; Schema: public; Owner: tennis_rails; Tablespace: 
--

CREATE INDEX index_orders_on_coach_id ON orders USING btree (coach_id);


--
-- Name: index_orders_on_stadium_id; Type: INDEX; Schema: public; Owner: tennis_rails; Tablespace: 
--

CREATE INDEX index_orders_on_stadium_id ON orders USING btree (stadium_id);


--
-- Name: index_orders_on_user_id; Type: INDEX; Schema: public; Owner: tennis_rails; Tablespace: 
--

CREATE INDEX index_orders_on_user_id ON orders USING btree (user_id);


--
-- Name: index_pictures_on_imageable_type_and_imageable_id; Type: INDEX; Schema: public; Owner: tennis_rails; Tablespace: 
--

CREATE INDEX index_pictures_on_imageable_type_and_imageable_id ON pictures USING btree (imageable_type, imageable_id);


--
-- Name: index_reviews_on_reviewable_type_and_reviewable_id; Type: INDEX; Schema: public; Owner: tennis_rails; Tablespace: 
--

CREATE INDEX index_reviews_on_reviewable_type_and_reviewable_id ON reviews USING btree (reviewable_type, reviewable_id);


--
-- Name: index_reviews_on_user_id; Type: INDEX; Schema: public; Owner: tennis_rails; Tablespace: 
--

CREATE INDEX index_reviews_on_user_id ON reviews USING btree (user_id);


--
-- Name: index_special_prices_on_court_id; Type: INDEX; Schema: public; Owner: tennis_rails; Tablespace: 
--

CREATE INDEX index_special_prices_on_court_id ON special_prices USING btree (court_id);


--
-- Name: index_stadia_on_category_id; Type: INDEX; Schema: public; Owner: tennis_rails; Tablespace: 
--

CREATE INDEX index_stadia_on_category_id ON stadia USING btree (category_id);


--
-- Name: index_stadia_on_user_id; Type: INDEX; Schema: public; Owner: tennis_rails; Tablespace: 
--

CREATE INDEX index_stadia_on_user_id ON stadia USING btree (user_id);


--
-- Name: index_stadiums_on_category_id; Type: INDEX; Schema: public; Owner: tennis_rails; Tablespace: 
--

CREATE INDEX index_stadiums_on_category_id ON stadiums USING btree (category_id);


--
-- Name: index_stadiums_on_user_id; Type: INDEX; Schema: public; Owner: tennis_rails; Tablespace: 
--

CREATE INDEX index_stadiums_on_user_id ON stadiums USING btree (user_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: tennis_rails; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: tennis_rails; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON users USING btree (reset_password_token);


--
-- Name: index_wallets_on_user_id; Type: INDEX; Schema: public; Owner: tennis_rails; Tablespace: 
--

CREATE INDEX index_wallets_on_user_id ON wallets USING btree (user_id);


--
-- Name: index_withdrawal_requests_on_wallet_id; Type: INDEX; Schema: public; Owner: tennis_rails; Tablespace: 
--

CREATE INDEX index_withdrawal_requests_on_wallet_id ON withdrawal_requests USING btree (wallet_id);


--
-- Name: index_withdrawals_on_wallet_id; Type: INDEX; Schema: public; Owner: tennis_rails; Tablespace: 
--

CREATE INDEX index_withdrawals_on_wallet_id ON withdrawals USING btree (wallet_id);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: tennis_rails; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: fk_rails_06a57fa19d; Type: FK CONSTRAINT; Schema: public; Owner: tennis_rails
--

ALTER TABLE ONLY stadia
    ADD CONSTRAINT fk_rails_06a57fa19d FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: fk_rails_0baae5ff96; Type: FK CONSTRAINT; Schema: public; Owner: tennis_rails
--

ALTER TABLE ONLY events
    ADD CONSTRAINT fk_rails_0baae5ff96 FOREIGN KEY (court_id) REFERENCES courts(id);


--
-- Name: fk_rails_0d81cebf3b; Type: FK CONSTRAINT; Schema: public; Owner: tennis_rails
--

ALTER TABLE ONLY deposit_responses
    ADD CONSTRAINT fk_rails_0d81cebf3b FOREIGN KEY (deposit_request_id) REFERENCES deposit_requests(id);


--
-- Name: fk_rails_0fa02c3e03; Type: FK CONSTRAINT; Schema: public; Owner: tennis_rails
--

ALTER TABLE ONLY events
    ADD CONSTRAINT fk_rails_0fa02c3e03 FOREIGN KEY (order_id) REFERENCES orders(id);


--
-- Name: fk_rails_47601681db; Type: FK CONSTRAINT; Schema: public; Owner: tennis_rails
--

ALTER TABLE ONLY withdrawals
    ADD CONSTRAINT fk_rails_47601681db FOREIGN KEY (wallet_id) REFERENCES wallets(id);


--
-- Name: fk_rails_48cac02f7a; Type: FK CONSTRAINT; Schema: public; Owner: tennis_rails
--

ALTER TABLE ONLY event_changes
    ADD CONSTRAINT fk_rails_48cac02f7a FOREIGN KEY (order_id) REFERENCES orders(id);


--
-- Name: fk_rails_4976c1226d; Type: FK CONSTRAINT; Schema: public; Owner: tennis_rails
--

ALTER TABLE ONLY event_changes
    ADD CONSTRAINT fk_rails_4976c1226d FOREIGN KEY (event_id) REFERENCES events(id);


--
-- Name: fk_rails_732f6628c4; Type: FK CONSTRAINT; Schema: public; Owner: tennis_rails
--

ALTER TABLE ONLY wallets
    ADD CONSTRAINT fk_rails_732f6628c4 FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: fk_rails_742dd9046f; Type: FK CONSTRAINT; Schema: public; Owner: tennis_rails
--

ALTER TABLE ONLY courts
    ADD CONSTRAINT fk_rails_742dd9046f FOREIGN KEY (stadium_id) REFERENCES stadiums(id);


--
-- Name: fk_rails_74a66bd6c5; Type: FK CONSTRAINT; Schema: public; Owner: tennis_rails
--

ALTER TABLE ONLY reviews
    ADD CONSTRAINT fk_rails_74a66bd6c5 FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: fk_rails_78d37f57aa; Type: FK CONSTRAINT; Schema: public; Owner: tennis_rails
--

ALTER TABLE ONLY withdrawal_requests
    ADD CONSTRAINT fk_rails_78d37f57aa FOREIGN KEY (wallet_id) REFERENCES wallets(id);


--
-- Name: fk_rails_7e07541d16; Type: FK CONSTRAINT; Schema: public; Owner: tennis_rails
--

ALTER TABLE ONLY orders
    ADD CONSTRAINT fk_rails_7e07541d16 FOREIGN KEY (stadium_id) REFERENCES stadiums(id);


--
-- Name: fk_rails_89435ebea0; Type: FK CONSTRAINT; Schema: public; Owner: tennis_rails
--

ALTER TABLE ONLY stadia
    ADD CONSTRAINT fk_rails_89435ebea0 FOREIGN KEY (category_id) REFERENCES categories(id);


--
-- Name: fk_rails_8dec7c825b; Type: FK CONSTRAINT; Schema: public; Owner: tennis_rails
--

ALTER TABLE ONLY coach_profiles
    ADD CONSTRAINT fk_rails_8dec7c825b FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: fk_rails_9ce3aa23de; Type: FK CONSTRAINT; Schema: public; Owner: tennis_rails
--

ALTER TABLE ONLY deposit_requests
    ADD CONSTRAINT fk_rails_9ce3aa23de FOREIGN KEY (wallet_id) REFERENCES wallets(id);


--
-- Name: fk_rails_a66e4d76c9; Type: FK CONSTRAINT; Schema: public; Owner: tennis_rails
--

ALTER TABLE ONLY additional_event_items
    ADD CONSTRAINT fk_rails_a66e4d76c9 FOREIGN KEY (event_id) REFERENCES events(id);


--
-- Name: fk_rails_b1bd5d1cc5; Type: FK CONSTRAINT; Schema: public; Owner: tennis_rails
--

ALTER TABLE ONLY stadiums
    ADD CONSTRAINT fk_rails_b1bd5d1cc5 FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: fk_rails_b6b151f474; Type: FK CONSTRAINT; Schema: public; Owner: tennis_rails
--

ALTER TABLE ONLY stadiums
    ADD CONSTRAINT fk_rails_b6b151f474 FOREIGN KEY (category_id) REFERENCES categories(id);


--
-- Name: fk_rails_f745d9178a; Type: FK CONSTRAINT; Schema: public; Owner: tennis_rails
--

ALTER TABLE ONLY special_prices
    ADD CONSTRAINT fk_rails_f745d9178a FOREIGN KEY (court_id) REFERENCES courts(id);


--
-- Name: fk_rails_f868b47f6a; Type: FK CONSTRAINT; Schema: public; Owner: tennis_rails
--

ALTER TABLE ONLY orders
    ADD CONSTRAINT fk_rails_f868b47f6a FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: fk_rails_fc6e9988d0; Type: FK CONSTRAINT; Schema: public; Owner: tennis_rails
--

ALTER TABLE ONLY deposits
    ADD CONSTRAINT fk_rails_fc6e9988d0 FOREIGN KEY (wallet_id) REFERENCES wallets(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--


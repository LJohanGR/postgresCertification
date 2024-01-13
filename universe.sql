--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    amount_of_planets integer,
    amount_of_stars integer,
    age_in_million_of_years integer NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_conections; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_conections (
    galaxy_conections_id integer NOT NULL,
    name character varying(30) NOT NULL,
    exist boolean
);


ALTER TABLE public.galaxy_conections OWNER TO freecodecamp;

--
-- Name: galaxy_conections_galaxy_conections_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_conections_galaxy_conections_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_conections_galaxy_conections_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_conections_galaxy_conections_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_conections_galaxy_conections_id_seq OWNED BY public.galaxy_conections.galaxy_conections_id;


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_id integer,
    geometric_type character varying(30),
    circumference_in_km numeric
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    has_life boolean,
    key text,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    circumference numeric,
    years integer,
    has_oxigen boolean,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: galaxy_conections galaxy_conections_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_conections ALTER COLUMN galaxy_conections_id SET DEFAULT nextval('public.galaxy_conections_galaxy_conections_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Galaxy-01', 100, NULL, 1);
INSERT INTO public.galaxy VALUES (2, 'Galaxy-02', 12, NULL, 0);
INSERT INTO public.galaxy VALUES (3, 'Galaxy-03', 5, NULL, 1);
INSERT INTO public.galaxy VALUES (4, 'Galaxy-04', 1, NULL, 0);
INSERT INTO public.galaxy VALUES (5, 'Galaxy-05', 5, NULL, 1);
INSERT INTO public.galaxy VALUES (6, 'Galaxy-06', 1, NULL, 6);


--
-- Data for Name: galaxy_conections; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_conections VALUES (1, 'a', true);
INSERT INTO public.galaxy_conections VALUES (2, 'b', false);
INSERT INTO public.galaxy_conections VALUES (3, 'c', true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'M-1', 1, NULL, NULL);
INSERT INTO public.moon VALUES (2, 'M-2', 2, NULL, NULL);
INSERT INTO public.moon VALUES (3, 'M-3', 1, NULL, NULL);
INSERT INTO public.moon VALUES (4, 'M-4', 5, NULL, NULL);
INSERT INTO public.moon VALUES (5, 'M-5', 10, NULL, NULL);
INSERT INTO public.moon VALUES (6, 'M-6', 1, NULL, NULL);
INSERT INTO public.moon VALUES (7, 'M-7', 2, NULL, NULL);
INSERT INTO public.moon VALUES (8, 'M-8', 1, NULL, NULL);
INSERT INTO public.moon VALUES (9, 'M-9', 5, NULL, NULL);
INSERT INTO public.moon VALUES (10, 'M-10', 10, NULL, NULL);
INSERT INTO public.moon VALUES (11, 'M-11', 1, NULL, NULL);
INSERT INTO public.moon VALUES (12, 'M-12', 2, NULL, NULL);
INSERT INTO public.moon VALUES (13, 'M-13', 1, NULL, NULL);
INSERT INTO public.moon VALUES (14, 'M-14', 5, NULL, NULL);
INSERT INTO public.moon VALUES (15, 'M-15', 10, NULL, NULL);
INSERT INTO public.moon VALUES (16, 'M-16', 1, NULL, NULL);
INSERT INTO public.moon VALUES (17, 'M-17', 2, NULL, NULL);
INSERT INTO public.moon VALUES (18, 'M-18', 1, NULL, NULL);
INSERT INTO public.moon VALUES (19, 'M-19', 5, NULL, NULL);
INSERT INTO public.moon VALUES (20, 'M-20', 10, NULL, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'A-1', false, NULL, 1);
INSERT INTO public.planet VALUES (2, 'B-1', true, NULL, 2);
INSERT INTO public.planet VALUES (3, 'A-2', false, NULL, 1);
INSERT INTO public.planet VALUES (4, 'B-2', true, NULL, 4);
INSERT INTO public.planet VALUES (5, 'B-4', true, NULL, 2);
INSERT INTO public.planet VALUES (6, 'A-4', false, NULL, 1);
INSERT INTO public.planet VALUES (7, 'C-2', true, NULL, 4);
INSERT INTO public.planet VALUES (8, 'B-5', true, NULL, 2);
INSERT INTO public.planet VALUES (9, 'C-1', false, NULL, 1);
INSERT INTO public.planet VALUES (10, 'D-2', true, NULL, 4);
INSERT INTO public.planet VALUES (11, 'F-5', true, NULL, 2);
INSERT INTO public.planet VALUES (12, 'C-45', false, NULL, 1);
INSERT INTO public.planet VALUES (13, 'D-1', true, NULL, 4);
INSERT INTO public.planet VALUES (14, 'F-1', true, NULL, 2);
INSERT INTO public.planet VALUES (15, 'C-4', false, NULL, 1);
INSERT INTO public.planet VALUES (16, 'D-45', true, NULL, 4);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'a', 21, 2, NULL, 1);
INSERT INTO public.star VALUES (2, 'b', 12, 3, NULL, 1);
INSERT INTO public.star VALUES (4, 'd', 5, 12, NULL, 1);
INSERT INTO public.star VALUES (6, 'f', 21, 2, NULL, 1);
INSERT INTO public.star VALUES (3, 'c', 222, 312, NULL, 2);
INSERT INTO public.star VALUES (5, 'e', 213, 23, NULL, 2);


--
-- Name: galaxy_conections_galaxy_conections_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_conections_galaxy_conections_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 16, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy_conections galaxy_conections_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_conections
    ADD CONSTRAINT galaxy_conections_pkey PRIMARY KEY (galaxy_conections_id);


--
-- Name: galaxy_conections galaxy_conections_test_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_conections
    ADD CONSTRAINT galaxy_conections_test_key UNIQUE (name);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--


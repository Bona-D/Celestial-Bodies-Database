--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
    name character varying NOT NULL,
    description text,
    age_in_millions_of_years numeric(5,2),
    distance_from_earth_in_km integer,
    number_of_stars integer,
    is_spherical boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

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
-- Name: galaxy_star_planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_star_planet (
    galaxy_star_planet_id integer NOT NULL,
    name character varying(20) NOT NULL,
    star_id integer,
    planet_id integer
);


ALTER TABLE public.galaxy_star_planet OWNER TO freecodecamp;

--
-- Name: galaxy_star_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_star_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_star_planet_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_star_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_star_planet_id_seq OWNED BY public.galaxy_star_planet.galaxy_star_planet_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying NOT NULL,
    description text,
    age_in_millions_of_years numeric(5,2),
    distance_from_earth_in_km integer,
    planet_id integer
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
    name character varying NOT NULL,
    description text,
    age_in_millions_of_years numeric(5,2),
    distance_from_earth_in_km integer,
    has_life boolean,
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
    name character varying NOT NULL,
    description text,
    age_in_millions_of_years numeric(5,2),
    distance_from_earth_in_km integer,
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
-- Name: galaxy_star_planet galaxy_star_planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_star_planet ALTER COLUMN galaxy_star_planet_id SET DEFAULT nextval('public.galaxy_star_planet_id_seq'::regclass);


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

INSERT INTO public.galaxy VALUES (1, 'galaxy1', 'G', 34.40, 12, 2000, true);
INSERT INTO public.galaxy VALUES (2, 'galaxy2', 'G', 34.40, 12, 2000, true);
INSERT INTO public.galaxy VALUES (3, 'galaxy3', 'G', 34.40, 12, 2000, true);
INSERT INTO public.galaxy VALUES (4, 'galaxy4', 'G', 34.40, 12, 2000, true);
INSERT INTO public.galaxy VALUES (5, 'galaxy5', 'G', 34.40, 12, 2000, true);
INSERT INTO public.galaxy VALUES (6, 'galaxy6', 'G', 3.40, 1, 20, false);


--
-- Data for Name: galaxy_star_planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_star_planet VALUES (4, 'G1', 2, 1);
INSERT INTO public.galaxy_star_planet VALUES (5, 'G2', 2, 1);
INSERT INTO public.galaxy_star_planet VALUES (6, 'G3', 3, 2);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'The Moon', 'We all are know', 50.00, 384400, 1);
INSERT INTO public.moon VALUES (2, 'moon2', 'M', 9.00, 9, 2);
INSERT INTO public.moon VALUES (3, 'moon3', 'M', 1.00, 1, 2);
INSERT INTO public.moon VALUES (4, 'moon4', 'M', 1.00, 1, 4);
INSERT INTO public.moon VALUES (5, 'moon5', 'M', 1.00, 1, 3);
INSERT INTO public.moon VALUES (6, 'moon6', 'M', 1.00, 1, 6);
INSERT INTO public.moon VALUES (7, 'moon7', 'M', 1.00, 1, 2);
INSERT INTO public.moon VALUES (8, 'moon8', 'M', 1.00, 1, 2);
INSERT INTO public.moon VALUES (9, 'moon9', 'M', 1.00, 1, 2);
INSERT INTO public.moon VALUES (10, 'moon10', 'M', 1.00, 1, 2);
INSERT INTO public.moon VALUES (11, 'moon11', 'M', 1.00, 1, 8);
INSERT INTO public.moon VALUES (12, 'moon12', 'M', 1.00, 1, 5);
INSERT INTO public.moon VALUES (13, 'MOON13', 'M', 123.34, 2131, 4);
INSERT INTO public.moon VALUES (14, 'MOON14', 'M', 123.34, 2131, 5);
INSERT INTO public.moon VALUES (15, 'MOON15', 'M', 123.34, 2131, 4);
INSERT INTO public.moon VALUES (16, 'MOON16', 'M', 14.00, 21, 4);
INSERT INTO public.moon VALUES (17, 'MOON17', 'M', 123.34, 2131, 4);
INSERT INTO public.moon VALUES (18, 'MOON18', 'M', 344.30, 23, 7);
INSERT INTO public.moon VALUES (19, 'MOON19', 'M', 344.30, 23, 7);
INSERT INTO public.moon VALUES (20, 'MOON20', 'M', 344.30, 23, 7);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'earth', 'Our planet', 50.00, 0, true, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 'dummy', 10.00, 10, false, 1);
INSERT INTO public.planet VALUES (3, 'planet3', 'dummy', 1.00, 1, false, 1);
INSERT INTO public.planet VALUES (4, 'planet4', 'dummy', 1.00, 1, false, 1);
INSERT INTO public.planet VALUES (6, 'planet6', 'dummy', 1.00, 1, true, 1);
INSERT INTO public.planet VALUES (7, 'planet7', 'dummy', 1.00, 1, true, 1);
INSERT INTO public.planet VALUES (8, 'planet8', 'dummy', 1.00, 1, false, 1);
INSERT INTO public.planet VALUES (9, 'planet9', 'dummy', 1.00, 1, true, 1);
INSERT INTO public.planet VALUES (10, 'planet10', 'dummy', 1.00, 1, true, 1);
INSERT INTO public.planet VALUES (11, 'planet11', 'dummy', 1.00, 1, true, 1);
INSERT INTO public.planet VALUES (12, 'planet12', 'dummy', 1.00, 1, false, 1);
INSERT INTO public.planet VALUES (5, 'planet5', 'dummy', 1.00, 1, true, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'star1', 'S', 23.40, 4, 2);
INSERT INTO public.star VALUES (2, 'star2', 'S', 23.40, 4, 2);
INSERT INTO public.star VALUES (3, 'star3', 'S', 23.40, 4, 2);
INSERT INTO public.star VALUES (4, 'star4', 'S', 23.40, 4, 2);
INSERT INTO public.star VALUES (5, 'star5', 'S', 23.40, 4, 1);
INSERT INTO public.star VALUES (6, 'star6', 'S', 23.40, 4, 1);
INSERT INTO public.star VALUES (7, 'star7', 'S', 23.40, 4, 2);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: galaxy_star_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_star_planet_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 14, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


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
-- Name: galaxy_star_planet galaxy_star_planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_star_planet
    ADD CONSTRAINT galaxy_star_planet_name_key UNIQUE (name);


--
-- Name: galaxy_star_planet galaxy_star_planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_star_planet
    ADD CONSTRAINT galaxy_star_planet_pkey PRIMARY KEY (galaxy_star_planet_id);


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


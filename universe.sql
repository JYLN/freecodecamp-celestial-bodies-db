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
    name character varying(50) NOT NULL,
    visible_by_naked_eye boolean NOT NULL,
    constellation text,
    discovery_year integer
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
-- Name: galaxy_more_info; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_more_info (
    galaxy_more_info_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    designation text,
    distance_from_earth_in_mly numeric(5,2)
);


ALTER TABLE public.galaxy_more_info OWNER TO freecodecamp;

--
-- Name: galaxy_more_info_galaxy_more_info_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_more_info_galaxy_more_info_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_more_info_galaxy_more_info_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_more_info_galaxy_more_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_more_info_galaxy_more_info_id_seq OWNED BY public.galaxy_more_info.galaxy_more_info_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    planet_id integer NOT NULL,
    is_spherical boolean,
    time_to_orbit_in_hrs numeric(7,2)
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
    name character varying(50) NOT NULL,
    star_id integer NOT NULL,
    mass_in_earth_mass integer,
    type text
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
    name character varying(50) NOT NULL,
    galaxy_id integer NOT NULL,
    age_in_myr integer,
    temp_in_kelvin integer
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
-- Name: galaxy_more_info galaxy_more_info_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_more_info ALTER COLUMN galaxy_more_info_id SET DEFAULT nextval('public.galaxy_more_info_galaxy_more_info_id_seq'::regclass);


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

INSERT INTO public.galaxy VALUES (1, 'Andromeda', true, 'Andromeda', 964);
INSERT INTO public.galaxy VALUES (2, 'Triangulum', true, 'Triangulum', 1600);
INSERT INTO public.galaxy VALUES (3, 'Whirlpool', false, 'Canes Venatici', 1773);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', false, 'Virgo', 1781);
INSERT INTO public.galaxy VALUES (5, 'Cigar', false, 'Ursa Major', 1774);
INSERT INTO public.galaxy VALUES (6, 'Large Magellanic Cloud', true, 'Dorado', NULL);


--
-- Data for Name: galaxy_more_info; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_more_info VALUES (1, 1, 'Andromeda', 'M31', 2.54);
INSERT INTO public.galaxy_more_info VALUES (2, 2, 'Triangulum', 'M33', 2.73);
INSERT INTO public.galaxy_more_info VALUES (3, 3, 'Whirlpool', 'M51', 23.00);
INSERT INTO public.galaxy_more_info VALUES (4, 4, 'Sombrero', 'M104', 29.30);
INSERT INTO public.galaxy_more_info VALUES (5, 5, 'Cigar', 'M82', 11.40);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Lunara', 1, true, 120.00);
INSERT INTO public.moon VALUES (3, 'Asterion', 1, true, 96.00);
INSERT INTO public.moon VALUES (4, 'Phasara', 2, false, 50.00);
INSERT INTO public.moon VALUES (5, 'Solstice', 2, true, 72.00);
INSERT INTO public.moon VALUES (6, 'Cosmara', 3, true, 84.00);
INSERT INTO public.moon VALUES (7, 'Stellaris', 3, false, 60.00);
INSERT INTO public.moon VALUES (8, 'Orbina', 4, true, 48.00);
INSERT INTO public.moon VALUES (9, 'Ecliptica', 4, true, 36.00);
INSERT INTO public.moon VALUES (10, 'Nebula', 5, true, 72.00);
INSERT INTO public.moon VALUES (11, 'Galactica', 5, false, 96.00);
INSERT INTO public.moon VALUES (12, 'Aurora', 6, true, 120.00);
INSERT INTO public.moon VALUES (13, 'Nimbus', 6, true, 144.00);
INSERT INTO public.moon VALUES (14, 'Terra', 7, true, 100.00);
INSERT INTO public.moon VALUES (15, 'Lunarion', 7, true, 120.00);
INSERT INTO public.moon VALUES (16, 'Astralis', 8, true, 72.00);
INSERT INTO public.moon VALUES (17, 'Stellaria', 8, false, 48.00);
INSERT INTO public.moon VALUES (18, 'Nebulon', 9, true, 60.00);
INSERT INTO public.moon VALUES (19, 'Galaxara', 9, true, 72.00);
INSERT INTO public.moon VALUES (20, 'Celestia', 10, true, 84.00);
INSERT INTO public.moon VALUES (21, 'Cynosia', 11, true, 72.00);
INSERT INTO public.moon VALUES (22, 'Lunadon', 12, true, 108.00);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Planemo Prime', 1, 4, 'Super-Earth');
INSERT INTO public.planet VALUES (2, 'Astrion', 1, 9, 'Super-Earth');
INSERT INTO public.planet VALUES (3, 'Triterra', 2, 2, 'Sub-Neptune');
INSERT INTO public.planet VALUES (4, 'Stellera', 2, 15, 'Super-Earth');
INSERT INTO public.planet VALUES (5, 'Nova Star', 3, 5, 'Super-Earth');
INSERT INTO public.planet VALUES (6, 'Celestium', 3, 12, 'Super-Earth');
INSERT INTO public.planet VALUES (7, 'Aurelia', 4, 6, 'Super-Earth');
INSERT INTO public.planet VALUES (8, 'Galaxion', 4, 17, 'Super-Earth');
INSERT INTO public.planet VALUES (9, 'Nebulon', 5, 9, 'Super-Earth');
INSERT INTO public.planet VALUES (10, 'Orbiton', 5, 20, 'Super-Earth');
INSERT INTO public.planet VALUES (11, 'Cynos', 6, 2, 'Sub-Neptune');
INSERT INTO public.planet VALUES (12, 'Lunaris', 6, 9, 'Super-Earth');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Alpheratz', 1, 210, 13000);
INSERT INTO public.star VALUES (2, 'Beta Trianguli Australis', 2, 1200, 6400);
INSERT INTO public.star VALUES (3, 'Cor Caroli', 3, 1000, 8500);
INSERT INTO public.star VALUES (4, 'Spica', 4, 10, 22400);
INSERT INTO public.star VALUES (5, 'Dubhe', 5, 300, 8000);
INSERT INTO public.star VALUES (6, 'R Doradus', 6, 100, 2500);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: galaxy_more_info_galaxy_more_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_more_info_galaxy_more_info_id_seq', 5, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy_more_info galaxy_more_info_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_more_info
    ADD CONSTRAINT galaxy_more_info_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy_more_info galaxy_more_info_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_more_info
    ADD CONSTRAINT galaxy_more_info_pkey PRIMARY KEY (galaxy_more_info_id);


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
-- Name: galaxy_more_info galaxy_more_info_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_more_info
    ADD CONSTRAINT galaxy_more_info_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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


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
    name character varying(100) NOT NULL,
    age_in_millions_of_years numeric,
    description text,
    has_life boolean NOT NULL,
    number_of_stars bigint NOT NULL
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
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(100) NOT NULL,
    planet_id integer,
    radius_km numeric(7,1),
    orbital_period_days numeric(10,2),
    is_spherical boolean NOT NULL
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
-- Name: nebula; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.nebula (
    nebula_id integer NOT NULL,
    description text,
    size integer,
    nebula_types character varying(50) NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public.nebula OWNER TO freecodecamp;

--
-- Name: nebula_nebula_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.nebula_nebula_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.nebula_nebula_id_seq OWNER TO freecodecamp;

--
-- Name: nebula_nebula_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.nebula_nebula_id_seq OWNED BY public.nebula.nebula_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    star_id integer,
    has_atmosphere boolean NOT NULL,
    distance_from_star numeric(8,2),
    orbital_period_days integer
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
    name character varying(100) NOT NULL,
    galaxy_id integer,
    temperature_kelvin integer,
    is_spherical boolean NOT NULL,
    mass_solar_masses numeric(10,2)
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
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: nebula nebula_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebula ALTER COLUMN nebula_id SET DEFAULT nextval('public.nebula_nebula_id_seq'::regclass);


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

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 13600, 'Our home galaxy', true, 400000000000);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 10000, 'Nearest spiral galaxy to Milky Way', false, 1000000000000);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 5000, 'Third-largest galaxy in the Local Group', false, 40000000000);
INSERT INTO public.galaxy VALUES (4, 'Centaurus A', 13270, 'Peculiar galaxy in the constellation of Centaurus', false, 100000000000);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 400, 'Interacting grand-design spiral galaxy', false, 100000000000);
INSERT INTO public.galaxy VALUES (6, 'Sombrero', 13250, 'Peculiar galaxy of unclear classification', false, 100000000000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 1737.1, 27.32, true);
INSERT INTO public.moon VALUES (2, 'Phobos', 2, 11.1, 0.32, false);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 6.2, 1.26, false);
INSERT INTO public.moon VALUES (4, 'Io', 3, 1821.6, 1.77, true);
INSERT INTO public.moon VALUES (5, 'Europa', 3, 1560.8, 3.55, true);
INSERT INTO public.moon VALUES (6, 'Ganymede', 3, 2634.1, 7.15, true);
INSERT INTO public.moon VALUES (7, 'Callisto', 3, 2410.3, 16.69, true);
INSERT INTO public.moon VALUES (8, 'Titan', 5, 2574.7, 15.95, true);
INSERT INTO public.moon VALUES (9, 'Enceladus', 5, 252.1, 1.37, true);
INSERT INTO public.moon VALUES (10, 'Mimas', 5, 198.2, 0.94, true);
INSERT INTO public.moon VALUES (11, 'Triton', 8, 1353.4, 5.88, true);
INSERT INTO public.moon VALUES (12, 'Charon', 9, 606.0, 6.39, true);
INSERT INTO public.moon VALUES (13, 'Phoebe', 5, 106.5, 550.31, false);
INSERT INTO public.moon VALUES (14, 'Oberon', 7, 761.4, 13.46, true);
INSERT INTO public.moon VALUES (15, 'Titania', 7, 788.9, 8.71, true);
INSERT INTO public.moon VALUES (16, 'Miranda', 7, 235.8, 1.41, false);
INSERT INTO public.moon VALUES (17, 'Ariel', 7, 578.9, 2.52, true);
INSERT INTO public.moon VALUES (18, 'Umbriel', 7, 584.7, 4.14, true);
INSERT INTO public.moon VALUES (19, 'Dione', 5, 561.4, 2.74, true);
INSERT INTO public.moon VALUES (20, 'Tethys', 5, 531.1, 1.89, true);


--
-- Data for Name: nebula; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.nebula VALUES (1, 'A diffuse nebula situated in the Milky Way', 24, 'Emission', 'Orion Nebula');
INSERT INTO public.nebula VALUES (2, 'Supernova remnant in the constellation Taurus', 11, 'Supernova Remnant', 'Crab Nebula');
INSERT INTO public.nebula VALUES (3, 'A large planetary nebula located in Aquarius', 3, 'Planetary', 'Helix Nebula');
INSERT INTO public.nebula VALUES (4, 'Young open cluster of stars in the constellation Serpens', 70, 'Emission', 'Eagle Nebula');
INSERT INTO public.nebula VALUES (5, 'Large complex area of bright and dark nebulosity in Carina', 300, 'Diffuse', 'Carina Nebula');
INSERT INTO public.nebula VALUES (6, 'A protoplanetary nebula in the constellation Centaurus', 1, 'Reflection', 'Boomerang Nebula');
INSERT INTO public.nebula VALUES (7, 'One of the most complex planetary nebulae known', 0, 'Planetary', 'Cats Eye Nebula');
INSERT INTO public.nebula VALUES (8, 'Dark nebula in the constellation Orion', 4, 'Dark', 'Horsehead Nebula');
INSERT INTO public.nebula VALUES (9, 'Planetary nebula in the northern constellation of Lyra', 1, 'Planetary', 'Ring Nebula');
INSERT INTO public.nebula VALUES (10, 'H II region in the Large Magellanic Cloud', 1000, 'Emission', 'Tarantula Nebula');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, true, 1.00, 365);
INSERT INTO public.planet VALUES (2, 'Mars', 1, true, 1.52, 687);
INSERT INTO public.planet VALUES (3, 'Jupiter', 1, true, 5.20, 4333);
INSERT INTO public.planet VALUES (4, 'Venus', 1, true, 0.72, 225);
INSERT INTO public.planet VALUES (5, 'Saturn', 1, true, 9.54, 10759);
INSERT INTO public.planet VALUES (6, 'Mercury', 1, false, 0.39, 88);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, true, 19.18, 30687);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, true, 30.07, 60190);
INSERT INTO public.planet VALUES (9, 'Kepler-186f', 2, true, 0.35, 130);
INSERT INTO public.planet VALUES (10, 'HD 209458 b', 3, true, 0.05, 3);
INSERT INTO public.planet VALUES (11, 'Gliese 581g', 4, true, 0.14, 37);
INSERT INTO public.planet VALUES (12, 'TRAPPIST-1e', 5, true, 0.03, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 5778, true, 1.00);
INSERT INTO public.star VALUES (2, 'Sirius', 1, 9940, true, 2.02);
INSERT INTO public.star VALUES (3, 'Alpha Centauri A', 1, 5790, true, 1.10);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 1, 3500, false, 11.60);
INSERT INTO public.star VALUES (5, 'Proxima Centauri', 1, 3042, true, 0.12);
INSERT INTO public.star VALUES (6, 'Vega', 1, 9602, true, 2.10);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: nebula_nebula_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.nebula_nebula_id_seq', 10, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- Name: nebula nebula_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebula
    ADD CONSTRAINT nebula_name_key UNIQUE (name);


--
-- Name: nebula nebula_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebula
    ADD CONSTRAINT nebula_pkey PRIMARY KEY (nebula_id);


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


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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    user_id integer,
    no_of_guesses integer
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22),
    best_game integer,
    games_played integer
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_uid_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_uid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_uid_seq OWNER TO freecodecamp;

--
-- Name: users_uid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_uid_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_uid_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (13, 47, 15);
INSERT INTO public.games VALUES (14, 48, 10);
INSERT INTO public.games VALUES (15, 49, 783);
INSERT INTO public.games VALUES (16, 49, 83);
INSERT INTO public.games VALUES (17, 50, 668);
INSERT INTO public.games VALUES (18, 50, 540);
INSERT INTO public.games VALUES (19, 49, 10);
INSERT INTO public.games VALUES (20, 49, 522);
INSERT INTO public.games VALUES (21, 49, 989);
INSERT INTO public.games VALUES (22, 51, 52);
INSERT INTO public.games VALUES (23, 51, 614);
INSERT INTO public.games VALUES (24, 52, 232);
INSERT INTO public.games VALUES (25, 52, 23);
INSERT INTO public.games VALUES (26, 51, 73);
INSERT INTO public.games VALUES (27, 51, 426);
INSERT INTO public.games VALUES (28, 51, 425);
INSERT INTO public.games VALUES (29, 53, 873);
INSERT INTO public.games VALUES (30, 53, 711);
INSERT INTO public.games VALUES (31, 54, 813);
INSERT INTO public.games VALUES (32, 54, 380);
INSERT INTO public.games VALUES (33, 53, 715);
INSERT INTO public.games VALUES (34, 53, 603);
INSERT INTO public.games VALUES (35, 53, 323);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (47, 'op', 15, 1);
INSERT INTO public.users VALUES (48, 'ajrf', 10, 1);
INSERT INTO public.users VALUES (50, 'user_1691821464561', 540, 2);
INSERT INTO public.users VALUES (49, 'user_1691821464562', 10, 5);
INSERT INTO public.users VALUES (52, 'user_1691821584603', 23, 2);
INSERT INTO public.users VALUES (51, 'user_1691821584604', 52, 5);
INSERT INTO public.users VALUES (54, 'user_1691821777004', 380, 2);
INSERT INTO public.users VALUES (53, 'user_1691821777005', 323, 5);


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 35, true);


--
-- Name: users_uid_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_uid_seq', 54, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- Name: games games_user_id_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey1 FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--


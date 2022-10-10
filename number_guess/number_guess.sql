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
    number_of_guesses integer,
    user_id integer
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
    name character varying(200) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 3, 3);
INSERT INTO public.games VALUES (2, 1, 3);
INSERT INTO public.games VALUES (3, 2, 3);
INSERT INTO public.games VALUES (4, 7, 3);
INSERT INTO public.games VALUES (5, 247, 61);
INSERT INTO public.games VALUES (6, 764, 61);
INSERT INTO public.games VALUES (7, 7, 62);
INSERT INTO public.games VALUES (8, 615, 62);
INSERT INTO public.games VALUES (9, 700, 61);
INSERT INTO public.games VALUES (10, 917, 61);
INSERT INTO public.games VALUES (11, 929, 61);
INSERT INTO public.games VALUES (12, 205, 63);
INSERT INTO public.games VALUES (13, 667, 63);
INSERT INTO public.games VALUES (14, 307, 64);
INSERT INTO public.games VALUES (15, 687, 64);
INSERT INTO public.games VALUES (16, 340, 63);
INSERT INTO public.games VALUES (17, 668, 63);
INSERT INTO public.games VALUES (18, 436, 63);
INSERT INTO public.games VALUES (19, 3, 3);
INSERT INTO public.games VALUES (20, 4, 3);
INSERT INTO public.games VALUES (21, 1, 3);
INSERT INTO public.games VALUES (22, 2, 3);
INSERT INTO public.games VALUES (23, 811, 65);
INSERT INTO public.games VALUES (24, 936, 65);
INSERT INTO public.games VALUES (25, 834, 66);
INSERT INTO public.games VALUES (26, 398, 66);
INSERT INTO public.games VALUES (27, 47, 65);
INSERT INTO public.games VALUES (28, 684, 65);
INSERT INTO public.games VALUES (29, 50, 65);
INSERT INTO public.games VALUES (30, 570, 67);
INSERT INTO public.games VALUES (31, 953, 67);
INSERT INTO public.games VALUES (32, 224, 68);
INSERT INTO public.games VALUES (33, 853, 68);
INSERT INTO public.games VALUES (34, 213, 67);
INSERT INTO public.games VALUES (35, 451, 67);
INSERT INTO public.games VALUES (36, 513, 67);
INSERT INTO public.games VALUES (37, 952, 69);
INSERT INTO public.games VALUES (38, 534, 69);
INSERT INTO public.games VALUES (39, 583, 70);
INSERT INTO public.games VALUES (40, 969, 70);
INSERT INTO public.games VALUES (41, 782, 69);
INSERT INTO public.games VALUES (42, 467, 69);
INSERT INTO public.games VALUES (43, 475, 69);
INSERT INTO public.games VALUES (44, 355, 71);
INSERT INTO public.games VALUES (45, 837, 71);
INSERT INTO public.games VALUES (46, 837, 72);
INSERT INTO public.games VALUES (47, 194, 72);
INSERT INTO public.games VALUES (48, 374, 71);
INSERT INTO public.games VALUES (49, 253, 71);
INSERT INTO public.games VALUES (50, 828, 71);
INSERT INTO public.games VALUES (51, 9, 3);
INSERT INTO public.games VALUES (52, 428, 73);
INSERT INTO public.games VALUES (53, 28, 73);
INSERT INTO public.games VALUES (54, 271, 74);
INSERT INTO public.games VALUES (55, 77, 74);
INSERT INTO public.games VALUES (56, 329, 73);
INSERT INTO public.games VALUES (57, 465, 73);
INSERT INTO public.games VALUES (58, 627, 73);
INSERT INTO public.games VALUES (59, 783, 75);
INSERT INTO public.games VALUES (60, 373, 75);
INSERT INTO public.games VALUES (61, 250, 76);
INSERT INTO public.games VALUES (62, 215, 76);
INSERT INTO public.games VALUES (63, 4, 75);
INSERT INTO public.games VALUES (64, 289, 75);
INSERT INTO public.games VALUES (65, 33, 75);
INSERT INTO public.games VALUES (66, 552, 77);
INSERT INTO public.games VALUES (67, 245, 77);
INSERT INTO public.games VALUES (68, 489, 78);
INSERT INTO public.games VALUES (69, 653, 78);
INSERT INTO public.games VALUES (70, 307, 77);
INSERT INTO public.games VALUES (71, 118, 77);
INSERT INTO public.games VALUES (72, 706, 77);
INSERT INTO public.games VALUES (73, 771, 79);
INSERT INTO public.games VALUES (74, 442, 79);
INSERT INTO public.games VALUES (75, 753, 80);
INSERT INTO public.games VALUES (76, 634, 80);
INSERT INTO public.games VALUES (77, 829, 79);
INSERT INTO public.games VALUES (78, 456, 79);
INSERT INTO public.games VALUES (79, 958, 79);
INSERT INTO public.games VALUES (80, 10, 3);
INSERT INTO public.games VALUES (81, 14, 3);
INSERT INTO public.games VALUES (82, 276, 81);
INSERT INTO public.games VALUES (83, 441, 81);
INSERT INTO public.games VALUES (84, 246, 82);
INSERT INTO public.games VALUES (85, 288, 82);
INSERT INTO public.games VALUES (86, 780, 81);
INSERT INTO public.games VALUES (87, 597, 81);
INSERT INTO public.games VALUES (88, 723, 81);
INSERT INTO public.games VALUES (89, 914, 83);
INSERT INTO public.games VALUES (90, 415, 83);
INSERT INTO public.games VALUES (91, 168, 84);
INSERT INTO public.games VALUES (92, 211, 84);
INSERT INTO public.games VALUES (93, 450, 83);
INSERT INTO public.games VALUES (94, 333, 83);
INSERT INTO public.games VALUES (95, 261, 83);
INSERT INTO public.games VALUES (122, 32, 116);
INSERT INTO public.games VALUES (123, 450, 116);
INSERT INTO public.games VALUES (124, 800, 117);
INSERT INTO public.games VALUES (125, 73, 117);
INSERT INTO public.games VALUES (126, 907, 116);
INSERT INTO public.games VALUES (127, 9, 116);
INSERT INTO public.games VALUES (128, 833, 116);
INSERT INTO public.games VALUES (129, 8, 3);
INSERT INTO public.games VALUES (155, 804, 149);
INSERT INTO public.games VALUES (156, 721, 149);
INSERT INTO public.games VALUES (157, 395, 150);
INSERT INTO public.games VALUES (158, 284, 150);
INSERT INTO public.games VALUES (159, 263, 149);
INSERT INTO public.games VALUES (160, 215, 149);
INSERT INTO public.games VALUES (161, 409, 149);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'user_1665124752405');
INSERT INTO public.users VALUES (2, 'user_1665124752404');
INSERT INTO public.users VALUES (3, 'Aalio');
INSERT INTO public.users VALUES (4, 'user_1665125755404');
INSERT INTO public.users VALUES (5, 'user_1665125755403');
INSERT INTO public.users VALUES (6, 'user_1665125768020');
INSERT INTO public.users VALUES (7, 'user_1665125768019');
INSERT INTO public.users VALUES (8, 'user_1665135792770');
INSERT INTO public.users VALUES (9, 'user_1665135792769');
INSERT INTO public.users VALUES (10, 'user_1665142350210');
INSERT INTO public.users VALUES (11, 'user_1665142350209');
INSERT INTO public.users VALUES (43, 'user_1665282019869');
INSERT INTO public.users VALUES (44, 'user_1665282019868');
INSERT INTO public.users VALUES (45, 'user_1665288374994');
INSERT INTO public.users VALUES (46, 'user_1665288374993');
INSERT INTO public.users VALUES (47, 'user_1665288734313');
INSERT INTO public.users VALUES (48, 'user_1665288734312');
INSERT INTO public.users VALUES (49, 'A');
INSERT INTO public.users VALUES (50, 'user_1665288810452');
INSERT INTO public.users VALUES (51, 'user_1665288810451');
INSERT INTO public.users VALUES (52, 'user_1665289554098');
INSERT INTO public.users VALUES (53, 'user_1665289554097');
INSERT INTO public.users VALUES (54, 'user_1665289595040');
INSERT INTO public.users VALUES (55, 'user_1665289595039');
INSERT INTO public.users VALUES (56, 'AB');
INSERT INTO public.users VALUES (57, 'user_1665289682090');
INSERT INTO public.users VALUES (58, 'user_1665289682089');
INSERT INTO public.users VALUES (59, 'user_1665290239588');
INSERT INTO public.users VALUES (60, 'user_1665290239587');
INSERT INTO public.users VALUES (61, 'user_1665296845131');
INSERT INTO public.users VALUES (62, 'user_1665296845130');
INSERT INTO public.users VALUES (63, 'user_1665297018608');
INSERT INTO public.users VALUES (64, 'user_1665297018607');
INSERT INTO public.users VALUES (65, 'user_1665297209062');
INSERT INTO public.users VALUES (66, 'user_1665297209061');
INSERT INTO public.users VALUES (67, 'user_1665297222272');
INSERT INTO public.users VALUES (68, 'user_1665297222271');
INSERT INTO public.users VALUES (69, 'user_1665297226233');
INSERT INTO public.users VALUES (70, 'user_1665297226232');
INSERT INTO public.users VALUES (71, 'user_1665297265584');
INSERT INTO public.users VALUES (72, 'user_1665297265583');
INSERT INTO public.users VALUES (73, 'user_1665297613809');
INSERT INTO public.users VALUES (74, 'user_1665297613808');
INSERT INTO public.users VALUES (75, 'user_1665297669648');
INSERT INTO public.users VALUES (76, 'user_1665297669647');
INSERT INTO public.users VALUES (77, 'user_1665297678846');
INSERT INTO public.users VALUES (78, 'user_1665297678845');
INSERT INTO public.users VALUES (79, 'user_1665297683505');
INSERT INTO public.users VALUES (80, 'user_1665297683504');
INSERT INTO public.users VALUES (81, 'user_1665297909112');
INSERT INTO public.users VALUES (82, 'user_1665297909111');
INSERT INTO public.users VALUES (83, 'user_1665298031422');
INSERT INTO public.users VALUES (84, 'user_1665298031421');
INSERT INTO public.users VALUES (116, 'user_1665325990803');
INSERT INTO public.users VALUES (117, 'user_1665325990801');
INSERT INTO public.users VALUES (149, 'user_1665427329121');
INSERT INTO public.users VALUES (150, 'user_1665427329120');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 161, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 150, true);


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
-- PostgreSQL database dump complete
--


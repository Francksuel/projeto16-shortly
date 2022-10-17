--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5 (Ubuntu 14.5-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.5 (Ubuntu 14.5-0ubuntu0.22.04.1)

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
-- Name: sessions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sessions (
    id integer NOT NULL,
    "userId" integer,
    token text NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sessions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sessions_id_seq OWNED BY public.sessions.id;


--
-- Name: urls; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.urls (
    id integer NOT NULL,
    url text NOT NULL,
    "shortUrl" character varying(8) NOT NULL,
    "userId" integer,
    "visitCount" integer DEFAULT 0 NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: urls_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.urls_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: urls_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.urls_id_seq OWNED BY public.urls.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    email character varying(150) NOT NULL,
    password text NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: sessions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions ALTER COLUMN id SET DEFAULT nextval('public.sessions_id_seq'::regclass);


--
-- Name: urls id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls ALTER COLUMN id SET DEFAULT nextval('public.urls_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sessions VALUES (1, 1, '7caa5220-153d-424a-a8ba-54f18fde5189', '2022-10-13 16:18:40.803845');
INSERT INTO public.sessions VALUES (2, 2, '7cbe14e1-f758-48c9-a1e0-0bcc3c8b8325', '2022-10-13 17:15:26.605327');
INSERT INTO public.sessions VALUES (3, 2, '5cb73d5e-7f9f-43d3-8f53-59de65ecc217', '2022-10-14 14:29:10.684542');
INSERT INTO public.sessions VALUES (4, 1, '4542895f-ef4f-4670-acbf-4d00c0c8bcd5', '2022-10-14 14:55:44.058547');
INSERT INTO public.sessions VALUES (5, 2, 'b98187e1-b3e9-403b-8955-c1df32504048', '2022-10-14 14:57:05.598723');
INSERT INTO public.sessions VALUES (6, 1, '1e27c582-7626-4ab4-91a1-e77b3cf618f8', '2022-10-14 15:05:13.816713');
INSERT INTO public.sessions VALUES (7, 11, '6a6c4cc7-8679-49ee-a6d7-767aab4679c2', '2022-10-17 18:15:17.592722');
INSERT INTO public.sessions VALUES (8, 7, '1989a86c-3bad-4200-ab6c-bc558a34fc05', '2022-10-17 18:32:38.192975');


--
-- Data for Name: urls; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.urls VALUES (2, 'http://driven.com', '05kfFZpS', 1, 2, '2022-10-13 16:29:43.337981');
INSERT INTO public.urls VALUES (1, 'http://www.globo.com', 'KvaPT4WZ', 1, 2, '2022-10-13 16:19:06.170024');
INSERT INTO public.urls VALUES (3, 'data:image/jpeg;base64,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', 'iTeWY59A', 1, 3, '2022-10-13 17:00:03.503708');
INSERT INTO public.urls VALUES (5, 'https://www.google.com', 'msepVpfN', 1, 0, '2022-10-17 17:52:20.841549');
INSERT INTO public.urls VALUES (6, 'http://www.google.com', 'u5yyf9Un', 1, 0, '2022-10-17 17:52:25.077963');
INSERT INTO public.urls VALUES (7, 'htt://www.google.com', 'aaiSL4Bt', 1, 0, '2022-10-17 17:52:28.173273');
INSERT INTO public.urls VALUES (8, 'http://www.google.com', 'G5XYbLg5', 1, 0, '2022-10-17 17:59:21.973145');
INSERT INTO public.urls VALUES (9, 'https://www.google.com', '6YlsFgzj', 1, 0, '2022-10-17 17:59:28.618376');
INSERT INTO public.urls VALUES (10, 'https://google.com', 'QAoIb0ma', 1, 0, '2022-10-17 17:59:35.139205');
INSERT INTO public.urls VALUES (11, 'https://google.net', 'qt63UMuT', 1, 0, '2022-10-17 17:59:49.229612');
INSERT INTO public.urls VALUES (13, 'http://google.com', 'NDl4pRyo', 1, 0, '2022-10-17 18:01:13.014353');
INSERT INTO public.urls VALUES (14, 'https://www.ge.com', 'MJuZYxei', 1, 0, '2022-10-17 18:05:23.699712');
INSERT INTO public.urls VALUES (15, 'https://ge.com', '3YyDJta1', 1, 0, '2022-10-17 18:05:28.822399');
INSERT INTO public.urls VALUES (16, 'https://ge.net', 'GQv84jzM', 1, 0, '2022-10-17 18:05:35.559997');
INSERT INTO public.urls VALUES (17, 'http://ge.net', '727XkeoE', 1, 0, '2022-10-17 18:05:40.347444');
INSERT INTO public.urls VALUES (18, 'htt://ge.net', 'RAo2q61f', 1, 0, '2022-10-17 18:05:50.229496');
INSERT INTO public.urls VALUES (19, 'https://mengaocampeao.com', 'oJNYClOl', 11, 0, '2022-10-17 18:16:00.992345');
INSERT INTO public.urls VALUES (20, 'https://mengaocampeao.com', '1gPFZzT8', 7, 2, '2022-10-17 18:33:12.569223');
INSERT INTO public.urls VALUES (12, 'http://www.google.com', 'EmWtojMg', 1, 2, '2022-10-17 18:01:03.399189');


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users VALUES (1, 'Franck', 'franck@driven.com', '$2b$10$uTkuTUErwGy9n0c6MOe6fOkUWb4sSRfsuz3431raIOOFFF/zSm1by', '2022-10-13 16:18:24.854217');
INSERT INTO public.users VALUES (2, 'Lid', 'lid@gmail.com', '$2b$10$IJlVF6bK4BCmmlCq3IMN4eJpAyW6ixhwx3qct.ex.DwAYQyXJX0fu', '2022-10-13 17:15:09.848229');
INSERT INTO public.users VALUES (3, 'junin', 'junin@gmail.com', '$2b$10$qvlHu5hWQ7edElKUQ8oOjOwQeJ0FPaGyPHVKtiNN3P66Q3fM5tnuS', '2022-10-17 18:12:20.719723');
INSERT INTO public.users VALUES (4, 'lucas', 'lucas@gmail.com', '$2b$10$VFsfnYQ3ZQ6c83hXf.7Ar.aIPPiDGXS/zODMGl63HFD3q2tbH05/q', '2022-10-17 18:12:28.602486');
INSERT INTO public.users VALUES (5, 'jão', 'jao@gmail.com', '$2b$10$t5s07MJFCKGLy6i7zqYqMuYpiD60qy57fNg3vQ6J62e.CBIkVAPei', '2022-10-17 18:12:45.006442');
INSERT INTO public.users VALUES (6, 'marcelo', 'marce@gmail.com', '$2b$10$DC9uY.cj4k6SzETAgwAP0OfxCuEuHbJKcNCFJOoETjQgbmB2KPqBa', '2022-10-17 18:12:56.858557');
INSERT INTO public.users VALUES (7, 'gabigol', 'gabi@gmail.com', '$2b$10$EUEYxYwaPBpAbaC0xDFYEuL3/T06yN7UNr7UIo8dE3jcLHWnBeJ7y', '2022-10-17 18:13:10.781017');
INSERT INTO public.users VALUES (8, 'arrasxca', 'arrasca@gmail.com', '$2b$10$npjJsh85H9qr3LuO2zh19.v7jW9cyw1OdklirXbxQGzgQr1btZ0T2', '2022-10-17 18:13:36.253941');
INSERT INTO public.users VALUES (9, 'Pedro21', 'peter@gmail.com', '$2b$10$SRK8gd13MNQeMxgmSDvZXO1n7XF4aNPcyLrUxOUgkKlUt3oTGJyUS', '2022-10-17 18:13:50.47133');
INSERT INTO public.users VALUES (10, 'cebolinha', 'everton@gmail.com', '$2b$10$SC1fEZtOYGfefmrwFlK2x.C3ZQYZ/cHSlHpaoOHakm5lyFnmtrFgO', '2022-10-17 18:14:07.828536');
INSERT INTO public.users VALUES (11, 'fla', 'flamengo@gmail.com', '$2b$10$dW6y6lWWQKoG3e6i8IUS1ecTOBlysSTtdaaj8NfMw9X/H2NzXkVCK', '2022-10-17 18:14:31.392495');


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sessions_id_seq', 8, true);


--
-- Name: urls_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.urls_id_seq', 20, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 11, true);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_token_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_token_key UNIQUE (token);


--
-- Name: urls urls_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT urls_pkey PRIMARY KEY (id);


--
-- Name: urls urls_shortUrl_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT "urls_shortUrl_key" UNIQUE ("shortUrl");


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT "sessions_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- Name: urls urls_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT "urls_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--


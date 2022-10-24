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
-- Name: likes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.likes (
    id integer NOT NULL,
    "postId" integer NOT NULL,
    "userId" integer NOT NULL
);


--
-- Name: likes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.likes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: likes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.likes_id_seq OWNED BY public.likes.id;


--
-- Name: posts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.posts (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    link text NOT NULL,
    description text
);


--
-- Name: posts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.posts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.posts_id_seq OWNED BY public.posts.id;


--
-- Name: posts_trends; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.posts_trends (
    id integer NOT NULL,
    "trendId" integer NOT NULL,
    "postId" integer NOT NULL
);


--
-- Name: posts_trends_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.posts_trends_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: posts_trends_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.posts_trends_id_seq OWNED BY public.posts_trends.id;


--
-- Name: sessions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sessions (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    token text NOT NULL,
    "createTime" timestamp without time zone DEFAULT now()
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
-- Name: trends; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.trends (
    id integer NOT NULL,
    name character varying(30) NOT NULL
);


--
-- Name: trends_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.trends_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: trends_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.trends_id_seq OWNED BY public.trends.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username text NOT NULL,
    email text NOT NULL,
    password text NOT NULL,
    picture text NOT NULL
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
-- Name: likes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.likes ALTER COLUMN id SET DEFAULT nextval('public.likes_id_seq'::regclass);


--
-- Name: posts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.posts ALTER COLUMN id SET DEFAULT nextval('public.posts_id_seq'::regclass);


--
-- Name: posts_trends id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.posts_trends ALTER COLUMN id SET DEFAULT nextval('public.posts_trends_id_seq'::regclass);


--
-- Name: sessions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions ALTER COLUMN id SET DEFAULT nextval('public.sessions_id_seq'::regclass);


--
-- Name: trends id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trends ALTER COLUMN id SET DEFAULT nextval('public.trends_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: likes; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.likes VALUES (11, 4, 2);
INSERT INTO public.likes VALUES (14, 2, 2);
INSERT INTO public.likes VALUES (16, 7, 2);
INSERT INTO public.likes VALUES (17, 7, 1);
INSERT INTO public.likes VALUES (18, 4, 1);
INSERT INTO public.likes VALUES (24, 4, 3);
INSERT INTO public.likes VALUES (26, 6, 3);
INSERT INTO public.likes VALUES (29, 14, 5);
INSERT INTO public.likes VALUES (30, 11, 5);
INSERT INTO public.likes VALUES (31, 9, 5);
INSERT INTO public.likes VALUES (32, 5, 5);
INSERT INTO public.likes VALUES (33, 4, 4);
INSERT INTO public.likes VALUES (34, 16, 5);
INSERT INTO public.likes VALUES (35, 5, 1);
INSERT INTO public.likes VALUES (36, 15, 1);
INSERT INTO public.likes VALUES (37, 9, 1);


--
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.posts VALUES (3, 2, 'https://pt-br.reactjs.org/', '#react 2 a');
INSERT INTO public.posts VALUES (4, 2, 'https://pt-br.reactjs.org/', '#react 3');
INSERT INTO public.posts VALUES (5, 2, 'https://pt-br.reactjs.org/', '#react 4');
INSERT INTO public.posts VALUES (2, 2, 'https://pt-br.reactjs.org/', '#react 1');
INSERT INTO public.posts VALUES (6, 2, 'https://pt-br.reactjs.org/', '#react 5');
INSERT INTO public.posts VALUES (7, 3, 'https://pt-br.reactjs.org/', 'Olha que legal #react #developer #software');
INSERT INTO public.posts VALUES (9, 3, 'https://tecnoblog.net/noticias/2022/03/17/protestware-desenvolvedor-sabota-projeto-com-mensagem-de-paz-para-ucrania/', 'Notiicia aqui #news');
INSERT INTO public.posts VALUES (11, 3, 'https://tecnoblog.net/noticias/2022/10/13/netflix-trara-plano-basico-com-anuncios-ao-brasil-para-competir-com-tv-aberta/', '#netflix');
INSERT INTO public.posts VALUES (12, 3, 'https://tecnoblog.net/noticias/2022/10/11/demorou-mas-o-youtube-vai-finalmente-oferecer-nomes-de-usuarios-unicos/', '@news');
INSERT INTO public.posts VALUES (13, 3, 'https://tecnoblog.net/noticias/2022/10/12/google-docs-consegue-transcrever-as-chamadas-do-meet-mas-so-em-ingles/', '#news #noticia');
INSERT INTO public.posts VALUES (14, 4, 'http://youtube.com', 'Site de vídeos maneiro... não sei se vcs conhecem... #novidade');
INSERT INTO public.posts VALUES (15, 5, 'https://tecnoblog.net/noticias/2022/10/11/demorou-mas-o-youtube-vai-finalmente-oferecer-nomes-de-usuarios-unicos/', 'Será será será #news');
INSERT INTO public.posts VALUES (16, 4, 'http://youtube.com', '#show #isso #calvo #seila #tmj #bora ');
INSERT INTO public.posts VALUES (17, 5, 'https://www.uol.com.br/nossa/noticias/redacao/2022/07/15/calvao-de-cria-corte-de-cabelo-para-ficar-calvo-viraliza-entre-os-jovens.htm', '#calvo é a moda');
INSERT INTO public.posts VALUES (18, 5, 'https://www.techtudo.com.br/dicas-e-tutoriais/2022/08/calvo-de-cria-filtro-simula-corte-de-cabelo-masculino-saiba-usar.ghtml', 'Abaixo a ditadura do cabelo #calvo #news');
INSERT INTO public.posts VALUES (19, 4, 'https://www.campograndenews.com.br/colunistas/em-pauta/nao-tolero-ser-calvo-o-cabelo-e-a-grande-obsessao-masculina', 'Até quando Brasil? #calvofobia #calvo Em pleno 2022...');


--
-- Data for Name: posts_trends; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.posts_trends VALUES (22, 1, 3);
INSERT INTO public.posts_trends VALUES (23, 1, 4);
INSERT INTO public.posts_trends VALUES (24, 1, 5);
INSERT INTO public.posts_trends VALUES (26, 1, 2);
INSERT INTO public.posts_trends VALUES (27, 1, 6);
INSERT INTO public.posts_trends VALUES (28, 1, 7);
INSERT INTO public.posts_trends VALUES (29, 6, 7);
INSERT INTO public.posts_trends VALUES (30, 7, 7);
INSERT INTO public.posts_trends VALUES (35, 9, 9);
INSERT INTO public.posts_trends VALUES (37, 11, 11);
INSERT INTO public.posts_trends VALUES (38, 9, 13);
INSERT INTO public.posts_trends VALUES (39, 12, 13);
INSERT INTO public.posts_trends VALUES (40, 13, 14);
INSERT INTO public.posts_trends VALUES (41, 9, 15);
INSERT INTO public.posts_trends VALUES (42, 14, 16);
INSERT INTO public.posts_trends VALUES (43, 15, 16);
INSERT INTO public.posts_trends VALUES (44, 16, 16);
INSERT INTO public.posts_trends VALUES (45, 17, 16);
INSERT INTO public.posts_trends VALUES (46, 18, 16);
INSERT INTO public.posts_trends VALUES (47, 19, 16);
INSERT INTO public.posts_trends VALUES (48, 16, 17);
INSERT INTO public.posts_trends VALUES (49, 16, 18);
INSERT INTO public.posts_trends VALUES (50, 9, 18);
INSERT INTO public.posts_trends VALUES (51, 20, 19);
INSERT INTO public.posts_trends VALUES (52, 16, 19);


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sessions VALUES (1, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjEsImlhdCI6MTY2NjUyNjIxNCwiZXhwIjoxNjY2NTMzNDE0fQ.xuiAvDByNEYMOaV8acdXV4o4LBq295C3S_5x1W9FrfU', '2022-10-23 11:56:54.895642');
INSERT INTO public.sessions VALUES (2, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjEsImlhdCI6MTY2NjUyNjM3NywiZXhwIjoxNjY2NTMzNTc3fQ.eC8pbVpJdHjCqBneLq3bg_prnTUqqClliq_QXtBHJmw', '2022-10-23 11:59:38.364172');
INSERT INTO public.sessions VALUES (3, 2, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjIsImlhdCI6MTY2NjUyNjQyNSwiZXhwIjoxNjY2NTMzNjI1fQ.wqnH8OqVigikSrb7KReNi1T5CN5-OzDOuJ5g2i_srEc', '2022-10-23 12:00:26.527308');
INSERT INTO public.sessions VALUES (4, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjEsImlhdCI6MTY2NjU2MzI5NywiZXhwIjoxNjY2NTcwNDk3fQ.3oKua4PuxNiOTFFrHm09RMFS58mjuc0Ff64Z-bk6kFU', '2022-10-23 22:14:57.454939');
INSERT INTO public.sessions VALUES (5, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjEsImlhdCI6MTY2NjU2NDQ4MiwiZXhwIjoxNjY2NTcxNjgyfQ.xG5w4sXrrjN12_LWBTG4YQS8CkBHNJ-x1SjMYWOLtjk', '2022-10-23 22:34:42.761849');
INSERT INTO public.sessions VALUES (6, 2, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjIsImlhdCI6MTY2NjU2NDY0NCwiZXhwIjoxNjY2NTcxODQ0fQ.nj1JsYq-slra5Iq4EDt5nECzpNxU402g__dN6ltbx3Q', '2022-10-23 22:37:24.847269');
INSERT INTO public.sessions VALUES (7, 3, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjMsImlhdCI6MTY2NjU2NTU2OSwiZXhwIjoxNjY2NTcyNzY5fQ.rfG10axH9n1vx8pwQfIAAN3imlw917SuBAMbfY3pXH4', '2022-10-23 22:52:49.764524');
INSERT INTO public.sessions VALUES (8, 2, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjIsImlhdCI6MTY2NjU2NTYyNiwiZXhwIjoxNjY2NTcyODI2fQ.ZQ4C-OguvpRZjWCgsdl5zt7Qx9-yIYgtcOnd9PKwi48', '2022-10-23 22:53:47.151693');
INSERT INTO public.sessions VALUES (9, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjEsImlhdCI6MTY2NjU2NTcxNywiZXhwIjoxNjY2NTcyOTE3fQ.YOJlS4_5Q-RsoIOT-LeYoCmpROFcuJ7poJlFoLLd5To', '2022-10-23 22:55:17.874037');
INSERT INTO public.sessions VALUES (10, 4, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjQsImlhdCI6MTY2NjU2Njc0NiwiZXhwIjoxNjY2NTczOTQ2fQ.1whttq2XsV7FDlcvdHxuk-uWuSBIBYBoVyM3O7SJkJg', '2022-10-23 23:12:27.141418');
INSERT INTO public.sessions VALUES (11, 5, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjUsImlhdCI6MTY2NjU2Njg0OSwiZXhwIjoxNjY2NTc0MDQ5fQ.FrzDb73UTyk2DDm0j0nZblJRjSwx5HtCXR0CiZUosgk', '2022-10-23 23:14:09.641199');
INSERT INTO public.sessions VALUES (12, 4, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjQsImlhdCI6MTY2NjU3MDc1MSwiZXhwIjoxNjY2NTc3OTUxfQ.B3WArgMc9PJS9xGEb-SjAfUOx_yUu-VUlGZyIl-sw7w', '2022-10-24 00:19:12.125156');
INSERT INTO public.sessions VALUES (13, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjEsImlhdCI6MTY2NjU3MjA3NCwiZXhwIjoxNjY2NTc5Mjc0fQ.Sx9ngAdVrCRTG9rCd3hX1ppvXtRxj1y9fit9UHQ47po', '2022-10-24 00:41:14.398758');
INSERT INTO public.sessions VALUES (14, 4, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjQsImlhdCI6MTY2NjU3NzEwNCwiZXhwIjoxNjY2NTg0MzA0fQ.OF7mbkc3uF6eBSvNXSGpoUJ37HL8yo7IzENZbVWa-es', '2022-10-24 02:05:04.872913');
INSERT INTO public.sessions VALUES (15, 6, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjYsImlhdCI6MTY2NjYxNjczNCwiZXhwIjoxNjY2NjIzOTM0fQ.BXHsAFdFfYtlAm74aT-eqRleIHACjjezR86ij21YzD4', '2022-10-24 13:05:34.834704');


--
-- Data for Name: trends; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.trends VALUES (1, 'react');
INSERT INTO public.trends VALUES (2, 'front-end');
INSERT INTO public.trends VALUES (3, 'development');
INSERT INTO public.trends VALUES (4, 'framework');
INSERT INTO public.trends VALUES (5, 'reactjs');
INSERT INTO public.trends VALUES (6, 'developer');
INSERT INTO public.trends VALUES (7, 'software');
INSERT INTO public.trends VALUES (8, 'bootcamp');
INSERT INTO public.trends VALUES (9, 'news');
INSERT INTO public.trends VALUES (10, 'insta');
INSERT INTO public.trends VALUES (11, 'netflix');
INSERT INTO public.trends VALUES (12, 'noticia');
INSERT INTO public.trends VALUES (13, 'novidade');
INSERT INTO public.trends VALUES (14, 'show');
INSERT INTO public.trends VALUES (15, 'isso');
INSERT INTO public.trends VALUES (16, 'calvo');
INSERT INTO public.trends VALUES (17, 'seila');
INSERT INTO public.trends VALUES (18, 'tmj');
INSERT INTO public.trends VALUES (19, 'bora');
INSERT INTO public.trends VALUES (20, 'calvofobia');


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users VALUES (1, 'Gabriel Rosin', 'teste@gmail.com', '$2b$12$Ylp/5eSM0VpG3EVtlu.88OxQtIZ2aLyfHuA433ySSjFAVAffYwNBW', 'https://images.contentstack.io/v3/assets/blt187521ff0727be24/blt71009d4f4fabcf6f/60ee0f3fb898ee4eaeb6e6a7/Lulu_0.jpg');
INSERT INTO public.users VALUES (2, 'Gabriel Rosin', 'teste2@gmail.com', '$2b$12$sFcHyrkKUkotJS6HLa6y9u6iTdobFF9zOTy7HgKb6elpHkUH8lLDK', 'https://meululudapomerania.com.br/wp-content/uploads/2017/12/11.04.2017-1-e1514407405414.jpg');
INSERT INTO public.users VALUES (3, 'Ana Paula', 'ana1@gmail.com', '$2b$12$Hwe6NfwJhy/I/jyoN43MfOF.2.zhywm5FrBhDS1SxYp3QNoh0MjsS', 'https://wl-incrivel.cf.tsp.li/resize/728x/jpg/e86/78d/cefdee58f2a13954c8fb59a585.jpg');
INSERT INTO public.users VALUES (4, 'Frotté', 'igor@igorf.com', '$2b$12$EHWRqRjX.lLHVUEhtHjRhOlzF9ctPUKFNeEsDwDNN0RxBz6eGaT4q', 'https://w7.pngwing.com/pngs/114/579/png-transparent-pink-cross-stroke-ink-brush-pen-red-ink-brush-ink-leave-the-material-text.png');
INSERT INTO public.users VALUES (5, 'Zé Dorinha', 'zedorinha@gmail.com', '$2b$12$MVOsMS.IQoYnp1ZZjc/TwOBDx5n6B.UQVMPz.tUdsYX3zTe.8vRT6', 'https://courier-images-web.imgix.net/static/img/meta_image.png?auto=compress,format&fit=max&w=undefined&h=undefined&dpr=2&fm=png');
INSERT INTO public.users VALUES (6, 'Perfil De Teste', 'teste@teste.com', '$2b$12$68XBmnJBqHwt4yW3pCBqHePArBbjLQgmwqFK69PYNXzFO5RjdRLnC', 'https://semeandoafeto.imadel.org.br/packages/trustir/exclusiva/img/user_placeholder.png');
INSERT INTO public.users VALUES (7, 'User Name', 'email@valido.com', '$2b$12$ZRyI5pWdM1fG1hm26a8Msu/Fu2l4eSGU5pJhWukDiOqFhv7LvywFW', 'https://semeandoafeto.imadel.org.br/packages/trustir/exclusiva/img/user_placeholder.png');
INSERT INTO public.users VALUES (8, 'UserName', 'email2@valido.com', '$2b$12$AHbSVVvlH1G5J977CDdYV.RHIjVWlY5m.Y1tzmt7WodiTnLO7pfHe', '.imadel.org.br/packages/trustir/exclusiva/img/user_placeholder.png');


--
-- Name: likes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.likes_id_seq', 39, true);


--
-- Name: posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.posts_id_seq', 19, true);


--
-- Name: posts_trends_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.posts_trends_id_seq', 52, true);


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sessions_id_seq', 15, true);


--
-- Name: trends_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.trends_id_seq', 20, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 8, true);


--
-- Name: likes likes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT likes_pkey PRIMARY KEY (id);


--
-- Name: posts posts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id);


--
-- Name: posts_trends posts_trends_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.posts_trends
    ADD CONSTRAINT posts_trends_pkey PRIMARY KEY (id);


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
-- Name: trends trends_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trends
    ADD CONSTRAINT trends_name_key UNIQUE (name);


--
-- Name: trends trends_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trends
    ADD CONSTRAINT trends_pkey PRIMARY KEY (id);


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
-- Name: likes likes_postId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT "likes_postId_fkey" FOREIGN KEY ("postId") REFERENCES public.posts(id);


--
-- Name: likes likes_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT "likes_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- Name: posts_trends posts_trends_postId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.posts_trends
    ADD CONSTRAINT "posts_trends_postId_fkey" FOREIGN KEY ("postId") REFERENCES public.posts(id);


--
-- Name: posts_trends posts_trends_trendId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.posts_trends
    ADD CONSTRAINT "posts_trends_trendId_fkey" FOREIGN KEY ("trendId") REFERENCES public.trends(id);


--
-- Name: posts posts_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT "posts_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- Name: sessions sessions_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT "sessions_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--


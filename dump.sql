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
-- Name: comments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.comments (
    id integer NOT NULL,
    "postId" integer NOT NULL,
    "userId" integer NOT NULL,
    description text NOT NULL
);


--
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.comments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.comments_id_seq OWNED BY public.comments.id;


--
-- Name: follows; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.follows (
    id integer NOT NULL,
    "followerId" integer NOT NULL,
    "followedId" integer NOT NULL
);


--
-- Name: follows_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.follows_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: follows_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.follows_id_seq OWNED BY public.follows.id;


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
    description text,
    "originalId" integer
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
-- Name: comments id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comments ALTER COLUMN id SET DEFAULT nextval('public.comments_id_seq'::regclass);


--
-- Name: follows id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.follows ALTER COLUMN id SET DEFAULT nextval('public.follows_id_seq'::regclass);


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
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.comments VALUES (1, 1, 3, 'Que legal');
INSERT INTO public.comments VALUES (2, 1, 2, 'comentario pra testar delete');


--
-- Data for Name: follows; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.follows VALUES (1, 2, 1);
INSERT INTO public.follows VALUES (3, 4, 1);
INSERT INTO public.follows VALUES (4, 5, 6);
INSERT INTO public.follows VALUES (5, 6, 1);
INSERT INTO public.follows VALUES (6, 8, 6);


--
-- Data for Name: likes; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.likes VALUES (1, 2, 2);
INSERT INTO public.likes VALUES (2, 3, 4);
INSERT INTO public.likes VALUES (3, 6, 5);


--
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.posts VALUES (1, 1, 'https://gauchazh.clicrbs.com.br/educacao-e-emprego/conteudo-publicitario/2022/10/curso-de-medicina-se-destaca-por-uso-de-tecnologia-e-relacao-com-a-comunidade-cl9msyshn002m014ujx07z7ae.html', '#news kk', NULL);
INSERT INTO public.posts VALUES (2, 1, 'https://odia.ig.com.br/volta-redonda/2022/10/6511896-inscricoes-para-o-projovem-urbano-vao-ate-a-proxima-segunda-feira-31.html', '#news k', NULL);
INSERT INTO public.posts VALUES (3, 2, 'https://www.cnnbrasil.com.br/politica/exonerado-do-tse-servidor-procura-pf-e-diz-ter-informado-tribunal-sobre-falhas-de-fiscalizacao-em-insercoes/', '#news #noticias', NULL);
INSERT INTO public.posts VALUES (5, 4, 'https://www.poder360.com.br/economia/banco-central-mantem-taxa-selic-em-1375/', '#noticias #noticias #noticias #noticias #noticias #noticias
 ', NULL);
INSERT INTO public.posts VALUES (6, 6, 'http://facebook.com', 'Agora foi :)) #nuncaDesista', NULL);
INSERT INTO public.posts VALUES (7, 6, 'http://youtube.com', 'ewfewf #funfaPF', NULL);


--
-- Data for Name: posts_trends; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.posts_trends VALUES (1, 1, 1);
INSERT INTO public.posts_trends VALUES (2, 1, 2);
INSERT INTO public.posts_trends VALUES (3, 1, 3);
INSERT INTO public.posts_trends VALUES (4, 2, 3);
INSERT INTO public.posts_trends VALUES (9, 2, 5);
INSERT INTO public.posts_trends VALUES (10, 2, 5);
INSERT INTO public.posts_trends VALUES (11, 2, 5);
INSERT INTO public.posts_trends VALUES (12, 2, 5);
INSERT INTO public.posts_trends VALUES (13, 2, 5);
INSERT INTO public.posts_trends VALUES (14, 4, 5);
INSERT INTO public.posts_trends VALUES (15, 5, 6);
INSERT INTO public.posts_trends VALUES (16, 6, 7);


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sessions VALUES (1, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjEsImlhdCI6MTY2NjcxODg4MCwiZXhwIjoxNjY2NzI2MDgwfQ.Kn0K5qPS2I57Iv1TVzIXmZBJsHjEULH3W9Q9IRyRj3g', '2022-10-25 17:28:01.031787');
INSERT INTO public.sessions VALUES (2, 2, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjIsImlhdCI6MTY2NjcxOTAwMSwiZXhwIjoxNjY2NzI2MjAxfQ.UfjZZ2dkQ8IM5s9Kref0hbgmGsvYcFsKF0_FJRaauJA', '2022-10-25 17:30:01.840422');
INSERT INTO public.sessions VALUES (3, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjEsImlhdCI6MTY2NjcxOTA5MSwiZXhwIjoxNjY2NzI2MjkxfQ.S2W6lfKtzcqcd52lHTk8fBeoiTlxL4gcLaHrVX-0_ms', '2022-10-25 17:31:31.335367');
INSERT INTO public.sessions VALUES (4, 2, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjIsImlhdCI6MTY2NjcyMjgzMSwiZXhwIjoxNjY2NzMwMDMxfQ.zBcgGATzrYVeFz_iO0jQx74DDL5_HkoFNLg0aSjIQEo', '2022-10-25 18:33:52.102036');
INSERT INTO public.sessions VALUES (5, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjEsImlhdCI6MTY2NjczNTQ4MiwiZXhwIjoxNjY2NzQyNjgyfQ.NbgFCK3nuZ12bHTPIO3CtTGK5DMUOgNKkCQyntieXR4', '2022-10-25 22:04:42.408753');
INSERT INTO public.sessions VALUES (6, 3, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjMsImlhdCI6MTY2Njc4NjA5NywiZXhwIjoxNjY2NzkzMjk3fQ.71HHYnQ9s3TZgJnlg0F2ax86P6zM0iTotDoQJlzcGPc', '2022-10-26 12:08:17.831974');
INSERT INTO public.sessions VALUES (7, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjEsImlhdCI6MTY2Njc4NjIxNywiZXhwIjoxNjY2NzkzNDE3fQ.SZwZ-mwNkGAtR5f1op4l8_IDdvER8D8iUY3NHMYJnoc', '2022-10-26 12:10:17.975187');
INSERT INTO public.sessions VALUES (8, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjEsImlhdCI6MTY2Njc4ODM3NSwiZXhwIjoxNjY2Nzk1NTc1fQ.NFofq6SLxGMe32gfUi_iD2ekV_6CgkTKMJ_lELMYt9E', '2022-10-26 12:46:15.819581');
INSERT INTO public.sessions VALUES (9, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjEsImlhdCI6MTY2Njc4OTEyMiwiZXhwIjoxNjY2Nzk2MzIyfQ.ReSPa5ilmIP1uj4ccgQ0eXw7ssn-JNadTA02Pwfvkb0', '2022-10-26 12:58:42.904556');
INSERT INTO public.sessions VALUES (10, 3, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjMsImlhdCI6MTY2Njc5MDc3OCwiZXhwIjoxNjY2Nzk3OTc4fQ.6uL--s_AJApvZnqCXrvfmFTyOXeqfK0GvskY6FJ7uFs', '2022-10-26 13:26:18.932495');
INSERT INTO public.sessions VALUES (11, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjEsImlhdCI6MTY2Njc5MTI4MiwiZXhwIjoxNjY2Nzk4NDgyfQ.h77G9I38iblBViyVbtMHvoDIQ3jdXiiP1RlFrDP472Y', '2022-10-26 13:34:42.286015');
INSERT INTO public.sessions VALUES (12, 2, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjIsImlhdCI6MTY2NjgwMjEzMSwiZXhwIjoxNjY2ODA5MzMxfQ.Ul-Bi4f99LuuGOHZPZiHY0VI9UAKmmJPMSGz7WR_GpA', '2022-10-26 16:35:31.305942');
INSERT INTO public.sessions VALUES (13, 4, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjQsImlhdCI6MTY2NjgyMDQ0MCwiZXhwIjoxNjY2ODI3NjQwfQ.UtI-Jh-FfJ2xuQnBoUVwUkwNr6hrRMP6vj0YY9cAP2U', '2022-10-26 21:40:40.707785');
INSERT INTO public.sessions VALUES (14, 5, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjUsImlhdCI6MTY2NjgyMTQwMSwiZXhwIjoxNjY2ODI4NjAxfQ.sT5pYaAHzrrAVWaLaDknxlKSRqmLWPvcjgqZIZTp2fQ', '2022-10-26 21:56:41.743003');
INSERT INTO public.sessions VALUES (15, 6, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjYsImlhdCI6MTY2NjgyMTgzMywiZXhwIjoxNjY2ODI5MDMzfQ.5lCZP2bGtnc5sOU3nDpBTy2fR14Fqkdi7fzXpKBHKP0', '2022-10-26 22:03:53.28175');
INSERT INTO public.sessions VALUES (16, 5, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjUsImlhdCI6MTY2NjgyMjA3NywiZXhwIjoxNjY2ODI5Mjc3fQ.q6vAdKOpteBtE_vW26FM79vC3XHGYNIRDsfJDN5xW50', '2022-10-26 22:07:57.981871');
INSERT INTO public.sessions VALUES (17, 5, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjUsImlhdCI6MTY2NjgyMjI4MCwiZXhwIjoxNjY2ODI5NDgwfQ.16-GvUtLE1amI1vcw5XT0Yxx2AlbbXullceiKLpg4yQ', '2022-10-26 22:11:20.486705');
INSERT INTO public.sessions VALUES (18, 7, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjcsImlhdCI6MTY2NjgyOTA2MiwiZXhwIjoxNjY2ODM2MjYyfQ.gzGxtVKveSzIivCDRZqkmu-axDdWThAVJ0CupyRGDVI', '2022-10-27 00:04:22.864854');
INSERT INTO public.sessions VALUES (19, 6, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjYsImlhdCI6MTY2NjgzNDE0MCwiZXhwIjoxNjY2ODQxMzQwfQ.99m4F50trVQBZVKftP3bYCTvtZC5ttz9K17qSxoZg00', '2022-10-27 01:29:00.861898');
INSERT INTO public.sessions VALUES (20, 8, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjgsImlhdCI6MTY2NjgzNDIxNywiZXhwIjoxNjY2ODQxNDE3fQ.axQmwPjR2ks2qcZL4aB9EOGKbMrPhLqilmw9w2NaR9o', '2022-10-27 01:30:18.122752');
INSERT INTO public.sessions VALUES (21, 6, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjYsImlhdCI6MTY2NjgzNjY1MiwiZXhwIjoxNjY2ODQzODUyfQ.zB2mSwjmX5SZwG4jxW59j-u3Kip1ZTHkp1AGSeGc6D8', '2022-10-27 02:10:52.784594');
INSERT INTO public.sessions VALUES (22, 2, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjIsImlhdCI6MTY2Njg5NDk2MCwiZXhwIjoxNjY2OTAyMTYwfQ.LQW5Td_oFglMpKxMUSHW7S7kEGfBMv8XBuUuP2qxnjo', '2022-10-27 18:22:41.077591');
INSERT INTO public.sessions VALUES (23, 2, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjIsImlhdCI6MTY2Njg5NTAzMywiZXhwIjoxNjY2OTAyMjMzfQ.I8hIxANXTGkIS1DyuGS0S8VdEWEtn0u3eIWszmj1xNk', '2022-10-27 18:23:54.028295');
INSERT INTO public.sessions VALUES (24, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjEsImlhdCI6MTY2Njg5ODczMSwiZXhwIjoxNjY2OTA1OTMxfQ.fMSpExZr8NEbbU6VgrvOsAVSrtt0Ib78xIbxUtkfLUI', '2022-10-27 19:25:32.016361');
INSERT INTO public.sessions VALUES (25, 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjEsImlhdCI6MTY2NjkwMTgxNSwiZXhwIjoxNjY2OTA5MDE1fQ.oFWs8rGynvBlYDZ8tSwz-Inly73uR_m0g9u75OAm7_M', '2022-10-27 20:16:55.650471');


--
-- Data for Name: trends; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.trends VALUES (1, 'news');
INSERT INTO public.trends VALUES (2, 'noticias');
INSERT INTO public.trends VALUES (3, 'ana');
INSERT INTO public.trends VALUES (4, 'noticias
');
INSERT INTO public.trends VALUES (5, 'nuncaDesista');
INSERT INTO public.trends VALUES (6, 'funfaPF');


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users VALUES (1, 'Ana Paula Conta Teste', 'ana@teste.com', '$2b$12$3MRAJfg1eqCtS8/tK0qALuC4z0c4070uu.qdBRj.Ilrorh.bRDrWW', 'https://4maos.com.br/wp-content/uploads/2022/07/004dc630b3e5734a071177ce4df81f0e.jpg');
INSERT INTO public.users VALUES (2, 'Perfil Teste', 'teste@teste.com', '$2b$12$exCK7IjJ9ae0uzhFciC/AeWyczcJ3KRuiaHZ8PPUFCYZfa0bhg7im', 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6e/Breezeicons-actions-22-im-user.svg/1200px-Breezeicons-actions-22-im-user.svg.png');
INSERT INTO public.users VALUES (3, 'Jonas Teste', 'pedrojonas.pj77@gmail.com', '$2b$12$ujAXQD9JSbDCxA6xSWL/NuqLT4LZq1cGTe5O8cMaihK/TA9cFp2Nm', 'https://res.cloudinary.com/lptennis/image/upload/v1481741458/sirzxzlkyzmfbxh4m0hj.jpg');
INSERT INTO public.users VALUES (4, 'Mais um Teste', 'teste2@teste.com', '$2b$12$0sKapeXd6dTB7kdC3J/6W.Hr2rGAg1FAKVwMEpmFKU4kkhRAYcQai', 'https://ps.w.org/metronet-profile-picture/assets/icon-256x256.png?rev=2464419');
INSERT INTO public.users VALUES (5, 'Lili Ana', 'lili@teste.com', '$2b$12$o0SrwZZNgIffbyJbUyxZT.U.CMA18fWe9k5m8ocAe4.MwdEXBmG7e', 'https://i.pinimg.com/originals/0a/ec/76/0aec76a31bfdad081f3307c7d0b01f5e.jpg');
INSERT INTO public.users VALUES (6, 'igorFf', 'olhaele@oi.com', '$2b$12$kc/eBSBcZll713q9JfVvEu3cVCFtZbCl..xb/nGwhtdta0NyXX2rK', 'https://www.zeldadungeon.net/wiki/images/f/fd/Link.png');
INSERT INTO public.users VALUES (7, 'testando', 'teste5@gmail.com', '$2b$12$SXmwxHuEqPUUfRXNVQTlfOMYjE5jFNc7L00CwfeSTSgClU6SfzYNK', 'https://almeidajunior-prod1.s3.amazonaws.com/prod/uploads/news/5d81505ac6770.jpg');
INSERT INTO public.users VALUES (8, 'Conta um', 'conta1@teste.com', '$2b$12$4juWzlKIdRMCJkuokxwr9O/Fw6Ir2HTK01QP8KNopCH.KeUyOv/ju', 'https://cdn.dribbble.com/users/1577045/screenshots/4914645/media/028d394ffb00cb7a4b2ef9915a384fd9.png?compress=1&resize=400x300&vertical=top');


--
-- Name: comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.comments_id_seq', 2, true);


--
-- Name: follows_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.follows_id_seq', 6, true);


--
-- Name: likes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.likes_id_seq', 3, true);


--
-- Name: posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.posts_id_seq', 8, true);


--
-- Name: posts_trends_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.posts_trends_id_seq', 16, true);


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sessions_id_seq', 25, true);


--
-- Name: trends_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.trends_id_seq', 6, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 8, true);


--
-- Name: comments comments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- Name: follows follows_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.follows
    ADD CONSTRAINT follows_pkey PRIMARY KEY (id);


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
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: comments comments_postId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT "comments_postId_fkey" FOREIGN KEY ("postId") REFERENCES public.posts(id) ON DELETE CASCADE;


--
-- Name: comments comments_postid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_postid_fkey FOREIGN KEY ("postId") REFERENCES public.posts(id);


--
-- Name: comments comments_userid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_userid_fkey FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- Name: follows follows_followedId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.follows
    ADD CONSTRAINT "follows_followedId_fkey" FOREIGN KEY ("followedId") REFERENCES public.users(id);


--
-- Name: follows follows_followerId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.follows
    ADD CONSTRAINT "follows_followerId_fkey" FOREIGN KEY ("followerId") REFERENCES public.users(id);


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


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
-- Name: alumnos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.alumnos (
    idalumnos integer NOT NULL,
    nombre character varying(50),
    apellido character varying(50),
    correo character varying(50),
    telefono character varying(50)
);


--
-- Name: aulas; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.aulas (
    idaulas integer,
    idgrupos integer,
    nombre character varying(50)
);


--
-- Name: evaluaciones; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.evaluaciones (
    idevaluaciones integer NOT NULL,
    nombre character varying(50)
);


--
-- Name: gralumnos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.gralumnos (
    idgalumnos integer NOT NULL,
    idalumnos integer,
    idgrupos integer
);


--
-- Name: grmaestro; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.grmaestro (
    idgmaestro integer NOT NULL,
    idmaestros integer,
    idgrupos integer
);


--
-- Name: grupos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.grupos (
    idgrupos integer NOT NULL,
    nombre character varying(50)
);


--
-- Name: maestros; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.maestros (
    idmaestros integer NOT NULL,
    nombre character varying(50),
    apellido character varying(50)
);


--
-- Name: nota; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.nota (
    idnota integer NOT NULL,
    idevaluaciones integer,
    idalumnos integer,
    notas character varying(50)
);


--
-- Name: usuari; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.usuari (
    iduser integer NOT NULL,
    idmaestros integer,
    usuario character varying(50),
    contra character varying(50)
);


--
-- Data for Name: alumnos; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.alumnos (idalumnos, nombre, apellido, correo, telefono) FROM stdin;
1	alumno1	sam1	alumno1@gmil.com	78980911
2	alumno2	sam2	alumno2@gmil.com	78980912
3	alumno3	sam3	alumno3@gmil.com	78980913
4	alumno4	sam4	alumno4@gmil.com	78980914
5	alumno5	sam5	alumno5@gmil.com	78980915
6	alumno6	sam6	alumno6@gmil.com	78980916
7	alumno7	sam7	alumno7@gmil.com	78980917
8	alumno8	sam8	alumno8@gmil.com	78980918
9	alumno9	sam9	alumno9@gmil.com	78980919
10	alumno10	sam10	alumno10@gmil.com	789809110
11	alumno11	sam11	alumno11@gmil.com	789809111
12	alumno12	sam12	alumno12@gmil.com	789809112
13	alumno13	sam13	alumno13@gmil.com	789809113
14	alumno14	sam14	alumno14@gmil.com	789809114
15	alumno15	sam15	alumno15@gmil.com	789809115
16	alumno16	sam16	alumno16@gmil.com	789809116
17	alumno17	sam17	alumno17@gmil.com	789809117
18	alumno18	sam18	alumno18@gmil.com	789809118
19	alumno19	sam19	alumno19@gmil.com	789809119
20	alumno20	sam20	alumno20@gmil.com	789809120
21	lester21	sam	lester21@gmail.com	70754821
\.


--
-- Data for Name: aulas; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.aulas (idaulas, idgrupos, nombre) FROM stdin;
1	1	A1
2	2	A2
3	3	A3
4	4	A4
\.


--
-- Data for Name: evaluaciones; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.evaluaciones (idevaluaciones, nombre) FROM stdin;
1	evaluacion1
2	evaluacion2
3	evaluacion3
4	evaluacion4
5	evaluacion5
6	evaluacion6
7	evaluacion7
8	evaluacion8
9	evaluacion9
10	evaluacion10
11	evaluacion11
12	evaluacion12
13	evaluacion13
14	evaluacion14
15	evaluacion15
16	evaluacion16
17	evaluacion17
18	evaluacion18
19	evaluacion19
20	evaluacion20
21	evaluacion21
22	evaluacion22
23	evaluacion23
24	evaluacion24
25	evaluacion25
26	evaluacion26
27	evaluacion27
28	evaluacion28
29	evaluacion29
30	evaluacion30
31	evaluacion31
32	evaluacion32
33	evaluacion33
34	evaluacion34
35	evaluacion35
36	evaluacion36
37	evaluacion37
38	evaluacion38
39	evaluacion39
40	evaluacion40
41	evaluacion41
42	evaluacion42
43	evaluacion43
44	evaluacion44
45	evaluacion45
46	evaluacion46
47	evaluacion47
48	evaluacion48
49	evaluacion49
50	evaluacion50
51	evaluacion51
52	evaluacion52
53	evaluacion53
54	evaluacion54
55	evaluacion55
56	evaluacion56
57	evaluacion57
58	evaluacion58
59	evaluacion59
60	evaluacion60
61	evaluacion61
62	evaluacion62
63	evaluacion63
64	evaluacion64
65	evaluacion65
66	evaluacion66
67	evaluacion67
68	evaluacion68
69	evaluacion69
70	evaluacion70
71	evaluacion71
72	evaluacion72
73	evaluacion73
74	evaluacion74
75	evaluacion75
76	evaluacion76
77	evaluacion77
78	evaluacion78
79	evaluacion79
80	evaluacion80
\.


--
-- Data for Name: gralumnos; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.gralumnos (idgalumnos, idalumnos, idgrupos) FROM stdin;
1	1	1
2	2	1
3	3	1
4	4	1
5	5	1
6	6	2
7	7	2
8	8	2
9	9	2
10	10	2
11	11	3
12	12	3
13	13	3
14	14	3
15	15	3
16	16	4
17	17	4
18	18	4
19	19	4
20	20	4
\.


--
-- Data for Name: grmaestro; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.grmaestro (idgmaestro, idmaestros, idgrupos) FROM stdin;
1	1	1
2	2	2
3	3	3
4	4	4
\.


--
-- Data for Name: grupos; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.grupos (idgrupos, nombre) FROM stdin;
1	backend
2	frontend
3	devops
4	mobile
\.


--
-- Data for Name: maestros; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.maestros (idmaestros, nombre, apellido) FROM stdin;
1	les	enins
2	vip	sain
3	scorp	els
4	test	cod
\.


--
-- Data for Name: nota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.nota (idnota, idevaluaciones, idalumnos, notas) FROM stdin;
\.


--
-- Data for Name: usuari; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.usuari (iduser, idmaestros, usuario, contra) FROM stdin;
1	1	les1	abcd1
2	2	vip2	abcd2
3	3	scorp3	abcd3
4	4	test4	abcd4
\.


--
-- Name: alumnos alumnos_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.alumnos
    ADD CONSTRAINT alumnos_pkey PRIMARY KEY (idalumnos);


--
-- Name: evaluaciones evaluaciones_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.evaluaciones
    ADD CONSTRAINT evaluaciones_pkey PRIMARY KEY (idevaluaciones);


--
-- Name: gralumnos gralumnos_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.gralumnos
    ADD CONSTRAINT gralumnos_pkey PRIMARY KEY (idgalumnos);


--
-- Name: grmaestro grmaestro_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.grmaestro
    ADD CONSTRAINT grmaestro_pkey PRIMARY KEY (idgmaestro);


--
-- Name: grupos grupos_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.grupos
    ADD CONSTRAINT grupos_pkey PRIMARY KEY (idgrupos);


--
-- Name: maestros maestros_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.maestros
    ADD CONSTRAINT maestros_pkey PRIMARY KEY (idmaestros);


--
-- Name: nota nota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nota
    ADD CONSTRAINT nota_pkey PRIMARY KEY (idnota);


--
-- Name: usuari usuari_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usuari
    ADD CONSTRAINT usuari_pkey PRIMARY KEY (iduser);


--
-- Name: aulas aulas_idgrupos_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.aulas
    ADD CONSTRAINT aulas_idgrupos_fkey FOREIGN KEY (idgrupos) REFERENCES public.grupos(idgrupos);


--
-- Name: gralumnos gralumnos_idalumnos_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.gralumnos
    ADD CONSTRAINT gralumnos_idalumnos_fkey FOREIGN KEY (idalumnos) REFERENCES public.alumnos(idalumnos);


--
-- Name: gralumnos gralumnos_idgrupos_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.gralumnos
    ADD CONSTRAINT gralumnos_idgrupos_fkey FOREIGN KEY (idgrupos) REFERENCES public.grupos(idgrupos);


--
-- Name: grmaestro grmaestro_idgrupos_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.grmaestro
    ADD CONSTRAINT grmaestro_idgrupos_fkey FOREIGN KEY (idgrupos) REFERENCES public.grupos(idgrupos);


--
-- Name: grmaestro grmaestro_idmaestros_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.grmaestro
    ADD CONSTRAINT grmaestro_idmaestros_fkey FOREIGN KEY (idmaestros) REFERENCES public.maestros(idmaestros);


--
-- Name: nota nota_idalumnos_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nota
    ADD CONSTRAINT nota_idalumnos_fkey FOREIGN KEY (idalumnos) REFERENCES public.alumnos(idalumnos);


--
-- Name: nota nota_idevaluaciones_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nota
    ADD CONSTRAINT nota_idevaluaciones_fkey FOREIGN KEY (idevaluaciones) REFERENCES public.evaluaciones(idevaluaciones);


--
-- Name: usuari usuari_idmaestros_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usuari
    ADD CONSTRAINT usuari_idmaestros_fkey FOREIGN KEY (idmaestros) REFERENCES public.maestros(idmaestros);


--
-- PostgreSQL database dump complete
--


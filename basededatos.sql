--
-- PostgreSQL database dump
--

-- Dumped from database version 17.5
-- Dumped by pg_dump version 17.4

-- Started on 2025-07-19 21:24:31

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- TOC entry 218 (class 1259 OID 16800)
-- Name: alumno; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alumno (
    rut text NOT NULL,
    nombres text NOT NULL,
    apellido_paterno text NOT NULL,
    apellido_materno text NOT NULL,
    fecha_nacimiento date NOT NULL,
    direccion text NOT NULL,
    ciudad text NOT NULL,
    codigo_curso text
);


ALTER TABLE public.alumno OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16915)
-- Name: alumnosxcurso; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.alumnosxcurso AS
 SELECT codigo_curso,
    count(*) AS total_alumnos
   FROM public.alumno
  GROUP BY codigo_curso;


ALTER VIEW public.alumnosxcurso OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16833)
-- Name: apoderado; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.apoderado (
    rut character varying NOT NULL,
    nombres character varying,
    apellido_paterno character varying,
    apellido_materno character varying,
    direccion character varying,
    ciudad character varying
);


ALTER TABLE public.apoderado OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16793)
-- Name: curso; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.curso (
    codigo text NOT NULL,
    "año" integer NOT NULL
);


ALTER TABLE public.curso OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16857)
-- Name: es_jefe; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.es_jefe (
    codigo_curso character varying NOT NULL,
    rut_profesor_jefe character varying NOT NULL
);


ALTER TABLE public.es_jefe OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16886)
-- Name: extraprogramatica; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.extraprogramatica (
    codigo character varying NOT NULL,
    nombre character varying,
    dia character varying,
    hora_inicio time without time zone,
    hora_fin time without time zone,
    cupos integer,
    lugar character varying,
    rut_profesor character varying
);


ALTER TABLE public.extraprogramatica OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16814)
-- Name: media; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.media (
    codigo character varying NOT NULL,
    orientacion character varying
);


ALTER TABLE public.media OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16898)
-- Name: participa; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.participa (
    rut_alumno character varying NOT NULL,
    codigo character varying NOT NULL
);


ALTER TABLE public.participa OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16826)
-- Name: profesor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.profesor (
    rut character varying NOT NULL,
    nombres character varying,
    apellido_paterno character varying,
    apellido_materno character varying,
    direccion character varying,
    ciudad character varying
);


ALTER TABLE public.profesor OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16840)
-- Name: representa; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.representa (
    rut_alumno character varying NOT NULL,
    rut_apoderado character varying NOT NULL,
    fecha_inicio date,
    fecha_termino date
);


ALTER TABLE public.representa OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16874)
-- Name: tiene; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tiene (
    rut_profesor character varying NOT NULL,
    codigo_especialidad character varying NOT NULL
);


ALTER TABLE public.tiene OWNER TO postgres;

--
-- TOC entry 4958 (class 0 OID 16800)
-- Dependencies: 218
-- Data for Name: alumno; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.alumno (rut, nombres, apellido_paterno, apellido_materno, fecha_nacimiento, direccion, ciudad, codigo_curso) FROM stdin;
21629898-2	lucas	perez	jara	2004-09-09	concepcion	concepcion	A1
12345678-9	juan	perez	lucas	2005-09-10	calle falsa 123	concepcion	A2
12340678-9	Juan	Pérez	Soto	2005-06-12	Calle Falsa 22	Concepción	C1
98765432-1	Ana	Ramírez	Contreras	2006-04-10	Los Álamos 101	Hualpén	B1
19283746-5	Diego	Muñoz	Leiva	2004-11-03	Av. Colón 5050	Talcahuano	D2
\.


--
-- TOC entry 4961 (class 0 OID 16833)
-- Dependencies: 221
-- Data for Name: apoderado; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.apoderado (rut, nombres, apellido_paterno, apellido_materno, direccion, ciudad) FROM stdin;
55555555-5	Marcela	Soto	Ramírez	Pasaje Azul 456	Concepción
66666666-6	Rodrigo	Contreras	Fuentes	Pje Verde 123	Hualpén
77777777-7	Paula	Leiva	Espinoza	Fresia 89	Talcahuano
\.


--
-- TOC entry 4957 (class 0 OID 16793)
-- Dependencies: 217
-- Data for Name: curso; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.curso (codigo, "año") FROM stdin;
A1	2025
A2	2025
B1	2025
B2	2025
C1	2025
C2	2025
D1	2025
D2	2025
\.


--
-- TOC entry 4963 (class 0 OID 16857)
-- Dependencies: 223
-- Data for Name: es_jefe; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.es_jefe (codigo_curso, rut_profesor_jefe) FROM stdin;
C1	11111111-1
B1	22222222-2
D2	33333333-3
\.


--
-- TOC entry 4965 (class 0 OID 16886)
-- Dependencies: 225
-- Data for Name: extraprogramatica; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.extraprogramatica (codigo, nombre, dia, hora_inicio, hora_fin, cupos, lugar, rut_profesor) FROM stdin;
EXTRA1	Taller de Teatro	Lunes	16:00:00	17:30:00	20	Sala 1	88888888-8
\.


--
-- TOC entry 4959 (class 0 OID 16814)
-- Dependencies: 219
-- Data for Name: media; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.media (codigo, orientacion) FROM stdin;
C1	Científico
C2	Humanista
D1	Técnico
D2	Científico
A2	Científico
A1	Humanista
\.


--
-- TOC entry 4966 (class 0 OID 16898)
-- Dependencies: 226
-- Data for Name: participa; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.participa (rut_alumno, codigo) FROM stdin;
12345678-9	EXTRA1
\.


--
-- TOC entry 4960 (class 0 OID 16826)
-- Dependencies: 220
-- Data for Name: profesor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.profesor (rut, nombres, apellido_paterno, apellido_materno, direccion, ciudad) FROM stdin;
11111111-1	Carlos	González	Rojas	Av. Siempre Viva 123	Concepción
22222222-2	Patricia	López	Martínez	Pasaje Amarillo 999	Talcahuano
33333333-3	Mario	Fuentes	Díaz	Villa El Sol 33	San Pedro
88888888-8	Elena	Bravo	Navarrete	Chillán 123	Concepción
\.


--
-- TOC entry 4962 (class 0 OID 16840)
-- Dependencies: 222
-- Data for Name: representa; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.representa (rut_alumno, rut_apoderado, fecha_inicio, fecha_termino) FROM stdin;
12345678-9	55555555-5	2025-01-01	\N
98765432-1	66666666-6	2025-01-01	\N
19283746-5	77777777-7	2025-01-01	\N
\.


--
-- TOC entry 4964 (class 0 OID 16874)
-- Dependencies: 224
-- Data for Name: tiene; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tiene (rut_profesor, codigo_especialidad) FROM stdin;
\.


--
-- TOC entry 4784 (class 2606 OID 16806)
-- Name: alumno alumno_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alumno
    ADD CONSTRAINT alumno_pkey PRIMARY KEY (rut);


--
-- TOC entry 4790 (class 2606 OID 16839)
-- Name: apoderado apoderado_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.apoderado
    ADD CONSTRAINT apoderado_pkey PRIMARY KEY (rut);


--
-- TOC entry 4782 (class 2606 OID 16799)
-- Name: curso curso_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.curso
    ADD CONSTRAINT curso_pkey PRIMARY KEY (codigo);


--
-- TOC entry 4794 (class 2606 OID 16863)
-- Name: es_jefe es_jefe_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.es_jefe
    ADD CONSTRAINT es_jefe_pkey PRIMARY KEY (codigo_curso, rut_profesor_jefe);


--
-- TOC entry 4798 (class 2606 OID 16892)
-- Name: extraprogramatica extraprogramatica_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.extraprogramatica
    ADD CONSTRAINT extraprogramatica_pkey PRIMARY KEY (codigo);


--
-- TOC entry 4786 (class 2606 OID 16820)
-- Name: media media_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.media
    ADD CONSTRAINT media_pkey PRIMARY KEY (codigo);


--
-- TOC entry 4800 (class 2606 OID 16904)
-- Name: participa participa_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.participa
    ADD CONSTRAINT participa_pkey PRIMARY KEY (rut_alumno, codigo);


--
-- TOC entry 4788 (class 2606 OID 16832)
-- Name: profesor profesor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profesor
    ADD CONSTRAINT profesor_pkey PRIMARY KEY (rut);


--
-- TOC entry 4792 (class 2606 OID 16846)
-- Name: representa representa_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.representa
    ADD CONSTRAINT representa_pkey PRIMARY KEY (rut_alumno, rut_apoderado);


--
-- TOC entry 4796 (class 2606 OID 16880)
-- Name: tiene tiene_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tiene
    ADD CONSTRAINT tiene_pkey PRIMARY KEY (rut_profesor, codigo_especialidad);


--
-- TOC entry 4801 (class 2606 OID 16807)
-- Name: alumno alumno_codigo_curso_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alumno
    ADD CONSTRAINT alumno_codigo_curso_fkey FOREIGN KEY (codigo_curso) REFERENCES public.curso(codigo);


--
-- TOC entry 4805 (class 2606 OID 16864)
-- Name: es_jefe es_jefe_codigo_curso_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.es_jefe
    ADD CONSTRAINT es_jefe_codigo_curso_fkey FOREIGN KEY (codigo_curso) REFERENCES public.curso(codigo);


--
-- TOC entry 4806 (class 2606 OID 16869)
-- Name: es_jefe es_jefe_rut_profesor_jefe_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.es_jefe
    ADD CONSTRAINT es_jefe_rut_profesor_jefe_fkey FOREIGN KEY (rut_profesor_jefe) REFERENCES public.profesor(rut);


--
-- TOC entry 4808 (class 2606 OID 16893)
-- Name: extraprogramatica extraprogramatica_rut_profesor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.extraprogramatica
    ADD CONSTRAINT extraprogramatica_rut_profesor_fkey FOREIGN KEY (rut_profesor) REFERENCES public.profesor(rut);


--
-- TOC entry 4802 (class 2606 OID 16821)
-- Name: media media_codigo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.media
    ADD CONSTRAINT media_codigo_fkey FOREIGN KEY (codigo) REFERENCES public.curso(codigo);


--
-- TOC entry 4809 (class 2606 OID 16910)
-- Name: participa participa_codigo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.participa
    ADD CONSTRAINT participa_codigo_fkey FOREIGN KEY (codigo) REFERENCES public.extraprogramatica(codigo);


--
-- TOC entry 4810 (class 2606 OID 16905)
-- Name: participa participa_rut_alumno_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.participa
    ADD CONSTRAINT participa_rut_alumno_fkey FOREIGN KEY (rut_alumno) REFERENCES public.alumno(rut);


--
-- TOC entry 4803 (class 2606 OID 16847)
-- Name: representa representa_rut_alumno_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.representa
    ADD CONSTRAINT representa_rut_alumno_fkey FOREIGN KEY (rut_alumno) REFERENCES public.alumno(rut);


--
-- TOC entry 4804 (class 2606 OID 16852)
-- Name: representa representa_rut_apoderado_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.representa
    ADD CONSTRAINT representa_rut_apoderado_fkey FOREIGN KEY (rut_apoderado) REFERENCES public.apoderado(rut);


--
-- TOC entry 4807 (class 2606 OID 16881)
-- Name: tiene tiene_rut_profesor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tiene
    ADD CONSTRAINT tiene_rut_profesor_fkey FOREIGN KEY (rut_profesor) REFERENCES public.profesor(rut);


-- Completed on 2025-07-19 21:24:32

--
-- PostgreSQL database dump complete
--


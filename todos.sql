--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.3
-- Dumped by pg_dump version 9.6.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: lists; Type: TABLE; Schema: public; Owner: User
--

CREATE TABLE lists (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE lists OWNER TO "User";

--
-- Name: list_id_seq; Type: SEQUENCE; Schema: public; Owner: User
--

CREATE SEQUENCE list_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE list_id_seq OWNER TO "User";

--
-- Name: list_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: User
--

ALTER SEQUENCE list_id_seq OWNED BY lists.id;


--
-- Name: todos; Type: TABLE; Schema: public; Owner: User
--

CREATE TABLE todos (
    id integer NOT NULL,
    name text NOT NULL,
    completed boolean DEFAULT false NOT NULL,
    list_id integer NOT NULL
);


ALTER TABLE todos OWNER TO "User";

--
-- Name: todos_id_seq; Type: SEQUENCE; Schema: public; Owner: User
--

CREATE SEQUENCE todos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE todos_id_seq OWNER TO "User";

--
-- Name: todos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: User
--

ALTER SEQUENCE todos_id_seq OWNED BY todos.id;


--
-- Name: lists id; Type: DEFAULT; Schema: public; Owner: User
--

ALTER TABLE ONLY lists ALTER COLUMN id SET DEFAULT nextval('list_id_seq'::regclass);


--
-- Name: todos id; Type: DEFAULT; Schema: public; Owner: User
--

ALTER TABLE ONLY todos ALTER COLUMN id SET DEFAULT nextval('todos_id_seq'::regclass);


--
-- Name: list_id_seq; Type: SEQUENCE SET; Schema: public; Owner: User
--

SELECT pg_catalog.setval('list_id_seq', 6, true);


--
-- Data for Name: lists; Type: TABLE DATA; Schema: public; Owner: User
--

COPY lists (id, name) FROM stdin;
\.


--
-- Data for Name: todos; Type: TABLE DATA; Schema: public; Owner: User
--

COPY todos (id, name, completed, list_id) FROM stdin;
\.


--
-- Name: todos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: User
--

SELECT pg_catalog.setval('todos_id_seq', 10, true);


--
-- Name: lists list_name_key; Type: CONSTRAINT; Schema: public; Owner: User
--

ALTER TABLE ONLY lists
    ADD CONSTRAINT list_name_key UNIQUE (name);


--
-- Name: lists list_pkey; Type: CONSTRAINT; Schema: public; Owner: User
--

ALTER TABLE ONLY lists
    ADD CONSTRAINT list_pkey PRIMARY KEY (id);


--
-- Name: todos todo_pkey; Type: CONSTRAINT; Schema: public; Owner: User
--

ALTER TABLE ONLY todos
    ADD CONSTRAINT todo_pkey PRIMARY KEY (id);


--
-- Name: todos todo_list_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: User
--

ALTER TABLE ONLY todos
    ADD CONSTRAINT todo_list_id_fkey FOREIGN KEY (list_id) REFERENCES lists(id);


--
-- PostgreSQL database dump complete
--


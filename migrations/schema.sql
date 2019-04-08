--
-- PostgreSQL database dump
--

-- Dumped from database version 10.6
-- Dumped by pg_dump version 10.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: ryon
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: comments; Type: TABLE; Schema: public; Owner: ryon
--

CREATE TABLE public.comments (
    id uuid NOT NULL,
    content character varying(255) NOT NULL,
    status character varying(255) NOT NULL,
    author_id uuid NOT NULL,
    post_id uuid NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.comments OWNER TO ryon;

--
-- Name: posts; Type: TABLE; Schema: public; Owner: ryon
--

CREATE TABLE public.posts (
    id uuid NOT NULL,
    title character varying(255) NOT NULL,
    content character varying(255) NOT NULL,
    tags character varying(255) NOT NULL,
    status character varying(255) NOT NULL,
    author_id uuid NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.posts OWNER TO ryon;

--
-- Name: schema_migration; Type: TABLE; Schema: public; Owner: ryon
--

CREATE TABLE public.schema_migration (
    version character varying(14) NOT NULL
);


ALTER TABLE public.schema_migration OWNER TO ryon;

--
-- Name: tags; Type: TABLE; Schema: public; Owner: ryon
--

CREATE TABLE public.tags (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    frequency character varying(255) NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.tags OWNER TO ryon;

--
-- Name: usernames; Type: TABLE; Schema: public; Owner: ryon
--

CREATE TABLE public.usernames (
    id uuid NOT NULL,
    password character varying(255) NOT NULL,
    salt character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    profile uuid NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.usernames OWNER TO ryon;

--
-- Name: users; Type: TABLE; Schema: public; Owner: ryon
--

CREATE TABLE public.users (
    id uuid NOT NULL,
    username character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    salt character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    profile uuid NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.users OWNER TO ryon;

--
-- Name: comments comments_pkey; Type: CONSTRAINT; Schema: public; Owner: ryon
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- Name: posts posts_pkey; Type: CONSTRAINT; Schema: public; Owner: ryon
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id);


--
-- Name: tags tags_pkey; Type: CONSTRAINT; Schema: public; Owner: ryon
--

ALTER TABLE ONLY public.tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (id);


--
-- Name: usernames usernames_pkey; Type: CONSTRAINT; Schema: public; Owner: ryon
--

ALTER TABLE ONLY public.usernames
    ADD CONSTRAINT usernames_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: ryon
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: schema_migration_version_idx; Type: INDEX; Schema: public; Owner: ryon
--

CREATE UNIQUE INDEX schema_migration_version_idx ON public.schema_migration USING btree (version);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: ryon
--

REVOKE ALL ON SCHEMA public FROM rdsadmin;
REVOKE ALL ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO ryon;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--


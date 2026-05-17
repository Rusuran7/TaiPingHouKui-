--
-- PostgreSQL database dump
--

\restrict OgpEh6md7OWSqiQfK7aAnX78or8JTRfzWrnbh9ZmJuKtDJyqarG2n9T2FHF6v77

-- Dumped from database version 18.3
-- Dumped by pg_dump version 18.3

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
-- Name: api_currency_rates; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.api_currency_rates (
    currency_code character varying(10),
    rate_to_usd numeric(15,6),
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.api_currency_rates OWNER TO postgres;

--
-- Name: crypto_marketing_data; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.crypto_marketing_data (
    id integer NOT NULL,
    coin_name character varying(50),
    price_usd double precision,
    market_cap double precision,
    total_volume double precision,
    "timestamp" timestamp without time zone
);


ALTER TABLE public.crypto_marketing_data OWNER TO postgres;

--
-- Name: crypto_marketing_data_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.crypto_marketing_data_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.crypto_marketing_data_id_seq OWNER TO postgres;

--
-- Name: crypto_marketing_data_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.crypto_marketing_data_id_seq OWNED BY public.crypto_marketing_data.id;


--
-- Name: crypto_marketing_data id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.crypto_marketing_data ALTER COLUMN id SET DEFAULT nextval('public.crypto_marketing_data_id_seq'::regclass);


--
-- Name: crypto_marketing_data crypto_marketing_data_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.crypto_marketing_data
    ADD CONSTRAINT crypto_marketing_data_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

\unrestrict OgpEh6md7OWSqiQfK7aAnX78or8JTRfzWrnbh9ZmJuKtDJyqarG2n9T2FHF6v77


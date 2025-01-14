--
-- PostgreSQL database dump
--

-- Dumped from database version 17.2
-- Dumped by pg_dump version 17.2

-- Started on 2025-01-05 20:29:32

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
-- TOC entry 217 (class 1259 OID 16724)
-- Name: analysis; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.analysis (
    id integer NOT NULL,
    survey_id character varying(255),
    version character varying(50) NOT NULL,
    status character varying(50),
    created_by character varying(255),
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.analysis OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16752)
-- Name: entities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.entities (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    location_ids character varying(255)[]
);


ALTER TABLE public.entities OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16762)
-- Name: locations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.locations (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    address text,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.locations OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16769)
-- Name: mine_sites; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mine_sites (
    id integer NOT NULL,
    entity_id integer,
    location_id integer,
    name character varying(255) NOT NULL,
    description text,
    is_active boolean DEFAULT true,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.mine_sites OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 16798)
-- Name: stockpile_analysis; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stockpile_analysis (
    id integer NOT NULL,
    analysis_id integer,
    polygon_id character varying(255),
    volume numeric,
    value numeric,
    weight numeric,
    material character varying(255),
    density numeric,
    value_per_unit numeric,
    data_source character varying(255),
    method character varying(255),
    mode character varying(255),
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.stockpile_analysis OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 16805)
-- Name: surveys; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.surveys (
    id integer NOT NULL,
    site_id integer,
    survey_date date NOT NULL,
    surveyor_id integer,
    notes text,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.surveys OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 16817)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    entity_id integer,
    email character varying(255) NOT NULL,
    password_hash character varying(255) NOT NULL,
    first_name character varying(255),
    last_name character varying(255),
    role character varying(50),
    is_active boolean DEFAULT true,
    access_level character varying(50),
    site_id integer,
    granted_at timestamp with time zone,
    granted_by character varying(255),
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 4846 (class 0 OID 16724)
-- Dependencies: 217
-- Data for Name: analysis; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.analysis (id, survey_id, version, status, created_by, created_at, updated_at) VALUES (1, '1', '1', 'Completed', 'Admin', '2024-12-23 10:24:59.518234+05:30', '2024-12-23 10:24:59.518234+05:30');
INSERT INTO public.analysis (id, survey_id, version, status, created_by, created_at, updated_at) VALUES (2, '2', '1', 'Completed', 'Admin', '2024-12-23 10:24:59.518234+05:30', '2024-12-23 10:24:59.518234+05:30');
INSERT INTO public.analysis (id, survey_id, version, status, created_by, created_at, updated_at) VALUES (3, '3', '1', 'Completed', 'Admin', '2024-12-23 10:24:59.518234+05:30', '2024-12-23 10:24:59.518234+05:30');
INSERT INTO public.analysis (id, survey_id, version, status, created_by, created_at, updated_at) VALUES (4, '4', '1', 'Completed', 'Admin', '2024-12-23 10:24:59.518234+05:30', '2024-12-23 10:24:59.518234+05:30');
INSERT INTO public.analysis (id, survey_id, version, status, created_by, created_at, updated_at) VALUES (5, '5', 'Version 1', 'Completed', 'Admin', '2025-01-02 21:57:04.37391+05:30', '2025-01-02 21:57:04.37391+05:30');
INSERT INTO public.analysis (id, survey_id, version, status, created_by, created_at, updated_at) VALUES (6, '5', 'Version 2', 'Completed', 'Admin', '2025-01-02 21:57:04.37391+05:30', '2025-01-02 21:57:04.37391+05:30');
INSERT INTO public.analysis (id, survey_id, version, status, created_by, created_at, updated_at) VALUES (7, '7', 'Version 3', 'Completed', 'Admin', '2025-01-02 21:57:04.37391+05:30', '2025-01-02 21:57:04.37391+05:30');
INSERT INTO public.analysis (id, survey_id, version, status, created_by, created_at, updated_at) VALUES (8, '8', 'Final', 'Completed', 'Admin', '2025-01-02 21:57:04.37391+05:30', '2025-01-02 21:57:04.37391+05:30');
INSERT INTO public.analysis (id, survey_id, version, status, created_by, created_at, updated_at) VALUES (9, '9', 'Version 2', 'Completed', 'Admin', '2025-01-02 21:57:04.37391+05:30', '2025-01-02 21:57:04.37391+05:30');
INSERT INTO public.analysis (id, survey_id, version, status, created_by, created_at, updated_at) VALUES (10, '10', 'Version 1', 'Completed', 'Admin', '2025-01-02 21:57:04.37391+05:30', '2025-01-02 21:57:04.37391+05:30');
INSERT INTO public.analysis (id, survey_id, version, status, created_by, created_at, updated_at) VALUES (11, '11', 'Final', 'Completed', 'Admin', '2025-01-02 21:57:04.37391+05:30', '2025-01-02 21:57:04.37391+05:30');
INSERT INTO public.analysis (id, survey_id, version, status, created_by, created_at, updated_at) VALUES (12, '12', 'Version 1', 'Completed', 'Admin', '2025-01-02 21:57:04.37391+05:30', '2025-01-02 21:57:04.37391+05:30');
INSERT INTO public.analysis (id, survey_id, version, status, created_by, created_at, updated_at) VALUES (13, '13', 'Version 3', 'Completed', 'Admin', '2025-01-02 21:57:04.37391+05:30', '2025-01-02 21:57:04.37391+05:30');


--
-- TOC entry 4847 (class 0 OID 16752)
-- Dependencies: 221
-- Data for Name: entities; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.entities (id, name, location_ids) VALUES (1, 'Tata', NULL);
INSERT INTO public.entities (id, name, location_ids) VALUES (2, 'Adani', NULL);


--
-- TOC entry 4848 (class 0 OID 16762)
-- Dependencies: 223
-- Data for Name: locations; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.locations (id, name, address, created_at, updated_at) VALUES (1, 'Orissa', NULL, '2024-12-23 10:23:36.314206+05:30', '2024-12-23 10:23:36.314206+05:30');
INSERT INTO public.locations (id, name, address, created_at, updated_at) VALUES (2, 'Jharkhand', NULL, '2024-12-23 10:23:36.314206+05:30', '2024-12-23 10:23:36.314206+05:30');
INSERT INTO public.locations (id, name, address, created_at, updated_at) VALUES (3, 'Telangana', NULL, '2024-12-23 10:23:36.314206+05:30', '2024-12-23 10:23:36.314206+05:30');
INSERT INTO public.locations (id, name, address, created_at, updated_at) VALUES (4, 'AP', NULL, '2025-01-02 21:15:29.753116+05:30', '2025-01-02 21:15:29.753116+05:30');


--
-- TOC entry 4849 (class 0 OID 16769)
-- Dependencies: 224
-- Data for Name: mine_sites; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.mine_sites (id, entity_id, location_id, name, description, is_active, created_at, updated_at) VALUES (1, 1, 1, 'Kamarda Chromite Mine', NULL, true, '2024-12-23 10:23:36.314206+05:30', '2024-12-23 10:23:36.314206+05:30');
INSERT INTO public.mine_sites (id, entity_id, location_id, name, description, is_active, created_at, updated_at) VALUES (2, 1, 1, 'Nadidih Iron Ore Mine', NULL, true, '2024-12-23 10:23:36.314206+05:30', '2024-12-23 10:23:36.314206+05:30');
INSERT INTO public.mine_sites (id, entity_id, location_id, name, description, is_active, created_at, updated_at) VALUES (3, 1, 2, 'Oraghat Iron Ore Mine', NULL, true, '2024-12-23 10:23:36.314206+05:30', '2024-12-23 10:23:36.314206+05:30');
INSERT INTO public.mine_sites (id, entity_id, location_id, name, description, is_active, created_at, updated_at) VALUES (4, 2, 3, 'Sagasahi Iron Ore Mine', NULL, true, '2024-12-23 10:23:36.314206+05:30', '2024-12-23 10:23:36.314206+05:30');
INSERT INTO public.mine_sites (id, entity_id, location_id, name, description, is_active, created_at, updated_at) VALUES (5, 1, 1, 'Jindal Chromite Mine Sukinda JSL', NULL, true, '2025-01-02 21:57:04.37391+05:30', '2025-01-02 21:57:04.37391+05:30');
INSERT INTO public.mine_sites (id, entity_id, location_id, name, description, is_active, created_at, updated_at) VALUES (6, 1, 4, 'Jururi Iron Ore Mine', NULL, true, '2025-01-02 21:57:04.37391+05:30', '2025-01-02 21:57:04.37391+05:30');
INSERT INTO public.mine_sites (id, entity_id, location_id, name, description, is_active, created_at, updated_at) VALUES (7, 1, 4, 'Katasahi Iron & Manganese Mine', NULL, true, '2025-01-02 21:57:04.37391+05:30', '2025-01-02 21:57:04.37391+05:30');
INSERT INTO public.mine_sites (id, entity_id, location_id, name, description, is_active, created_at, updated_at) VALUES (8, 2, 4, 'Sagasahi Copper Ore Mine', NULL, true, '2025-01-02 21:57:04.37391+05:30', '2025-01-02 21:57:04.37391+05:30');
INSERT INTO public.mine_sites (id, entity_id, location_id, name, description, is_active, created_at, updated_at) VALUES (9, 2, 1, 'Saruabil Chromite Mine', NULL, true, '2025-01-02 21:57:04.37391+05:30', '2025-01-02 21:57:04.37391+05:30');
INSERT INTO public.mine_sites (id, entity_id, location_id, name, description, is_active, created_at, updated_at) VALUES (10, 2, 1, 'Saruabil Chromite Mine', NULL, true, '2025-01-02 21:57:04.37391+05:30', '2025-01-02 21:57:04.37391+05:30');
INSERT INTO public.mine_sites (id, entity_id, location_id, name, description, is_active, created_at, updated_at) VALUES (11, 2, 3, 'Patabeda iron Ore Mine', NULL, true, '2025-01-02 21:57:04.37391+05:30', '2025-01-02 21:57:04.37391+05:30');


--
-- TOC entry 4850 (class 0 OID 16798)
-- Dependencies: 228
-- Data for Name: stockpile_analysis; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.stockpile_analysis (id, analysis_id, polygon_id, volume, value, weight, material, density, value_per_unit, data_source, method, mode, created_at, updated_at) VALUES (1, 1, '1', 29.19735276, 1657.942479, 261.6082807, 'Copper', 8960, 6.3375, 'DSM', 'Triangular Fit', 'AI', '2024-12-23 10:28:29.210979+05:30', '2024-12-23 10:28:29.210979+05:30');
INSERT INTO public.stockpile_analysis (id, analysis_id, polygon_id, volume, value, weight, material, density, value_per_unit, data_source, method, mode, created_at, updated_at) VALUES (2, 1, '2', 27.26638221, 1548.294247, 244.3067846, 'Copper', 8960, 6.3375, 'DSM', 'Triangular Fit', 'Manual', '2024-12-23 10:28:29.210979+05:30', '2024-12-23 10:28:29.210979+05:30');
INSERT INTO public.stockpile_analysis (id, analysis_id, polygon_id, volume, value, weight, material, density, value_per_unit, data_source, method, mode, created_at, updated_at) VALUES (3, 1, '3', 108.7729671, 6176.564166, 974.6057855, 'Copper', 8960, 6.3375, 'DSM', 'Triangular Fit', 'AI + Manual', '2024-12-23 10:28:29.210979+05:30', '2024-12-23 10:28:29.210979+05:30');
INSERT INTO public.stockpile_analysis (id, analysis_id, polygon_id, volume, value, weight, material, density, value_per_unit, data_source, method, mode, created_at, updated_at) VALUES (4, 1, '4', 30.07662047, 1707.870817, 269.4865194, 'Copper', 8960, 6.3375, 'DSM', 'Triangular Fit', 'AI', '2024-12-23 10:28:29.210979+05:30', '2024-12-23 10:28:29.210979+05:30');
INSERT INTO public.stockpile_analysis (id, analysis_id, polygon_id, volume, value, weight, material, density, value_per_unit, data_source, method, mode, created_at, updated_at) VALUES (5, 1, '5', 12.81052497, 727.4328497, 114.7823037, 'Copper', 8960, 6.3375, 'DSM', 'Triangular Fit', 'Manual', '2024-12-23 10:28:29.210979+05:30', '2024-12-23 10:28:29.210979+05:30');
INSERT INTO public.stockpile_analysis (id, analysis_id, polygon_id, volume, value, weight, material, density, value_per_unit, data_source, method, mode, created_at, updated_at) VALUES (6, 1, '6', 113.1082834, 6422.740769, 1013.45022, 'Copper', 8960, 6.3375, 'DSM', 'Triangular Fit', 'AI + Manual', '2024-12-23 10:28:29.210979+05:30', '2024-12-23 10:28:29.210979+05:30');
INSERT INTO public.stockpile_analysis (id, analysis_id, polygon_id, volume, value, weight, material, density, value_per_unit, data_source, method, mode, created_at, updated_at) VALUES (7, 1, '7', 24.07996878, 1367.356947, 215.7565203, 'Copper', 8960, 6.3375, 'DSM', 'Triangular Fit', 'AI', '2024-12-23 10:28:29.210979+05:30', '2024-12-23 10:28:29.210979+05:30');
INSERT INTO public.stockpile_analysis (id, analysis_id, polygon_id, volume, value, weight, material, density, value_per_unit, data_source, method, mode, created_at, updated_at) VALUES (8, 1, '8', 41.41754494, 2351.853872, 371.1012027, 'Copper', 8960, 6.3375, 'DSM', 'Triangular Fit', 'Manual', '2024-12-23 10:28:29.210979+05:30', '2024-12-23 10:28:29.210979+05:30');
INSERT INTO public.stockpile_analysis (id, analysis_id, polygon_id, volume, value, weight, material, density, value_per_unit, data_source, method, mode, created_at, updated_at) VALUES (9, 1, '9', 24.23669864, 1376.256695, 217.1608198, 'Copper', 8960, 6.3375, 'DSM', 'Triangular Fit', 'AI + Manual', '2024-12-23 10:28:29.210979+05:30', '2024-12-23 10:28:29.210979+05:30');
INSERT INTO public.stockpile_analysis (id, analysis_id, polygon_id, volume, value, weight, material, density, value_per_unit, data_source, method, mode, created_at, updated_at) VALUES (10, 1, '10', 13.19960606, 749.5264305, 118.2684703, 'Copper', 8960, 6.3375, 'DSM', 'Triangular Fit', 'AI', '2024-12-23 10:28:29.210979+05:30', '2024-12-23 10:28:29.210979+05:30');
INSERT INTO public.stockpile_analysis (id, analysis_id, polygon_id, volume, value, weight, material, density, value_per_unit, data_source, method, mode, created_at, updated_at) VALUES (11, 2, '1', 1127.039679, 16428.01213, 2592.191263, 'Bauxite', 2300, 6.3375, 'DSM', 'Linear Fit', 'AI', '2024-12-23 10:28:29.210979+05:30', '2024-12-23 10:28:29.210979+05:30');
INSERT INTO public.stockpile_analysis (id, analysis_id, polygon_id, volume, value, weight, material, density, value_per_unit, data_source, method, mode, created_at, updated_at) VALUES (12, 2, '2', 1513.872462, 22066.58348, 3481.906663, 'Bauxite', 2300, 6.3375, 'DSM', 'Linear Fit', 'Manual', '2024-12-23 10:28:29.210979+05:30', '2024-12-23 10:28:29.210979+05:30');
INSERT INTO public.stockpile_analysis (id, analysis_id, polygon_id, volume, value, weight, material, density, value_per_unit, data_source, method, mode, created_at, updated_at) VALUES (13, 2, '3', 906.8644814, 13218.6834, 2085.788307, 'Bauxite', 2300, 6.3375, 'DSM', 'Linear Fit', 'AI + Manual', '2024-12-23 10:28:29.210979+05:30', '2024-12-23 10:28:29.210979+05:30');
INSERT INTO public.stockpile_analysis (id, analysis_id, polygon_id, volume, value, weight, material, density, value_per_unit, data_source, method, mode, created_at, updated_at) VALUES (14, 2, '4', 1107.721325, 16146.42297, 2547.759048, 'Bauxite', 2300, 6.3375, 'DSM', 'Linear Fit', 'AI', '2024-12-23 10:28:29.210979+05:30', '2024-12-23 10:28:29.210979+05:30');
INSERT INTO public.stockpile_analysis (id, analysis_id, polygon_id, volume, value, weight, material, density, value_per_unit, data_source, method, mode, created_at, updated_at) VALUES (15, 2, '5', 2480.380931, 36154.65254, 5704.876141, 'Bauxite', 2300, 6.3375, 'DSM', 'Linear Fit', 'Manual', '2024-12-23 10:28:29.210979+05:30', '2024-12-23 10:28:29.210979+05:30');
INSERT INTO public.stockpile_analysis (id, analysis_id, polygon_id, volume, value, weight, material, density, value_per_unit, data_source, method, mode, created_at, updated_at) VALUES (16, 2, '6', 2774.167455, 40436.95837, 6380.585147, 'Bauxite', 2300, 6.3375, 'DSM', 'Linear Fit', 'AI + Manual', '2024-12-23 10:28:29.210979+05:30', '2024-12-23 10:28:29.210979+05:30');
INSERT INTO public.stockpile_analysis (id, analysis_id, polygon_id, volume, value, weight, material, density, value_per_unit, data_source, method, mode, created_at, updated_at) VALUES (17, 2, '7', 1379.535081, 20108.44823, 3172.930687, 'Bauxite', 2300, 6.3375, 'DSM', 'Linear Fit', 'AI', '2024-12-23 10:28:29.210979+05:30', '2024-12-23 10:28:29.210979+05:30');
INSERT INTO public.stockpile_analysis (id, analysis_id, polygon_id, volume, value, weight, material, density, value_per_unit, data_source, method, mode, created_at, updated_at) VALUES (18, 2, '8', 2467.999413, 35974.17645, 5676.398651, 'Bauxite', 2300, 6.3375, 'DSM', 'Linear Fit', 'Manual', '2024-12-23 10:28:29.210979+05:30', '2024-12-23 10:28:29.210979+05:30');
INSERT INTO public.stockpile_analysis (id, analysis_id, polygon_id, volume, value, weight, material, density, value_per_unit, data_source, method, mode, created_at, updated_at) VALUES (19, 2, '9', 1792.116375, 26122.33631, 4121.867663, 'Bauxite', 2300, 6.3375, 'DSM', 'Linear Fit', 'AI + Manual', '2024-12-23 10:28:29.210979+05:30', '2024-12-23 10:28:29.210979+05:30');
INSERT INTO public.stockpile_analysis (id, analysis_id, polygon_id, volume, value, weight, material, density, value_per_unit, data_source, method, mode, created_at, updated_at) VALUES (20, 2, '10', 1072.242455, 15629.27409, 2466.157647, 'Bauxite', 2300, 6.3375, 'DSM', 'Linear Fit', 'AI', '2024-12-23 10:28:29.210979+05:30', '2024-12-23 10:28:29.210979+05:30');
INSERT INTO public.stockpile_analysis (id, analysis_id, polygon_id, volume, value, weight, material, density, value_per_unit, data_source, method, mode, created_at, updated_at) VALUES (21, 5, '1', 842.5, 1263.75, 1897.75, 'Chromite', 2250, 6.6667, 'DSM', 'Lowest Point', 'AI', '2025-01-02 21:57:04.37391+05:30', '2025-01-02 21:57:04.37391+05:30');
INSERT INTO public.stockpile_analysis (id, analysis_id, polygon_id, volume, value, weight, material, density, value_per_unit, data_source, method, mode, created_at, updated_at) VALUES (22, 5, '2', 1235.8, 1853.7, 2780.55, 'Chromite', 2250, 6.6667, 'DTM', 'Manual Input', 'Manual', '2025-01-02 21:57:04.37391+05:30', '2025-01-02 21:57:04.37391+05:30');
INSERT INTO public.stockpile_analysis (id, analysis_id, polygon_id, volume, value, weight, material, density, value_per_unit, data_source, method, mode, created_at, updated_at) VALUES (23, 5, '3', 678.4, 1017.6, 1526.4, 'Chromite', 2250, 6.6667, '3D Model', 'Linear Fit', 'AI + Manual', '2025-01-02 21:57:04.37391+05:30', '2025-01-02 21:57:04.37391+05:30');
INSERT INTO public.stockpile_analysis (id, analysis_id, polygon_id, volume, value, weight, material, density, value_per_unit, data_source, method, mode, created_at, updated_at) VALUES (24, 5, '4', 1467.2, 2200.8, 3301.2, 'Chromite', 2250, 6.6667, 'TIN', 'Triangular Fit', 'Manual', '2025-01-02 21:57:04.37391+05:30', '2025-01-02 21:57:04.37391+05:30');
INSERT INTO public.stockpile_analysis (id, analysis_id, polygon_id, volume, value, weight, material, density, value_per_unit, data_source, method, mode, created_at, updated_at) VALUES (25, 5, '5', 1578.3, 2367.45, 3551.18, 'Chromite', 2250, 6.6667, 'DSM', 'Average Fit', 'AI + Manual', '2025-01-02 21:57:04.37391+05:30', '2025-01-02 21:57:04.37391+05:30');
INSERT INTO public.stockpile_analysis (id, analysis_id, polygon_id, volume, value, weight, material, density, value_per_unit, data_source, method, mode, created_at, updated_at) VALUES (26, 5, '6', 983.6, 1475.4, 2213.1, 'Chromite', 2250, 6.6667, 'DTM', 'Pre-Existing DEM', 'AI', '2025-01-02 21:57:04.37391+05:30', '2025-01-02 21:57:04.37391+05:30');
INSERT INTO public.stockpile_analysis (id, analysis_id, polygon_id, volume, value, weight, material, density, value_per_unit, data_source, method, mode, created_at, updated_at) VALUES (27, 6, '1', 1050.3, 1575.45, 2363.18, 'Chromite', 2250, 6.6667, 'DSM', 'Lowest Point', 'Manual', '2025-01-02 21:57:04.37391+05:30', '2025-01-02 21:57:04.37391+05:30');
INSERT INTO public.stockpile_analysis (id, analysis_id, polygon_id, volume, value, weight, material, density, value_per_unit, data_source, method, mode, created_at, updated_at) VALUES (28, 6, '2', 1420.7, 2131.05, 3196.58, 'Chromite', 2250, 6.6667, 'DSM', 'Linear Fit', 'AI', '2025-01-02 21:57:04.37391+05:30', '2025-01-02 21:57:04.37391+05:30');
INSERT INTO public.stockpile_analysis (id, analysis_id, polygon_id, volume, value, weight, material, density, value_per_unit, data_source, method, mode, created_at, updated_at) VALUES (29, 6, '3', 870.2, 1305.3, 1957.95, 'Chromite', 2250, 6.6667, 'DTM', 'Manual Input', 'AI + Manual', '2025-01-02 21:57:04.37391+05:30', '2025-01-02 21:57:04.37391+05:30');
INSERT INTO public.stockpile_analysis (id, analysis_id, polygon_id, volume, value, weight, material, density, value_per_unit, data_source, method, mode, created_at, updated_at) VALUES (30, 6, '4', 1560.5, 2340.75, 3511.13, 'Chromite', 2250, 6.6667, '3D Model', 'Triangular Fit', 'AI', '2025-01-02 21:57:04.37391+05:30', '2025-01-02 21:57:04.37391+05:30');
INSERT INTO public.stockpile_analysis (id, analysis_id, polygon_id, volume, value, weight, material, density, value_per_unit, data_source, method, mode, created_at, updated_at) VALUES (31, 6, '5', 1325.8, 1988.7, 2983.05, 'Chromite', 2250, 6.6667, 'DTM', 'Average Fit', 'Manual', '2025-01-02 21:57:04.37391+05:30', '2025-01-02 21:57:04.37391+05:30');
INSERT INTO public.stockpile_analysis (id, analysis_id, polygon_id, volume, value, weight, material, density, value_per_unit, data_source, method, mode, created_at, updated_at) VALUES (32, 6, '6', 1087.4, 1631.1, 2446.65, 'Chromite', 2250, 6.6667, 'TIN', 'Pre-Existing DEM', 'AI', '2025-01-02 21:57:04.37391+05:30', '2025-01-02 21:57:04.37391+05:30');
INSERT INTO public.stockpile_analysis (id, analysis_id, polygon_id, volume, value, weight, material, density, value_per_unit, data_source, method, mode, created_at, updated_at) VALUES (33, 6, '7', 950.6, 1425.9, 2138.85, 'Chromite', 2250, 6.6667, '3D Model', 'Linear Fit', 'Manual', '2025-01-02 21:57:04.37391+05:30', '2025-01-02 21:57:04.37391+05:30');
INSERT INTO public.stockpile_analysis (id, analysis_id, polygon_id, volume, value, weight, material, density, value_per_unit, data_source, method, mode, created_at, updated_at) VALUES (34, 6, '8', 1195.3, 1792.95, 2689.43, 'Chromite', 2250, 6.6667, 'DSM', 'Manual Input', 'AI', '2025-01-02 21:57:04.37391+05:30', '2025-01-02 21:57:04.37391+05:30');
INSERT INTO public.stockpile_analysis (id, analysis_id, polygon_id, volume, value, weight, material, density, value_per_unit, data_source, method, mode, created_at, updated_at) VALUES (35, 6, '9', 1435.9, 2153.85, 3230.78, 'Chromite', 2250, 6.6667, 'DTM', 'Linear Fit', 'AI + Manual', '2025-01-02 21:57:04.37391+05:30', '2025-01-02 21:57:04.37391+05:30');
INSERT INTO public.stockpile_analysis (id, analysis_id, polygon_id, volume, value, weight, material, density, value_per_unit, data_source, method, mode, created_at, updated_at) VALUES (36, 7, '1', 980.5, 1470.75, 2451.25, 'Iron Ore (Hematite)', 2500, 6, 'DSM', 'Average Fit', 'AI', '2025-01-02 21:57:04.37391+05:30', '2025-01-02 21:57:04.37391+05:30');
INSERT INTO public.stockpile_analysis (id, analysis_id, polygon_id, volume, value, weight, material, density, value_per_unit, data_source, method, mode, created_at, updated_at) VALUES (37, 7, '2', 1205.7, 1929.12, 3215.2, 'Iron Ore (Magnetite)', 2670, 6, 'DSM', 'Triangular Fit', 'AI', '2025-01-02 21:57:04.37391+05:30', '2025-01-02 21:57:04.37391+05:30');
INSERT INTO public.stockpile_analysis (id, analysis_id, polygon_id, volume, value, weight, material, density, value_per_unit, data_source, method, mode, created_at, updated_at) VALUES (38, 7, '3', 875.3, 1312.95, 2188.25, 'Iron Ore (Hematite)', 2500, 6, 'DTM', 'Linear Fit', 'AI + Manual', '2025-01-02 21:57:04.37391+05:30', '2025-01-02 21:57:04.37391+05:30');
INSERT INTO public.stockpile_analysis (id, analysis_id, polygon_id, volume, value, weight, material, density, value_per_unit, data_source, method, mode, created_at, updated_at) VALUES (39, 7, '4', 1150.8, 1842.24, 3076.64, 'Iron Ore (Magnetite)', 2670, 6, '3D Model', 'Pre-Existing DEM', 'AI + Manual', '2025-01-02 21:57:04.37391+05:30', '2025-01-02 21:57:04.37391+05:30');
INSERT INTO public.stockpile_analysis (id, analysis_id, polygon_id, volume, value, weight, material, density, value_per_unit, data_source, method, mode, created_at, updated_at) VALUES (40, 7, '5', 1365.4, 2048.1, 3413.5, 'Iron Ore (Hematite)', 2500, 6, 'DTM', 'Manual Input', 'AI', '2025-01-02 21:57:04.37391+05:30', '2025-01-02 21:57:04.37391+05:30');
INSERT INTO public.stockpile_analysis (id, analysis_id, polygon_id, volume, value, weight, material, density, value_per_unit, data_source, method, mode, created_at, updated_at) VALUES (41, 7, '6', 1023.6, 1637.94, 2732.01, 'Iron Ore (Magnetite)', 2670, 6, 'TIN', 'Linear Fit', 'Manual', '2025-01-02 21:57:04.37391+05:30', '2025-01-02 21:57:04.37391+05:30');
INSERT INTO public.stockpile_analysis (id, analysis_id, polygon_id, volume, value, weight, material, density, value_per_unit, data_source, method, mode, created_at, updated_at) VALUES (42, 7, '7', 895.2, 1342.8, 2238, 'Iron Ore (Hematite)', 2500, 6, 'DTM', 'Lowest Point', 'Manual', '2025-01-02 21:57:04.37391+05:30', '2025-01-02 21:57:04.37391+05:30');
INSERT INTO public.stockpile_analysis (id, analysis_id, polygon_id, volume, value, weight, material, density, value_per_unit, data_source, method, mode, created_at, updated_at) VALUES (43, 8, '1', 1120.5, 1680.75, 2801.25, 'Iron', 2500, 6, 'DSM', 'Pre-Existing DEM', 'Manual', '2025-01-02 21:57:04.37391+05:30', '2025-01-02 21:57:04.37391+05:30');
INSERT INTO public.stockpile_analysis (id, analysis_id, polygon_id, volume, value, weight, material, density, value_per_unit, data_source, method, mode, created_at, updated_at) VALUES (44, 8, '2', 950.8, 1426.2, 2377, 'Manganese', 2500, 6, 'DSM', 'Pre-Existing DEM', 'AI + Manual', '2025-01-02 21:57:04.37391+05:30', '2025-01-02 21:57:04.37391+05:30');
INSERT INTO public.stockpile_analysis (id, analysis_id, polygon_id, volume, value, weight, material, density, value_per_unit, data_source, method, mode, created_at, updated_at) VALUES (45, 8, '3', 825.6, 1238.4, 2064, 'Manganese', 2500, 6, 'DTM', 'Triangular Fit', 'AI + Manual', '2025-01-02 21:57:04.37391+05:30', '2025-01-02 21:57:04.37391+05:30');
INSERT INTO public.stockpile_analysis (id, analysis_id, polygon_id, volume, value, weight, material, density, value_per_unit, data_source, method, mode, created_at, updated_at) VALUES (46, 8, '4', 1097.3, 1645.95, 2743.25, 'Manganese', 2500, 6, '3D Model', 'Linear Fit', 'Manual', '2025-01-02 21:57:04.37391+05:30', '2025-01-02 21:57:04.37391+05:30');
INSERT INTO public.stockpile_analysis (id, analysis_id, polygon_id, volume, value, weight, material, density, value_per_unit, data_source, method, mode, created_at, updated_at) VALUES (47, 8, '5', 1340.7, 2011.05, 3351.75, 'Iron', 2500, 6, 'DTM', 'Triangular Fit', 'AI', '2025-01-02 21:57:04.37391+05:30', '2025-01-02 21:57:04.37391+05:30');
INSERT INTO public.stockpile_analysis (id, analysis_id, polygon_id, volume, value, weight, material, density, value_per_unit, data_source, method, mode, created_at, updated_at) VALUES (48, 8, '6', 1180.9, 1771.35, 2952.25, 'Iron', 2500, 6, 'TIN', 'Lowest Point', 'AI', '2025-01-02 21:57:04.37391+05:30', '2025-01-02 21:57:04.37391+05:30');
INSERT INTO public.stockpile_analysis (id, analysis_id, polygon_id, volume, value, weight, material, density, value_per_unit, data_source, method, mode, created_at, updated_at) VALUES (49, 8, '7', 1023.4, 1535.1, 2558.5, 'Iron', 2500, 6, '3D Model', 'Manual Input', 'AI', '2025-01-02 21:57:04.37391+05:30', '2025-01-02 21:57:04.37391+05:30');
INSERT INTO public.stockpile_analysis (id, analysis_id, polygon_id, volume, value, weight, material, density, value_per_unit, data_source, method, mode, created_at, updated_at) VALUES (50, 10, '1', 875.4, 2188.5, 3120.6, 'Copper Ore (Chalcopyrite)', 3565, 7, 'DSM', 'Triangular Fit', 'Manual', '2025-01-02 21:57:04.37391+05:30', '2025-01-02 21:57:04.37391+05:30');
INSERT INTO public.stockpile_analysis (id, analysis_id, polygon_id, volume, value, weight, material, density, value_per_unit, data_source, method, mode, created_at, updated_at) VALUES (51, 10, '2', 940.8, 1975.68, 2822.4, 'Copper Ore (Malachite)', 3000, 7, 'DSM', 'Triangular Fit', 'AI + Manual', '2025-01-02 21:57:04.37391+05:30', '2025-01-02 21:57:04.37391+05:30');
INSERT INTO public.stockpile_analysis (id, analysis_id, polygon_id, volume, value, weight, material, density, value_per_unit, data_source, method, mode, created_at, updated_at) VALUES (52, 10, '3', 1023.5, 2558.75, 3653.48, 'Copper Ore (Chalcopyrite)', 3565, 7, 'DTM', 'Pre-Existing DEM', 'Manual', '2025-01-02 21:57:04.37391+05:30', '2025-01-02 21:57:04.37391+05:30');
INSERT INTO public.stockpile_analysis (id, analysis_id, polygon_id, volume, value, weight, material, density, value_per_unit, data_source, method, mode, created_at, updated_at) VALUES (53, 10, '4', 1112.7, 2336.67, 3341.1, 'Copper Ore (Malachite)', 3000, 7, '3D Model', 'Pre-Existing DEM', 'Manual', '2025-01-02 21:57:04.37391+05:30', '2025-01-02 21:57:04.37391+05:30');
INSERT INTO public.stockpile_analysis (id, analysis_id, polygon_id, volume, value, weight, material, density, value_per_unit, data_source, method, mode, created_at, updated_at) VALUES (54, 10, '5', 985.6, 2464, 3510.9, 'Copper Ore (Chalcopyrite)', 3565, 7, 'DTM', 'Manual Input', 'AI', '2025-01-02 21:57:04.37391+05:30', '2025-01-02 21:57:04.37391+05:30');
INSERT INTO public.stockpile_analysis (id, analysis_id, polygon_id, volume, value, weight, material, density, value_per_unit, data_source, method, mode, created_at, updated_at) VALUES (55, 10, '6', 875.3, 1838.13, 2625.9, 'Copper Ore (Malachite)', 3000, 7, 'TIN', 'Manual Input', 'AI', '2025-01-02 21:57:04.37391+05:30', '2025-01-02 21:57:04.37391+05:30');
INSERT INTO public.stockpile_analysis (id, analysis_id, polygon_id, volume, value, weight, material, density, value_per_unit, data_source, method, mode, created_at, updated_at) VALUES (56, 10, '7', 810.4, 2026, 2890.6, 'Copper Ore (Chalcopyrite)', 3565, 7, 'DTM', 'Lowest Point', 'AI', '2025-01-02 21:57:04.37391+05:30', '2025-01-02 21:57:04.37391+05:30');
INSERT INTO public.stockpile_analysis (id, analysis_id, polygon_id, volume, value, weight, material, density, value_per_unit, data_source, method, mode, created_at, updated_at) VALUES (57, 10, '8', 995.2, 2089.92, 2985.6, 'Copper Ore (Malachite)', 3000, 7, '3D Model', 'Linear Fit', 'Manual', '2025-01-02 21:57:04.37391+05:30', '2025-01-02 21:57:04.37391+05:30');
INSERT INTO public.stockpile_analysis (id, analysis_id, polygon_id, volume, value, weight, material, density, value_per_unit, data_source, method, mode, created_at, updated_at) VALUES (58, 10, '9', 1045.3, 2577.11, 3675.77, 'Copper Ore (Chalcopyrite)', 3565, 7, 'DSM', 'Linear Fit', 'AI', '2025-01-02 21:57:04.37391+05:30', '2025-01-02 21:57:04.37391+05:30');
INSERT INTO public.stockpile_analysis (id, analysis_id, polygon_id, volume, value, weight, material, density, value_per_unit, data_source, method, mode, created_at, updated_at) VALUES (59, 11, '1', 1100.5, 330.15, 770.35, 'Coal', 700, 4.3, 'DSM', 'Average Fit', 'AI + Manual', '2025-01-02 21:57:04.37391+05:30', '2025-01-02 21:57:04.37391+05:30');
INSERT INTO public.stockpile_analysis (id, analysis_id, polygon_id, volume, value, weight, material, density, value_per_unit, data_source, method, mode, created_at, updated_at) VALUES (60, 11, '2', 1320.7, 396.21, 924.49, 'Coal', 700, 4.3, 'DSM', 'Linear Fit', 'AI', '2025-01-02 21:57:04.37391+05:30', '2025-01-02 21:57:04.37391+05:30');
INSERT INTO public.stockpile_analysis (id, analysis_id, polygon_id, volume, value, weight, material, density, value_per_unit, data_source, method, mode, created_at, updated_at) VALUES (61, 11, '3', 980.4, 294.12, 686.28, 'Coal', 700, 4.3, 'DTM', 'Manual Input', 'AI', '2025-01-02 21:57:04.37391+05:30', '2025-01-02 21:57:04.37391+05:30');
INSERT INTO public.stockpile_analysis (id, analysis_id, polygon_id, volume, value, weight, material, density, value_per_unit, data_source, method, mode, created_at, updated_at) VALUES (62, 11, '4', 1150.8, 345.24, 805.56, 'Coal', 700, 4.3, '3D Model', 'Linear Fit', 'AI + Manual', '2025-01-02 21:57:04.37391+05:30', '2025-01-02 21:57:04.37391+05:30');
INSERT INTO public.stockpile_analysis (id, analysis_id, polygon_id, volume, value, weight, material, density, value_per_unit, data_source, method, mode, created_at, updated_at) VALUES (63, 11, '5', 1215.6, 364.68, 851.12, 'Coal', 700, 4.3, 'DSM', 'Pre-Existing DEM', 'Manual', '2025-01-02 21:57:04.37391+05:30', '2025-01-02 21:57:04.37391+05:30');
INSERT INTO public.stockpile_analysis (id, analysis_id, polygon_id, volume, value, weight, material, density, value_per_unit, data_source, method, mode, created_at, updated_at) VALUES (64, 11, '6', 1025.3, 307.59, 717.71, 'Coal', 700, 4.3, 'DSM', 'Average Fit', 'AI', '2025-01-02 21:57:04.37391+05:30', '2025-01-02 21:57:04.37391+05:30');
INSERT INTO public.stockpile_analysis (id, analysis_id, polygon_id, volume, value, weight, material, density, value_per_unit, data_source, method, mode, created_at, updated_at) VALUES (65, 11, '7', 975.6, 292.68, 683.12, 'Coal', 700, 4.3, 'DTM', 'Linear Fit', 'AI', '2025-01-02 21:57:04.37391+05:30', '2025-01-02 21:57:04.37391+05:30');
INSERT INTO public.stockpile_analysis (id, analysis_id, polygon_id, volume, value, weight, material, density, value_per_unit, data_source, method, mode, created_at, updated_at) VALUES (66, 11, '8', 1080.9, 324.27, 756.63, 'Coal', 700, 4.3, '3D Model', 'Linear Fit', 'AI + Manual', '2025-01-02 21:57:04.37391+05:30', '2025-01-02 21:57:04.37391+05:30');
INSERT INTO public.stockpile_analysis (id, analysis_id, polygon_id, volume, value, weight, material, density, value_per_unit, data_source, method, mode, created_at, updated_at) VALUES (67, 11, '9', 1123.4, 336.98, 786.38, 'Coal', 700, 4.3, 'DTM', 'Manual Input', 'AI', '2025-01-02 21:57:04.37391+05:30', '2025-01-02 21:57:04.37391+05:30');
INSERT INTO public.stockpile_analysis (id, analysis_id, polygon_id, volume, value, weight, material, density, value_per_unit, data_source, method, mode, created_at, updated_at) VALUES (68, 11, '10', 990.3, 297.09, 693.21, 'Coal', 700, 4.3, 'TIN', 'Pre-Existing DEM', 'Manual', '2025-01-02 21:57:04.37391+05:30', '2025-01-02 21:57:04.37391+05:30');
INSERT INTO public.stockpile_analysis (id, analysis_id, polygon_id, volume, value, weight, material, density, value_per_unit, data_source, method, mode, created_at, updated_at) VALUES (69, 12, '1', 1150.6, 345.18, 805.42, 'Coal', 700, 4.3, 'DSM', 'Linear Fit', 'AI + Manual', '2025-01-02 21:57:04.37391+05:30', '2025-01-02 21:57:04.37391+05:30');
INSERT INTO public.stockpile_analysis (id, analysis_id, polygon_id, volume, value, weight, material, density, value_per_unit, data_source, method, mode, created_at, updated_at) VALUES (70, 12, '2', 1300.8, 390.24, 910.56, 'Coal', 700, 4.3, 'DSM', 'Average Fit', 'AI', '2025-01-02 21:57:04.37391+05:30', '2025-01-02 21:57:04.37391+05:30');
INSERT INTO public.stockpile_analysis (id, analysis_id, polygon_id, volume, value, weight, material, density, value_per_unit, data_source, method, mode, created_at, updated_at) VALUES (71, 12, '3', 1025.7, 307.71, 718, 'Coal', 700, 4.3, 'DTM', 'Linear Fit', 'AI', '2025-01-02 21:57:04.37391+05:30', '2025-01-02 21:57:04.37391+05:30');
INSERT INTO public.stockpile_analysis (id, analysis_id, polygon_id, volume, value, weight, material, density, value_per_unit, data_source, method, mode, created_at, updated_at) VALUES (72, 12, '4', 1175.4, 352.62, 822.78, 'Coal', 700, 4.3, '3D Model', 'Triangular Fit', 'AI + Manual', '2025-01-02 21:57:04.37391+05:30', '2025-01-02 21:57:04.37391+05:30');
INSERT INTO public.stockpile_analysis (id, analysis_id, polygon_id, volume, value, weight, material, density, value_per_unit, data_source, method, mode, created_at, updated_at) VALUES (73, 12, '5', 1250.3, 375.09, 875.21, 'Coal', 700, 4.3, 'DSM', 'Linear Fit', 'AI', '2025-01-02 21:57:04.37391+05:30', '2025-01-02 21:57:04.37391+05:30');
INSERT INTO public.stockpile_analysis (id, analysis_id, polygon_id, volume, value, weight, material, density, value_per_unit, data_source, method, mode, created_at, updated_at) VALUES (74, 12, '6', 1100.5, 330.15, 770.35, 'Coal', 700, 4.3, 'DSM', 'Pre-Existing DEM', 'Manual', '2025-01-02 21:57:04.37391+05:30', '2025-01-02 21:57:04.37391+05:30');
INSERT INTO public.stockpile_analysis (id, analysis_id, polygon_id, volume, value, weight, material, density, value_per_unit, data_source, method, mode, created_at, updated_at) VALUES (75, 12, '7', 980.6, 294.18, 686.42, 'Coal', 700, 4.3, 'DTM', 'Lowest Point', 'Manual', '2025-01-02 21:57:04.37391+05:30', '2025-01-02 21:57:04.37391+05:30');
INSERT INTO public.stockpile_analysis (id, analysis_id, polygon_id, volume, value, weight, material, density, value_per_unit, data_source, method, mode, created_at, updated_at) VALUES (76, 12, '8', 1050.9, 315.27, 735.63, 'Coal', 700, 4.3, '3D Model', 'Linear Fit', 'AI + Manual', '2025-01-02 21:57:04.37391+05:30', '2025-01-02 21:57:04.37391+05:30');
INSERT INTO public.stockpile_analysis (id, analysis_id, polygon_id, volume, value, weight, material, density, value_per_unit, data_source, method, mode, created_at, updated_at) VALUES (77, 12, '9', 1130.4, 339.12, 791.28, 'Coal', 700, 4.3, 'DTM', 'Manual Input', 'AI', '2025-01-02 21:57:04.37391+05:30', '2025-01-02 21:57:04.37391+05:30');
INSERT INTO public.stockpile_analysis (id, analysis_id, polygon_id, volume, value, weight, material, density, value_per_unit, data_source, method, mode, created_at, updated_at) VALUES (78, 12, '10', 1005.3, 301.59, 703.71, 'Coal', 700, 4.3, 'TIN', 'Linear Fit', 'AI', '2025-01-02 21:57:04.37391+05:30', '2025-01-02 21:57:04.37391+05:30');
INSERT INTO public.stockpile_analysis (id, analysis_id, polygon_id, volume, value, weight, material, density, value_per_unit, data_source, method, mode, created_at, updated_at) VALUES (79, 12, '11', 1200.7, 360.21, 840.49, 'Coal', 700, 4.3, 'DTM', 'Pre-Existing DEM', 'Manual', '2025-01-02 21:57:04.37391+05:30', '2025-01-02 21:57:04.37391+05:30');
INSERT INTO public.stockpile_analysis (id, analysis_id, polygon_id, volume, value, weight, material, density, value_per_unit, data_source, method, mode, created_at, updated_at) VALUES (80, 13, '1', 1500.6, 600.24, 3751.5, 'Iron Ore (Hematite)', 2500, 1.6, 'DSM', 'Average Fit', 'Manual', '2025-01-02 21:57:04.37391+05:30', '2025-01-02 21:57:04.37391+05:30');
INSERT INTO public.stockpile_analysis (id, analysis_id, polygon_id, volume, value, weight, material, density, value_per_unit, data_source, method, mode, created_at, updated_at) VALUES (81, 13, '2', 1600.7, 768.34, 5122.24, 'Iron Ore (Magnetite)', 3200, 1.5, 'DSM', 'Linear Fit', 'AI', '2025-01-02 21:57:04.37391+05:30', '2025-01-02 21:57:04.37391+05:30');
INSERT INTO public.stockpile_analysis (id, analysis_id, polygon_id, volume, value, weight, material, density, value_per_unit, data_source, method, mode, created_at, updated_at) VALUES (82, 13, '3', 1400.8, 560.32, 3502, 'Iron Ore (Hematite)', 2500, 1.6, 'DTM', 'Manual Input', 'AI', '2025-01-02 21:57:04.37391+05:30', '2025-01-02 21:57:04.37391+05:30');
INSERT INTO public.stockpile_analysis (id, analysis_id, polygon_id, volume, value, weight, material, density, value_per_unit, data_source, method, mode, created_at, updated_at) VALUES (83, 13, '4', 1550.9, 744.43, 4962.88, 'Iron Ore (Magnetite)', 3200, 1.5, '3D Model', 'Pre-Existing DEM', 'Manual', '2025-01-02 21:57:04.37391+05:30', '2025-01-02 21:57:04.37391+05:30');
INSERT INTO public.stockpile_analysis (id, analysis_id, polygon_id, volume, value, weight, material, density, value_per_unit, data_source, method, mode, created_at, updated_at) VALUES (84, 13, '5', 1450.4, 580.16, 3626, 'Iron Ore (Hematite)', 2500, 1.6, 'DTM', 'Linear Fit', 'AI', '2025-01-02 21:57:04.37391+05:30', '2025-01-02 21:57:04.37391+05:30');
INSERT INTO public.stockpile_analysis (id, analysis_id, polygon_id, volume, value, weight, material, density, value_per_unit, data_source, method, mode, created_at, updated_at) VALUES (85, 13, '6', 1350.2, 648.1, 4320.64, 'Iron Ore (Magnetite)', 3200, 1.5, 'TIN', 'Manual Input', 'AI', '2025-01-02 21:57:04.37391+05:30', '2025-01-02 21:57:04.37391+05:30');
INSERT INTO public.stockpile_analysis (id, analysis_id, polygon_id, volume, value, weight, material, density, value_per_unit, data_source, method, mode, created_at, updated_at) VALUES (86, 13, '7', 1200.3, 480.12, 3000.75, 'Iron Ore (Hematite)', 2500, 1.6, 'DSM', 'Linear Fit', 'AI + Manual', '2025-01-02 21:57:04.37391+05:30', '2025-01-02 21:57:04.37391+05:30');
INSERT INTO public.stockpile_analysis (id, analysis_id, polygon_id, volume, value, weight, material, density, value_per_unit, data_source, method, mode, created_at, updated_at) VALUES (87, 13, '8', 1250.5, 500.2, 3126.25, 'Iron Ore (Hematite)', 2500, 1.6, 'DSM', 'Triangular Fit', 'AI + Manual', '2025-01-02 21:57:04.37391+05:30', '2025-01-02 21:57:04.37391+05:30');
INSERT INTO public.stockpile_analysis (id, analysis_id, polygon_id, volume, value, weight, material, density, value_per_unit, data_source, method, mode, created_at, updated_at) VALUES (88, 13, '9', 1320.7, 528.28, 3301.75, 'Iron Ore (Hematite)', 2500, 1.6, 'DTM', 'Linear Fit', 'AI', '2025-01-02 21:57:04.37391+05:30', '2025-01-02 21:57:04.37391+05:30');
INSERT INTO public.stockpile_analysis (id, analysis_id, polygon_id, volume, value, weight, material, density, value_per_unit, data_source, method, mode, created_at, updated_at) VALUES (89, 13, '10', 1100.4, 440.16, 2751, 'Iron Ore (Hematite)', 2500, 1.6, '3D Model', 'Triangular Fit', 'AI', '2025-01-02 21:57:04.37391+05:30', '2025-01-02 21:57:04.37391+05:30');
INSERT INTO public.stockpile_analysis (id, analysis_id, polygon_id, volume, value, weight, material, density, value_per_unit, data_source, method, mode, created_at, updated_at) VALUES (90, 13, '11', 1250.8, 600.38, 4001.28, 'Iron Ore (Magnetite)', 3200, 1.5, 'DTM', 'Linear Fit', 'Manual', '2025-01-02 21:57:04.37391+05:30', '2025-01-02 21:57:04.37391+05:30');
INSERT INTO public.stockpile_analysis (id, analysis_id, polygon_id, volume, value, weight, material, density, value_per_unit, data_source, method, mode, created_at, updated_at) VALUES (91, 13, '12', 1300.6, 520.24, 3251.5, 'Iron Ore (Hematite)', 2500, 1.6, 'TIN', 'Lowest Point', 'Manual', '2025-01-02 21:57:04.37391+05:30', '2025-01-02 21:57:04.37391+05:30');
INSERT INTO public.stockpile_analysis (id, analysis_id, polygon_id, volume, value, weight, material, density, value_per_unit, data_source, method, mode, created_at, updated_at) VALUES (92, 4, '1', 950.4, 1425.6, 2376, 'Iron Ore (Hematite)', 2500, 6, 'DSM', 'Average Fit', 'Manual', '2025-01-02 21:57:04.37391+05:30', '2025-01-02 21:57:04.37391+05:30');
INSERT INTO public.stockpile_analysis (id, analysis_id, polygon_id, volume, value, weight, material, density, value_per_unit, data_source, method, mode, created_at, updated_at) VALUES (93, 4, '2', 1102.6, 1768.32, 2940.42, 'Iron Ore (Magnetite)', 2670, 6, 'DSM', 'Average Fit', 'AI', '2025-01-02 21:57:04.37391+05:30', '2025-01-02 21:57:04.37391+05:30');
INSERT INTO public.stockpile_analysis (id, analysis_id, polygon_id, volume, value, weight, material, density, value_per_unit, data_source, method, mode, created_at, updated_at) VALUES (94, 4, '3', 885.2, 1327.8, 2213, 'Iron Ore (Hematite)', 2500, 6, 'DTM', 'Triangular Fit', 'AI + Manual', '2025-01-02 21:57:04.37391+05:30', '2025-01-02 21:57:04.37391+05:30');
INSERT INTO public.stockpile_analysis (id, analysis_id, polygon_id, volume, value, weight, material, density, value_per_unit, data_source, method, mode, created_at, updated_at) VALUES (95, 4, '4', 1290.7, 2070.48, 3226.17, 'Iron Ore (Magnetite)', 2670, 6, '3D Model', 'Triangular Fit', 'AI', '2025-01-02 21:57:04.37391+05:30', '2025-01-02 21:57:04.37391+05:30');
INSERT INTO public.stockpile_analysis (id, analysis_id, polygon_id, volume, value, weight, material, density, value_per_unit, data_source, method, mode, created_at, updated_at) VALUES (96, 4, '5', 1043.3, 1564.95, 2608.25, 'Iron Ore (Hematite)', 2500, 6, 'DTM', 'Linear Fit', 'AI', '2025-01-02 21:57:04.37391+05:30', '2025-01-02 21:57:04.37391+05:30');
INSERT INTO public.stockpile_analysis (id, analysis_id, polygon_id, volume, value, weight, material, density, value_per_unit, data_source, method, mode, created_at, updated_at) VALUES (97, 4, '6', 1189.8, 1909.15, 3177.6, 'Iron Ore (Magnetite)', 2670, 6, 'TIN', 'Lowest Point', 'Manual', '2025-01-02 21:57:04.37391+05:30', '2025-01-02 21:57:04.37391+05:30');
INSERT INTO public.stockpile_analysis (id, analysis_id, polygon_id, volume, value, weight, material, density, value_per_unit, data_source, method, mode, created_at, updated_at) VALUES (98, 4, '7', 976.5, 1464.75, 2441.25, 'Iron Ore (Hematite)', 2500, 6, 'DSM', 'Linear Fit', 'AI', '2025-01-02 21:57:04.37391+05:30', '2025-01-02 21:57:04.37391+05:30');
INSERT INTO public.stockpile_analysis (id, analysis_id, polygon_id, volume, value, weight, material, density, value_per_unit, data_source, method, mode, created_at, updated_at) VALUES (99, 4, '8', 1235.4, 1853.1, 3088.5, 'Iron Ore (Hematite)', 2500, 6, '3D Model', 'Manual Input', 'AI + Manual', '2025-01-02 21:57:04.37391+05:30', '2025-01-02 21:57:04.37391+05:30');


--
-- TOC entry 4851 (class 0 OID 16805)
-- Dependencies: 229
-- Data for Name: surveys; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.surveys (id, site_id, survey_date, surveyor_id, notes, created_at, updated_at) VALUES (1, 1, '2024-12-20', 1, 'Survey for Kamarda Chromite Mine', '2024-12-23 10:24:40.314824+05:30', '2024-12-23 10:24:40.314824+05:30');
INSERT INTO public.surveys (id, site_id, survey_date, surveyor_id, notes, created_at, updated_at) VALUES (2, 2, '2024-12-20', 1, 'Survey for Nadidih Iron Ore Mine', '2024-12-23 10:24:40.314824+05:30', '2024-12-23 10:24:40.314824+05:30');
INSERT INTO public.surveys (id, site_id, survey_date, surveyor_id, notes, created_at, updated_at) VALUES (3, 3, '2024-12-20', 1, 'Survey for Oraghat Iron Ore Mine', '2024-12-23 10:24:40.314824+05:30', '2024-12-23 10:24:40.314824+05:30');
INSERT INTO public.surveys (id, site_id, survey_date, surveyor_id, notes, created_at, updated_at) VALUES (4, 4, '2024-12-20', 1, 'Survey for Sagasahi Iron Ore Mine', '2024-12-23 10:24:40.314824+05:30', '2024-12-23 10:24:40.314824+05:30');
INSERT INTO public.surveys (id, site_id, survey_date, surveyor_id, notes, created_at, updated_at) VALUES (5, 5, '2022-10-30', NULL, NULL, '2025-01-02 21:57:04.37391+05:30', '2025-01-02 21:57:04.37391+05:30');
INSERT INTO public.surveys (id, site_id, survey_date, surveyor_id, notes, created_at, updated_at) VALUES (6, 5, '2022-10-30', NULL, NULL, '2025-01-02 21:57:04.37391+05:30', '2025-01-02 21:57:04.37391+05:30');
INSERT INTO public.surveys (id, site_id, survey_date, surveyor_id, notes, created_at, updated_at) VALUES (7, 6, '2022-11-25', NULL, NULL, '2025-01-02 21:57:04.37391+05:30', '2025-01-02 21:57:04.37391+05:30');
INSERT INTO public.surveys (id, site_id, survey_date, surveyor_id, notes, created_at, updated_at) VALUES (8, 7, '2022-11-01', NULL, NULL, '2025-01-02 21:57:04.37391+05:30', '2025-01-02 21:57:04.37391+05:30');
INSERT INTO public.surveys (id, site_id, survey_date, surveyor_id, notes, created_at, updated_at) VALUES (9, 4, '2022-12-03', NULL, NULL, '2025-01-02 21:57:04.37391+05:30', '2025-01-02 21:57:04.37391+05:30');
INSERT INTO public.surveys (id, site_id, survey_date, surveyor_id, notes, created_at, updated_at) VALUES (10, 8, '2023-01-06', NULL, NULL, '2025-01-02 21:57:04.37391+05:30', '2025-01-02 21:57:04.37391+05:30');
INSERT INTO public.surveys (id, site_id, survey_date, surveyor_id, notes, created_at, updated_at) VALUES (11, 9, '2022-11-29', NULL, NULL, '2025-01-02 21:57:04.37391+05:30', '2025-01-02 21:57:04.37391+05:30');
INSERT INTO public.surveys (id, site_id, survey_date, surveyor_id, notes, created_at, updated_at) VALUES (12, 10, '2023-01-07', NULL, NULL, '2025-01-02 21:57:04.37391+05:30', '2025-01-02 21:57:04.37391+05:30');
INSERT INTO public.surveys (id, site_id, survey_date, surveyor_id, notes, created_at, updated_at) VALUES (13, 11, '2022-12-02', NULL, NULL, '2025-01-02 21:57:04.37391+05:30', '2025-01-02 21:57:04.37391+05:30');


--
-- TOC entry 4852 (class 0 OID 16817)
-- Dependencies: 231
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.users (id, entity_id, email, password_hash, first_name, last_name, role, is_active, access_level, site_id, granted_at, granted_by, created_at, updated_at) VALUES (1, 1, 'manager.tata@company.com', 'hashed_password_1', 'Manager', 'Tata', 'Manager', true, 'Admin', 1, '2024-12-23 10:23:53.050291+05:30', 'System', '2024-12-23 10:23:53.050291+05:30', '2024-12-23 10:23:53.050291+05:30');
INSERT INTO public.users (id, entity_id, email, password_hash, first_name, last_name, role, is_active, access_level, site_id, granted_at, granted_by, created_at, updated_at) VALUES (2, 1, 'supervisor.tata@company.com', 'hashed_password_2', 'Supervisor', 'Tata', 'Supervisor', true, 'User', 1, '2024-12-23 10:23:53.050291+05:30', 'System', '2024-12-23 10:23:53.050291+05:30', '2024-12-23 10:23:53.050291+05:30');
INSERT INTO public.users (id, entity_id, email, password_hash, first_name, last_name, role, is_active, access_level, site_id, granted_at, granted_by, created_at, updated_at) VALUES (3, 2, 'manager.adani@company.com', 'hashed_password_3', 'Manager', 'Adani', 'Manager', true, 'Admin', 4, '2024-12-23 10:23:53.050291+05:30', 'System', '2024-12-23 10:23:53.050291+05:30', '2024-12-23 10:23:53.050291+05:30');
INSERT INTO public.users (id, entity_id, email, password_hash, first_name, last_name, role, is_active, access_level, site_id, granted_at, granted_by, created_at, updated_at) VALUES (4, 2, 'supervisor.adani@company.com', 'hashed_password_4', 'Supervisor', 'Adani', 'Supervisor', true, 'User', 4, '2024-12-23 10:23:53.050291+05:30', 'System', '2024-12-23 10:23:53.050291+05:30', '2024-12-23 10:23:53.050291+05:30');


-- Completed on 2025-01-05 20:29:32

--
-- PostgreSQL database dump complete
--


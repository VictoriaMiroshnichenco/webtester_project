SET check_function_bodies = false;
--
-- Structure for table user (OID = 24579) : 
--
SET search_path = public, pg_catalog;
CREATE TABLE public."user" (
    id_user bigint NOT NULL,
    login varchar(30) NOT NULL,
    email varchar(50) NOT NULL,
    password varchar(256) NOT NULL,
    name varchar(70) NOT NULL,
    active boolean DEFAULT false NOT NULL,
    created timestamp(6) without time zone DEFAULT now() NOT NULL,
    updated timestamp(6) without time zone,
    CONSTRAINT user_chk CHECK ((updated >= created))
)
WITH (oids = false);
ALTER TABLE ONLY public."user" ALTER COLUMN email SET STATISTICS 0;
ALTER TABLE ONLY public."user" ALTER COLUMN password SET STATISTICS 0;
ALTER TABLE ONLY public."user" ALTER COLUMN name SET STATISTICS 0;
ALTER TABLE ONLY public."user" ALTER COLUMN active SET STATISTICS 0;
ALTER TABLE ONLY public."user" ALTER COLUMN created SET STATISTICS 0;
ALTER TABLE ONLY public."user" ALTER COLUMN updated SET STATISTICS 0;
--
-- Structure for table role (OID = 24591) : 
--
CREATE TABLE public.role (
    id_role bigint NOT NULL,
    name varchar(20) NOT NULL
)
WITH (oids = false);
ALTER TABLE ONLY public.role ALTER COLUMN id_role SET STATISTICS 0;
ALTER TABLE ONLY public.role ALTER COLUMN name SET STATISTICS 0;
--
-- Structure for table user_role (OID = 24598) : 
--
CREATE TABLE public.user_role (
    id_user_role bigint NOT NULL,
    id_user bigint NOT NULL,
    id_role bigint NOT NULL
)
WITH (oids = false);
ALTER TABLE ONLY public.user_role ALTER COLUMN id_user_role SET STATISTICS 0;
ALTER TABLE ONLY public.user_role ALTER COLUMN id_user SET STATISTICS 0;
ALTER TABLE ONLY public.user_role ALTER COLUMN id_role SET STATISTICS 0;
--
-- Structure for table test (OID = 24619) : 
--
CREATE TABLE public.test (
    id_test bigint NOT NULL,
    id_tutor bigint NOT NULL,
    name varchar(30) NOT NULL,
    description text,
    "time" integer DEFAULT 30 NOT NULL,
    active boolean DEFAULT true NOT NULL,
    created timestamp(6) without time zone DEFAULT now() NOT NULL,
    updated timestamp(6) without time zone,
    CONSTRAINT test_chk CHECK (("time" > 0))
)
WITH (oids = false);
ALTER TABLE ONLY public.test ALTER COLUMN id_tutor SET STATISTICS 0;
ALTER TABLE ONLY public.test ALTER COLUMN name SET STATISTICS 0;
ALTER TABLE ONLY public.test ALTER COLUMN description SET STATISTICS 0;
ALTER TABLE ONLY public.test ALTER COLUMN "time" SET STATISTICS 0;
ALTER TABLE ONLY public.test ALTER COLUMN created SET STATISTICS 0;
ALTER TABLE ONLY public.test ALTER COLUMN updated SET STATISTICS 0;
--
-- Structure for table question (OID = 24636) : 
--
CREATE TABLE public.question (
    id_question bigint NOT NULL,
    id_test bigint NOT NULL,
    text text NOT NULL,
    active boolean DEFAULT true NOT NULL,
    created timestamp(6) without time zone DEFAULT now() NOT NULL,
    updated timestamp(6) without time zone
)
WITH (oids = false);
ALTER TABLE ONLY public.question ALTER COLUMN id_question SET STATISTICS 0;
ALTER TABLE ONLY public.question ALTER COLUMN id_test SET STATISTICS 0;
ALTER TABLE ONLY public.question ALTER COLUMN text SET STATISTICS 0;
ALTER TABLE ONLY public.question ALTER COLUMN active SET STATISTICS 0;
ALTER TABLE ONLY public.question ALTER COLUMN created SET STATISTICS 0;
ALTER TABLE ONLY public.question ALTER COLUMN updated SET STATISTICS 0;
--
-- Structure for table answer (OID = 24656) : 
--
CREATE TABLE public.answer (
    id_answer bigint NOT NULL,
    id_question bigint NOT NULL,
    text text NOT NULL,
    correct boolean DEFAULT false NOT NULL,
    active boolean DEFAULT true NOT NULL,
    created timestamp(6) without time zone DEFAULT now() NOT NULL,
    updated timestamp(6) without time zone
)
WITH (oids = false);
ALTER TABLE ONLY public.answer ALTER COLUMN id_answer SET STATISTICS 0;
ALTER TABLE ONLY public.answer ALTER COLUMN id_question SET STATISTICS 0;
ALTER TABLE ONLY public.answer ALTER COLUMN text SET STATISTICS 0;
ALTER TABLE ONLY public.answer ALTER COLUMN correct SET STATISTICS 0;
ALTER TABLE ONLY public.answer ALTER COLUMN active SET STATISTICS 0;
ALTER TABLE ONLY public.answer ALTER COLUMN created SET STATISTICS 0;
ALTER TABLE ONLY public.answer ALTER COLUMN updated SET STATISTICS 0;
--
-- Structure for table result (OID = 24672) : 
--
CREATE TABLE public.result (
    id_result bigint NOT NULL,
    id_student bigint NOT NULL,
    id_test bigint,
    result varchar(30) NOT NULL,
    created timestamp(0) without time zone DEFAULT now() NOT NULL,
    comment text
)
WITH (oids = false);
ALTER TABLE ONLY public.result ALTER COLUMN id_result SET STATISTICS 0;
ALTER TABLE ONLY public.result ALTER COLUMN id_student SET STATISTICS 0;
ALTER TABLE ONLY public.result ALTER COLUMN id_test SET STATISTICS 0;
--
-- Structure for table user_registration (OID = 24696) : 
--
CREATE TABLE public.user_registration (
    id_user bigint NOT NULL,
    hash text NOT NULL
)
WITH (oids = false);
ALTER TABLE ONLY public.user_registration ALTER COLUMN id_user SET STATISTICS 0;
ALTER TABLE ONLY public.user_registration ALTER COLUMN hash SET STATISTICS 0;
--
-- Definition for sequence user_seq (OID = 24715) : 
--
CREATE SEQUENCE public.user_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
--
-- Definition for sequence answer_seq (OID = 24717) : 
--
CREATE SEQUENCE public.answer_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
--
-- Definition for sequence question_seq (OID = 24719) : 
--
CREATE SEQUENCE public.question_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
--
-- Definition for sequence result_seq (OID = 24721) : 
--
CREATE SEQUENCE public.result_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
--
-- Definition for sequence user_role_seq (OID = 24723) : 
--
CREATE SEQUENCE public.user_role_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
--
-- Definition for sequence test_seq (OID = 24726) : 
--
CREATE SEQUENCE public.test_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
--
-- Definition for index user_role_idx (OID = 24603) : 
--
CREATE UNIQUE INDEX user_role_idx ON user_role USING btree (id_user, id_role);
--
-- Definition for index answer_idx (OID = 24709) : 
--
CREATE INDEX answer_idx ON answer USING btree (id_question);
--
-- Definition for index question_idx (OID = 24710) : 
--
CREATE INDEX question_idx ON question USING btree (id_test);
--
-- Definition for index result_idx (OID = 24711) : 
--
CREATE INDEX result_idx ON result USING btree (id_student);
--
-- Definition for index result_idx1 (OID = 24712) : 
--
CREATE INDEX result_idx1 ON result USING btree (id_test);
--
-- Definition for index test_idx (OID = 24713) : 
--
CREATE INDEX test_idx ON test USING btree (id_tutor);
--
-- Definition for index user_role_idx1 (OID = 24714) : 
--
CREATE INDEX user_role_idx1 ON user_role USING btree (id_user);
--
-- Definition for index user_pkey (OID = 24584) : 
--
ALTER TABLE ONLY "user"
    ADD CONSTRAINT user_pkey
    PRIMARY KEY (id_user);
--
-- Definition for index user_login_key (OID = 24586) : 
--
ALTER TABLE ONLY "user"
    ADD CONSTRAINT user_login_key
    UNIQUE (login);
--
-- Definition for index user_email_key (OID = 24588) : 
--
ALTER TABLE ONLY "user"
    ADD CONSTRAINT user_email_key
    UNIQUE (email);
--
-- Definition for index role_pkey (OID = 24594) : 
--
ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey
    PRIMARY KEY (id_role);
--
-- Definition for index role_name_key (OID = 24596) : 
--
ALTER TABLE ONLY role
    ADD CONSTRAINT role_name_key
    UNIQUE (name);
--
-- Definition for index user_role_pkey (OID = 24601) : 
--
ALTER TABLE ONLY user_role
    ADD CONSTRAINT user_role_pkey
    PRIMARY KEY (id_user_role);
--
-- Definition for index user_role_fk (OID = 24604) : 
--
ALTER TABLE ONLY user_role
    ADD CONSTRAINT user_role_fk
    FOREIGN KEY (id_user) REFERENCES "user"(id_user) ON UPDATE CASCADE ON DELETE CASCADE;
--
-- Definition for index user_role_fk1 (OID = 24614) : 
--
ALTER TABLE ONLY user_role
    ADD CONSTRAINT user_role_fk1
    FOREIGN KEY (id_role) REFERENCES role(id_role) ON UPDATE CASCADE ON DELETE RESTRICT;
--
-- Definition for index test_pkey (OID = 24628) : 
--
ALTER TABLE ONLY test
    ADD CONSTRAINT test_pkey
    PRIMARY KEY (id_test);
--
-- Definition for index test_fk (OID = 24630) : 
--
ALTER TABLE ONLY test
    ADD CONSTRAINT test_fk
    FOREIGN KEY (id_tutor) REFERENCES "user"(id_user) ON UPDATE CASCADE ON DELETE CASCADE;
--
-- Definition for index question_pkey (OID = 24644) : 
--
ALTER TABLE ONLY question
    ADD CONSTRAINT question_pkey
    PRIMARY KEY (id_question);
--
-- Definition for index question_fk (OID = 24646) : 
--
ALTER TABLE ONLY question
    ADD CONSTRAINT question_fk
    FOREIGN KEY (id_test) REFERENCES test(id_test) ON UPDATE CASCADE ON DELETE CASCADE;
--
-- Definition for index answer_pkey (OID = 24665) : 
--
ALTER TABLE ONLY answer
    ADD CONSTRAINT answer_pkey
    PRIMARY KEY (id_answer);
--
-- Definition for index answer_fk (OID = 24667) : 
--
ALTER TABLE ONLY answer
    ADD CONSTRAINT answer_fk
    FOREIGN KEY (id_question) REFERENCES question(id_question) ON UPDATE CASCADE ON DELETE CASCADE;
--
-- Definition for index result_pkey (OID = 24676) : 
--
ALTER TABLE ONLY result
    ADD CONSTRAINT result_pkey
    PRIMARY KEY (id_result);
--
-- Definition for index result_fk (OID = 24678) : 
--
ALTER TABLE ONLY result
    ADD CONSTRAINT result_fk
    FOREIGN KEY (id_student) REFERENCES "user"(id_user) ON UPDATE CASCADE ON DELETE CASCADE;
--
-- Definition for index result_fk1 (OID = 24688) : 
--
ALTER TABLE ONLY result
    ADD CONSTRAINT result_fk1
    FOREIGN KEY (id_test) REFERENCES test(id_test) ON UPDATE CASCADE ON DELETE SET NULL;
--
-- Definition for index user_registration_pkey (OID = 24702) : 
--
ALTER TABLE ONLY user_registration
    ADD CONSTRAINT user_registration_pkey
    PRIMARY KEY (id_user);
--
-- Definition for index user_registration_fk (OID = 24704) : 
--
ALTER TABLE ONLY user_registration
    ADD CONSTRAINT user_registration_fk
    FOREIGN KEY (id_user) REFERENCES "user"(id_user) ON UPDATE CASCADE ON DELETE CASCADE;
--
-- Data for sequence public.user_seq (OID = 24715)
--
SELECT pg_catalog.setval('user_seq', 1, false);
--
-- Data for sequence public.answer_seq (OID = 24717)
--
SELECT pg_catalog.setval('answer_seq', 1, false);
--
-- Data for sequence public.question_seq (OID = 24719)
--
SELECT pg_catalog.setval('question_seq', 1, false);
--
-- Data for sequence public.result_seq (OID = 24721)
--
SELECT pg_catalog.setval('result_seq', 1, false);
--
-- Data for sequence public.user_role_seq (OID = 24723)
--
SELECT pg_catalog.setval('user_role_seq', 1, false);
--
-- Data for sequence public.test_seq (OID = 24726)
--
SELECT pg_catalog.setval('test_seq', 1, false);
--
-- Comments
--
COMMENT ON SCHEMA public IS 'standard public schema';
COMMENT ON COLUMN public."user".name IS '���';
COMMENT ON COLUMN public.test."time" IS '����� � ��������';
COMMENT ON COLUMN public.question.text IS '������';
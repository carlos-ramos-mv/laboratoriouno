/*
 Navicat Premium Data Transfer

 Source Server         : LaboratorioUno
 Source Server Type    : PostgreSQL
 Source Server Version : 130002
 Source Host           : localhost:5432
 Source Catalog        : laboratoriouno
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 130002
 File Encoding         : 65001

 Date: 26/08/2021 11:36:03
*/


-- ----------------------------
-- Sequence structure for actividades_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."actividades_id_seq";
CREATE SEQUENCE "public"."actividades_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for avances_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."avances_id_seq";
CREATE SEQUENCE "public"."avances_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for cursos_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."cursos_id_seq";
CREATE SEQUENCE "public"."cursos_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for failed_jobs_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."failed_jobs_id_seq";
CREATE SEQUENCE "public"."failed_jobs_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for feedbacks_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."feedbacks_id_seq";
CREATE SEQUENCE "public"."feedbacks_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for instituciones_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."instituciones_id_seq";
CREATE SEQUENCE "public"."instituciones_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for migrations_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."migrations_id_seq";
CREATE SEQUENCE "public"."migrations_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for modulos_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."modulos_id_seq";
CREATE SEQUENCE "public"."modulos_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for permissions_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."permissions_id_seq";
CREATE SEQUENCE "public"."permissions_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for rates_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."rates_id_seq";
CREATE SEQUENCE "public"."rates_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for roles_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."roles_id_seq";
CREATE SEQUENCE "public"."roles_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for temas_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."temas_id_seq";
CREATE SEQUENCE "public"."temas_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for users_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."users_id_seq";
CREATE SEQUENCE "public"."users_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Table structure for actividades
-- ----------------------------
DROP TABLE IF EXISTS "public"."actividades";
CREATE TABLE "public"."actividades" (
  "id" int8 NOT NULL DEFAULT nextval('actividades_id_seq'::regclass),
  "titulo" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "descripcion" text COLLATE "pg_catalog"."default",
  "created_at" timestamp(0),
  "updated_at" timestamp(0),
  "tema_id" int8 NOT NULL,
  "status" bool,
  "numero" int2
)
;

-- ----------------------------
-- Table structure for avances
-- ----------------------------
DROP TABLE IF EXISTS "public"."avances";
CREATE TABLE "public"."avances" (
  "user_id" int8 NOT NULL,
  "avanzable_id" int8 NOT NULL,
  "avanzable_type" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "progreso" float4 NOT NULL,
  "completado" bool,
  "puntuacion" float4,
  "created_at" timestamp(0),
  "updated_at" timestamp(0),
  "id" int8 NOT NULL DEFAULT nextval('avances_id_seq'::regclass)
)
;

-- ----------------------------
-- Table structure for backups
-- ----------------------------
DROP TABLE IF EXISTS "public"."backups";
CREATE TABLE "public"."backups" (
  "hash" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "date" timestamp(6),
  "type" varchar(15) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for curso_user
-- ----------------------------
DROP TABLE IF EXISTS "public"."curso_user";
CREATE TABLE "public"."curso_user" (
  "curso_id" int8 NOT NULL,
  "user_id" int8 NOT NULL,
  "progreso" float4,
  "completado" bool,
  "puntuacion" float4
)
;

-- ----------------------------
-- Table structure for cursos
-- ----------------------------
DROP TABLE IF EXISTS "public"."cursos";
CREATE TABLE "public"."cursos" (
  "id" int8 NOT NULL DEFAULT nextval('cursos_id_seq'::regclass),
  "nombre" varchar(150) COLLATE "pg_catalog"."default" NOT NULL,
  "descripcion" text COLLATE "pg_catalog"."default" NOT NULL,
  "portada" varchar(255) COLLATE "pg_catalog"."default",
  "created_at" timestamp(0),
  "updated_at" timestamp(0),
  "status" bool,
  "breve_descripcion" varchar(100) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS "public"."failed_jobs";
CREATE TABLE "public"."failed_jobs" (
  "id" int8 NOT NULL DEFAULT nextval('failed_jobs_id_seq'::regclass),
  "uuid" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "connection" text COLLATE "pg_catalog"."default" NOT NULL,
  "queue" text COLLATE "pg_catalog"."default" NOT NULL,
  "payload" text COLLATE "pg_catalog"."default" NOT NULL,
  "exception" text COLLATE "pg_catalog"."default" NOT NULL,
  "failed_at" timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP
)
;

-- ----------------------------
-- Table structure for feedbacks
-- ----------------------------
DROP TABLE IF EXISTS "public"."feedbacks";
CREATE TABLE "public"."feedbacks" (
  "id" int8 NOT NULL DEFAULT nextval('feedbacks_id_seq'::regclass),
  "comentario" text COLLATE "pg_catalog"."default" NOT NULL,
  "rate_id" int8 NOT NULL,
  "created_at" timestamp(0),
  "updated_at" timestamp(0)
)
;

-- ----------------------------
-- Table structure for instituciones
-- ----------------------------
DROP TABLE IF EXISTS "public"."instituciones";
CREATE TABLE "public"."instituciones" (
  "id" int8 NOT NULL DEFAULT nextval('instituciones_id_seq'::regclass),
  "nombre" varchar(255) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS "public"."migrations";
CREATE TABLE "public"."migrations" (
  "id" int4 NOT NULL DEFAULT nextval('migrations_id_seq'::regclass),
  "migration" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "batch" int4 NOT NULL
)
;

-- ----------------------------
-- Table structure for model_has_permissions
-- ----------------------------
DROP TABLE IF EXISTS "public"."model_has_permissions";
CREATE TABLE "public"."model_has_permissions" (
  "permission_id" int8 NOT NULL,
  "model_type" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "model_id" int8 NOT NULL
)
;

-- ----------------------------
-- Table structure for model_has_roles
-- ----------------------------
DROP TABLE IF EXISTS "public"."model_has_roles";
CREATE TABLE "public"."model_has_roles" (
  "role_id" int8 NOT NULL,
  "model_type" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "model_id" int8 NOT NULL
)
;

-- ----------------------------
-- Table structure for modulos
-- ----------------------------
DROP TABLE IF EXISTS "public"."modulos";
CREATE TABLE "public"."modulos" (
  "id" int8 NOT NULL DEFAULT nextval('modulos_id_seq'::regclass),
  "numero" int2,
  "titulo" varchar(150) COLLATE "pg_catalog"."default" NOT NULL,
  "descripcion" text COLLATE "pg_catalog"."default",
  "created_at" timestamp(0),
  "updated_at" timestamp(0),
  "curso_id" int8 NOT NULL,
  "breve_descripcion" varchar(100) COLLATE "pg_catalog"."default",
  "status" bool
)
;

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS "public"."password_resets";
CREATE TABLE "public"."password_resets" (
  "email" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "token" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "created_at" timestamp(0)
)
;

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS "public"."permissions";
CREATE TABLE "public"."permissions" (
  "id" int8 NOT NULL DEFAULT nextval('permissions_id_seq'::regclass),
  "name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "guard_name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "created_at" timestamp(0),
  "updated_at" timestamp(0)
)
;

-- ----------------------------
-- Table structure for rates
-- ----------------------------
DROP TABLE IF EXISTS "public"."rates";
CREATE TABLE "public"."rates" (
  "id" int8 NOT NULL DEFAULT nextval('rates_id_seq'::regclass),
  "rateable_id" int8 NOT NULL,
  "rateable_type" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "rate" int2 NOT NULL DEFAULT 0,
  "user_id" int8 NOT NULL,
  "created_at" timestamp(0),
  "updated_at" timestamp(0)
)
;

-- ----------------------------
-- Table structure for role_has_permissions
-- ----------------------------
DROP TABLE IF EXISTS "public"."role_has_permissions";
CREATE TABLE "public"."role_has_permissions" (
  "permission_id" int8 NOT NULL,
  "role_id" int8 NOT NULL
)
;

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS "public"."roles";
CREATE TABLE "public"."roles" (
  "id" int8 NOT NULL DEFAULT nextval('roles_id_seq'::regclass),
  "name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "guard_name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "created_at" timestamp(0),
  "updated_at" timestamp(0)
)
;

-- ----------------------------
-- Table structure for temas
-- ----------------------------
DROP TABLE IF EXISTS "public"."temas";
CREATE TABLE "public"."temas" (
  "id" int8 NOT NULL DEFAULT nextval('temas_id_seq'::regclass),
  "titulo" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "contenido" text COLLATE "pg_catalog"."default",
  "created_at" timestamp(0),
  "updated_at" timestamp(0),
  "modulo_id" int8 NOT NULL,
  "breve_descripcion" varchar(100) COLLATE "pg_catalog"."default",
  "introduccion" text COLLATE "pg_catalog"."default",
  "status" bool,
  "numero" int2
)
;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS "public"."users";
CREATE TABLE "public"."users" (
  "id" int8 NOT NULL DEFAULT nextval('users_id_seq'::regclass),
  "email" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "email_verified_at" timestamp(0),
  "password" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "dob" date NOT NULL,
  "avatar" varchar(255) COLLATE "pg_catalog"."default",
  "remember_token" varchar(100) COLLATE "pg_catalog"."default",
  "created_at" timestamp(0),
  "updated_at" timestamp(0),
  "status" bool,
  "nombre" varchar(50) COLLATE "pg_catalog"."default",
  "ap_pat" varchar(50) COLLATE "pg_catalog"."default",
  "ap_mat" varchar(50) COLLATE "pg_catalog"."default",
  "institucion_id" int8
)
;

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."actividades_id_seq"
OWNED BY "public"."actividades"."id";
SELECT setval('"public"."actividades_id_seq"', 4, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."avances_id_seq"
OWNED BY "public"."avances"."id";
SELECT setval('"public"."avances_id_seq"', 101, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."cursos_id_seq"
OWNED BY "public"."cursos"."id";
SELECT setval('"public"."cursos_id_seq"', 36, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."failed_jobs_id_seq"
OWNED BY "public"."failed_jobs"."id";
SELECT setval('"public"."failed_jobs_id_seq"', 2, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."feedbacks_id_seq"
OWNED BY "public"."feedbacks"."id";
SELECT setval('"public"."feedbacks_id_seq"', 3, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."instituciones_id_seq"
OWNED BY "public"."instituciones"."id";
SELECT setval('"public"."instituciones_id_seq"', 2, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."migrations_id_seq"
OWNED BY "public"."migrations"."id";
SELECT setval('"public"."migrations_id_seq"', 8, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."modulos_id_seq"
OWNED BY "public"."modulos"."id";
SELECT setval('"public"."modulos_id_seq"', 25, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."permissions_id_seq"
OWNED BY "public"."permissions"."id";
SELECT setval('"public"."permissions_id_seq"', 49, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."rates_id_seq"
OWNED BY "public"."rates"."id";
SELECT setval('"public"."rates_id_seq"', 12, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."roles_id_seq"
OWNED BY "public"."roles"."id";
SELECT setval('"public"."roles_id_seq"', 4, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."temas_id_seq"
OWNED BY "public"."temas"."id";
SELECT setval('"public"."temas_id_seq"', 28, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."users_id_seq"
OWNED BY "public"."users"."id";
SELECT setval('"public"."users_id_seq"', 72, true);

-- ----------------------------
-- Primary Key structure for table actividades
-- ----------------------------
ALTER TABLE "public"."actividades" ADD CONSTRAINT "actividades_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Uniques structure for table avances
-- ----------------------------
ALTER TABLE "public"."avances" ADD CONSTRAINT "identificador_avance" UNIQUE ("user_id", "avanzable_id", "avanzable_type");

-- ----------------------------
-- Primary Key structure for table avances
-- ----------------------------
ALTER TABLE "public"."avances" ADD CONSTRAINT "avances_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Uniques structure for table backups
-- ----------------------------
ALTER TABLE "public"."backups" ADD CONSTRAINT "hash" UNIQUE ("hash");

-- ----------------------------
-- Primary Key structure for table backups
-- ----------------------------
ALTER TABLE "public"."backups" ADD CONSTRAINT "backups_pkey" PRIMARY KEY ("hash");

-- ----------------------------
-- Primary Key structure for table cursos
-- ----------------------------
ALTER TABLE "public"."cursos" ADD CONSTRAINT "cursos_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Uniques structure for table failed_jobs
-- ----------------------------
ALTER TABLE "public"."failed_jobs" ADD CONSTRAINT "failed_jobs_uuid_unique" UNIQUE ("uuid");

-- ----------------------------
-- Primary Key structure for table failed_jobs
-- ----------------------------
ALTER TABLE "public"."failed_jobs" ADD CONSTRAINT "failed_jobs_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table feedbacks
-- ----------------------------
ALTER TABLE "public"."feedbacks" ADD CONSTRAINT "feedbacks_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table instituciones
-- ----------------------------
ALTER TABLE "public"."instituciones" ADD CONSTRAINT "instituciones_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table migrations
-- ----------------------------
ALTER TABLE "public"."migrations" ADD CONSTRAINT "migrations_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table model_has_permissions
-- ----------------------------
CREATE INDEX "model_has_permissions_model_id_model_type_index" ON "public"."model_has_permissions" USING btree (
  "model_id" "pg_catalog"."int8_ops" ASC NULLS LAST,
  "model_type" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table model_has_permissions
-- ----------------------------
ALTER TABLE "public"."model_has_permissions" ADD CONSTRAINT "model_has_permissions_pkey" PRIMARY KEY ("permission_id", "model_id", "model_type");

-- ----------------------------
-- Indexes structure for table model_has_roles
-- ----------------------------
CREATE INDEX "model_has_roles_model_id_model_type_index" ON "public"."model_has_roles" USING btree (
  "model_id" "pg_catalog"."int8_ops" ASC NULLS LAST,
  "model_type" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table model_has_roles
-- ----------------------------
ALTER TABLE "public"."model_has_roles" ADD CONSTRAINT "model_has_roles_pkey" PRIMARY KEY ("role_id", "model_id", "model_type");

-- ----------------------------
-- Primary Key structure for table modulos
-- ----------------------------
ALTER TABLE "public"."modulos" ADD CONSTRAINT "modulos_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table password_resets
-- ----------------------------
CREATE INDEX "password_resets_email_index" ON "public"."password_resets" USING btree (
  "email" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Uniques structure for table permissions
-- ----------------------------
ALTER TABLE "public"."permissions" ADD CONSTRAINT "permissions_name_guard_name_unique" UNIQUE ("name", "guard_name");

-- ----------------------------
-- Primary Key structure for table permissions
-- ----------------------------
ALTER TABLE "public"."permissions" ADD CONSTRAINT "permissions_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Uniques structure for table rates
-- ----------------------------
ALTER TABLE "public"."rates" ADD CONSTRAINT "identificador_rate" UNIQUE ("user_id", "rateable_id", "rateable_type");

-- ----------------------------
-- Primary Key structure for table rates
-- ----------------------------
ALTER TABLE "public"."rates" ADD CONSTRAINT "rates_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table role_has_permissions
-- ----------------------------
ALTER TABLE "public"."role_has_permissions" ADD CONSTRAINT "role_has_permissions_pkey" PRIMARY KEY ("permission_id", "role_id");

-- ----------------------------
-- Uniques structure for table roles
-- ----------------------------
ALTER TABLE "public"."roles" ADD CONSTRAINT "roles_name_guard_name_unique" UNIQUE ("name", "guard_name");

-- ----------------------------
-- Primary Key structure for table roles
-- ----------------------------
ALTER TABLE "public"."roles" ADD CONSTRAINT "roles_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table temas
-- ----------------------------
ALTER TABLE "public"."temas" ADD CONSTRAINT "temas_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Uniques structure for table users
-- ----------------------------
ALTER TABLE "public"."users" ADD CONSTRAINT "users_email_unique" UNIQUE ("email");

-- ----------------------------
-- Primary Key structure for table users
-- ----------------------------
ALTER TABLE "public"."users" ADD CONSTRAINT "users_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Foreign Keys structure for table actividades
-- ----------------------------
ALTER TABLE "public"."actividades" ADD CONSTRAINT "fk_actividades_temas_1" FOREIGN KEY ("tema_id") REFERENCES "public"."temas" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table avances
-- ----------------------------
ALTER TABLE "public"."avances" ADD CONSTRAINT "fk_avances_users_1" FOREIGN KEY ("user_id") REFERENCES "public"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table curso_user
-- ----------------------------
ALTER TABLE "public"."curso_user" ADD CONSTRAINT "fk_curso_user_cursos_1" FOREIGN KEY ("curso_id") REFERENCES "public"."cursos" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "public"."curso_user" ADD CONSTRAINT "fk_curso_user_users_1" FOREIGN KEY ("user_id") REFERENCES "public"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table feedbacks
-- ----------------------------
ALTER TABLE "public"."feedbacks" ADD CONSTRAINT "fk_feedbacks_rates_1" FOREIGN KEY ("rate_id") REFERENCES "public"."rates" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table model_has_permissions
-- ----------------------------
ALTER TABLE "public"."model_has_permissions" ADD CONSTRAINT "model_has_permissions_permission_id_foreign" FOREIGN KEY ("permission_id") REFERENCES "public"."permissions" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table model_has_roles
-- ----------------------------
ALTER TABLE "public"."model_has_roles" ADD CONSTRAINT "model_has_roles_role_id_foreign" FOREIGN KEY ("role_id") REFERENCES "public"."roles" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table modulos
-- ----------------------------
ALTER TABLE "public"."modulos" ADD CONSTRAINT "fk_modulos_cursos_1" FOREIGN KEY ("curso_id") REFERENCES "public"."cursos" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table rates
-- ----------------------------
ALTER TABLE "public"."rates" ADD CONSTRAINT "fk_rates_users_1" FOREIGN KEY ("user_id") REFERENCES "public"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table role_has_permissions
-- ----------------------------
ALTER TABLE "public"."role_has_permissions" ADD CONSTRAINT "role_has_permissions_permission_id_foreign" FOREIGN KEY ("permission_id") REFERENCES "public"."permissions" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."role_has_permissions" ADD CONSTRAINT "role_has_permissions_role_id_foreign" FOREIGN KEY ("role_id") REFERENCES "public"."roles" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table temas
-- ----------------------------
ALTER TABLE "public"."temas" ADD CONSTRAINT "fk_temas_modulos_1" FOREIGN KEY ("modulo_id") REFERENCES "public"."modulos" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table users
-- ----------------------------
ALTER TABLE "public"."users" ADD CONSTRAINT "fk_users_instituciones_1" FOREIGN KEY ("institucion_id") REFERENCES "public"."instituciones" ("id") ON DELETE SET NULL ON UPDATE CASCADE;

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

 Date: 27/07/2021 16:30:15
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
-- Records of actividades
-- ----------------------------

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
-- Records of avances
-- ----------------------------
INSERT INTO "public"."avances" VALUES (63, 10, 'App\Models\Tema', 100, 't', 10, '2021-05-25 17:21:37', '2021-06-22 17:46:43', 4);
INSERT INTO "public"."avances" VALUES (63, 11, 'App\Models\Tema', 100, 't', 10, '2021-05-25 17:21:37', '2021-06-22 17:47:14', 2);
INSERT INTO "public"."avances" VALUES (63, 12, 'App\Models\Tema', 100, 't', 10, '2021-05-25 17:21:37', '2021-06-22 18:01:30', 3);
INSERT INTO "public"."avances" VALUES (63, 20, 'App\Models\Modulo', 80, 't', 10, '2021-05-25 17:21:37', '2021-07-27 14:12:55', 1);
INSERT INTO "public"."avances" VALUES (63, 27, 'App\Models\Tema', 0, NULL, NULL, '2021-07-07 14:12:55', '2021-07-07 14:12:55', 16);
INSERT INTO "public"."avances" VALUES (63, 24, 'App\Models\Modulo', 0, NULL, NULL, '2021-07-07 13:34:40', '2021-07-07 13:34:40', 15);
INSERT INTO "public"."avances" VALUES (63, 20, 'App\Models\Tema', 100, 't', 10, '2021-07-06 15:14:21', '2021-07-06 15:34:33', 14);

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
-- Records of backups
-- ----------------------------

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
-- Records of curso_user
-- ----------------------------
INSERT INTO "public"."curso_user" VALUES (32, 63, 40, 't', 10);

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
-- Records of cursos
-- ----------------------------
INSERT INTO "public"."cursos" VALUES (34, 'DummyCourse', '<p>Pellentesque elementum egestas elit nec ullamcorper. Morbi mauris nulla, congue fermentum ornare vitae, posuere vitae tellus. Fusce mollis suscipit venenatis. Interdum et malesuada fames ac ante ipsum primis in faucibus. Integer scelerisque auctor risus ut pharetra. Vestibulum dignissim iaculis diam. Mauris quis mi vitae est porta eleifend. Aenean et dolor vitae leo ornare aliquet. Sed ut ultrices ligula. Fusce quam dui, pharetra quis urna ac, lobortis laoreet elit. Phasellus iaculis scelerisque euismod. Sed tempor venenatis risus eget posuere. Ut faucibus faucibus nisi, et placerat metus accumsan quis. Morbi eget lectus ipsum. Nunc sodales malesuada nunc vel laoreet.</p>', NULL, '2021-07-07 13:20:22', '2021-07-07 13:20:22', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse commodo aliquam varius. Ut in d');
INSERT INTO "public"."cursos" VALUES (32, 'Python', '<p>En este curso se pretende que desarolles un sentido l&oacute;gico del paradigma de la programaici&oacute;n y las implementes en tu proceso de aprendizaje.</p>', NULL, '2021-05-11 16:17:55', '2021-06-01 16:03:59', 't', 'Curso de programaci??n en python.');

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
-- Records of failed_jobs
-- ----------------------------

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
-- Records of feedbacks
-- ----------------------------
INSERT INTO "public"."feedbacks" VALUES (1, 'vvvvvvvv', 10, '2021-06-23 00:00:20', '2021-06-23 00:00:20');
INSERT INTO "public"."feedbacks" VALUES (2, 'Buen curso', 11, '2021-07-26 15:34:33', '2021-07-26 15:34:33');

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
-- Records of instituciones
-- ----------------------------
INSERT INTO "public"."instituciones" VALUES (1, 'UNAM');

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
-- Records of migrations
-- ----------------------------
INSERT INTO "public"."migrations" VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO "public"."migrations" VALUES (2, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO "public"."migrations" VALUES (3, '2019_08_19_000000_create_failed_jobs_table', 1);
INSERT INTO "public"."migrations" VALUES (7, '2021_04_20_154208_create_permission_tables', 2);

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
-- Records of model_has_permissions
-- ----------------------------

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
-- Records of model_has_roles
-- ----------------------------
INSERT INTO "public"."model_has_roles" VALUES (1, 'App\Models\User', 60);
INSERT INTO "public"."model_has_roles" VALUES (3, 'App\Models\User', 63);
INSERT INTO "public"."model_has_roles" VALUES (2, 'App\Models\User', 67);

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
-- Records of modulos
-- ----------------------------
INSERT INTO "public"."modulos" VALUES (20, 1, 'Introducci??n', '<p>Aqu&iacute; comprender&aacute;s los conceptos que conforman el grandioso mundo de la programaci&oacute;n y las maravillas que puede hacer con lo que aqu&iacute; aprender&aacute;s.</p>', '2021-05-11 16:19:41', '2021-07-22 12:41:57', 32, 'Introducci??n a los conceptos m??s b??sicos de la programaci??n y Python.', 't');
INSERT INTO "public"."modulos" VALUES (23, 2, 'Intro', '<p>eros diam viverra sapien, id semper mi purus lobortis elit. In nibh ligula, tristique in rutrum eu, tempus ac neque. Maecenas nec diam quis justo imperdiet cursus. Quisque lobortis libero id ante mollis luctus. Morbi ipsum elit, iaculis at velit non, tempus consequat eros. Nullam dignissim, elit a auctor maximus, ipsum felis fringilla quam, ut viverra quam diam et metus.</p>', '2021-07-07 13:21:50', '2021-07-07 13:21:50', 34, 'Sed congue, neque sit amet consequat rutrum, tellus ante sagittis sapien, ut sodales dolor sem quis.', 'f');
INSERT INTO "public"."modulos" VALUES (22, 1, 'DummyModule', '<p>Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec vehicula mauris et ipsum imperdiet cursus. Vivamus sit amet porta dui. Phasellus nec ex sit amet lacus placerat egestas. Curabitur nec lectus quis enim porttitor semper. Vestibulum non justo enim. Quisque dictum porttitor ligula, eget rutrum mauris sollicitudin a. Sed accumsan lacus suscipit mauris luctus rhoncus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.</p>', '2021-07-07 13:20:53', '2021-07-07 13:22:15', 34, 'Donec ut purus et ligula ornare tempus. Nunc ut turpis elementum, pellentesque velit nec, dapibus l.', 'f');
INSERT INTO "public"."modulos" VALUES (24, 2, 'DummyModule', '<p>Pellentesque elementum egestas elit nec ullamcorper. Morbi mauris nulla, congue fermentum ornare vitae, posuere vitae tellus. Fusce mollis suscipit venenatis. Interdum et malesuada fames ac ante ipsum primis in faucibus. Integer scelerisque auctor risus ut pharetra. Vestibulum dignissim iaculis diam. Mauris quis mi vitae est porta eleifend. Aenean et dolor vitae leo ornare aliquet. Sed ut ultrices ligula. Fusce quam dui, pharetra quis urna ac, lobortis laoreet elit. Phasellus iaculis scelerisque euismod. Sed tempor venenatis risus eget posuere. Ut faucibus faucibus nisi, et placerat metus accumsan quis. Morbi eget lectus ipsum. Nunc sodales malesuada nunc vel laoreet.</p>
<p>Donec ut purus et ligula ornare tempus. Nunc ut turpis elementum, pellentesque velit nec, dapibus lacus. Cras sit amet varius odio, eu suscipit tortor. Nulla facilisi. Aenean pharetra facilisis ante, quis tristique ante tempus fringilla. Sed at ipsum et est rutrum mattis. Aenean turpis nisl, varius quis nulla vitae, interdum pulvinar orci. Proin eleifend, urna eget molestie tristique, nisl mi vulputate risus, sollicitudin malesuada urna justo sit amet odio.</p>', '2021-07-07 13:34:40', '2021-07-07 13:34:40', 32, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse commodo aliquam varius.', 't');

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
-- Records of password_resets
-- ----------------------------

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
-- Records of permissions
-- ----------------------------
INSERT INTO "public"."permissions" VALUES (1, 'admin.home', 'web', '2021-05-25 15:46:19', '2021-05-25 15:46:19');
INSERT INTO "public"."permissions" VALUES (2, 'admin.alumnos.store', 'web', '2021-05-25 15:46:19', '2021-05-25 15:46:19');
INSERT INTO "public"."permissions" VALUES (3, 'admin.alumnos.index', 'web', '2021-05-25 15:46:19', '2021-05-25 15:46:19');
INSERT INTO "public"."permissions" VALUES (4, 'admin.alumnos.create', 'web', '2021-05-25 15:46:19', '2021-05-25 15:46:19');
INSERT INTO "public"."permissions" VALUES (5, 'admin.alumnos.destroy', 'web', '2021-05-25 15:46:19', '2021-05-25 15:46:19');
INSERT INTO "public"."permissions" VALUES (6, 'admin.alumnos.update', 'web', '2021-05-25 15:46:19', '2021-05-25 15:46:19');
INSERT INTO "public"."permissions" VALUES (7, 'admin.alumnos.show', 'web', '2021-05-25 15:46:19', '2021-05-25 15:46:19');
INSERT INTO "public"."permissions" VALUES (8, 'admin.alumnos.edit', 'web', '2021-05-25 15:46:19', '2021-05-25 15:46:19');
INSERT INTO "public"."permissions" VALUES (9, 'admin.instructores.store', 'web', '2021-05-25 15:46:19', '2021-05-25 15:46:19');
INSERT INTO "public"."permissions" VALUES (10, 'admin.instructores.index', 'web', '2021-05-25 15:46:19', '2021-05-25 15:46:19');
INSERT INTO "public"."permissions" VALUES (11, 'admin.instructores.create', 'web', '2021-05-25 15:46:19', '2021-05-25 15:46:19');
INSERT INTO "public"."permissions" VALUES (12, 'admin.instructores.destroy', 'web', '2021-05-25 15:46:19', '2021-05-25 15:46:19');
INSERT INTO "public"."permissions" VALUES (13, 'admin.instructores.update', 'web', '2021-05-25 15:46:20', '2021-05-25 15:46:20');
INSERT INTO "public"."permissions" VALUES (14, 'admin.instructores.show', 'web', '2021-05-25 15:46:20', '2021-05-25 15:46:20');
INSERT INTO "public"."permissions" VALUES (15, 'admin.instructores.edit', 'web', '2021-05-25 15:46:20', '2021-05-25 15:46:20');
INSERT INTO "public"."permissions" VALUES (16, 'admin.cursos.store', 'web', '2021-05-25 15:46:20', '2021-05-25 15:46:20');
INSERT INTO "public"."permissions" VALUES (17, 'admin.cursos.index', 'web', '2021-05-25 15:46:20', '2021-05-25 15:46:20');
INSERT INTO "public"."permissions" VALUES (18, 'admin.cursos.create', 'web', '2021-05-25 15:46:20', '2021-05-25 15:46:20');
INSERT INTO "public"."permissions" VALUES (19, 'admin.cursos.destroy', 'web', '2021-05-25 15:46:20', '2021-05-25 15:46:20');
INSERT INTO "public"."permissions" VALUES (20, 'admin.cursos.update', 'web', '2021-05-25 15:46:20', '2021-05-25 15:46:20');
INSERT INTO "public"."permissions" VALUES (21, 'admin.cursos.show', 'web', '2021-05-25 15:46:20', '2021-05-25 15:46:20');
INSERT INTO "public"."permissions" VALUES (22, 'admin.cursos.edit', 'web', '2021-05-25 15:46:20', '2021-05-25 15:46:20');
INSERT INTO "public"."permissions" VALUES (23, 'admin.modulos.store', 'web', '2021-05-25 15:46:20', '2021-05-25 15:46:20');
INSERT INTO "public"."permissions" VALUES (24, 'admin.modulos.index', 'web', '2021-05-25 15:46:20', '2021-05-25 15:46:20');
INSERT INTO "public"."permissions" VALUES (25, 'admin.modulos.create', 'web', '2021-05-25 15:46:20', '2021-05-25 15:46:20');
INSERT INTO "public"."permissions" VALUES (26, 'admin.modulos.destroy', 'web', '2021-05-25 15:46:20', '2021-05-25 15:46:20');
INSERT INTO "public"."permissions" VALUES (27, 'admin.modulos.update', 'web', '2021-05-25 15:46:20', '2021-05-25 15:46:20');
INSERT INTO "public"."permissions" VALUES (28, 'admin.modulos.show', 'web', '2021-05-25 15:46:20', '2021-05-25 15:46:20');
INSERT INTO "public"."permissions" VALUES (29, 'admin.modulos.edit', 'web', '2021-05-25 15:46:20', '2021-05-25 15:46:20');
INSERT INTO "public"."permissions" VALUES (30, 'admin.temas.store', 'web', '2021-05-25 15:46:20', '2021-05-25 15:46:20');
INSERT INTO "public"."permissions" VALUES (31, 'admin.temas.index', 'web', '2021-05-25 15:46:20', '2021-05-25 15:46:20');
INSERT INTO "public"."permissions" VALUES (32, 'admin.temas.create', 'web', '2021-05-25 15:46:20', '2021-05-25 15:46:20');
INSERT INTO "public"."permissions" VALUES (33, 'admin.temas.destroy', 'web', '2021-05-25 15:46:20', '2021-05-25 15:46:20');
INSERT INTO "public"."permissions" VALUES (34, 'admin.temas.update', 'web', '2021-05-25 15:46:20', '2021-05-25 15:46:20');
INSERT INTO "public"."permissions" VALUES (35, 'admin.temas.show', 'web', '2021-05-25 15:46:20', '2021-05-25 15:46:20');
INSERT INTO "public"."permissions" VALUES (36, 'admin.temas.edit', 'web', '2021-05-25 15:46:20', '2021-05-25 15:46:20');
INSERT INTO "public"."permissions" VALUES (37, 'admin.actividades.store', 'web', '2021-05-25 15:46:20', '2021-05-25 15:46:20');
INSERT INTO "public"."permissions" VALUES (38, 'admin.actividades.index', 'web', '2021-05-25 15:46:20', '2021-05-25 15:46:20');
INSERT INTO "public"."permissions" VALUES (39, 'admin.actividades.create', 'web', '2021-05-25 15:46:20', '2021-05-25 15:46:20');
INSERT INTO "public"."permissions" VALUES (40, 'admin.actividades.destroy', 'web', '2021-05-25 15:46:20', '2021-05-25 15:46:20');
INSERT INTO "public"."permissions" VALUES (41, 'admin.actividades.update', 'web', '2021-05-25 15:46:20', '2021-05-25 15:46:20');
INSERT INTO "public"."permissions" VALUES (42, 'admin.actividades.show', 'web', '2021-05-25 15:46:20', '2021-05-25 15:46:20');
INSERT INTO "public"."permissions" VALUES (43, 'admin.actividades.edit', 'web', '2021-05-25 15:46:21', '2021-05-25 15:46:21');
INSERT INTO "public"."permissions" VALUES (44, 'alumno.home', 'web', '2021-05-25 15:46:21', '2021-05-25 15:46:21');
INSERT INTO "public"."permissions" VALUES (45, 'alumno.cursos.show', 'web', '2021-05-25 15:46:21', '2021-05-25 15:46:21');
INSERT INTO "public"."permissions" VALUES (46, 'alumno.modulos.show', 'web', '2021-05-25 15:46:21', '2021-05-25 15:46:21');
INSERT INTO "public"."permissions" VALUES (47, 'alumno.temas.show', 'web', '2021-05-25 15:46:21', '2021-05-25 15:46:21');
INSERT INTO "public"."permissions" VALUES (48, 'alumno.actividades.show', 'web', '2021-05-25 15:46:21', '2021-05-25 15:46:21');

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
-- Records of rates
-- ----------------------------
INSERT INTO "public"."rates" VALUES (8, 10, 'App\Models\Tema', 4, 63, '2021-06-22 17:46:44', '2021-06-22 17:46:44');
INSERT INTO "public"."rates" VALUES (9, 11, 'App\Models\Tema', 5, 63, '2021-06-22 17:47:14', '2021-06-22 17:47:14');
INSERT INTO "public"."rates" VALUES (10, 12, 'App\Models\Tema', 5, 63, '2021-06-22 18:01:31', '2021-07-26 14:50:05');
INSERT INTO "public"."rates" VALUES (11, 20, 'App\Models\Tema', 5, 63, '2021-07-26 15:34:33', '2021-07-26 15:34:33');

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
-- Records of role_has_permissions
-- ----------------------------
INSERT INTO "public"."role_has_permissions" VALUES (1, 1);
INSERT INTO "public"."role_has_permissions" VALUES (1, 2);
INSERT INTO "public"."role_has_permissions" VALUES (2, 1);
INSERT INTO "public"."role_has_permissions" VALUES (3, 1);
INSERT INTO "public"."role_has_permissions" VALUES (4, 1);
INSERT INTO "public"."role_has_permissions" VALUES (5, 1);
INSERT INTO "public"."role_has_permissions" VALUES (6, 1);
INSERT INTO "public"."role_has_permissions" VALUES (7, 1);
INSERT INTO "public"."role_has_permissions" VALUES (8, 1);
INSERT INTO "public"."role_has_permissions" VALUES (9, 1);
INSERT INTO "public"."role_has_permissions" VALUES (10, 1);
INSERT INTO "public"."role_has_permissions" VALUES (11, 1);
INSERT INTO "public"."role_has_permissions" VALUES (12, 1);
INSERT INTO "public"."role_has_permissions" VALUES (13, 1);
INSERT INTO "public"."role_has_permissions" VALUES (14, 1);
INSERT INTO "public"."role_has_permissions" VALUES (15, 1);
INSERT INTO "public"."role_has_permissions" VALUES (16, 1);
INSERT INTO "public"."role_has_permissions" VALUES (16, 2);
INSERT INTO "public"."role_has_permissions" VALUES (17, 1);
INSERT INTO "public"."role_has_permissions" VALUES (17, 2);
INSERT INTO "public"."role_has_permissions" VALUES (18, 1);
INSERT INTO "public"."role_has_permissions" VALUES (18, 2);
INSERT INTO "public"."role_has_permissions" VALUES (19, 1);
INSERT INTO "public"."role_has_permissions" VALUES (19, 2);
INSERT INTO "public"."role_has_permissions" VALUES (20, 1);
INSERT INTO "public"."role_has_permissions" VALUES (20, 2);
INSERT INTO "public"."role_has_permissions" VALUES (21, 1);
INSERT INTO "public"."role_has_permissions" VALUES (21, 2);
INSERT INTO "public"."role_has_permissions" VALUES (22, 1);
INSERT INTO "public"."role_has_permissions" VALUES (22, 2);
INSERT INTO "public"."role_has_permissions" VALUES (23, 1);
INSERT INTO "public"."role_has_permissions" VALUES (23, 2);
INSERT INTO "public"."role_has_permissions" VALUES (24, 1);
INSERT INTO "public"."role_has_permissions" VALUES (24, 2);
INSERT INTO "public"."role_has_permissions" VALUES (25, 1);
INSERT INTO "public"."role_has_permissions" VALUES (25, 2);
INSERT INTO "public"."role_has_permissions" VALUES (26, 1);
INSERT INTO "public"."role_has_permissions" VALUES (26, 2);
INSERT INTO "public"."role_has_permissions" VALUES (27, 1);
INSERT INTO "public"."role_has_permissions" VALUES (27, 2);
INSERT INTO "public"."role_has_permissions" VALUES (28, 1);
INSERT INTO "public"."role_has_permissions" VALUES (28, 2);
INSERT INTO "public"."role_has_permissions" VALUES (29, 1);
INSERT INTO "public"."role_has_permissions" VALUES (29, 2);
INSERT INTO "public"."role_has_permissions" VALUES (30, 1);
INSERT INTO "public"."role_has_permissions" VALUES (30, 2);
INSERT INTO "public"."role_has_permissions" VALUES (31, 1);
INSERT INTO "public"."role_has_permissions" VALUES (31, 2);
INSERT INTO "public"."role_has_permissions" VALUES (32, 1);
INSERT INTO "public"."role_has_permissions" VALUES (32, 2);
INSERT INTO "public"."role_has_permissions" VALUES (33, 1);
INSERT INTO "public"."role_has_permissions" VALUES (33, 2);
INSERT INTO "public"."role_has_permissions" VALUES (34, 1);
INSERT INTO "public"."role_has_permissions" VALUES (34, 2);
INSERT INTO "public"."role_has_permissions" VALUES (35, 1);
INSERT INTO "public"."role_has_permissions" VALUES (35, 2);
INSERT INTO "public"."role_has_permissions" VALUES (36, 1);
INSERT INTO "public"."role_has_permissions" VALUES (36, 2);
INSERT INTO "public"."role_has_permissions" VALUES (37, 1);
INSERT INTO "public"."role_has_permissions" VALUES (37, 2);
INSERT INTO "public"."role_has_permissions" VALUES (38, 1);
INSERT INTO "public"."role_has_permissions" VALUES (38, 2);
INSERT INTO "public"."role_has_permissions" VALUES (39, 1);
INSERT INTO "public"."role_has_permissions" VALUES (39, 2);
INSERT INTO "public"."role_has_permissions" VALUES (40, 1);
INSERT INTO "public"."role_has_permissions" VALUES (40, 2);
INSERT INTO "public"."role_has_permissions" VALUES (41, 1);
INSERT INTO "public"."role_has_permissions" VALUES (41, 2);
INSERT INTO "public"."role_has_permissions" VALUES (42, 1);
INSERT INTO "public"."role_has_permissions" VALUES (42, 2);
INSERT INTO "public"."role_has_permissions" VALUES (43, 1);
INSERT INTO "public"."role_has_permissions" VALUES (43, 2);
INSERT INTO "public"."role_has_permissions" VALUES (44, 3);
INSERT INTO "public"."role_has_permissions" VALUES (45, 3);
INSERT INTO "public"."role_has_permissions" VALUES (46, 3);
INSERT INTO "public"."role_has_permissions" VALUES (47, 3);
INSERT INTO "public"."role_has_permissions" VALUES (48, 3);

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
-- Records of roles
-- ----------------------------
INSERT INTO "public"."roles" VALUES (1, 'Admin', 'web', '2021-05-25 15:46:19', '2021-05-25 15:46:19');
INSERT INTO "public"."roles" VALUES (2, 'Instructor', 'web', '2021-05-25 15:46:19', '2021-05-25 15:46:19');
INSERT INTO "public"."roles" VALUES (3, 'Alumno', 'web', '2021-05-25 15:46:19', '2021-05-25 15:46:19');

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
-- Records of temas
-- ----------------------------
INSERT INTO "public"."temas" VALUES (11, 'Variables', '<p>Para ello utilizamos lo que se llaman <code>variables</code>. Esas <code>variables</code> son realmente espacios en memoria dentro de tu computadora que sirven para almacenar informaci&oacute;n; por ejemplo, el n&uacute;mero de manzanas que ten&iacute;a <em>Andrito</em>. Una variable tiene dos componentes esenciales: <strong>nombre</strong> y <strong>valor</strong>.</p>
<p>El <strong>nombre</strong> de una variable es literalmente una palabra que nos sirve para entender (nosotros los programadores) a qu&eacute; hace referencia lo que vamos a guardar, y el <strong>valor</strong> es literalmente lo que va a guardar. Veamos un ejemplo r&aacute;pido en c&oacute;digo:</p>
<p><code> Static code </code></p>
<div class="w3-panel w3-card w3-light-grey pythonHigh notranslate">
<pre>manzanasDeAndrito = 5
      </pre>
</div>
<p>en este ejemplo tenemos tres cosas importantes: <code>manzanasDeAndrito</code>, <code>=</code> y <code>5</code>, vamos a entenderlas un poco m&aacute;s.</p>
<p><code>manzanasDeAndrito</code> es el <strong>nombre</strong> que se eligi&oacute; (quien escribi&oacute; el c&oacute;digo) para la variable donde se va a guardar el n&uacute;mero de manzanas que tiene <em>Andrito</em>, y como podr&aacute;s deducir correctamente, ese valor es el <code>5</code> que est&aacute; ah&iacute;. Entre estos dos valores se encuentra el operador de asignaci&oacute;n (signo de igual para los cuates) <code>=</code>, el cual sirve para decir algo como: <em>le voy a asignar a la variable de la izquierda, el valor que me dieron en la derecha</em>.</p>
<p>Pero adem&aacute;s de eso, ahora podremos preguntarle a <code>python</code> cu&aacute;ntas manzanas tiene <em>Andrito</em> &iexcl;y va a poder decirnos que tiene 5! No me crees, m&iacute;ralo en acci&oacute;n:</p>
<p><code>static code</code></p>
<div class="w3-panel w3-card w3-light-grey pythonHigh notranslate">
<pre>manzanasDeAndrito = 5
print(manzanasDeAndrito)
      </pre>
</div>
<h2>Ejercicio</h2>
<p>Vamos a seguir con <em>Andrito</em> y sus manzanas. En particular vamos a centrarnos en la idea de que <em>Andrito tiene 5 manzanas, si su abuelita le di&oacute; por su cumplea&ntilde;os otras 9...</em>, antes de poder acabarlo, hay que tener toda nuetsra informaci&oacute;n en c&oacute;digo. Es decir, ahora hay que agregar una variable que represente el n&uacute;mero de manzanas que le va a dar la abuelita. Pero eso te va a tocar a ti.</p>
<h3>Instrucciones</h3>
<p>En esta ocasi&oacute;n tendr&aacute;s que agregar una variable que se llame <code>manzanasDeAbuelita</code> que debe de tener las <code>9</code> manzanas que le va a dar en el enunciado anterior. En el c&oacute;digo que tienes ya est&aacute;n las manzanas que tiene <em>Andrito</em> que son <code>5</code>.</p>
<p><code>user code</code></p>
<div class="w3-panel w3-card w3-light-grey pythonHigh notranslate">
<pre>manzanasDeAndrito = 5
      </pre>
</div>
<p>Muy bien, ahora la computadora ya tiene el n&uacute;mero de manzanas que tiene tanto <em>Andrito</em> como su abuelita, &iquest;qu&eacute; sigue? Claro, la suma de estas manzanas para obtener cu&aacute;ntas manzanas le quedan a <em>Andrito</em>. Bien, en nuestra siguiente lecci&oacute;n, ahor as&iacute;, acabaremos con nuestra frase y habremos ense&ntilde;ado a nuestra computadora a darnos la respuesta a los problemas de <em>Andrito</em> y sus manzanas de una vez por todas.</p>', '2021-05-11 16:34:11', '2021-07-07 14:09:27', 20, 'Aprender qu?? es una variable y c??mo se utilizan de manera b??sica.', '<p>Antes de hablar de lenguaje t&eacute;cnico ser&iacute;a buena idea que recordaras aquellos bellos momentos en la primaria, cuando eras joven y sin responsabilidades (excepto la escuela, claro).</p>
<p>Posiblemente recordar&aacute;s en matem&aacute;ticas cuando te ense&ntilde;aban que <em>Andrito</em> (un ni&ntilde;o) ten&iacute;a manzanas (&iquest;o eran peras?). Tal ves te ayude la frase tipo <em>Andrito tiene 5 manzanas, si su abuelita le di&oacute; por su cumplea&ntilde;os...</em>. Ah, &iquest;verdad que s&iacute; te acordabas? Bien, pues <em>Andrito</em> era el ni&ntilde;o comerciante de manzanas y en general siempre comenzaba con un n&uacute;mero fijo de manzanas. Es decir, la frase <em>Andrito tiene 5 manzanas...</em>, nos indica que <em>Andrito</em> ten&iacute;a al principio 5 manzanas. Por tanto, si en alg&uacute;n momento alguien te preguntara <em>&iquest;cu&aacute;ntas manzanas ten&iacute;a Andrito?</em> t&uacute; contestar&iacute;as &iquest;?... `5`, &iquest;cierto? <em>Andrito</em> ten&iacute;a <code>5 manzanas</code>. Bueno, podemos lograr algo parecido en c&oacute;digo.</p>', 't', 2);
INSERT INTO "public"."temas" VALUES (10, 'Introducci??n', '<p style="color: #000000; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; overflow-wrap: break-word; white-space: pre-wrap;">Primero que nada, hay que presentarse, pero de una forma m&aacute;s <em>computacional</em>:</p>
<p style="color: #000000; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; overflow-wrap: break-word; white-space: pre-wrap;">&nbsp;</p>
<p><code> Static code </code></p>
<div class="w3-panel w3-card w3-light-grey pythonHigh notranslate">
<pre>print("&iexcl;Hola! &iquest;C&oacute;mo te llamas?")
      </pre>
</div>
<p>S&iacute;, s&iacute;, tal vez te preguntar&aacute;s &iquest;qu&eacute; cosas son todos esos s&iacute;mbolos y colores extra&ntilde;os?</p>
<p>Bien, si eso es lo primero que pensaste, te doy la formal bienvenida al mundo de la programaci&oacute;n. En particular, lo que acabas de ver es la l&iacute;nea de c&oacute;digo que podemos ocupar para desplegar informaci&oacute;n (usualmente se le dice _imprimir_) a partir de un lenguaje de programaci&oacute;n, en este caso <a href="https://www.python.org/"><code>Python</code></a>. &iquest;Por qu&eacute; Python? Actualmente `python` es uno de los lenguajes con mayor demanda a nivel mundial <a href="https://octoverse.github.com/#top-languages">referencia original</a> tanto por su versatilidad como por el hecho de ser de <a href="https://es.wikipedia.org/wiki/C%C3%B3digo_abierto">c&oacute;digo abierto</a> y por tanto totalmente gratuito. Adem&aacute;s, tiene herramientas que incursionan en &aacute;reas como el c&oacute;mputo cient&iacute;fico, ciencia de datos (data science), inteligencia artificial, programaci&oacute;n web, entre muchas otras herramientas que igualmente son totalmente gratuitas.</p>
<h2>Ejercicio</h2>
<p>Y, si todav&iacute;a tienes alguna duda sobre el poder y la utilidad del lenguaje de programaci&oacute;n <code>python</code>, te informo que tambi&eacute;n es por su facilidad de uso. Para comprobarlo, probemos con tu primera l&iacute;nea de c&oacute;digo.</p>
<h3>Instrucciones</h3>
<p>Hay que hacer formal la bienvenida, as&iacute; que por favor plat&iacute;canos tu nombre, pero recuerda, de una forma m&aacute;s <em>computacional</em>. A continuaci&oacute;n est&aacute; un peque&ntilde;o editor donde puedes escribir c&oacute;digo, en particular ya cuentas con una parte, ahora solo debes de cambiar el texto <code>&lt;tuNombre&gt;</code> por tu nombre, y ejecutarlo (<em>darle en el bot&oacute;n de ejecutar</em>).</p>
<p><code>user code </code></p>
<div class="w3-panel w3-card w3-light-grey pythonHigh notranslate">
<pre>print("&iexcl;Hola! Mi nombre es &lt;tuNombre&gt;")
      </pre>
</div>
<p>&iexcl;Listo! &iquest;Verdad que es sencillo?</p>
<p>Eso ha sido todo en nuestro primer acercamiento con la programaci&oacute;n. Pero prep&aacute;rate, porque lo que est&aacute;s a punto de aprender ha revolucionado el mundo moderno como no tienes... bueno, s&iacute; tienes idea, vives en &eacute;l. &iquest;List@ para dominar el mundo de la programaci&oacute;n? &iexcl;Avancemos a tu segunda lecci&oacute;n!</p>', '2021-05-11 16:32:13', '2021-07-22 12:42:51', 20, 'Introducci??n al curso.', '<p style="color: #000000; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; overflow-wrap: break-word; white-space: pre-wrap;">Bien, ahora entrando en tema, en este curso practicaremos nociones b&aacute;sicas de programaci&oacute;n. Ya sea si tienes poca, mucha o nula experiencia programando, las lecciones en este curso est&aacute;n dise&ntilde;adas para que, terminando, tengas una noci&oacute;n completa de los fundamentos en programaci&oacute;n y seas capaz de aplciarlos a diversos problemas de tan diverso origen y aplicaci&oacute;n como tu mente los limite.</p>', 't', 1);
INSERT INTO "public"."temas" VALUES (27, 'Suma y resta', '<p style="box-sizing: border-box; margin-bottom: 16px; margin-top: 0px; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">En esta parte es cuando las matem&aacute;ticas y la programaci&oacute;n tienen un lenguaje en com&uacute;n, es decir, que ocupan los mismo s&iacute;mbolos para representar una misma operaci&oacute;n. En particular, para el lenguaje de programaci&oacute;n&nbsp;<code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">python</code>&nbsp;y la mayor&iacute;a de todos los lenguajes se ocupa algo que se denomina un&nbsp;<code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">operador</code>, en el caso de una&nbsp;<strong style="box-sizing: border-box; font-weight: 600;">suma</strong>&nbsp;hacemos una operaci&oacute;n aritm&eacute;tica, y por tanto ocupamos un operador aritm&eacute;tico, que resulta ser denotado por el s&iacute;mbolo&nbsp;<code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">+</code>&nbsp;exactamente de la misma forma que en matem&aacute;ticas. Es decir, si en matem&aacute;ticas escribimos&nbsp;<code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">5 + 3</code>&nbsp;sabemos que el resultado de esa operaci&oacute;n es&nbsp;<code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">8</code>. De forma totalmente an&aacute;loga podemos escribir la misma l&iacute;nea y esperar el mismo resultado pero en&nbsp;<code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">python</code>. Puedes ejecutar el siguiente c&oacute;digo de ejemplo:</p>
<p style="box-sizing: border-box; margin-bottom: 16px; margin-top: 0px; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;"><code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">Static code</code></p>
<div style="box-sizing: border-box; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">
<pre style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; margin-bottom: 16px; margin-top: 0px; overflow-wrap: normal; background-color: var(--color-bg-tertiary); border-radius: 6px; line-height: 1.45; overflow: auto; padding: 16px;">5 + 3
      </pre>
</div>
<p style="box-sizing: border-box; margin-bottom: 16px; margin-top: 0px; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">Cabe notar aqu&iacute; que pareciera que&nbsp;<code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">python</code>&nbsp;no nos est&aacute; dando ning&uacute;n resultado o que no est&aacute; haciendo ninguna operaci&oacute;n. En realidad s&iacute; la est&aacute; haciendo, solo que no nos est&aacute; mostrando el resultado. Prueba ahora con el siguiente c&oacute;digo:</p>
<p style="box-sizing: border-box; margin-bottom: 16px; margin-top: 0px; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;"><code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">Static code</code></p>
<div style="box-sizing: border-box; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">
<pre style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; margin-bottom: 16px; margin-top: 0px; overflow-wrap: normal; background-color: var(--color-bg-tertiary); border-radius: 6px; line-height: 1.45; overflow: auto; padding: 16px;">print(5 + 3)
      </pre>
</div>
<p style="box-sizing: border-box; margin-bottom: 16px; margin-top: 0px; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">nota que ahora escribimos la palabra&nbsp;<code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">print</code>&nbsp;y seguido abrimos par&eacute;ntesis, dentro de ellos pusimos nuestra suma&nbsp;<code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">5 + 3</code>&nbsp;y luego cerramos par&eacute;ntesis. Resulta que la palabra&nbsp;<code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">print</code>&nbsp;es una palabra (<em style="box-sizing: border-box;">funci&oacute;n</em>) que ya est&aacute; definida en&nbsp;<code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">python</code>&nbsp;y sirve para que el lenaguaje despliegue alg&uacute;n resultado en pantalla, es decir, que se lo imprima al usuario para que lo pueda ver. M&aacute;s adelante vamos a ver esto m&aacute;s a fondo, pero por lo pronto recuerda que, siempre que quieras imprimir o saber el resultado de algo, o el valor de una&nbsp;<strong style="box-sizing: border-box; font-weight: 600;">variable</strong>&nbsp;puedes ocupar la funci&oacute;n&nbsp;<code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">print</code>&nbsp;para hacerlo, escribiendo la&nbsp;<strong style="box-sizing: border-box; font-weight: 600;">variable</strong>&nbsp;o resultado entre par&eacute;ntesis inmediatamente despu&eacute;s de la palabra&nbsp;<code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">print</code>. Ahora comprueba el resultado,&nbsp;<code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">8</code>&nbsp;&iquest;cierto?</p>
<p style="box-sizing: border-box; margin-bottom: 16px; margin-top: 0px; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">De forma similar se puede ocupar el s&iacute;mbolo&nbsp;<code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">-</code>&nbsp;para denotar una resta, por ejemplo&nbsp;<code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">5 - 3</code>&nbsp;nos dar&iacute;a un resultado de&nbsp;<code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">2</code>.</p>
<p style="box-sizing: border-box; margin-bottom: 16px; margin-top: 0px; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">Una de las capacidades de estos operadores aritm&eacute;ticos es que pueden&nbsp;<em style="box-sizing: border-box;">operar</em>&nbsp;no solo sobre n&uacute;meros,&nbsp;<strong style="box-sizing: border-box; font-weight: 600;">sino con los valores de variables</strong>&nbsp;y es ah&iacute; donde est&aacute; su poder, ya que ahora puedes expresar de forma general una operaci&oacute;n. Por ejemplo, digamos que le queremos sumar&nbsp;<code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">2</code>&nbsp;a una variable llamada&nbsp;<code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">n</code>&nbsp;podr&iacute;amos escribir el resultado de la suma como:&nbsp;<code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">2 + n</code>&nbsp;y adem&aacute;s podr&iacute;amos asignarle ese valor a una nueva variable. &iexcl;Impresionante! Algo como lo siguiente:</p>
<p style="box-sizing: border-box; margin-bottom: 16px; margin-top: 0px; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;"><code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">manzanasDeAndrito</code>&nbsp;es el&nbsp;<strong style="box-sizing: border-box; font-weight: 600;">nombre</strong>&nbsp;que se eligi&oacute; (quien escribi&oacute; el c&oacute;digo) para la variable donde se va a guardar el n&uacute;mero de manzanas que tiene&nbsp;<em style="box-sizing: border-box;">Andrito</em>, y como podr&aacute;s deducir correctamente, ese valor es el&nbsp;<code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">5</code>&nbsp;que est&aacute; ah&iacute;. Entre estos dos valores se encuentra el operador de asignaci&oacute;n (signo de igual para los cuates)&nbsp;<code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">=</code>, el cual sirve para decir algo como:&nbsp;<em style="box-sizing: border-box;">le voy a asignar a la variable de la izquierda, el valor que me dieron en la derecha</em>.</p>
<p style="box-sizing: border-box; margin-bottom: 16px; margin-top: 0px; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;"><code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">Static code</code></p>
<div style="box-sizing: border-box; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">
<pre style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; margin-bottom: 16px; margin-top: 0px; overflow-wrap: normal; background-color: var(--color-bg-tertiary); border-radius: 6px; line-height: 1.45; overflow: auto; padding: 16px;">n = 5
resultado = 2 + n
print(resultado)
      </pre>
</div>
<p style="box-sizing: border-box; margin-bottom: 16px; margin-top: 0px; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">Poderoso, &iquest;no? Ahora podr&iacute;amos cambiar el valor de&nbsp;<code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">n</code>&nbsp;para que fuera cualquier n&uacute;mero, y la variable&nbsp;<code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">resultado</code>&nbsp;tendr&iacute;a siempre el resultado de sumarle&nbsp;<code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">2</code>&nbsp;a ese n&uacute;mero asignado en&nbsp;<code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">n</code>.</p>
<h2 style="box-sizing: border-box; margin-bottom: 16px; margin-top: 24px; font-weight: 600; font-size: 1.5em; line-height: 1.25; border-bottom: 1px solid var(--color-border-secondary); padding-bottom: 0.3em; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;"><a id="user-content--ejercicio-" class="anchor" style="box-sizing: border-box; background-color: transparent; color: var(--color-text-link); text-decoration: none; float: left; line-height: 1; margin-left: -20px; padding-right: 4px;" href="https://github.com/ulises1229/VirtualLabENESJ/blob/Teaching/Courses/Fundamentals/Intro/03_SumaResta.md#-ejercicio-" aria-hidden="true"></a>Ejercicio</h2>
<p style="box-sizing: border-box; margin-bottom: 16px; margin-top: 0px; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">Acabemos de una vez por todas con el caso de&nbsp;<em style="box-sizing: border-box;">Andrito</em>&nbsp;pero de forma general, es decir, que sirva para cualquier n&uacute;mero de manzanas que tenga&nbsp;<em style="box-sizing: border-box;">Andrito</em>&nbsp;y cualquier n&uacute;mero de manzanas que le d&eacute; su abuelita.</p>
<h3 style="box-sizing: border-box; margin-bottom: 16px; margin-top: 24px; font-size: 1.25em; font-weight: 600; line-height: 1.25; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;"><a id="user-content--instrucciones-" class="anchor" style="box-sizing: border-box; background-color: transparent; color: var(--color-text-link); text-decoration: none; float: left; line-height: 1; margin-left: -20px; padding-right: 4px;" href="https://github.com/ulises1229/VirtualLabENESJ/blob/Teaching/Courses/Fundamentals/Intro/03_SumaResta.md#-instrucciones-" aria-hidden="true"></a>Instrucciones</h3>
<p style="box-sizing: border-box; margin-bottom: 16px; margin-top: 0px; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">Para este ejercicio tendrpas que declarar una nueva variable que se llame&nbsp;<code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">manzanasDeAbuelita</code>, las cuales har&aacute;n referencia al n&uacute;mero de manzanas que le dar&aacute; su abuelita a&nbsp;<em style="box-sizing: border-box;">Andrito</em>, pon por ejemplo que inicialmente le va a dar&nbsp;<code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">10</code>. Ahora toca determinar cu&aacute;ntas manzanas le quedar&iacute;an a&nbsp;<em style="box-sizing: border-box;">Andrito</em>&nbsp;despu&eacute;s de recibir las manzanas de su abuelita. Este valor lo vas a guardar en una variable denominada&nbsp;<code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">manzanasFinalesAndrito</code>&nbsp;el cual tendr&aacute; el valor de la suma de las manzanas iniciales m&aacute;s las que le di&oacute; su abuelita.&nbsp;<strong style="box-sizing: border-box; font-weight: 600;">Recuerda hacerlo de forma general, &iexcl;no hagas la operaci&oacute;n por la computadora!</strong>&nbsp;de forma que podamos cambiar los valores del n&uacute;mero de manzanas de&nbsp;<em style="box-sizing: border-box;">Andrito</em>&nbsp;y de su abuelita y la computadora sea capaz de decirnos el resultado correcto.</p>
<p style="box-sizing: border-box; margin-bottom: 16px; margin-top: 0px; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;"><code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">user code</code></p>
<div style="box-sizing: border-box; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">
<pre style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; margin-bottom: 16px; margin-top: 0px; overflow-wrap: normal; background-color: var(--color-bg-tertiary); border-radius: 6px; line-height: 1.45; overflow: auto; padding: 16px;">manzanasDeAndrito = 5
      </pre>
</div>
<p style="box-sizing: border-box; margin-bottom: 0px !important; margin-top: 0px; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">&iexcl;Excelente! Ya le dimos la capacidad de resolver cualquier problema de&nbsp;<em style="box-sizing: border-box;">Andrito</em>&nbsp;y sus manzanas a nuestra computadora utilizando&nbsp;<code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">python</code>&nbsp;&iexcl;Felicidades! Ahora formalicemos los conceptos que hemos aprendido hasta ahora (que son bastantes) y expand&aacute;moslos a cosas mucho m&aacute;s interesantes. Nos vemos en la siguiente lecci&oacute;n. Tres manzanas m&aacute;s dos manzanas, cambio y fuera.</p>', '2021-07-07 14:12:55', '2021-07-07 14:12:55', 20, 'Interacci??n con las variables num??ricas.', '<p><span style="color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">Recordemos r&aacute;pidamente el problema que estamos buscando resolver: el de la frase&nbsp;</span><em style="box-sizing: border-box; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-size: 16px; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">Andrito tiene 5 manzanas, si su abuela le da 10 por su cumplea&ntilde;os, &iquest;cu&aacute;ntas tiene Andrito?</em><span style="color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">. Resulta evidente que esto consiste en una suma, es decir, hay que sumarle a las manzanas que ten&iacute;a&nbsp;</span><em style="box-sizing: border-box; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-size: 16px; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">Andrito</em><span style="color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">&nbsp;las que le da su abuelita por su cumplea&ntilde;os. F&aacute;cil, &iquest;cierto? Veamos ahora c&oacute;mo decirle eso a la computadora.</span></p>', 't', 3);
INSERT INTO "public"."temas" VALUES (12, 'Variables Num??ricas', '<h4>Variables enteras (int)</h4>
<p>Las variables enteras son aquellas capaces de guardar n&uacute;meros enteros, es decir valores como <code>-3</code>, <code>-1</code>, <code>0</code>, <code>16</code> y dem&aacute;s. Recordar&aacute;s de las lecciones anteriores que trabajamos con manzanas, las variables que utiliz&aacute;bamos eran de tipo entero, solo que t&uacute; todav&iacute;a no lo sab&iacute;as de todo (probablemente te lo pudiste imaginar), eso es porque <code>python</code> interpreta los n&uacute;meros que le asign&aacute;bamos a la variable y decid&iacute;a por nosotros qu&eacute; tipo de variable era. Una vez que declaramos una variable en <code>python</code> se le asigna el tipo de variable que <code>python</code> considere que es el adecuado (generalmente hace un buen trabajo, pero no siempre, hay que estar atentos ante algunos casos especiales). Para saber qu&eacute; tipo de variable est&aacute; asignando <code>python</code> podemos utilizar la <em>palabra</em> <code>type</code> para lograrlo. Observa el siguiente ejemplo:</p>
<p><code> Static code </code></p>
<div class="w3-panel w3-card w3-light-grey pythonHigh notranslate">
<pre>variableEntera = -3
print(type(variableEntera))
      </pre>
</div>
<p>Podr&aacute;s notar en el ejemplo que llamamos la palabra (<em>funci&oacute;n</em>, pronto veremos esto a m&aacute;s detalle) <code>type</code> dentro de la que ya hab&iacute;amos visto antes <code>print</code> es decir, quiero que me despliegue el resultado que da <code>type</code> para que lo pueda ver. Tambi&eacute;n notar&aacute;s que a <code>type</code> le estamos <em>pasando</em> nuestra variable <code>variableEntera</code>, y una vez que lo ejecutamos nos muestra algo como: <code>&amp;ltclass: ''int''&gt;</code>, esto nos est&aacute; diciendo el tipo (o clase) de variable que es <code>variableEntera</code>, en este caso <code>int</code>, &iexcl;un valor entero! De forma an&aacute;loga podr&iacute;amos hacerlo con cualquier valor hasta pr&aacute;cticamente el infinito. Bueno, nos fuimos un poco lejos, no tanto, pero cada vez nos acercamos m&aacute;s. De forma breve, el n&uacute;mero m&aacute;s grande (y m&aacute;s peque&ntilde;o) que puedes guardar en una computadora est&aacute; determinado por el n&uacute;mero de <a href="https://es.wikipedia.org/wiki/Bit">bits</a> que tiene, es decir, mientras m&aacute;s tenga, mayor ser&aacute; el valor m&aacute;ximo que puedas guardar.</p>
<p>Antes de que nos entre el p&aacute;nico, no te preocupes, las computadoras actuales pueden guardar cantidades realmente grandes, pero no infinitas (a veces esto se vuelve realmente importante). Interesante, &iquest;no?</p>
<h4>Variables decimales (flotantes)</h4>
<p>Ahora toca el turno de las variables fraccionales o con punto decimal. A diferencia de las variables enteras, las fraccionales son capaces de guardar valores como <code>-25.7</code>, <code>0.2</code> y <code>8.99</code>. Es decir, estas variables pueden guardar tanto la porci&oacute;n entera de un n&uacute;mero, as&iacute; como su parte decimal. &iquest;D&oacute;nde podr&iacute;an ser &uacute;tiles estos valores?</p>
<p>Posiblemente se te ocurrieron varios ejemplos, y si no, te invito a que analices por unos minutos tus alrededores digitales, seguro encuentras bastantes que ocupas en tu d&iacute;a a d&iacute;a y que tal vez no hab&iacute;as notado.</p>
<p>Resulta que en <code>python</code> la forma para declarar una variable flotante y asignarle un valor flotante es pr&aacute;cticamente igual a como lo hicste antes con una variable entera, solo que ahora el n&uacute;mero va a tener un punto que separe la parte entera de la decimal, tal y como lo hacemos en cualquier otro lado:</p>
<p><code> Static code </code></p>
<div class="w3-panel w3-card w3-light-grey pythonHigh notranslate">
<pre>variableFlotante = 16.4
print(type(variableFlotante))
      </pre>
</div>
<p>Con esto posiblemente te estar&aacute;s preguntando, &iquest;para qu&eacute; existen los enteros si hay flotantes? Bien, esto resulta de cuestiones pr&aacute;cticas, tanto de precisi&oacute;n como de almacenaje, te invito a que veas el siguiente ejemplo y luego discutimos lo que est&aacute; pasando:</p>
<p><code> Static code </code></p>
<div class="w3-panel w3-card w3-light-grey pythonHigh notranslate">
<pre>print(0.1 + 0.1 + 0.1)
      </pre>
</div>
<p>Espera un minuto, &iquest;qu&eacute; cosa? No importa c&oacute;mo lo intentes, tres veces <code>0.1</code> jam&aacute;s va a ser <code>0.30000000000000004</code>. &iquest;Acaso las matem&aacute;ticas nos han mentido todo este tiempo? &iquest;O es que <code>python</code> nos ha fallado? Bueno, realmente ninguna de las dos, lo que sucede es algo parecido que con los n&uacute;meros enteros cuando dec&iacute;amos que hab&iacute;a un n&uacute;mero m&aacute;ximo que no era infinito, solo un n&uacute;mero muy grande. A eso se le denomina <em>precisi&oacute;n</em> y como ya se mencion&oacute;, depende del n&uacute;mero de bits que tenga tu computadora. En el caso de los n&uacute;meros flotantes resulta ser mucho m&aacute;s importante que en los enteros, ya que adem&aacute;s de definir qu&eacute; tan <em>grande</em> o tan <em>chico</em> puede ser el n&uacute;mero, tambi&eacute;n define qu&eacute; tanta precisi&oacute;n puede tener, es decir, qu&eacute; tantos n&uacute;meros a la derecha del punto decimal va a poder guardar con toda la precisi&oacute;n necesaria.</p>
<p>Esto se vuelve algo mucho m&aacute;s preocupante puesto que los errores de precisi&oacute;n al trabajar con variables flotantes se vuelven algo a considerar. Por esa raz&oacute;n cuando se busca llevar a cabo simulaciones computacionales de alt&iacute;sima precisi&oacute;n se ocupan equipos especiales, que como seguramente habr&aacute;s adivinado, tienen muchos m&aacute;s bits para guardar n&uacute;meros flotantes que una computadora comercial.</p>
<p>Este ejemplo no es para que te espantes y ahora le tengas miedo a los n&uacute;meros flotantes, sino como una prueba de que siempre hay que hacer las cosas de forma planeada y no simplemente declarar n&uacute;meros como flotantes porque es m&aacute;s vers&aacute;til o sencillo. Por esa raz&oacute;n sigue habiendo ambos tipos de variables, y seguir&aacute;n habiendo, ya que tienen aplicaciones muy diferentes y particulares en &aacute;reas espec&iacute;ficas. Por &uacute;ltimo cabe destacar que, a pesar de que no son totalmente exactas las operaciones con n&uacute;meros flotantes, la cifra de error se encuentra en el orden de 10<sup>-17</sup> que por ejemplo si hablamos de centavos de un peso, se encuentra realmente lejos de ser algo preocupante, pero que tal vez s&iacute; lo podr&iacute;a ser si est&aacute;s calculando la &oacute;rbita de un sat&eacute;lite alrededor de la Tierra.</p>
<h4>Variables booleanas (bool)</h4>
<p>Finalmente, pero no menos importante, pasaremos a entender las variables boolenas. En general son algo simples ya que &uacute;nicamente pueden tener dos posibles valores: <code>True</code> o <code>False</code> en espa&ntilde;ol <em>Cierto</em> o <em>Falso</em>. En programaci&oacute;n este tipo de variables son de alta utilidad y uso, aunque muchas veces pasan mayormente desapercibidas. Poco a poco vamos a ir descubriendo sus usos, por ahora s&oacute;lo vamos a ver c&oacute;mo se declara una variable booleana en <code>python</code>, algo que es muy parecido a como lo har&iacute;amos para una variable num&eacute;rica:</p>
<p><code> Static code </code></p>
<div class="w3-panel w3-card w3-light-grey pythonHigh notranslate">
<pre>variableBooleana = True
print(type(variableBooleana))
      </pre>
</div>
<p>donde el valor que le dimos a la variable en este caso ser&iacute;a <em>Cierto</em>, pero en ingl&eacute;s, y en may&uacute;sculas. En <code>python</code> son palabras reservadas (es decir tienen un uso espec&iacute;fico) tanto <code>True</code> como <code>False</code> las cuales son literalmente los valores de las variables booleanas, mismos que puedes asignarles a cualquier otra variable que hayas declarado t&uacute;. Lo puedes ver como con los n&uacute;meros, t&uacute; no inventaste el <code>3</code> en <code>python</code>, sino que lo escribes para guardar su valor en una variable, bueno, es lo mismo pero con booleanas.</p>
<h2>Ejercicio</h2>
<p>Para reforzar lo aprendido realizar&aacute;s un peque&ntilde;o ejemplo relacionado con variables num&eacute;ricas. Tendr&aacute;s que declarar cinco variables diferentes, las cuales tendr&aacute;s que darles ya sea un valor entero, flotanto o booleano seg&uacute;n consideres sea el adecuado para representarlo. Por ejemplo, si te pidiera declarar una variable que guarde el n&uacute;mero de personas que viven en tu colonia, &iquest;qu&eacute; tipo de variable deber&iacute;as de tener? Una variable del tipo <code>int</code> o entera, &iquest;cierto? Porque no pueden haber medias personas (o no hasta donde yo recuerde), ni tampoco podr&iacute;a ser un &uacute;nico valor s&iacute; o no. Bien, con la idea un poco m&aacute;s clara, pasemos al ejercicio.</p>
<h3>Instrucciones</h3>
<p>Declara las siguientes cinco variables y as&iacute;gnales el valor correspondiente de la forma necesaria para que <code>python</code> las interprete como el tipo de variable que consideras ser&iacute;a el ideal (con punto decimal para flotantes, <code>True</code> o <code>False</code> para booleanas, etc.):</p>
<ul>
<li><code>numComputadoras</code>: en esta variable tendr&aacute;s que poner el n&uacute;mero de computadoras que hay en el lugar donde te encuentras sentad@ actualmente.</li>
<li><code>yaDesayuno</code>: aqu&iacute; tendr&aacute;s que poner si al momento en que est&aacute;s leyendo esta lecci&oacute;n ya acabaste de desayunar el d&iacute;a de hoy (si ya es de noche espero que s&iacute; lo hayas hecho, si no &iexcl;corre por una manzana por favor!).</li>
<li><code>diamTierra</code>: aqu&iacute; tendr&aacute;s que colocar el valor de la constante de gravedad en la Luna (en m/s<sup>2</sup>).</li>
<li><code>accionCompFavorita</code>: aqu&iacute; pondr&aacute;s el valor (aprox.) de las acciones de tu compa&ntilde;&iacute;a favorita en estos instantes (en d&oacute;lares).</li>
<li><code>voltajeReposoNeurona</code>: aqu&iacute; deber&aacute;s de poner el voltaje en reposo (com&uacute;nmente se entiende como el inicial) de una neurona antes del proceso de despolarizaci&oacute;n y por ende del potencial de acci&oacute;n en mV (mili Volts). (<em>tip</em>: es un valor negativo)</li>
</ul>
<p><code>user code</code></p>
<div class="w3-panel w3-card w3-light-grey pythonHigh notranslate">
<pre>#Tu c&oacute;digo aqu&iacute;
      </pre>
</div>
<p>Vaya, vaya, pero cu&aacute;ntas diferentes cosas podemos guardar en una simple variable. &iexcl;Esto comienza a ponerse interesante! Lo mejor es que, si recuerdas de la lecci&oacute;n pasada, onde vimos los operadores de suma y resta, pues resulta que para todas estas variables &iexcl;podemos ocupar estos operadores! Pero te tengo una sorpresan, &iexcl;no son las &uacute;nicas variables! Vamos a la siguiente lecci&oacute;n para conocer c&oacute;mo guardar texto en una computadora.</p>', '2021-05-11 16:36:29', '2021-07-07 14:12:55', 20, 'Entendiendo las variables num??ricas', '<p>En esta ocasi&oacute;n vamos a hablar de dos tipos de variables: <strong>num&eacute;ricas</strong> y <strong>booleanas</strong>.</p>
<h4>Variables num&eacute;ricas</h4>
<p>Como su propio nombre te podr&aacute; dar una pista, son aquellas variables que guardar un tipo de dato relacionado con n&uacute;meros. En particular hay dos tipos de valores num&eacute;ricos: <strong>enteros</strong> (<em>int</em> en ingl&eacute;s) y <strong>flotantes</strong> (en ingl&eacute;s <em>float</em>). Los primeros son con los que ya has experimentado anteriormente con este dilema de las manzanas y <em>Andrito</em>, pero van m&aacute;s all&aacute;, ya que pueden ser tanto negativos como positivos. Por otro lado, las variables flotantes son aquellas que nos van a permitir representar valores fraccionales, tambi&eacute;n llamados con punto flotante o decimal (de ah&iacute; el nombre). Estos n&uacute;meros flotantes pueden contener tanto n&uacute;meros enteros como su parte decimal, es como el equivalente de los <a href="https://es.wikipedia.org/wiki/N%C3%BAmero_real">n&uacute;meros reales</a> en matem&aacute;ticas.</p>
<h4>Variables booleanas</h4>
<p>En ingl&eacute;s llamadas <em>bool</em> son aquellas que tienen su surgimiento de la <a href="https://es.wikipedia.org/wiki/%C3%81lgebra_de_Boole">l&oacute;gica booleana</a> creada por <a href="https://es.wikipedia.org/wiki/George_Boole">George Boole</a> y que consiste esencialmente en el uso de dos &uacute;nicos valores: <strong>Cierto</strong> (<em>True</em> en ingl&eacute;s) y <strong>Falso</strong> (<em>False</em> en ingl&eacute;s). Ambos valores pueden ser utilizados para muchas cuestiones, donde los m&aacute;s destacados son el &aacute;lgebra booleana misma, pero en programaci&oacute;n se pueden extender sus usos todav&iacute;a m&aacute;s, como en el uso para tomar decisiones a trav&eacute;s de comparaciones (tranquil@ m&aacute;s adelante veremos esto formalmente).</p>', 't', 4);
INSERT INTO "public"."temas" VALUES (20, 'Dummy', '<p>asdfasdfasdfasdfasdf</p>', '2021-07-06 15:14:21', '2021-07-07 14:12:55', 20, 'asdfasdfasdf', '<p>asdfasdfasdfasdf</p>', 't', 5);
INSERT INTO "public"."temas" VALUES (22, 'Introducci??n', '<h2 style="box-sizing: border-box; margin-bottom: 16px; margin-top: 24px; font-weight: 600; font-size: 1.5em; line-height: 1.25; border-bottom: 1px solid var(--color-border-secondary); padding-bottom: 0.3em; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">Ejercicio</h2>
<p style="box-sizing: border-box; margin-bottom: 16px; margin-top: 0px; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">Y, si todav&iacute;a tienes alguna duda sobre el poder y la utilidad del lenguaje de programaci&oacute;n&nbsp;<code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">python</code>, te informo que tambi&eacute;n es por su facilidad de uso. Para comprobarlo, probemos con tu primera l&iacute;nea de c&oacute;digo.</p>
<h3 style="box-sizing: border-box; margin-bottom: 16px; margin-top: 24px; font-size: 1.25em; font-weight: 600; line-height: 1.25; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;"><a id="user-content--instrucciones-" class="anchor" style="box-sizing: border-box; background-color: transparent; color: var(--color-text-link); text-decoration: none; float: left; line-height: 1; margin-left: -20px; padding-right: 4px;" href="https://github.com/ulises1229/VirtualLabENESJ/blob/Teaching/Courses/DummyCourse/Intro/01_Intro.md#-instrucciones-" aria-hidden="true"></a>Instrucciones</h3>
<p style="box-sizing: border-box; margin-bottom: 16px; margin-top: 0px; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">Hay que hacer formal la bienvenida, as&iacute; que por favor plat&iacute;canos tu nombre, pero recuerda, de una forma m&aacute;s&nbsp;<em style="box-sizing: border-box;">computacional</em>. A continuaci&oacute;n est&aacute; un peque&ntilde;o editor donde puedes escribir c&oacute;digo, en particular ya cuentas con una parte, ahora solo debes de cambiar el texto&nbsp;<code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">&lt;tuNombre&gt;</code>&nbsp;por tu nombre, y ejecutarlo (<em style="box-sizing: border-box;">darle en el bot&oacute;n de ejecutar</em>).</p>
<p style="box-sizing: border-box; margin-bottom: 16px; margin-top: 0px; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;"><code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">user code</code></p>
<div style="box-sizing: border-box; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">
<pre style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; margin-bottom: 16px; margin-top: 0px; overflow-wrap: normal; background-color: var(--color-bg-tertiary); border-radius: 6px; line-height: 1.45; overflow: auto; padding: 16px;">print("&iexcl;Hola! Mi nombre es &lt;tuNombre&gt;")
      </pre>
</div>
<p style="box-sizing: border-box; margin-bottom: 16px; margin-top: 0px; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">&iexcl;Listo! &iquest;Verdad que es sencillo?</p>
<p style="box-sizing: border-box; margin-bottom: 0px !important; margin-top: 0px; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">Eso ha sido todo en nuestro primer acercamiento con la programaci&oacute;n. Pero prep&aacute;rate, porque lo que est&aacute;s a punto de aprender ha revolucionado el mundo moderno como no tienes... bueno, s&iacute; tienes idea, vives en &eacute;l. &iquest;List@ para dominar el mundo de la programaci&oacute;n? &iexcl;Avancemos a tu segunda lecci&oacute;n!</p>', '2021-07-07 13:28:36', '2021-07-07 13:30:07', 23, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse commodo aliquam varius.', '<p style="box-sizing: border-box; margin-bottom: 16px; margin-top: 0px; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">Bien, ahora entrando en tema, en este curso practicaremos nociones b&aacute;sicas de programaci&oacute;n. Ya sea si tienes poca, mucha o nula experiencia programando, las lecciones en este curso est&aacute;n dise&ntilde;adas para que, terminando, tengas una noci&oacute;n completa de los fundamentos en programaci&oacute;n y seas capaz de aplciarlos a diversos problemas de tan diverso origen y aplicaci&oacute;n como tu mente los limite.</p>
<p style="box-sizing: border-box; margin-bottom: 16px; margin-top: 0px; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">Primero que nada, hay que presentarse, pero de una forma m&aacute;s&nbsp;<em style="box-sizing: border-box;">computacional</em>:</p>
<p style="box-sizing: border-box; margin-bottom: 16px; margin-top: 0px; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;"><code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">Static code</code></p>
<div style="box-sizing: border-box; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">
<pre style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; margin-bottom: 16px; margin-top: 0px; overflow-wrap: normal; background-color: var(--color-bg-tertiary); border-radius: 6px; line-height: 1.45; overflow: auto; padding: 16px;">print("&iexcl;Hola! &iquest;C&oacute;mo te llamas?")
      </pre>
</div>
<p style="box-sizing: border-box; margin-bottom: 16px; margin-top: 0px; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">S&iacute;, s&iacute;, tal vez te preguntar&aacute;s &iquest;qu&eacute; cosas son todos esos s&iacute;mbolos y colores extra&ntilde;os?</p>
<p style="box-sizing: border-box; margin-bottom: 16px; margin-top: 0px; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">Bien, si eso es lo primero que pensaste, te doy la formal bienvenida al mundo de la programaci&oacute;n. En particular, lo que acabas de ver es la l&iacute;nea de c&oacute;digo que podemos ocupar para desplegar informaci&oacute;n (usualmente se le dice _imprimir_) a partir de un lenguaje de programaci&oacute;n, en este caso&nbsp;<a style="box-sizing: border-box; background-color: transparent; color: var(--color-text-link); text-decoration: none;" href="https://www.python.org/" rel="nofollow"><code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">Python</code></a>. &iquest;Por qu&eacute; Python? Actualmente `python` es uno de los lenguajes con mayor demanda a nivel mundial&nbsp;<a style="box-sizing: border-box; background-color: transparent; color: var(--color-text-link); text-decoration: none;" href="https://octoverse.github.com/#top-languages">referencia original</a>&nbsp;tanto por su versatilidad como por el hecho de ser de&nbsp;<a style="box-sizing: border-box; background-color: transparent; color: var(--color-text-link); text-decoration: none;" href="https://es.wikipedia.org/wiki/C%C3%B3digo_abierto" rel="nofollow">c&oacute;digo abierto</a>&nbsp;y por tanto totalmente gratuito. Adem&aacute;s, tiene herramientas que incursionan en &aacute;reas como el c&oacute;mputo cient&iacute;fico, ciencia de datos (data science), inteligencia artificial, programaci&oacute;n web, entre muchas otras herramientas que igualmente son totalmente gratuitas.</p>', 'f', 1);
INSERT INTO "public"."temas" VALUES (24, 'Manzanas y m??s manzanas', '<p style="box-sizing: border-box; margin-bottom: 16px; margin-top: 0px; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">En esta parte es cuando las matem&aacute;ticas y la programaci&oacute;n tienen un lenguaje en com&uacute;n, es decir, que ocupan los mismo s&iacute;mbolos para representar una misma operaci&oacute;n. En particular, para el lenguaje de programaci&oacute;n&nbsp;<code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">python</code>&nbsp;y la mayor&iacute;a de todos los lenguajes se ocupa algo que se denomina un&nbsp;<code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">operador</code>, en el caso de una&nbsp;<strong style="box-sizing: border-box; font-weight: 600;">suma</strong>&nbsp;hacemos una operaci&oacute;n aritm&eacute;tica, y por tanto ocupamos un operador aritm&eacute;tico, que resulta ser denotado por el s&iacute;mbolo&nbsp;<code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">+</code>&nbsp;exactamente de la misma forma que en matem&aacute;ticas. Es decir, si en matem&aacute;ticas escribimos&nbsp;<code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">5 + 3</code>&nbsp;sabemos que el resultado de esa operaci&oacute;n es&nbsp;<code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">8</code>. De forma totalmente an&aacute;loga podemos escribir la misma l&iacute;nea y esperar el mismo resultado pero en&nbsp;<code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">python</code>. Puedes ejecutar el siguiente c&oacute;digo de ejemplo:</p>
<p style="box-sizing: border-box; margin-bottom: 16px; margin-top: 0px; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;"><code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">Static code</code></p>
<div style="box-sizing: border-box; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">
<pre style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; margin-bottom: 16px; margin-top: 0px; overflow-wrap: normal; background-color: var(--color-bg-tertiary); border-radius: 6px; line-height: 1.45; overflow: auto; padding: 16px;">5 + 3
      </pre>
</div>
<p style="box-sizing: border-box; margin-bottom: 16px; margin-top: 0px; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">Cabe notar aqu&iacute; que pareciera que&nbsp;<code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">python</code>&nbsp;no nos est&aacute; dando ning&uacute;n resultado o que no est&aacute; haciendo ninguna operaci&oacute;n. En realidad s&iacute; la est&aacute; haciendo, solo que no nos est&aacute; mostrando el resultado. Prueba ahora con el siguiente c&oacute;digo:</p>
<p style="box-sizing: border-box; margin-bottom: 16px; margin-top: 0px; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;"><code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">Static code</code></p>
<div style="box-sizing: border-box; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">
<pre style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; margin-bottom: 16px; margin-top: 0px; overflow-wrap: normal; background-color: var(--color-bg-tertiary); border-radius: 6px; line-height: 1.45; overflow: auto; padding: 16px;">print(5 + 3)
      </pre>
</div>
<p style="box-sizing: border-box; margin-bottom: 16px; margin-top: 0px; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">nota que ahora escribimos la palabra&nbsp;<code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">print</code>&nbsp;y seguido abrimos par&eacute;ntesis, dentro de ellos pusimos nuestra suma&nbsp;<code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">5 + 3</code>&nbsp;y luego cerramos par&eacute;ntesis. Resulta que la palabra&nbsp;<code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">print</code>&nbsp;es una palabra (<em style="box-sizing: border-box;">funci&oacute;n</em>) que ya est&aacute; definida en&nbsp;<code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">python</code>&nbsp;y sirve para que el lenaguaje despliegue alg&uacute;n resultado en pantalla, es decir, que se lo imprima al usuario para que lo pueda ver. M&aacute;s adelante vamos a ver esto m&aacute;s a fondo, pero por lo pronto recuerda que, siempre que quieras imprimir o saber el resultado de algo, o el valor de una&nbsp;<strong style="box-sizing: border-box; font-weight: 600;">variable</strong>&nbsp;puedes ocupar la funci&oacute;n&nbsp;<code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">print</code>&nbsp;para hacerlo, escribiendo la&nbsp;<strong style="box-sizing: border-box; font-weight: 600;">variable</strong>&nbsp;o resultado entre par&eacute;ntesis inmediatamente despu&eacute;s de la palabra&nbsp;<code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">print</code>. Ahora comprueba el resultado,&nbsp;<code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">8</code>&nbsp;&iquest;cierto?</p>
<p style="box-sizing: border-box; margin-bottom: 16px; margin-top: 0px; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">De forma similar se puede ocupar el s&iacute;mbolo&nbsp;<code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">-</code>&nbsp;para denotar una resta, por ejemplo&nbsp;<code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">5 - 3</code>&nbsp;nos dar&iacute;a un resultado de&nbsp;<code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">2</code>.</p>
<p style="box-sizing: border-box; margin-bottom: 16px; margin-top: 0px; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">Una de las capacidades de estos operadores aritm&eacute;ticos es que pueden&nbsp;<em style="box-sizing: border-box;">operar</em>&nbsp;no solo sobre n&uacute;meros,&nbsp;<strong style="box-sizing: border-box; font-weight: 600;">sino con los valores de variables</strong>&nbsp;y es ah&iacute; donde est&aacute; su poder, ya que ahora puedes expresar de forma general una operaci&oacute;n. Por ejemplo, digamos que le queremos sumar&nbsp;<code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">2</code>&nbsp;a una variable llamada&nbsp;<code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">n</code>&nbsp;podr&iacute;amos escribir el resultado de la suma como:&nbsp;<code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">2 + n</code>&nbsp;y adem&aacute;s podr&iacute;amos asignarle ese valor a una nueva variable. &iexcl;Impresionante! Algo como lo siguiente:</p>
<p style="box-sizing: border-box; margin-bottom: 16px; margin-top: 0px; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;"><code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">manzanasDeAndrito</code>&nbsp;es el&nbsp;<strong style="box-sizing: border-box; font-weight: 600;">nombre</strong>&nbsp;que se eligi&oacute; (quien escribi&oacute; el c&oacute;digo) para la variable donde se va a guardar el n&uacute;mero de manzanas que tiene&nbsp;<em style="box-sizing: border-box;">Andrito</em>, y como podr&aacute;s deducir correctamente, ese valor es el&nbsp;<code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">5</code>&nbsp;que est&aacute; ah&iacute;. Entre estos dos valores se encuentra el operador de asignaci&oacute;n (signo de igual para los cuates)&nbsp;<code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">=</code>, el cual sirve para decir algo como:&nbsp;<em style="box-sizing: border-box;">le voy a asignar a la variable de la izquierda, el valor que me dieron en la derecha</em>.</p>
<p style="box-sizing: border-box; margin-bottom: 16px; margin-top: 0px; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;"><code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">Static code</code></p>
<div style="box-sizing: border-box; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">
<pre style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; margin-bottom: 16px; margin-top: 0px; overflow-wrap: normal; background-color: var(--color-bg-tertiary); border-radius: 6px; line-height: 1.45; overflow: auto; padding: 16px;">n = 5
resultado = 2 + n
print(resultado)
      </pre>
</div>
<p style="box-sizing: border-box; margin-bottom: 16px; margin-top: 0px; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">Poderoso, &iquest;no? Ahora podr&iacute;amos cambiar el valor de&nbsp;<code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">n</code>&nbsp;para que fuera cualquier n&uacute;mero, y la variable&nbsp;<code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">resultado</code>&nbsp;tendr&iacute;a siempre el resultado de sumarle&nbsp;<code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">2</code>&nbsp;a ese n&uacute;mero asignado en&nbsp;<code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">n</code>.</p>
<h2 style="box-sizing: border-box; margin-bottom: 16px; margin-top: 24px; font-weight: 600; font-size: 1.5em; line-height: 1.25; border-bottom: 1px solid var(--color-border-secondary); padding-bottom: 0.3em; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;"><a id="user-content--ejercicio-" class="anchor" style="box-sizing: border-box; background-color: transparent; color: var(--color-text-link); text-decoration: none; float: left; line-height: 1; margin-left: -20px; padding-right: 4px;" href="https://github.com/ulises1229/VirtualLabENESJ/blob/Teaching/Courses/DummyCourse/Intro/03_SumaResta.md#-ejercicio-" aria-hidden="true"></a>Ejercicio</h2>
<p style="box-sizing: border-box; margin-bottom: 16px; margin-top: 0px; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">Acabemos de una vez por todas con el caso de&nbsp;<em style="box-sizing: border-box;">Andrito</em>&nbsp;pero de forma general, es decir, que sirva para cualquier n&uacute;mero de manzanas que tenga&nbsp;<em style="box-sizing: border-box;">Andrito</em>&nbsp;y cualquier n&uacute;mero de manzanas que le d&eacute; su abuelita.</p>
<h3 style="box-sizing: border-box; margin-bottom: 16px; margin-top: 24px; font-size: 1.25em; font-weight: 600; line-height: 1.25; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;"><a id="user-content--instrucciones-" class="anchor" style="box-sizing: border-box; background-color: transparent; color: var(--color-text-link); text-decoration: none; float: left; line-height: 1; margin-left: -20px; padding-right: 4px;" href="https://github.com/ulises1229/VirtualLabENESJ/blob/Teaching/Courses/DummyCourse/Intro/03_SumaResta.md#-instrucciones-" aria-hidden="true"></a>Instrucciones</h3>
<p style="box-sizing: border-box; margin-bottom: 16px; margin-top: 0px; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">Para este ejercicio tendrpas que declarar una nueva variable que se llame&nbsp;<code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">manzanasDeAbuelita</code>, las cuales har&aacute;n referencia al n&uacute;mero de manzanas que le dar&aacute; su abuelita a&nbsp;<em style="box-sizing: border-box;">Andrito</em>, pon por ejemplo que inicialmente le va a dar&nbsp;<code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">10</code>. Ahora toca determinar cu&aacute;ntas manzanas le quedar&iacute;an a&nbsp;<em style="box-sizing: border-box;">Andrito</em>&nbsp;despu&eacute;s de recibir las manzanas de su abuelita. Este valor lo vas a guardar en una variable denominada&nbsp;<code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">manzanasFinalesAndrito</code>&nbsp;el cual tendr&aacute; el valor de la suma de las manzanas iniciales m&aacute;s las que le di&oacute; su abuelita.&nbsp;<strong style="box-sizing: border-box; font-weight: 600;">Recuerda hacerlo de forma general, &iexcl;no hagas la operaci&oacute;n por la computadora!</strong>&nbsp;de forma que podamos cambiar los valores del n&uacute;mero de manzanas de&nbsp;<em style="box-sizing: border-box;">Andrito</em>&nbsp;y de su abuelita y la computadora sea capaz de decirnos el resultado correcto.</p>
<p style="box-sizing: border-box; margin-bottom: 16px; margin-top: 0px; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;"><code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">user code</code></p>
<div style="box-sizing: border-box; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">
<pre style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; margin-bottom: 16px; margin-top: 0px; overflow-wrap: normal; background-color: var(--color-bg-tertiary); border-radius: 6px; line-height: 1.45; overflow: auto; padding: 16px;">manzanasDeAndrito = 5
      </pre>
</div>
<p style="box-sizing: border-box; margin-bottom: 0px !important; margin-top: 0px; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">&iexcl;Excelente! Ya le dimos la capacidad de resolver cualquier problema de&nbsp;<em style="box-sizing: border-box;">Andrito</em>&nbsp;y sus manzanas a nuestra computadora utilizando&nbsp;<code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">python</code>&nbsp;&iexcl;Felicidades! Ahora formalicemos los conceptos que hemos aprendido hasta ahora (que son bastantes) y expand&aacute;moslos a cosas mucho m&aacute;s interesantes. Nos vemos en la siguiente lecci&oacute;n. Tres manzanas m&aacute;s dos manzanas, cambio y fuera.</p>', '2021-07-07 13:31:32', '2021-07-07 13:31:32', 23, 'Tema avanzado de variables.', '<p><span style="color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">Recordemos r&aacute;pidamente el problema que estamos buscando resolver: el de la frase&nbsp;</span><em style="box-sizing: border-box; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-size: 16px; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">Andrito tiene 5 manzanas, si su abuela le da 10 por su cumplea&ntilde;os, &iquest;cu&aacute;ntas tiene Andrito?</em><span style="color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">. Resulta evidente que esto consiste en una suma, es decir, hay que sumarle a las manzanas que ten&iacute;a&nbsp;</span><em style="box-sizing: border-box; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-size: 16px; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">Andrito</em><span style="color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">&nbsp;las que le da su abuelita por su cumplea&ntilde;os. F&aacute;cil, &iquest;cierto? Veamos ahora c&oacute;mo decirle eso a la computadora.</span></p>', 'f', 3);
INSERT INTO "public"."temas" VALUES (21, 'Intro', '<h2 style="box-sizing: border-box; margin-bottom: 16px; margin-top: 24px; font-weight: 600; font-size: 1.5em; line-height: 1.25; border-bottom: 1px solid var(--color-border-secondary); padding-bottom: 0.3em; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">Ejercicio</h2>
<p style="box-sizing: border-box; margin-bottom: 16px; margin-top: 0px; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">Y, si todav&iacute;a tienes alguna duda sobre el poder y la utilidad del lenguaje de programaci&oacute;n&nbsp;<code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">python</code>, te informo que tambi&eacute;n es por su facilidad de uso. Para comprobarlo, probemos con tu primera l&iacute;nea de c&oacute;digo.</p>
<h3 style="box-sizing: border-box; margin-bottom: 16px; margin-top: 24px; font-size: 1.25em; font-weight: 600; line-height: 1.25; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;"><a id="user-content--instrucciones-" class="anchor" style="box-sizing: border-box; background-color: transparent; color: var(--color-text-link); text-decoration: none; float: left; line-height: 1; margin-left: -20px; padding-right: 4px;" href="https://github.com/ulises1229/VirtualLabENESJ/blob/Teaching/Courses/DummyCourse/DummyModule/01_Intro.md#-instrucciones-" aria-hidden="true"></a>Instrucciones</h3>
<p style="box-sizing: border-box; margin-bottom: 16px; margin-top: 0px; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">Hay que hacer formal la bienvenida, as&iacute; que por favor plat&iacute;canos tu nombre, pero recuerda, de una forma m&aacute;s&nbsp;<em style="box-sizing: border-box;">computacional</em>. A continuaci&oacute;n est&aacute; un peque&ntilde;o editor donde puedes escribir c&oacute;digo, en particular ya cuentas con una parte, ahora solo debes de cambiar el texto&nbsp;<code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">&lt;tuNombre&gt;</code>&nbsp;por tu nombre, y ejecutarlo (<em style="box-sizing: border-box;">darle en el bot&oacute;n de ejecutar</em>).</p>
<p style="box-sizing: border-box; margin-bottom: 16px; margin-top: 0px; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;"><code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">user code</code></p>
<div style="box-sizing: border-box; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">
<pre style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; margin-bottom: 16px; margin-top: 0px; overflow-wrap: normal; background-color: var(--color-bg-tertiary); border-radius: 6px; line-height: 1.45; overflow: auto; padding: 16px;">print("&iexcl;Hola! Mi nombre es &lt;tuNombre&gt;")
      </pre>
</div>
<p style="box-sizing: border-box; margin-bottom: 16px; margin-top: 0px; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">&iexcl;Listo! &iquest;Verdad que es sencillo?</p>
<p style="box-sizing: border-box; margin-bottom: 0px !important; margin-top: 0px; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">Eso ha sido todo en nuestro primer acercamiento con la programaci&oacute;n. Pero prep&aacute;rate, porque lo que est&aacute;s a punto de aprender ha revolucionado el mundo moderno como no tienes... bueno, s&iacute; tienes idea, vives en &eacute;l. &iquest;List@ para dominar el mundo de la programaci&oacute;n? &iexcl;Avancemos a tu segunda lecci&oacute;n!</p>', '2021-07-07 13:26:52', '2021-07-07 13:26:52', 22, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse commodo aliquam varius.', '<p style="box-sizing: border-box; margin-bottom: 16px; margin-top: 0px; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">Bien, ahora entrando en tema, en este curso practicaremos nociones b&aacute;sicas de programaci&oacute;n. Ya sea si tienes poca, mucha o nula experiencia programando, las lecciones en este curso est&aacute;n dise&ntilde;adas para que, terminando, tengas una noci&oacute;n completa de los fundamentos en programaci&oacute;n y seas capaz de aplciarlos a diversos problemas de tan diverso origen y aplicaci&oacute;n como tu mente los limite.</p>
<p style="box-sizing: border-box; margin-bottom: 16px; margin-top: 0px; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">Primero que nada, hay que presentarse, pero de una forma m&aacute;s&nbsp;<em style="box-sizing: border-box;">computacional</em>:</p>
<p style="box-sizing: border-box; margin-bottom: 16px; margin-top: 0px; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;"><code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">Static code</code></p>
<div style="box-sizing: border-box; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">
<pre style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; margin-bottom: 16px; margin-top: 0px; overflow-wrap: normal; background-color: var(--color-bg-tertiary); border-radius: 6px; line-height: 1.45; overflow: auto; padding: 16px;">print("&iexcl;Hola! &iquest;C&oacute;mo te llamas?")
      </pre>
</div>
<p style="box-sizing: border-box; margin-bottom: 16px; margin-top: 0px; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">S&iacute;, s&iacute;, tal vez te preguntar&aacute;s &iquest;qu&eacute; cosas son todos esos s&iacute;mbolos y colores extra&ntilde;os?</p>
<p style="box-sizing: border-box; margin-bottom: 16px; margin-top: 0px; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">Bien, si eso es lo primero que pensaste, te doy la formal bienvenida al mundo de la programaci&oacute;n. En particular, lo que acabas de ver es la l&iacute;nea de c&oacute;digo que podemos ocupar para desplegar informaci&oacute;n (usualmente se le dice _imprimir_) a partir de un lenguaje de programaci&oacute;n, en este caso&nbsp;<a style="box-sizing: border-box; background-color: transparent; color: var(--color-text-link); text-decoration: none;" href="https://www.python.org/" rel="nofollow"><code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">Python</code></a>. &iquest;Por qu&eacute; Python? Actualmente `python` es uno de los lenguajes con mayor demanda a nivel mundial&nbsp;<a style="box-sizing: border-box; background-color: transparent; color: var(--color-text-link); text-decoration: none;" href="https://octoverse.github.com/#top-languages">referencia original</a>&nbsp;tanto por su versatilidad como por el hecho de ser de&nbsp;<a style="box-sizing: border-box; background-color: transparent; color: var(--color-text-link); text-decoration: none;" href="https://es.wikipedia.org/wiki/C%C3%B3digo_abierto" rel="nofollow">c&oacute;digo abierto</a>&nbsp;y por tanto totalmente gratuito. Adem&aacute;s, tiene herramientas que incursionan en &aacute;reas como el c&oacute;mputo cient&iacute;fico, ciencia de datos (data science), inteligencia artificial, programaci&oacute;n web, entre muchas otras herramientas que igualmente son totalmente gratuitas.</p>', 'f', 1);
INSERT INTO "public"."temas" VALUES (25, 'Variables Num??ricas', '<h4 style="box-sizing: border-box; margin-bottom: 16px; margin-top: 24px; font-weight: 600; font-size: 16px; line-height: 1.25; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">Variables enteras (int)</h4>
<p style="box-sizing: border-box; margin-bottom: 16px; margin-top: 0px; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">Las variables enteras son aquellas capaces de guardar n&uacute;meros enteros, es decir valores como&nbsp;<code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">-3</code>,&nbsp;<code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">-1</code>,&nbsp;<code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">0</code>,&nbsp;<code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">16</code>&nbsp;y dem&aacute;s. Recordar&aacute;s de las lecciones anteriores que trabajamos con manzanas, las variables que utiliz&aacute;bamos eran de tipo entero, solo que t&uacute; todav&iacute;a no lo sab&iacute;as de todo (probablemente te lo pudiste imaginar), eso es porque&nbsp;<code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">python</code>&nbsp;interpreta los n&uacute;meros que le asign&aacute;bamos a la variable y decid&iacute;a por nosotros qu&eacute; tipo de variable era. Una vez que declaramos una variable en&nbsp;<code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">python</code>&nbsp;se le asigna el tipo de variable que&nbsp;<code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">python</code>&nbsp;considere que es el adecuado (generalmente hace un buen trabajo, pero no siempre, hay que estar atentos ante algunos casos especiales). Para saber qu&eacute; tipo de variable est&aacute; asignando&nbsp;<code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">python</code>&nbsp;podemos utilizar la&nbsp;<em style="box-sizing: border-box;">palabra</em>&nbsp;<code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">type</code>&nbsp;para lograrlo. Observa el siguiente ejemplo:</p>
<p style="box-sizing: border-box; margin-bottom: 16px; margin-top: 0px; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;"><code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">Static code</code></p>
<div style="box-sizing: border-box; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">
<pre style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; margin-bottom: 16px; margin-top: 0px; overflow-wrap: normal; background-color: var(--color-bg-tertiary); border-radius: 6px; line-height: 1.45; overflow: auto; padding: 16px;">variableEntera = -3
print(type(variableEntera))
      </pre>
</div>
<p style="box-sizing: border-box; margin-bottom: 16px; margin-top: 0px; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">Podr&aacute;s notar en el ejemplo que llamamos la palabra (<em style="box-sizing: border-box;">funci&oacute;n</em>, pronto veremos esto a m&aacute;s detalle)&nbsp;<code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">type</code>&nbsp;dentro de la que ya hab&iacute;amos visto antes&nbsp;<code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">print</code>&nbsp;es decir, quiero que me despliegue el resultado que da&nbsp;<code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">type</code>&nbsp;para que lo pueda ver. Tambi&eacute;n notar&aacute;s que a&nbsp;<code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">type</code>&nbsp;le estamos&nbsp;<em style="box-sizing: border-box;">pasando</em>&nbsp;nuestra variable&nbsp;<code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">variableEntera</code>, y una vez que lo ejecutamos nos muestra algo como:&nbsp;<code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">&lt;class: ''int''&gt;</code>, esto nos est&aacute; diciendo el tipo (o clase) de variable que es&nbsp;<code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">variableEntera</code>, en este caso&nbsp;<code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">int</code>, &iexcl;un valor entero! De forma an&aacute;loga podr&iacute;amos hacerlo con cualquier valor hasta pr&aacute;cticamente el infinito. Bueno, nos fuimos un poco lejos, no tanto, pero cada vez nos acercamos m&aacute;s. De forma breve, el n&uacute;mero m&aacute;s grande (y m&aacute;s peque&ntilde;o) que puedes guardar en una computadora est&aacute; determinado por el n&uacute;mero de&nbsp;<a style="box-sizing: border-box; background-color: transparent; color: var(--color-text-link); text-decoration: none;" href="https://es.wikipedia.org/wiki/Bit" rel="nofollow">bits</a>&nbsp;que tiene, es decir, mientras m&aacute;s tenga, mayor ser&aacute; el valor m&aacute;ximo que puedas guardar.</p>
<p style="box-sizing: border-box; margin-bottom: 16px; margin-top: 0px; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">Antes de que nos entre el p&aacute;nico, no te preocupes, las computadoras actuales pueden guardar cantidades realmente grandes, pero no infinitas (a veces esto se vuelve realmente importante). Interesante, &iquest;no?</p>
<h4 style="box-sizing: border-box; margin-bottom: 16px; margin-top: 24px; font-weight: 600; font-size: 16px; line-height: 1.25; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;"><a id="user-content-variables-decimales-flotantes" class="anchor" style="box-sizing: border-box; background-color: transparent; color: var(--color-text-link); text-decoration: none; float: left; line-height: 1; margin-left: -20px; padding-right: 4px;" href="https://github.com/ulises1229/VirtualLabENESJ/blob/Teaching/Courses/DummyCourse/Intro/04_VariablesNumericas.md#variables-decimales-flotantes" aria-hidden="true"></a>Variables decimales (flotantes)</h4>
<p style="box-sizing: border-box; margin-bottom: 16px; margin-top: 0px; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">Ahora toca el turno de las variables fraccionales o con punto decimal. A diferencia de las variables enteras, las fraccionales son capaces de guardar valores como&nbsp;<code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">-25.7</code>,&nbsp;<code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">0.2</code>&nbsp;y&nbsp;<code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">8.99</code>. Es decir, estas variables pueden guardar tanto la porci&oacute;n entera de un n&uacute;mero, as&iacute; como su parte decimal. &iquest;D&oacute;nde podr&iacute;an ser &uacute;tiles estos valores?</p>
<p style="box-sizing: border-box; margin-bottom: 16px; margin-top: 0px; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">Posiblemente se te ocurrieron varios ejemplos, y si no, te invito a que analices por unos minutos tus alrededores digitales, seguro encuentras bastantes que ocupas en tu d&iacute;a a d&iacute;a y que tal vez no hab&iacute;as notado.</p>
<p style="box-sizing: border-box; margin-bottom: 16px; margin-top: 0px; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">Resulta que en&nbsp;<code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">python</code>&nbsp;la forma para declarar una variable flotante y asignarle un valor flotante es pr&aacute;cticamente igual a como lo hicste antes con una variable entera, solo que ahora el n&uacute;mero va a tener un punto que separe la parte entera de la decimal, tal y como lo hacemos en cualquier otro lado:</p>
<p style="box-sizing: border-box; margin-bottom: 16px; margin-top: 0px; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;"><code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">Static code</code></p>
<div style="box-sizing: border-box; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">
<pre style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; margin-bottom: 16px; margin-top: 0px; overflow-wrap: normal; background-color: var(--color-bg-tertiary); border-radius: 6px; line-height: 1.45; overflow: auto; padding: 16px;">variableFlotante = 16.4
print(type(variableFlotante))
      </pre>
</div>
<p style="box-sizing: border-box; margin-bottom: 16px; margin-top: 0px; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">Con esto posiblemente te estar&aacute;s preguntando, &iquest;para qu&eacute; existen los enteros si hay flotantes? Bien, esto resulta de cuestiones pr&aacute;cticas, tanto de precisi&oacute;n como de almacenaje, te invito a que veas el siguiente ejemplo y luego discutimos lo que est&aacute; pasando:</p>
<p style="box-sizing: border-box; margin-bottom: 16px; margin-top: 0px; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;"><code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">Static code</code></p>
<div style="box-sizing: border-box; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">
<pre style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; margin-bottom: 16px; margin-top: 0px; overflow-wrap: normal; background-color: var(--color-bg-tertiary); border-radius: 6px; line-height: 1.45; overflow: auto; padding: 16px;">print(0.1 + 0.1 + 0.1)
      </pre>
</div>
<p style="box-sizing: border-box; margin-bottom: 16px; margin-top: 0px; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">Espera un minuto, &iquest;qu&eacute; cosa? No importa c&oacute;mo lo intentes, tres veces&nbsp;<code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">0.1</code>&nbsp;jam&aacute;s va a ser&nbsp;<code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">0.30000000000000004</code>. &iquest;Acaso las matem&aacute;ticas nos han mentido todo este tiempo? &iquest;O es que&nbsp;<code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">python</code>&nbsp;nos ha fallado? Bueno, realmente ninguna de las dos, lo que sucede es algo parecido que con los n&uacute;meros enteros cuando dec&iacute;amos que hab&iacute;a un n&uacute;mero m&aacute;ximo que no era infinito, solo un n&uacute;mero muy grande. A eso se le denomina&nbsp;<em style="box-sizing: border-box;">precisi&oacute;n</em>&nbsp;y como ya se mencion&oacute;, depende del n&uacute;mero de bits que tenga tu computadora. En el caso de los n&uacute;meros flotantes resulta ser mucho m&aacute;s importante que en los enteros, ya que adem&aacute;s de definir qu&eacute; tan&nbsp;<em style="box-sizing: border-box;">grande</em>&nbsp;o tan&nbsp;<em style="box-sizing: border-box;">chico</em>&nbsp;puede ser el n&uacute;mero, tambi&eacute;n define qu&eacute; tanta precisi&oacute;n puede tener, es decir, qu&eacute; tantos n&uacute;meros a la derecha del punto decimal va a poder guardar con toda la precisi&oacute;n necesaria.</p>
<p style="box-sizing: border-box; margin-bottom: 16px; margin-top: 0px; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">Esto se vuelve algo mucho m&aacute;s preocupante puesto que los errores de precisi&oacute;n al trabajar con variables flotantes se vuelven algo a considerar. Por esa raz&oacute;n cuando se busca llevar a cabo simulaciones computacionales de alt&iacute;sima precisi&oacute;n se ocupan equipos especiales, que como seguramente habr&aacute;s adivinado, tienen muchos m&aacute;s bits para guardar n&uacute;meros flotantes que una computadora comercial.</p>
<p style="box-sizing: border-box; margin-bottom: 16px; margin-top: 0px; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">Este ejemplo no es para que te espantes y ahora le tengas miedo a los n&uacute;meros flotantes, sino como una prueba de que siempre hay que hacer las cosas de forma planeada y no simplemente declarar n&uacute;meros como flotantes porque es m&aacute;s vers&aacute;til o sencillo. Por esa raz&oacute;n sigue habiendo ambos tipos de variables, y seguir&aacute;n habiendo, ya que tienen aplicaciones muy diferentes y particulares en &aacute;reas espec&iacute;ficas. Por &uacute;ltimo cabe destacar que, a pesar de que no son totalmente exactas las operaciones con n&uacute;meros flotantes, la cifra de error se encuentra en el orden de 10<sup style="box-sizing: border-box; font-size: 12px; line-height: 0; position: relative; vertical-align: baseline; top: -0.5em;">-17</sup>&nbsp;que por ejemplo si hablamos de centavos de un peso, se encuentra realmente lejos de ser algo preocupante, pero que tal vez s&iacute; lo podr&iacute;a ser si est&aacute;s calculando la &oacute;rbita de un sat&eacute;lite alrededor de la Tierra.</p>
<h4 style="box-sizing: border-box; margin-bottom: 16px; margin-top: 24px; font-weight: 600; font-size: 16px; line-height: 1.25; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;"><a id="user-content--variables-booleanas-bool" class="anchor" style="box-sizing: border-box; background-color: transparent; color: var(--color-text-link); text-decoration: none; float: left; line-height: 1; margin-left: -20px; padding-right: 4px;" href="https://github.com/ulises1229/VirtualLabENESJ/blob/Teaching/Courses/DummyCourse/Intro/04_VariablesNumericas.md#-variables-booleanas-bool" aria-hidden="true"></a>Variables booleanas (bool)</h4>
<p style="box-sizing: border-box; margin-bottom: 16px; margin-top: 0px; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">Finalmente, pero no menos importante, pasaremos a entender las variables boolenas. En general son algo simples ya que &uacute;nicamente pueden tener dos posibles valores:&nbsp;<code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">True</code>&nbsp;o&nbsp;<code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">False</code>&nbsp;en espa&ntilde;ol&nbsp;<em style="box-sizing: border-box;">Cierto</em>&nbsp;o&nbsp;<em style="box-sizing: border-box;">Falso</em>. En programaci&oacute;n este tipo de variables son de alta utilidad y uso, aunque muchas veces pasan mayormente desapercibidas. Poco a poco vamos a ir descubriendo sus usos, por ahora s&oacute;lo vamos a ver c&oacute;mo se declara una variable booleana en&nbsp;<code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">python</code>, algo que es muy parecido a como lo har&iacute;amos para una variable num&eacute;rica:</p>
<p style="box-sizing: border-box; margin-bottom: 16px; margin-top: 0px; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;"><code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">Static code</code></p>
<div style="box-sizing: border-box; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">
<pre style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; margin-bottom: 16px; margin-top: 0px; overflow-wrap: normal; background-color: var(--color-bg-tertiary); border-radius: 6px; line-height: 1.45; overflow: auto; padding: 16px;">variableBooleana = True
print(type(variableBooleana))
      </pre>
</div>
<p style="box-sizing: border-box; margin-bottom: 16px; margin-top: 0px; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">donde el valor que le dimos a la variable en este caso ser&iacute;a&nbsp;<em style="box-sizing: border-box;">Cierto</em>, pero en ingl&eacute;s, y en may&uacute;sculas. En&nbsp;<code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">python</code>&nbsp;son palabras reservadas (es decir tienen un uso espec&iacute;fico) tanto&nbsp;<code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">True</code>&nbsp;como&nbsp;<code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">False</code>&nbsp;las cuales son literalmente los valores de las variables booleanas, mismos que puedes asignarles a cualquier otra variable que hayas declarado t&uacute;. Lo puedes ver como con los n&uacute;meros, t&uacute; no inventaste el&nbsp;<code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">3</code>&nbsp;en&nbsp;<code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">python</code>, sino que lo escribes para guardar su valor en una variable, bueno, es lo mismo pero con booleanas.</p>
<h2 style="box-sizing: border-box; margin-bottom: 16px; margin-top: 24px; font-weight: 600; font-size: 1.5em; line-height: 1.25; border-bottom: 1px solid var(--color-border-secondary); padding-bottom: 0.3em; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;"><a id="user-content--ejercicio-" class="anchor" style="box-sizing: border-box; background-color: transparent; color: var(--color-text-link); text-decoration: none; float: left; line-height: 1; margin-left: -20px; padding-right: 4px;" href="https://github.com/ulises1229/VirtualLabENESJ/blob/Teaching/Courses/DummyCourse/Intro/04_VariablesNumericas.md#-ejercicio-" aria-hidden="true"></a>Ejercicio</h2>
<p style="box-sizing: border-box; margin-bottom: 16px; margin-top: 0px; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">Para reforzar lo aprendido realizar&aacute;s un peque&ntilde;o ejemplo relacionado con variables num&eacute;ricas. Tendr&aacute;s que declarar cinco variables diferentes, las cuales tendr&aacute;s que darles ya sea un valor entero, flotanto o booleano seg&uacute;n consideres sea el adecuado para representarlo. Por ejemplo, si te pidiera declarar una variable que guarde el n&uacute;mero de personas que viven en tu colonia, &iquest;qu&eacute; tipo de variable deber&iacute;as de tener? Una variable del tipo&nbsp;<code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">int</code>&nbsp;o entera, &iquest;cierto? Porque no pueden haber medias personas (o no hasta donde yo recuerde), ni tampoco podr&iacute;a ser un &uacute;nico valor s&iacute; o no. Bien, con la idea un poco m&aacute;s clara, pasemos al ejercicio.</p>
<h3 style="box-sizing: border-box; margin-bottom: 16px; margin-top: 24px; font-size: 1.25em; font-weight: 600; line-height: 1.25; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;"><a id="user-content--instrucciones-" class="anchor" style="box-sizing: border-box; background-color: transparent; color: var(--color-text-link); text-decoration: none; float: left; line-height: 1; margin-left: -20px; padding-right: 4px;" href="https://github.com/ulises1229/VirtualLabENESJ/blob/Teaching/Courses/DummyCourse/Intro/04_VariablesNumericas.md#-instrucciones-" aria-hidden="true"></a>Instrucciones</h3>
<p style="box-sizing: border-box; margin-bottom: 16px; margin-top: 0px; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">Declara las siguientes cinco variables y as&iacute;gnales el valor correspondiente de la forma necesaria para que&nbsp;<code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">python</code>&nbsp;las interprete como el tipo de variable que consideras ser&iacute;a el ideal (con punto decimal para flotantes,&nbsp;<code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">True</code>&nbsp;o&nbsp;<code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">False</code>&nbsp;para booleanas, etc.):</p>
<ul style="box-sizing: border-box; margin-bottom: 16px; margin-top: 0px; padding-left: 2em; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">
<li style="box-sizing: border-box;"><code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">numComputadoras</code>: en esta variable tendr&aacute;s que poner el n&uacute;mero de computadoras que hay en el lugar donde te encuentras sentad@ actualmente.</li>
<li style="box-sizing: border-box; margin-top: 0.25em;"><code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">yaDesayuno</code>: aqu&iacute; tendr&aacute;s que poner si al momento en que est&aacute;s leyendo esta lecci&oacute;n ya acabaste de desayunar el d&iacute;a de hoy (si ya es de noche espero que s&iacute; lo hayas hecho, si no &iexcl;corre por una manzana por favor!).</li>
<li style="box-sizing: border-box; margin-top: 0.25em;"><code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">diamTierra</code>: aqu&iacute; tendr&aacute;s que colocar el valor de la constante de gravedad en la Luna (en m/s<sup style="box-sizing: border-box; font-size: 12px; line-height: 0; position: relative; vertical-align: baseline; top: -0.5em;">2</sup>).</li>
<li style="box-sizing: border-box; margin-top: 0.25em;"><code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">accionCompFavorita</code>: aqu&iacute; pondr&aacute;s el valor (aprox.) de las acciones de tu compa&ntilde;&iacute;a favorita en estos instantes (en d&oacute;lares).</li>
<li style="box-sizing: border-box; margin-top: 0.25em;"><code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">voltajeReposoNeurona</code>: aqu&iacute; deber&aacute;s de poner el voltaje en reposo (com&uacute;nmente se entiende como el inicial) de una neurona antes del proceso de despolarizaci&oacute;n y por ende del potencial de acci&oacute;n en mV (mili Volts). (<em style="box-sizing: border-box;">tip</em>: es un valor negativo)</li>
</ul>
<p style="box-sizing: border-box; margin-bottom: 16px; margin-top: 0px; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">&nbsp;</p>
<p style="box-sizing: border-box; margin-bottom: 16px; margin-top: 0px; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;"><code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">user code</code></p>
<div style="box-sizing: border-box; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">
<pre style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; margin-bottom: 16px; margin-top: 0px; overflow-wrap: normal; background-color: var(--color-bg-tertiary); border-radius: 6px; line-height: 1.45; overflow: auto; padding: 16px;">#Tu c&oacute;digo aqu&iacute;
      </pre>
</div>
<p style="box-sizing: border-box; margin-bottom: 0px !important; margin-top: 0px; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">Vaya, vaya, pero cu&aacute;ntas diferentes cosas podemos guardar en una simple variable. &iexcl;Esto comienza a ponerse interesante! Lo mejor es que, si recuerdas de la lecci&oacute;n pasada, onde vimos los operadores de suma y resta, pues resulta que para todas estas variables &iexcl;podemos ocupar estos operadores! Pero te tengo una sorpresan, &iexcl;no son las &uacute;nicas variables! Vamos a la siguiente lecci&oacute;n para conocer c&oacute;mo guardar texto en una computadora.</p>', '2021-07-07 13:33:14', '2021-07-07 13:33:14', 23, 'Conoce los tipos de variables num??ricas y booleanas.', '<p><span style="color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">En esta ocasi&oacute;n vamos a hablar de dos tipos de variables:&nbsp;</span><strong style="box-sizing: border-box; font-weight: 600; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">num&eacute;ricas</strong><span style="color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">&nbsp;y&nbsp;</span><strong style="box-sizing: border-box; font-weight: 600; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">booleanas</strong><span style="color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">.</span></p>
<h4 style="box-sizing: border-box; margin-bottom: 16px; margin-top: 24px; font-weight: 600; font-size: 16px; line-height: 1.25; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">Variables num&eacute;ricas</h4>
<p style="box-sizing: border-box; margin-bottom: 16px; margin-top: 0px; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">Como su propio nombre te podr&aacute; dar una pista, son aquellas variables que guardar un tipo de dato relacionado con n&uacute;meros. En particular hay dos tipos de valores num&eacute;ricos:&nbsp;<strong style="box-sizing: border-box; font-weight: 600;">enteros</strong>&nbsp;(<em style="box-sizing: border-box;">int</em>&nbsp;en ingl&eacute;s) y&nbsp;<strong style="box-sizing: border-box; font-weight: 600;">flotantes</strong>&nbsp;(en ingl&eacute;s&nbsp;<em style="box-sizing: border-box;">float</em>). Los primeros son con los que ya has experimentado anteriormente con este dilema de las manzanas y&nbsp;<em style="box-sizing: border-box;">Andrito</em>, pero van m&aacute;s all&aacute;, ya que pueden ser tanto negativos como positivos. Por otro lado, las variables flotantes son aquellas que nos van a permitir representar valores fraccionales, tambi&eacute;n llamados con punto flotante o decimal (de ah&iacute; el nombre). Estos n&uacute;meros flotantes pueden contener tanto n&uacute;meros enteros como su parte decimal, es como el equivalente de los&nbsp;<a style="box-sizing: border-box; background-color: transparent; color: var(--color-text-link); text-decoration: none;" href="https://es.wikipedia.org/wiki/N%C3%BAmero_real" rel="nofollow">n&uacute;meros reales</a>&nbsp;en matem&aacute;ticas.</p>
<h4 style="box-sizing: border-box; margin-bottom: 16px; margin-top: 24px; font-weight: 600; font-size: 16px; line-height: 1.25; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;"><a id="user-content-variables-booleanas" class="anchor" style="box-sizing: border-box; background-color: transparent; color: var(--color-text-link); text-decoration: none; float: left; line-height: 1; margin-left: -20px; padding-right: 4px;" href="https://github.com/ulises1229/VirtualLabENESJ/blob/Teaching/Courses/DummyCourse/Intro/04_VariablesNumericas.md#variables-booleanas" aria-hidden="true"></a>Variables booleanas</h4>
<p style="box-sizing: border-box; margin-bottom: 16px; margin-top: 0px; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">En ingl&eacute;s llamadas&nbsp;<em style="box-sizing: border-box;">bool</em>&nbsp;son aquellas que tienen su surgimiento de la&nbsp;<a style="box-sizing: border-box; background-color: transparent; color: var(--color-text-link); text-decoration: none;" href="https://es.wikipedia.org/wiki/%C3%81lgebra_de_Boole" rel="nofollow">l&oacute;gica booleana</a>&nbsp;creada por&nbsp;<a style="box-sizing: border-box; background-color: transparent; color: var(--color-text-link); text-decoration: none;" href="https://es.wikipedia.org/wiki/George_Boole" rel="nofollow">George Boole</a>&nbsp;y que consiste esencialmente en el uso de dos &uacute;nicos valores:&nbsp;<strong style="box-sizing: border-box; font-weight: 600;">Cierto</strong>&nbsp;(<em style="box-sizing: border-box;">True</em>&nbsp;en ingl&eacute;s) y&nbsp;<strong style="box-sizing: border-box; font-weight: 600;">Falso</strong>&nbsp;(<em style="box-sizing: border-box;">False</em>&nbsp;en ingl&eacute;s). Ambos valores pueden ser utilizados para muchas cuestiones, donde los m&aacute;s destacados son el &aacute;lgebra booleana misma, pero en programaci&oacute;n se pueden extender sus usos todav&iacute;a m&aacute;s, como en el uso para tomar decisiones a trav&eacute;s de comparaciones (tranquil@ m&aacute;s adelante veremos esto formalmente).</p>', 'f', 4);
INSERT INTO "public"."temas" VALUES (23, 'Variables y manzanas', '<p style="box-sizing: border-box; margin-bottom: 16px; margin-top: 0px; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">Para ello utilizamos lo que se llaman&nbsp;<code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">variables</code>. Esas&nbsp;<code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">variables</code>&nbsp;son realmente espacios en memoria dentro de tu computadora que sirven para almacenar informaci&oacute;n; por ejemplo, el n&uacute;mero de manzanas que ten&iacute;a&nbsp;<em style="box-sizing: border-box;">Andrito</em>. Una variable tiene dos componentes esenciales:&nbsp;<strong style="box-sizing: border-box; font-weight: 600;">nombre</strong>&nbsp;y&nbsp;<strong style="box-sizing: border-box; font-weight: 600;">valor</strong>.</p>
<p style="box-sizing: border-box; margin-bottom: 16px; margin-top: 0px; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">El&nbsp;<strong style="box-sizing: border-box; font-weight: 600;">nombre</strong>&nbsp;de una variable es literalmente una palabra que nos sirve para entender (nosotros los programadores) a qu&eacute; hace referencia lo que vamos a guardar, y el&nbsp;<strong style="box-sizing: border-box; font-weight: 600;">valor</strong>&nbsp;es literalmente lo que va a guardar. Veamos un ejemplo r&aacute;pido en c&oacute;digo:</p>
<p style="box-sizing: border-box; margin-bottom: 16px; margin-top: 0px; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;"><code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">Static code</code></p>
<div style="box-sizing: border-box; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">
<pre style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; margin-bottom: 16px; margin-top: 0px; overflow-wrap: normal; background-color: var(--color-bg-tertiary); border-radius: 6px; line-height: 1.45; overflow: auto; padding: 16px;">manzanasDeAndrito = 5
      </pre>
</div>
<p style="box-sizing: border-box; margin-bottom: 16px; margin-top: 0px; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">en este ejemplo tenemos tres cosas importantes:&nbsp;<code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">manzanasDeAndrito</code>,&nbsp;<code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">=</code>&nbsp;y&nbsp;<code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">5</code>, vamos a entenderlas un poco m&aacute;s.</p>
<p style="box-sizing: border-box; margin-bottom: 16px; margin-top: 0px; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;"><code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">manzanasDeAndrito</code>&nbsp;es el&nbsp;<strong style="box-sizing: border-box; font-weight: 600;">nombre</strong>&nbsp;que se eligi&oacute; (quien escribi&oacute; el c&oacute;digo) para la variable donde se va a guardar el n&uacute;mero de manzanas que tiene&nbsp;<em style="box-sizing: border-box;">Andrito</em>, y como podr&aacute;s deducir correctamente, ese valor es el&nbsp;<code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">5</code>&nbsp;que est&aacute; ah&iacute;. Entre estos dos valores se encuentra el operador de asignaci&oacute;n (signo de igual para los cuates)&nbsp;<code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">=</code>, el cual sirve para decir algo como:&nbsp;<em style="box-sizing: border-box;">le voy a asignar a la variable de la izquierda, el valor que me dieron en la derecha</em>.</p>
<p style="box-sizing: border-box; margin-bottom: 16px; margin-top: 0px; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">Pero adem&aacute;s de eso, ahora podremos preguntarle a&nbsp;<code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">python</code>&nbsp;cu&aacute;ntas manzanas tiene&nbsp;<em style="box-sizing: border-box;">Andrito</em>&nbsp;&iexcl;y va a poder decirnos que tiene 5! No me crees, m&iacute;ralo en acci&oacute;n:</p>
<p style="box-sizing: border-box; margin-bottom: 16px; margin-top: 0px; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;"><code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">static code</code></p>
<div style="box-sizing: border-box; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">
<pre style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; margin-bottom: 16px; margin-top: 0px; overflow-wrap: normal; background-color: var(--color-bg-tertiary); border-radius: 6px; line-height: 1.45; overflow: auto; padding: 16px;">manzanasDeAndrito = 5
print(manzanasDeAndrito)
      </pre>
</div>
<h2 style="box-sizing: border-box; margin-bottom: 16px; margin-top: 24px; font-weight: 600; font-size: 1.5em; line-height: 1.25; border-bottom: 1px solid var(--color-border-secondary); padding-bottom: 0.3em; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;"><a id="user-content--ejercicio-" class="anchor" style="box-sizing: border-box; background-color: transparent; color: var(--color-text-link); text-decoration: none; float: left; line-height: 1; margin-left: -20px; padding-right: 4px;" href="https://github.com/ulises1229/VirtualLabENESJ/blob/Teaching/Courses/DummyCourse/Intro/02_Variables.md#-ejercicio-" aria-hidden="true"></a>Ejercicio</h2>
<p style="box-sizing: border-box; margin-bottom: 16px; margin-top: 0px; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">Vamos a seguir con&nbsp;<em style="box-sizing: border-box;">Andrito</em>&nbsp;y sus manzanas. En particular vamos a centrarnos en la idea de que&nbsp;<em style="box-sizing: border-box;">Andrito tiene 5 manzanas, si su abuelita le di&oacute; por su cumplea&ntilde;os otras 9...</em>, antes de poder acabarlo, hay que tener toda nuetsra informaci&oacute;n en c&oacute;digo. Es decir, ahora hay que agregar una variable que represente el n&uacute;mero de manzanas que le va a dar la abuelita. Pero eso te va a tocar a ti.</p>
<h3 style="box-sizing: border-box; margin-bottom: 16px; margin-top: 24px; font-size: 1.25em; font-weight: 600; line-height: 1.25; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;"><a id="user-content--instrucciones-" class="anchor" style="box-sizing: border-box; background-color: transparent; color: var(--color-text-link); text-decoration: none; float: left; line-height: 1; margin-left: -20px; padding-right: 4px;" href="https://github.com/ulises1229/VirtualLabENESJ/blob/Teaching/Courses/DummyCourse/Intro/02_Variables.md#-instrucciones-" aria-hidden="true"></a>Instrucciones</h3>
<p style="box-sizing: border-box; margin-bottom: 16px; margin-top: 0px; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">En esta ocasi&oacute;n tendr&aacute;s que agregar una variable que se llame&nbsp;<code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">manzanasDeAbuelita</code>&nbsp;que debe de tener las&nbsp;<code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">9</code>&nbsp;manzanas que le va a dar en el enunciado anterior. En el c&oacute;digo que tienes ya est&aacute;n las manzanas que tiene&nbsp;<em style="box-sizing: border-box;">Andrito</em>&nbsp;que son&nbsp;<code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">5</code>.</p>
<p style="box-sizing: border-box; margin-bottom: 16px; margin-top: 0px; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;"><code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">user code</code></p>
<div style="box-sizing: border-box; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">
<pre style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; margin-bottom: 16px; margin-top: 0px; overflow-wrap: normal; background-color: var(--color-bg-tertiary); border-radius: 6px; line-height: 1.45; overflow: auto; padding: 16px;">manzanasDeAndrito = 5
      </pre>
</div>
<p style="box-sizing: border-box; margin-bottom: 0px !important; margin-top: 0px; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">Muy bien, ahora la computadora ya tiene el n&uacute;mero de manzanas que tiene tanto&nbsp;<em style="box-sizing: border-box;">Andrito</em>&nbsp;como su abuelita, &iquest;qu&eacute; sigue? Claro, la suma de estas manzanas para obtener cu&aacute;ntas manzanas le quedan a&nbsp;<em style="box-sizing: border-box;">Andrito</em>. Bien, en nuestra siguiente lecci&oacute;n, ahora s&iacute;, acabaremos con nuestra frase y habremos ense&ntilde;ado a nuestra computadora a darnos la respuesta a los problemas de&nbsp;<em style="box-sizing: border-box;">Andrito</em>&nbsp;y sus manzanas de una vez por todas.</p>', '2021-07-07 13:29:51', '2021-07-07 13:29:51', 23, 'Tipos de variables utilizadas m??s comunmente.', '<p style="box-sizing: border-box; margin-bottom: 16px; margin-top: 0px; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">Antes de hablar de lenguaje t&eacute;cnico ser&iacute;a buena idea que recordaras aquellos bellos momentos en la primaria, cuando eras joven y sin responsabilidades (excepto la escuela, claro).</p>
<p style="box-sizing: border-box; margin-bottom: 16px; margin-top: 0px; color: #24292e; font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Helvetica, Arial, sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji''; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">Posiblemente recordar&aacute;s en matem&aacute;ticas cuando te ense&ntilde;aban que&nbsp;<em style="box-sizing: border-box;">Andrito</em>&nbsp;(un ni&ntilde;o) ten&iacute;a manzanas (&iquest;o eran peras?). Tal ves te ayude la frase tipo&nbsp;<em style="box-sizing: border-box;">Andrito tiene 5 manzanas, si su abuelita le di&oacute; por su cumplea&ntilde;os...</em>. Ah, &iquest;verdad que s&iacute; te acordabas? Bien, pues&nbsp;<em style="box-sizing: border-box;">Andrito</em>&nbsp;era el ni&ntilde;o comerciante de manzanas y en general siempre comenzaba con un n&uacute;mero fijo de manzanas. Es decir, la frase&nbsp;<em style="box-sizing: border-box;">Andrito tiene 5 manzanas...</em>, nos indica que&nbsp;<em style="box-sizing: border-box;">Andrito</em>&nbsp;ten&iacute;a al principio 5 manzanas. Por tanto, si en alg&uacute;n momento alguien te preguntara&nbsp;<em style="box-sizing: border-box;">&iquest;cu&aacute;ntas manzanas ten&iacute;a Andrito?</em>&nbsp;t&uacute; contestar&iacute;as &iquest;?... `5`, &iquest;cierto?&nbsp;<em style="box-sizing: border-box;">Andrito</em>&nbsp;ten&iacute;a&nbsp;<code style="box-sizing: border-box; font-family: ui-monospace, SFMono-Regular, ''SF Mono'', Menlo, Consolas, ''Liberation Mono'', monospace; font-size: 13.6px; background-color: var(--color-markdown-code-bg); border-radius: 6px; margin: 0px; padding: 0.2em 0.4em;">5 manzanas</code>. Bueno, podemos lograr algo parecido en c&oacute;digo.</p>', 'f', 2);

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
-- Records of users
-- ----------------------------
INSERT INTO "public"."users" VALUES (63, 'cmr.carlosramos@gmail.com', '2021-05-10 10:49:31', '$2y$10$IWEvOXzlg4YwgzewtdbWweVFH8XmLgyNdwn6taZT/Z/J9Z1F8TlAm', '1998-10-27', NULL, 'Jozh3eFJ8c2CNbAGOzrGDhGY4nZFrODGGFjPNF63XrJyROkz4Lx8ry1JfrHb', '2021-05-10 10:48:33', '2021-07-06 18:20:37', 't', NULL, NULL, NULL, NULL);
INSERT INTO "public"."users" VALUES (60, 'car.aeem98@gmail.com', '2021-04-20 15:34:52', '$2y$10$WyjOSA7i9ZOOWJ8VFOG2TOxqzZK9g8YJjdSUtE/WD2jC.TZjNHjiW', '2000-01-01', NULL, NULL, '2021-04-20 15:34:08', '2021-07-13 16:38:00', 't', 'Carlos', 'Ramos', 'Vega', NULL);
INSERT INTO "public"."users" VALUES (67, 'car.aeem98@outlook.com', '2021-05-25 14:08:50', '$2y$10$rrC7D6s3Z9gtWpKdN1ngxew5ksvEp6UAxgHDAAQAHI3Zf8v9cPyz.', '1998-10-27', NULL, NULL, '2021-05-25 14:03:49', '2021-07-22 12:36:56', 't', NULL, NULL, NULL, NULL);

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
SELECT setval('"public"."avances_id_seq"', 17, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."cursos_id_seq"
OWNED BY "public"."cursos"."id";
SELECT setval('"public"."cursos_id_seq"', 35, true);

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
SELECT setval('"public"."users_id_seq"', 68, true);

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
-- Primary Key structure for table backups
-- ----------------------------
ALTER TABLE "public"."backups" ADD CONSTRAINT "hash" PRIMARY KEY ("hash");

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

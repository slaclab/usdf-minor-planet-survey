/*
 
 
 Source Server Type    : PostgreSQL
 Source Server Version : 140006 (140006)
 Source Catalog        : mpc_sbn
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 140006 (140006)
 File Encoding         : 65001

 Date: 23/01/2023 22:55:07
*/


-- ----------------------------
-- Table structure for obs_alterations_corrections
-- ----------------------------
DROP TABLE IF EXISTS "public"."obs_alterations_corrections";
CREATE TABLE "public"."obs_alterations_corrections" (
  "id" int4 NOT NULL,
  "obsid_old" text COLLATE "pg_catalog"."default" NOT NULL,
  "obsid_new" text COLLATE "pg_catalog"."default" NOT NULL,
  "publication_ref" text[] COLLATE "pg_catalog"."default",
  "created_at" timestamp(6) DEFAULT timezone('utc'::text, now()),
  "updated_at" timestamp(6) DEFAULT timezone('utc'::text, now())
)
;
ALTER TABLE "public"."obs_alterations_corrections" OWNER TO "postgres";
COMMENT ON COLUMN "public"."obs_alterations_corrections"."obsid_old" IS 'The unique obsid of the OLD observation that was REPLACED';
COMMENT ON COLUMN "public"."obs_alterations_corrections"."obsid_new" IS 'The unique obsid of the NEW observation that REPLACES the obsid_old';
COMMENT ON COLUMN "public"."obs_alterations_corrections"."publication_ref" IS 'Array of reference(s) to pubn(s) announcing this unassociation';
COMMENT ON TABLE "public"."obs_alterations_corrections" IS 'It is intended that the fields in this table will record updates that have been made to the obs table that require subsequent publication to announce UNPUBLISH/UNASSOCIATION/SEND-TO-ITF
Some/all of these changes may be indicated in the obs table itself (e.g. via status flags), but this table is intended to help flag changes to observations that require publication in some form.';

-- ----------------------------
-- Table structure for obs_alterations_deletions
-- ----------------------------
DROP TABLE IF EXISTS "public"."obs_alterations_deletions";
CREATE TABLE "public"."obs_alterations_deletions" (
  "id" int4 NOT NULL,
  "obsid" text COLLATE "pg_catalog"."default" NOT NULL,
  "publication_ref" text[] COLLATE "pg_catalog"."default",
  "status" int4 NOT NULL,
  "created_at" timestamp(6) DEFAULT timezone('utc'::text, now()),
  "updated_at" timestamp(6) DEFAULT timezone('utc'::text, now())
)
;
ALTER TABLE "public"."obs_alterations_deletions" OWNER TO "postgres";
COMMENT ON COLUMN "public"."obs_alterations_deletions"."obsid" IS 'The unique obsid of the observation that was altered. Links to the observation record in the obs table.';
COMMENT ON COLUMN "public"."obs_alterations_deletions"."publication_ref" IS 'Array of reference(s) to pubn(s) announcing this deletion';
COMMENT ON COLUMN "public"."obs_alterations_deletions"."status" IS 'Integer to indicate state of publication. 0=Unpublished/Needs-to-be-published, 1=Published in DOU, 2=Published in Monthly';
COMMENT ON TABLE "public"."obs_alterations_deletions" IS 'It is intended that the fields in this table will record updates that have been made to the obs table that require subsequent publication to announce DELETION
Some/all of these changes may be indicated in the obs table itself (e.g. via status flags), but this table is intended to help flag changes to observations that require publication in some form.';

-- ----------------------------
-- Table structure for obs_alterations_redesignations
-- ----------------------------
DROP TABLE IF EXISTS "public"."obs_alterations_redesignations";
CREATE TABLE "public"."obs_alterations_redesignations" (
  "id" int4 NOT NULL,
  "obsid" text COLLATE "pg_catalog"."default" NOT NULL,
  "packed_provisional_designation_from" text COLLATE "pg_catalog"."default" NOT NULL,
  "unpacked_provisional_designation_from" text COLLATE "pg_catalog"."default" NOT NULL,
  "packed_provisional_designation_to" text COLLATE "pg_catalog"."default" NOT NULL,
  "unpacked_provisional_designation_to" text COLLATE "pg_catalog"."default" NOT NULL,
  "publication_ref" text[] COLLATE "pg_catalog"."default",
  "status" int4 NOT NULL,
  "created_at" timestamp(6) DEFAULT timezone('utc'::text, now()),
  "updated_at" timestamp(6) DEFAULT timezone('utc'::text, now()),
  "new_designation_created" bool NOT NULL DEFAULT false
)
;
ALTER TABLE "public"."obs_alterations_redesignations" OWNER TO "postgres";
COMMENT ON COLUMN "public"."obs_alterations_redesignations"."obsid" IS 'The unique obsid of the observation that was altered. Links to the observation record in the obs table.';
COMMENT ON COLUMN "public"."obs_alterations_redesignations"."packed_provisional_designation_from" IS 'Original packed provisional designation';
COMMENT ON COLUMN "public"."obs_alterations_redesignations"."unpacked_provisional_designation_from" IS 'Original unpacked provisional designation';
COMMENT ON COLUMN "public"."obs_alterations_redesignations"."packed_provisional_designation_to" IS 'New packed provisional designation';
COMMENT ON COLUMN "public"."obs_alterations_redesignations"."unpacked_provisional_designation_to" IS 'New unpacked provisional designation';
COMMENT ON COLUMN "public"."obs_alterations_redesignations"."publication_ref" IS 'Array of reference(s) to pubn(s) announcing this redesignation';
COMMENT ON COLUMN "public"."obs_alterations_redesignations"."status" IS 'Integer to indicate state of publication. 0=Unpublished/Needs-to-be-published, 1=Published in DOU, 2=Published in Monthly';
COMMENT ON TABLE "public"."obs_alterations_redesignations" IS 'It is intended that the fields in this table will record updates that have been made to the obs table that require subsequent publication to announce REDESIGNATIONS
These changes may be indicated in the obs table itself (e.g. via status flags), but this table is intended to help flag changes to observations that require publication in some form.';

-- ----------------------------
-- Table structure for obs_alterations_unassociations
-- ----------------------------
DROP TABLE IF EXISTS "public"."obs_alterations_unassociations";
CREATE TABLE "public"."obs_alterations_unassociations" (
  "id" int4 NOT NULL,
  "obsid" text COLLATE "pg_catalog"."default" NOT NULL,
  "unpacked_provisional_designation_from" text COLLATE "pg_catalog"."default" NOT NULL,
  "packed_provisional_designation_from" text COLLATE "pg_catalog"."default" NOT NULL,
  "trkmpc_to" text COLLATE "pg_catalog"."default" NOT NULL,
  "publication_ref" text[] COLLATE "pg_catalog"."default",
  "created_at" timestamp(6) DEFAULT timezone('utc'::text, now()),
  "updated_at" timestamp(6) DEFAULT timezone('utc'::text, now())
)
;
ALTER TABLE "public"."obs_alterations_unassociations" OWNER TO "postgres";
COMMENT ON COLUMN "public"."obs_alterations_unassociations"."obsid" IS 'The unique obsid of the observation that was altered. Links to the observation record in the obs table.';
COMMENT ON COLUMN "public"."obs_alterations_unassociations"."trkmpc_to" IS 'New trkMPC used to label the observations within the ITF';
COMMENT ON COLUMN "public"."obs_alterations_unassociations"."publication_ref" IS 'Array of reference(s) to pubn(s) announcing this unassociation';
COMMENT ON TABLE "public"."obs_alterations_unassociations" IS 'It is intended that the fields in this table will record updates that have been made to the obs table that require subsequent publication to announce UNPUBLISH/UNASSOCIATION/SEND-TO-ITF
Some/all of these changes may be indicated in the obs table itself (e.g. via status flags), but this table is intended to help flag changes to observations that require publication in some form.';

-- ----------------------------
-- Primary Key structure for table obs_alterations_corrections
-- ----------------------------
ALTER TABLE "public"."obs_alterations_corrections" ADD CONSTRAINT "obs_alterations_corrections_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table obs_alterations_deletions
-- ----------------------------
ALTER TABLE "public"."obs_alterations_deletions" ADD CONSTRAINT "obs_alterations_deletions_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table obs_alterations_redesignations
-- ----------------------------
ALTER TABLE "public"."obs_alterations_redesignations" ADD CONSTRAINT "obs_alterations_redesignations_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table obs_alterations_unassociations
-- ----------------------------
ALTER TABLE "public"."obs_alterations_unassociations" ADD CONSTRAINT "obs_alterations_unassociations_pkey" PRIMARY KEY ("id");

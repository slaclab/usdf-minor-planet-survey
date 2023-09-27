/*

 Target Server Type    : PostgreSQL
 Target Server Version : 140006 (140006)
 File Encoding         : 65001

 Date: 02/02/2023 08:51:10
*/


-- ----------------------------
-- Table structure for current_identifications
-- ----------------------------
DROP TABLE IF EXISTS "public"."current_identifications";
CREATE TABLE "public"."current_identifications" (
  "id" int4 NOT NULL,
  "packed_primary_provisional_designation" text COLLATE "pg_catalog"."default" NOT NULL,
  "packed_secondary_provisional_designation" text COLLATE "pg_catalog"."default" NOT NULL,
  "unpacked_primary_provisional_designation" text COLLATE "pg_catalog"."default" NOT NULL,
  "unpacked_secondary_provisional_designation" text COLLATE "pg_catalog"."default" NOT NULL,
  "published" int4,
  "identifier_ids" text[] COLLATE "pg_catalog"."default" NOT NULL,
  "object_type" int4,
  "numbered" bool,
  "created_at" timestamp(6) DEFAULT timezone('utc'::text, now()),
  "updated_at" timestamp(6) DEFAULT timezone('utc'::text, now())
)
;
ALTER TABLE "public"."current_identifications" OWNER TO "postgres";
COMMENT ON COLUMN "public"."current_identifications"."packed_primary_provisional_designation" IS 'The primary provisional designation in packed form (e.g. K08A00B)';
COMMENT ON COLUMN "public"."current_identifications"."packed_secondary_provisional_designation" IS 'The secondary provisional designation in packed form (e.g. K08A00B). May be the same-as (A=A) or different-to (A=B) the primary provisional designation';
COMMENT ON COLUMN "public"."current_identifications"."unpacked_primary_provisional_designation" IS 'The primary provisional designation in unpacked form (e.g. 2008 AB)';
COMMENT ON COLUMN "public"."current_identifications"."unpacked_secondary_provisional_designation" IS 'The secondary provisional designation in unpacked form (e.g. 2008 AB). May be the same-as (A=A) or different-to (A=B) the primary provisional designation';
COMMENT ON COLUMN "public"."current_identifications"."published" IS 'Has this been published yet? i.e. has it been published in the DOU, Mid month, or monthly products. Field values: 0=unpublished ; 1=published as MPEC; 2=published in DOU ; 3=published in mid-month ; 4=published in monthly';
COMMENT ON COLUMN "public"."current_identifications"."identifier_ids" IS 'This is a set of unique identifier_ids in an array e.g. {1e96e1ba-63be-11ea-8e74-801844df97e0,1eb8bdee-63be-11ea-8e74-801844df97e0} that can link to multiple records in the identification_metadata table. Multiple people can suggest A=B and this would be recorded in the identification_metadata table. This is important for the backfill when reading the flat files. So in the backfill scenario, if the record exists and it has a different name and/or reference then 1. add to the id_history, then add to metadata, then UPDATE columns publication_references, identifier_ids in current_identifications otherwise if no record exists create one';
COMMENT ON COLUMN "public"."current_identifications"."object_type" IS 'Integer to indicate the object type. To be linked (foreign key) to object_type lookup table';
COMMENT ON COLUMN "public"."current_identifications"."numbered" IS 'Has the object been numbered and hence does it appear in the numbered_objects table?';
COMMENT ON TABLE "public"."current_identifications" IS 'All single-designations, and all identifications between designations. Always uses primary provisional designation (even for numbered objects). Includes all comets and satellites.';

-- ----------------------------
-- Table structure for neocp_els
-- ----------------------------
DROP TABLE IF EXISTS "public"."neocp_els";
CREATE TABLE "public"."neocp_els" (
  "id" int4 NOT NULL,
  "desig" varchar(16) COLLATE "pg_catalog"."default" NOT NULL,
  "els" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "dsc_obs" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "digest2" numeric,
  "flag" char(1) COLLATE "pg_catalog"."default",
  "prep" char(1) COLLATE "pg_catalog"."default",
  "comet" char(1) COLLATE "pg_catalog"."default",
  "created_at" timestamp(6) DEFAULT timezone('UTC'::text, now()),
  "updated_at" timestamp(6) DEFAULT timezone('UTC'::text, now())
)
;
ALTER TABLE "public"."neocp_els" OWNER TO "postgres";

-- ----------------------------
-- Table structure for neocp_events
-- ----------------------------
DROP TABLE IF EXISTS "public"."neocp_events";
CREATE TABLE "public"."neocp_events" (
  "id" int4 NOT NULL,
  "desig" text COLLATE "pg_catalog"."default",
  "event_type" text COLLATE "pg_catalog"."default",
  "event_text" text COLLATE "pg_catalog"."default",
  "event_user" text COLLATE "pg_catalog"."default",
  "created_at" timestamp(6) DEFAULT timezone('UTC'::text, now()),
  "updated_at" timestamp(6) DEFAULT timezone('UTC'::text, now())
)
;
ALTER TABLE "public"."neocp_events" OWNER TO "postgres";

-- ----------------------------
-- Table structure for neocp_obs
-- ----------------------------
DROP TABLE IF EXISTS "public"."neocp_obs";
CREATE TABLE "public"."neocp_obs" (
  "id" int4 NOT NULL,
  "desig" varchar(16) COLLATE "pg_catalog"."default" NOT NULL,
  "trkid" text COLLATE "pg_catalog"."default" NOT NULL,
  "obs80" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "rmstime" numeric,
  "rmsra" numeric,
  "rmsdec" numeric,
  "rmscorr" numeric,
  "force_code" text COLLATE "pg_catalog"."default",
  "created_at" timestamp(6) DEFAULT now(),
  "updated_at" timestamp(6) DEFAULT now()
)
;
ALTER TABLE "public"."neocp_obs" OWNER TO "postgres";

-- ----------------------------
-- Table structure for neocp_obs_archive
-- ----------------------------
DROP TABLE IF EXISTS "public"."neocp_obs_archive";
CREATE TABLE "public"."neocp_obs_archive" (
  "id" int4 NOT NULL,
  "desig" varchar(16) COLLATE "pg_catalog"."default" NOT NULL,
  "trkid" text COLLATE "pg_catalog"."default" NOT NULL,
  "obs80" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "rmstime" numeric,
  "rmsra" numeric,
  "rmsdec" numeric,
  "rmscorr" numeric,
  "force_code" text COLLATE "pg_catalog"."default",
  "created_at" timestamp(6) DEFAULT now(),
  "updated_at" timestamp(6) DEFAULT now()
)
;
ALTER TABLE "public"."neocp_obs_archive" OWNER TO "postgres";

-- ----------------------------
-- Table structure for neocp_prev_des
-- ----------------------------
DROP TABLE IF EXISTS "public"."neocp_prev_des";
CREATE TABLE "public"."neocp_prev_des" (
  "id" int4 NOT NULL,
  "desig" text COLLATE "pg_catalog"."default" NOT NULL,
  "status" text COLLATE "pg_catalog"."default",
  "iau_desig" text COLLATE "pg_catalog"."default",
  "pkd_desig" text COLLATE "pg_catalog"."default",
  "ref" text COLLATE "pg_catalog"."default",
  "digest2" numeric,
  "created_at" timestamp(6) DEFAULT timezone('UTC'::text, now()),
  "updated_at" timestamp(6) DEFAULT timezone('UTC'::text, now())
)
;
ALTER TABLE "public"."neocp_prev_des" OWNER TO "postgres";

-- ----------------------------
-- Table structure for neocp_var
-- ----------------------------
DROP TABLE IF EXISTS "public"."neocp_var";
CREATE TABLE "public"."neocp_var" (
  "id" int4 NOT NULL,
  "desig" varchar(16) COLLATE "pg_catalog"."default" NOT NULL,
  "els" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "created_at" timestamp(6) DEFAULT timezone('UTC'::text, now()),
  "updated_at" timestamp(6) DEFAULT timezone('UTC'::text, now())
)
;
ALTER TABLE "public"."neocp_var" OWNER TO "postgres";

-- ----------------------------
-- Table structure for numbered_identifications
-- ----------------------------
DROP TABLE IF EXISTS "public"."numbered_identifications";
CREATE TABLE "public"."numbered_identifications" (
  "id" int4 NOT NULL,
  "packed_primary_provisional_designation" text COLLATE "pg_catalog"."default" NOT NULL,
  "unpacked_primary_provisional_designation" text COLLATE "pg_catalog"."default" NOT NULL,
  "permid" text COLLATE "pg_catalog"."default" NOT NULL,
  "iau_designation" text COLLATE "pg_catalog"."default",
  "iau_name" text COLLATE "pg_catalog"."default",
  "numbered_publication_references" text[] COLLATE "pg_catalog"."default",
  "named_publication_references" text[] COLLATE "pg_catalog"."default",
  "naming_credit" text COLLATE "pg_catalog"."default",
  "created_at" timestamp(6) DEFAULT timezone('utc'::text, now()),
  "updated_at" timestamp(6) DEFAULT timezone('utc'::text, now())
)
;
ALTER TABLE "public"."numbered_identifications" OWNER TO "postgres";
COMMENT ON COLUMN "public"."numbered_identifications"."packed_primary_provisional_designation" IS 'Keeping a map of packed (K03B35W) and unpacked (2003 BW35)';
COMMENT ON COLUMN "public"."numbered_identifications"."unpacked_primary_provisional_designation" IS 'Keeping a map of packed (K03B35W) and unpacked (2003 BW35)';
COMMENT ON COLUMN "public"."numbered_identifications"."permid" IS 'The ADES version of the permanent ID which ...  follows the associated IAU designation very closely, with the exception of removing parentheses around the permanent designation of minor planets ... For natural satellites, the IAU designation is preserved except that in permanent designations arabic numerals are used instead of roman numerals and for permanent designations of satellites of minor planets the name of the central body is neglected. Could be 541130 (Minor Planet), 1 (Minor Planet), 257P (Comet), 73P-AC (Comet Fragment), Jupiter 13 (Satellite - of Jupiter)';
COMMENT ON COLUMN "public"."numbered_identifications"."iau_name" IS 'For example, 1 = Ceres, 57567 = Crikey';
COMMENT ON COLUMN "public"."numbered_identifications"."numbered_publication_references" IS 'Array of references to any MPC publication(s) that concern the numbering of this object (e.g. Monthly-MPC, etc)';
COMMENT ON TABLE "public"."numbered_identifications" IS 'Numbers and Names for any objects that have been Numbered or Named. Linked to primary-provisional-designation in current_identifications';

-- ----------------------------
-- Table structure for obs_sbn
-- ----------------------------
DROP TABLE IF EXISTS "public"."obs_sbn";
CREATE TABLE "public"."obs_sbn" (
  "id" int4 NOT NULL GENERATED BY DEFAULT AS IDENTITY (
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1
),
  "trksub" text COLLATE "pg_catalog"."default",
  "trkid" text COLLATE "pg_catalog"."default",
  "obsid" text COLLATE "pg_catalog"."default",
  "submission_id" text COLLATE "pg_catalog"."default",
  "submission_block_id" text COLLATE "pg_catalog"."default",
  "obs80" text COLLATE "pg_catalog"."default",
  "status" char(1) COLLATE "pg_catalog"."default",
  "ref" text COLLATE "pg_catalog"."default",
  "healpix" int8,
  "permid" text COLLATE "pg_catalog"."default",
  "provid" text COLLATE "pg_catalog"."default",
  "artsat" text COLLATE "pg_catalog"."default",
  "mode" text COLLATE "pg_catalog"."default",
  "stn" text COLLATE "pg_catalog"."default",
  "trx" text COLLATE "pg_catalog"."default",
  "rcv" text COLLATE "pg_catalog"."default",
  "sys" text COLLATE "pg_catalog"."default",
  "ctr" int4,
  "pos1" numeric,
  "pos2" numeric,
  "pos3" numeric,
  "poscov11" numeric,
  "poscov12" numeric,
  "poscov13" numeric,
  "poscov22" numeric,
  "poscov23" numeric,
  "poscov33" numeric,
  "prog" text COLLATE "pg_catalog"."default",
  "obstime" timestamp(0),
  "ra" numeric,
  "dec" numeric,
  "rastar" numeric,
  "decstar" numeric,
  "obscenter" text COLLATE "pg_catalog"."default",
  "deltara" numeric,
  "deltadec" numeric,
  "dist" numeric,
  "pa" numeric,
  "rmsra" numeric,
  "rmsdec" numeric,
  "rmsdist" numeric,
  "rmspa" numeric,
  "rmscorr" numeric,
  "delay" numeric,
  "rmsdelay" numeric,
  "doppler" numeric,
  "rmsdoppler" numeric,
  "astcat" text COLLATE "pg_catalog"."default",
  "mag" numeric,
  "rmsmag" numeric,
  "band" text COLLATE "pg_catalog"."default",
  "photcat" text COLLATE "pg_catalog"."default",
  "photap" numeric,
  "nucmag" int2,
  "logsnr" numeric,
  "seeing" numeric,
  "exp" numeric,
  "rmsfit" numeric,
  "com" int2,
  "frq" numeric,
  "disc" char(1) COLLATE "pg_catalog"."default",
  "subfrm" text COLLATE "pg_catalog"."default",
  "subfmt" text COLLATE "pg_catalog"."default",
  "prectime" int4,
  "precra" numeric,
  "precdec" numeric,
  "unctime" numeric,
  "notes" text COLLATE "pg_catalog"."default",
  "remarks" text COLLATE "pg_catalog"."default",
  "deprecated" char(1) COLLATE "pg_catalog"."default",
  "localuse" text COLLATE "pg_catalog"."default",
  "nstars" int4,
  "prev_desig" text COLLATE "pg_catalog"."default",
  "prev_ref" text COLLATE "pg_catalog"."default",
  "rmstime" numeric,
  "created_at" timestamptz(6) DEFAULT now(),
  "updated_at" timestamptz(6) DEFAULT now(),
  "trkmpc" text COLLATE "pg_catalog"."default",
  "orbit_id" text COLLATE "pg_catalog"."default",
  "designation_asterisk" bool,
  "all_pub_ref" text[] COLLATE "pg_catalog"."default",
  "shapeocc" bool,
  "obssubid" text COLLATE "pg_catalog"."default",
  "replacesobsid" text COLLATE "pg_catalog"."default",
  "group_id" text COLLATE "pg_catalog"."default"
)
;
ALTER TABLE "public"."obs_sbn" OWNER TO "postgres";

-- ----------------------------
-- Table structure for primary_objects
-- ----------------------------
DROP TABLE IF EXISTS "public"."primary_objects";
CREATE TABLE "public"."primary_objects" (
  "id" int4 NOT NULL,
  "packed_primary_provisional_designation" text COLLATE "pg_catalog"."default" NOT NULL,
  "unpacked_primary_provisional_designation" text COLLATE "pg_catalog"."default" NOT NULL,
  "status" int4,
  "standard_minor_planet" bool NOT NULL DEFAULT false,
  "standard_epoch" bool NOT NULL DEFAULT false,
  "orbfit_epoch" bool NOT NULL DEFAULT false,
  "nongravs" bool NOT NULL DEFAULT false,
  "satellite" bool NOT NULL DEFAULT false,
  "comet" bool NOT NULL DEFAULT false,
  "barycentric" bool NOT NULL DEFAULT false,
  "no_orbit" bool NOT NULL DEFAULT true,
  "orbit_publication_references" text[] COLLATE "pg_catalog"."default",
  "flag_all_object_obs_consistent" bool NOT NULL DEFAULT false,
  "flag_orbit_calculated_from_consistent_obs" bool NOT NULL DEFAULT false,
  "flag_allowed_external" bool NOT NULL DEFAULT false,
  "created_at" timestamp(6) DEFAULT timezone('utc'::text, now()),
  "updated_at" timestamp(6) DEFAULT timezone('utc'::text, now()),
  "orbit_published" int4,
  "object_type" int4
)
;
ALTER TABLE "public"."primary_objects" OWNER TO "postgres";
COMMENT ON COLUMN "public"."primary_objects"."packed_primary_provisional_designation" IS 'The primary provisional designation in packed form (e.g. K08A00B). UNIQUE';
COMMENT ON COLUMN "public"."primary_objects"."unpacked_primary_provisional_designation" IS 'The primary provisional designation in UNpacked form (e.g. 2008 AB). UNIQUE';
COMMENT ON COLUMN "public"."primary_objects"."status" IS 'granular status of orbfit results';
COMMENT ON COLUMN "public"."primary_objects"."standard_minor_planet" IS 'Boolean to indicate whether the object-orbit is specified in the standard_minor_planet table';
COMMENT ON COLUMN "public"."primary_objects"."standard_epoch" IS 'If in standard_minor_planet, boolean indicates whether orbit at standard-epoch is populated';
COMMENT ON COLUMN "public"."primary_objects"."orbfit_epoch" IS 'If in standard_minor_planet, boolean indicates whether orbit at mid-observation-epoch is populated';
COMMENT ON COLUMN "public"."primary_objects"."nongravs" IS 'Boolean to indicate whether the object-orbit is specified in the nongravs table';
COMMENT ON COLUMN "public"."primary_objects"."satellite" IS 'Boolean to indicate whether the object-orbit is specified in the satellite table';
COMMENT ON COLUMN "public"."primary_objects"."comet" IS 'Boolean to indicate whether the object-orbit is specified in the comet table';
COMMENT ON COLUMN "public"."primary_objects"."barycentric" IS 'Boolean to indicate whether the object-orbit is specified in the barycentric table. N.B. Can be in standard-table AND barycentric table';
COMMENT ON COLUMN "public"."primary_objects"."no_orbit" IS 'If no orbit calculated: new insert; no-possible calc; ... ';
COMMENT ON COLUMN "public"."primary_objects"."orbit_publication_references" IS 'Array of references to MPC publication(s) that contained this particular orbit calculation (e.g. DOU MPEC, mid-month, Monthly-MPC, etc)';
COMMENT ON COLUMN "public"."primary_objects"."flag_all_object_obs_consistent" IS 'flag if/when all observations for an object have been checked to be consistent with obs-files';
COMMENT ON COLUMN "public"."primary_objects"."flag_orbit_calculated_from_consistent_obs" IS 'Was this orbit calculated using obs flagged as consistent ? (may be necessary while developing / transitioning)';
COMMENT ON COLUMN "public"."primary_objects"."flag_allowed_external" IS 'If flag_all_object_obs_consistent=True and flag_orbit_calculated_from_consistent_obs=True, then set flag_allowed_external = True';
COMMENT ON COLUMN "public"."primary_objects"."orbit_published" IS 'Has this ORBIT (not object-desig) been published yet? i.e. has it been published in the DOU, Mid month, or monthly products. Field values: 0=unpublished ; 1=published as MPEC; 2=published in DOU ; 3=published in mid-month ; 4=published in monthly';
COMMENT ON TABLE "public"."primary_objects" IS 'All Objects Live Here: Labelled by their primary provisional designation. Fields indicate the tables in which any orbit information might be found';

-- ----------------------------
-- Indexes structure for table current_identifications
-- ----------------------------
CREATE INDEX "current_identifications_packed_primary_provisional_designation_" ON "public"."current_identifications" USING btree (
  "packed_primary_provisional_designation" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE UNIQUE INDEX "current_identifications_packed_secondary_provisional_designatio" ON "public"."current_identifications" USING btree (
  "packed_secondary_provisional_designation" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table current_identifications
-- ----------------------------
ALTER TABLE "public"."current_identifications" ADD CONSTRAINT "current_identifications_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table neocp_els
-- ----------------------------
CREATE INDEX "neocp_els_created_at_key" ON "public"."neocp_els" USING btree (
  "created_at" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "neocp_els_digest2_key" ON "public"."neocp_els" USING btree (
  "digest2" "pg_catalog"."numeric_ops" ASC NULLS LAST
);

-- ----------------------------
-- Uniques structure for table neocp_els
-- ----------------------------
ALTER TABLE "public"."neocp_els" ADD CONSTRAINT "neocp_els_desig_key" UNIQUE ("desig");

-- ----------------------------
-- Primary Key structure for table neocp_els
-- ----------------------------
ALTER TABLE "public"."neocp_els" ADD CONSTRAINT "neocp_els_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table neocp_events
-- ----------------------------
CREATE INDEX "neocp_events_desig_key" ON "public"."neocp_events" USING btree (
  "desig" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "neocp_events_event_text_key" ON "public"."neocp_events" USING btree (
  "event_text" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "neocp_events_event_type_key" ON "public"."neocp_events" USING btree (
  "event_type" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "neocp_events_event_user_key" ON "public"."neocp_events" USING btree (
  "event_user" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table neocp_events
-- ----------------------------
ALTER TABLE "public"."neocp_events" ADD CONSTRAINT "neocp_events_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table neocp_obs
-- ----------------------------
CREATE INDEX "neocp_obs_created_at_key" ON "public"."neocp_obs" USING btree (
  "created_at" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "neocp_obs_desig_key" ON "public"."neocp_obs" USING btree (
  "desig" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "neocp_obs_substring_idx" ON "public"."neocp_obs" USING btree (
  "substring"(obs80::text, 16, 17) COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "neocp_obs_trkid_key" ON "public"."neocp_obs" USING btree (
  "trkid" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "neocp_obs_updated_at_key" ON "public"."neocp_obs" USING btree (
  "updated_at" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table neocp_obs
-- ----------------------------
ALTER TABLE "public"."neocp_obs" ADD CONSTRAINT "neocp_obs_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table neocp_obs_archive
-- ----------------------------
CREATE INDEX "neocp_obs_archive_created_at_key" ON "public"."neocp_obs_archive" USING btree (
  "created_at" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "neocp_obs_archive_desig_key" ON "public"."neocp_obs_archive" USING btree (
  "desig" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "neocp_obs_archive_trkid_key" ON "public"."neocp_obs_archive" USING btree (
  "trkid" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "neocp_obs_archive_updated_at_key" ON "public"."neocp_obs_archive" USING btree (
  "updated_at" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table neocp_obs_archive
-- ----------------------------
ALTER TABLE "public"."neocp_obs_archive" ADD CONSTRAINT "neocp_obs_archive_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table neocp_prev_des
-- ----------------------------
CREATE INDEX "neocp_prev_des_created_at_key" ON "public"."neocp_prev_des" USING btree (
  "created_at" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "neocp_prev_des_desig_key" ON "public"."neocp_prev_des" USING btree (
  "desig" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "neocp_prev_des_iau_desig_key" ON "public"."neocp_prev_des" USING btree (
  "iau_desig" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "neocp_prev_des_pkd_desig_key" ON "public"."neocp_prev_des" USING btree (
  "pkd_desig" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "neocp_prev_des_ref_key" ON "public"."neocp_prev_des" USING btree (
  "ref" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "neocp_prev_des_status_key" ON "public"."neocp_prev_des" USING btree (
  "status" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table neocp_prev_des
-- ----------------------------
ALTER TABLE "public"."neocp_prev_des" ADD CONSTRAINT "neocp_prev_des_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table neocp_var
-- ----------------------------
CREATE INDEX "neocp_var_created_at_key" ON "public"."neocp_var" USING btree (
  "created_at" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "neocp_var_desig_key" ON "public"."neocp_var" USING btree (
  "desig" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table neocp_var
-- ----------------------------
ALTER TABLE "public"."neocp_var" ADD CONSTRAINT "neocp_var_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table numbered_identifications
-- ----------------------------
CREATE UNIQUE INDEX "numbered_identifications_iau_name_idx" ON "public"."numbered_identifications" USING btree (
  "iau_name" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE UNIQUE INDEX "numbered_identifications_packed_primary_provisional_designation" ON "public"."numbered_identifications" USING btree (
  "packed_primary_provisional_designation" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE UNIQUE INDEX "numbered_identifications_permid_idx" ON "public"."numbered_identifications" USING btree (
  "permid" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE UNIQUE INDEX "numbered_identifications_unpacked_primary_provisional_designati" ON "public"."numbered_identifications" USING btree (
  "unpacked_primary_provisional_designation" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table numbered_identifications
-- ----------------------------
ALTER TABLE "public"."numbered_identifications" ADD CONSTRAINT "numbered_identifications_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table obs_sbn
-- ----------------------------
CREATE INDEX "obs_sbn_obstime_idx" ON "public"."obs_sbn" USING btree (
  "obstime" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "obs_sbn_stn_idx" ON "public"."obs_sbn" USING btree (
  "stn" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "obs_sbn_submission_block_id_key" ON "public"."obs_sbn" USING btree (
  "submission_block_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "obs_sbn_trkid_idx" ON "public"."obs_sbn" USING btree (
  "trkid" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "obs_sbn_trkmpc_idx" ON "public"."obs_sbn" USING btree (
  "trkmpc" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "obs_sbn_trksub_idx" ON "public"."obs_sbn" USING btree (
  "trksub" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "obs_sbn_updated_at_idx" ON "public"."obs_sbn" USING btree (
  "updated_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table obs_sbn
-- ----------------------------
ALTER TABLE "public"."obs_sbn" ADD CONSTRAINT "obs_sbn_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table primary_objects
-- ----------------------------
CREATE UNIQUE INDEX "primary_objects_packed_primary_provisional_designation_idx" ON "public"."primary_objects" USING btree (
  "packed_primary_provisional_designation" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Uniques structure for table primary_objects
-- ----------------------------
ALTER TABLE "public"."primary_objects" ADD CONSTRAINT "primary_objects_packed_primary_provisional_designation_key" UNIQUE ("packed_primary_provisional_designation");
ALTER TABLE "public"."primary_objects" ADD CONSTRAINT "primary_objects_unpacked_primary_provisional_designation_key" UNIQUE ("unpacked_primary_provisional_designation");

-- ----------------------------
-- Checks structure for table primary_objects
-- ----------------------------
ALTER TABLE "public"."primary_objects" ADD CONSTRAINT "otc" CHECK (standard_minor_planet = true AND nongravs = false AND satellite = false AND comet = false AND no_orbit = false OR standard_minor_planet = false AND nongravs = true AND satellite = false AND comet = false AND no_orbit = false OR standard_minor_planet = false AND nongravs = false AND satellite = true AND comet = false AND no_orbit = false OR standard_minor_planet = false AND nongravs = false AND satellite = false AND comet = true AND no_orbit = false OR standard_minor_planet = false AND nongravs = false AND satellite = false AND comet = false AND no_orbit = true);

-- ----------------------------
-- Primary Key structure for table primary_objects
-- ----------------------------
ALTER TABLE "public"."primary_objects" ADD CONSTRAINT "primary_objects_pkey" PRIMARY KEY ("id");

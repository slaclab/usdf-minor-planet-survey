/*
 Navicat Premium Dump SQL


 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 160004 (160004)
 File Encoding         : 65001

 Date: 01/11/2024 07:20:16
*/


-- ----------------------------
-- Table structure for obs_ingest
-- ----------------------------
DROP TABLE IF EXISTS "public"."obs_ingest";
CREATE TABLE "public"."obs_ingest" (
  "id" int8 NOT NULL ,
  "trksub" text COLLATE "pg_catalog"."default",
  "trkid" text COLLATE "pg_catalog"."default",
  "obsid" text COLLATE "pg_catalog"."default" NOT NULL,
  "submission_id" text COLLATE "pg_catalog"."default",
  "submission_block_id" text COLLATE "pg_catalog"."default",
  "obs80" text COLLATE "pg_catalog"."default",
  "status" char(1) COLLATE "pg_catalog"."default" DEFAULT 'X'::bpchar,
  "ref" text COLLATE "pg_catalog"."default",
  "orig_mag_band" char(1) COLLATE "pg_catalog"."default",
  "orig_obs_note" char(1) COLLATE "pg_catalog"."default",
  "obs80_bit" char(42) COLLATE "pg_catalog"."default",
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
  "obstime" timestamp(6),
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
  "rmstime" numeric,
  "created_at" timestamptz(6) NOT NULL DEFAULT now(),
  "updated_at" timestamptz(6) DEFAULT now(),
  "desig_disc" char(1) COLLATE "pg_catalog"."default",
  "pending_publication" text COLLATE "pg_catalog"."default",
  "duplicate" int8,
  "tracklet" text COLLATE "pg_catalog"."default",
  "desig_err" bool DEFAULT false,
  "shapeocc" bool,
  "healpix" int8,
  "prog" text COLLATE "pg_catalog"."default",
  "suppd" text COLLATE "pg_catalog"."default",
  "group_id" text COLLATE "pg_catalog"."default",
  "trkmpc" text COLLATE "pg_catalog"."default",
  "vel1" numeric,
  "vel2" numeric,
  "vel3" numeric,
  "prectime_ades" int2,
  "obssubid" text COLLATE "pg_catalog"."default"
)
WITH (fillfactor=100)
;
ALTER TABLE "public"."obs_ingest" OWNER TO "postgres";
COMMENT ON COLUMN "public"."obs_ingest"."vel1" IS 'A22 column';
COMMENT ON COLUMN "public"."obs_ingest"."vel2" IS 'A22 column';
COMMENT ON COLUMN "public"."obs_ingest"."vel3" IS 'A22 column';
COMMENT ON COLUMN "public"."obs_ingest"."prectime_ades" IS 'Submitted onetime precision';
COMMENT ON COLUMN "public"."obs_ingest"."obssubid" IS 'A22 column';

-- ----------------------------
-- Indexes structure for table obs_ingest
-- ----------------------------
CREATE INDEX "obs_ingest_group_id_idx" ON "public"."obs_ingest" USING btree (
  "group_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "obs_ingest_healpix_idx" ON "public"."obs_ingest" USING btree (
  "healpix" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "obs_ingest_obs80_bit_idx" ON "public"."obs_ingest" USING btree (
  "obs80_bit" COLLATE "pg_catalog"."default" "pg_catalog"."bpchar_ops" ASC NULLS LAST
);
CREATE UNIQUE INDEX "obs_ingest_obsid_idx" ON "public"."obs_ingest" USING btree (
  "obsid" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "obs_ingest_obstime_idx" ON "public"."obs_ingest" USING btree (
  "obstime" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "obs_ingest_permid_idx" ON "public"."obs_ingest" USING btree (
  "permid" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "obs_ingest_provid_idx" ON "public"."obs_ingest" USING btree (
  "provid" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "obs_ingest_submission_block_id_idx" ON "public"."obs_ingest" USING btree (
  "submission_block_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "obs_ingest_submission_id_idx" ON "public"."obs_ingest" USING btree (
  "submission_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "obs_ingest_trkid_idx" ON "public"."obs_ingest" USING btree (
  "trkid" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "obs_ingest_trksub_idx" ON "public"."obs_ingest" USING btree (
  "trksub" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "obs_ingest_updated_at_idx" ON "public"."obs_ingest" USING btree (
  "updated_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
);



-- ----------------------------
-- Primary Key structure for table obs_ingest
-- ----------------------------
ALTER TABLE "public"."obs_ingest" ADD CONSTRAINT "obs_pkey1" PRIMARY KEY ("id");

/*
 


 Source Server Type    : PostgreSQL
 Source Server Version : 140007 (140007)
 Source Catalog        : mpc_sbn
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 140007 (140007)
 File Encoding         : 65001

 Date: 12/04/2023 11:38:27
*/


-- ----------------------------
-- Table structure for mpc_orbits
-- ----------------------------
DROP TABLE IF EXISTS "public"."mpc_orbits";
CREATE TABLE "public"."mpc_orbits" (
  "id" int4 NOT NULL,
  "packed_primary_provisional_designation" text COLLATE "pg_catalog"."default" NOT NULL,
  "unpacked_primary_provisional_designation" text COLLATE "pg_catalog"."default" NOT NULL,
  "mpc_orb_jsonb" jsonb,
  "created_at" timestamp(6),
  "updated_at" timestamp(6)
)
;
ALTER TABLE "public"."mpc_orbits" OWNER TO "postgres";

-- ----------------------------
-- Indexes structure for table mpc_orbits
-- ----------------------------
CREATE UNIQUE INDEX "packed_primary_provisional_idx" ON "public"."mpc_orbits" USING btree (
  "packed_primary_provisional_designation" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE UNIQUE INDEX "unpacked_primary_provisional_idx" ON "public"."mpc_orbits" USING btree (
  "unpacked_primary_provisional_designation" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table mpc_orbits
-- ----------------------------
ALTER TABLE "public"."mpc_orbits" ADD CONSTRAINT "mpc_orbits_pkey" PRIMARY KEY ("id");

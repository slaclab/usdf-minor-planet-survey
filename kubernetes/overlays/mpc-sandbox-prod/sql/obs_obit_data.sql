/*


 Target Server Type    : PostgreSQL
 Target Server Version : 160004 (160004)
 File Encoding         : 65001


 Date: 13/11/2024 14:41:53
*/




-- ----------------------------
-- Table structure for obs_orbit_data
-- ----------------------------
DROP TABLE IF EXISTS "public"."obs_orbit_data";
CREATE TABLE "public"."obs_orbit_data" (
  "obs_obsid" text COLLATE "pg_catalog"."default" NOT NULL,
  "orbit_data_id" int4 NOT NULL
)
;
ALTER TABLE "public"."obs_orbit_data" OWNER TO "postgres";


-- ----------------------------
-- Primary Key structure for table obs_orbit_data
-- ----------------------------
ALTER TABLE "public"."obs_orbit_data" ADD CONSTRAINT "obs_orbit_data_pkey" PRIMARY KEY ("obs_obsid", "orbit_data_id");

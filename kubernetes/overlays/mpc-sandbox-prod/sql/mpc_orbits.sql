/*
 
 Source Server Type    : PostgreSQL
 Source Server Version : 170004 (170004)
 Source Host           : mpc-sbn-db:5432
 Source Catalog        : mpc_sbn
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 170004 (170004)
 File Encoding         : 65001

 Date: 31/03/2025 18:08:58
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
  "updated_at" timestamp(6),
  "orbit_type_int" int4,
  "u_param" int4,
  "nopp" int4,
  "arc_length_total" float8,
  "arc_length_sel" float8,
  "nobs_total" int4,
  "nobs_total_sel" int4,
  "a" float8,
  "q" float8,
  "e" float8,
  "i" float8,
  "node" float8,
  "argperi" float8,
  "peri_time" float8,
  "yarkovsky" float8,
  "srp" float8,
  "a1" float8,
  "a2" float8,
  "a3" float8,
  "dt" float8,
  "mean_anomaly" float8,
  "period" float8,
  "mean_motion" float8,
  "a_unc" float8,
  "q_unc" float8,
  "e_unc" float8,
  "i_unc" float8,
  "node_unc" float8,
  "argperi_unc" float8,
  "peri_time_unc" float8,
  "yarkovsky_unc" float8,
  "srp_unc" float8,
  "a1_unc" float8,
  "a2_unc" float8,
  "a3_unc" float8,
  "dt_unc" float8,
  "mean_anomaly_unc" float8,
  "period_unc" float8,
  "mean_motion_unc" float8,
  "epoch_mjd" float8,
  "h" float8,
  "g" float8,
  "not_normalized_rms" float8,
  "normalized_rms" float8,
  "earth_moid" float8,
  "fitting_datetime" timestamp(6)
)
;
ALTER TABLE "public"."mpc_orbits" OWNER TO "postgres";
COMMENT ON COLUMN "public"."mpc_orbits"."id" IS 'PostgreSQL automatically generated identifier';
COMMENT ON COLUMN "public"."mpc_orbits"."packed_primary_provisional_designation" IS 'Packed form of the primary provisional designation (e.g. K17P08M).';
COMMENT ON COLUMN "public"."mpc_orbits"."unpacked_primary_provisional_designation" IS 'Unpacked form of the primary provisional designation (e.g. 2017PM8).';
COMMENT ON COLUMN "public"."mpc_orbits"."mpc_orb_jsonb" IS 'MPC JSON format used to describe MPC orbits. The public python package is available as part of the MPC public Gitub https://github.com/Smithsonian/mpc-public/ with additional information. ';
COMMENT ON COLUMN "public"."mpc_orbits"."created_at" IS 'Date and time of initial row insert';
COMMENT ON COLUMN "public"."mpc_orbits"."updated_at" IS 'Date and time of latest row update';
COMMENT ON COLUMN "public"."mpc_orbits"."orbit_type_int" IS 'Orbit classification based on the object orbital element. For more information please see https://minorplanetcenter.net/mpcops/documentation/orbit-types/';
COMMENT ON COLUMN "public"."mpc_orbits"."u_param" IS 'MPC defined U parameter. For more information please see https://www.minorplanetcenter.net/iau/info/UValue.html. ';
COMMENT ON COLUMN "public"."mpc_orbits"."nopp" IS 'MPC computed number of oppositions. ';
COMMENT ON COLUMN "public"."mpc_orbits"."arc_length_total" IS 'Arc length of all the observations associated to the object, computed as the difference between the time of the last observations and the time of the first observation. ';
COMMENT ON COLUMN "public"."mpc_orbits"."arc_length_sel" IS 'Arc length of all the observations selected by the fit, computed as the difference between the time of the last selected observations and the time of the first selected observation. ';
COMMENT ON COLUMN "public"."mpc_orbits"."nobs_total" IS 'Total number of observations associated to the object.';
COMMENT ON COLUMN "public"."mpc_orbits"."nobs_total_sel" IS 'Total number of observations used by the fit. ';
COMMENT ON COLUMN "public"."mpc_orbits"."a" IS 'Semi-major axis [au]';
COMMENT ON COLUMN "public"."mpc_orbits"."q" IS 'Perihelion distance [au]';
COMMENT ON COLUMN "public"."mpc_orbits"."e" IS 'Eccentricity ';
COMMENT ON COLUMN "public"."mpc_orbits"."i" IS 'Inclination [degrees]';
COMMENT ON COLUMN "public"."mpc_orbits"."node" IS 'Longitude of the ascending node [degrees]';
COMMENT ON COLUMN "public"."mpc_orbits"."argperi" IS 'Argument of the pericenter [degrees]';
COMMENT ON COLUMN "public"."mpc_orbits"."peri_time" IS 'Time of the passage at the pericenter [days]';
COMMENT ON COLUMN "public"."mpc_orbits"."yarkovsky" IS 'A2 component of the Yarkovsky acceleration [10^(-10) au/d^2]';
COMMENT ON COLUMN "public"."mpc_orbits"."srp" IS 'Solar radiation pressure [m^2/ton]';
COMMENT ON COLUMN "public"."mpc_orbits"."a1" IS 'A1 component of the non-gravitational acceleration for comets [10^(-10) au/d^2]';
COMMENT ON COLUMN "public"."mpc_orbits"."a2" IS 'A2 component of the non-gravitational acceleration for comets [10^(-10) au/d^2]';
COMMENT ON COLUMN "public"."mpc_orbits"."a3" IS 'A3 component of the non-gravitational acceleration for comets [10^(-10) au/d^2]';
COMMENT ON COLUMN "public"."mpc_orbits"."dt" IS 'DeltaT component of the non-gravitational acceleration [days]';
COMMENT ON COLUMN "public"."mpc_orbits"."mean_anomaly" IS 'Mean anomaly [degrees]';
COMMENT ON COLUMN "public"."mpc_orbits"."period" IS 'Orbital period [days]';
COMMENT ON COLUMN "public"."mpc_orbits"."mean_motion" IS 'Orbital mean motion [degrees per day]';
COMMENT ON COLUMN "public"."mpc_orbits"."a_unc" IS 'Post-fit 1-sigma uncertainty in the semi-major axis [au] ';
COMMENT ON COLUMN "public"."mpc_orbits"."q_unc" IS 'Post-fit 1-sigma uncertainty in the perihelion distance [au] ';
COMMENT ON COLUMN "public"."mpc_orbits"."e_unc" IS 'Post-fit 1-sigma uncertainty in the eccentricity ';
COMMENT ON COLUMN "public"."mpc_orbits"."i_unc" IS 'Post-fit 1-sigma uncertainty in the inclination [degrees] ';
COMMENT ON COLUMN "public"."mpc_orbits"."node_unc" IS 'Post-fit 1-sigma uncertainty in the longitude of the node [degrees] ';
COMMENT ON COLUMN "public"."mpc_orbits"."argperi_unc" IS 'Post-fit 1-sigma uncertainty in the argument of the pericenter [degrees] ';
COMMENT ON COLUMN "public"."mpc_orbits"."peri_time_unc" IS 'Post-fit 1-sigma uncertainty in the time of the pericenter passage [days] ';
COMMENT ON COLUMN "public"."mpc_orbits"."yarkovsky_unc" IS 'Post-fit 1-sigma uncertainty in the A2 component of the Yarkovsky acceleration [10^(-10) au/d^2]';
COMMENT ON COLUMN "public"."mpc_orbits"."srp_unc" IS 'Post-fit 1-sigma uncertainty in the solar radiation pressure [m^2/ton]';
COMMENT ON COLUMN "public"."mpc_orbits"."a1_unc" IS 'Post-fit 1-sigma uncertainty in the A1 component of the non-gravitational acceleration [10^(-10) au/d^2]';
COMMENT ON COLUMN "public"."mpc_orbits"."a2_unc" IS 'Post-fit 1-sigma uncertainty in the A2 component of the non-gravitational acceleration [10^(-10) au/d^2]';
COMMENT ON COLUMN "public"."mpc_orbits"."a3_unc" IS 'Post-fit 1-sigma uncertainty in the A3 component of the non-gravitational acceleration [10^(-10) au/d^2]';
COMMENT ON COLUMN "public"."mpc_orbits"."dt_unc" IS 'Post-fit 1-sigma uncertainty in the DeltaT component of the non-gravitational acceleration [days]';
COMMENT ON COLUMN "public"."mpc_orbits"."mean_anomaly_unc" IS 'Post-fit 1-sigma uncertainty in the mean anomaly [degrees] ';
COMMENT ON COLUMN "public"."mpc_orbits"."period_unc" IS 'Post-fit 1-sigma uncertainty in the orbital period [days] ';
COMMENT ON COLUMN "public"."mpc_orbits"."mean_motion_unc" IS 'Post-fit 1-sigma uncertainty in the mean motion [degrees] ';
COMMENT ON COLUMN "public"."mpc_orbits"."epoch_mjd" IS 'Orbit epoch [TT, MJD]';
COMMENT ON COLUMN "public"."mpc_orbits"."h" IS 'Absolute magnitude as computed by OrbFit';
COMMENT ON COLUMN "public"."mpc_orbits"."g" IS 'Slope parameter';
COMMENT ON COLUMN "public"."mpc_orbits"."not_normalized_rms" IS 'Not normalized post-fit RMS [arcseconds]';
COMMENT ON COLUMN "public"."mpc_orbits"."normalized_rms" IS 'Normalized post-fit RMS';
COMMENT ON COLUMN "public"."mpc_orbits"."earth_moid" IS 'Minimum Orbit Intersection Distance [au] with respect to the orbit of the Earth.';
COMMENT ON COLUMN "public"."mpc_orbits"."fitting_datetime" IS 'Date and time recorded when the orbital fit was performed';
COMMENT ON TABLE "public"."mpc_orbits" IS 'Table containing orbits and related information for any minor planet that has been designated and for which it is possible to fit an orbit with the available observations.';

-- ----------------------------
-- Indexes structure for table mpc_orbits
-- ----------------------------
CREATE INDEX "mpc_orbits_updated_at_idx" ON "public"."mpc_orbits" USING btree (
  "updated_at" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
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

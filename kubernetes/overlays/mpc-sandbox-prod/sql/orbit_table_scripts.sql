/*

 Source Server Type    : PostgreSQL
 Source Server Version : 160004 (160004)
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 160004 (160004)
 File Encoding         : 65001

 Date: 01/11/2024 07:23:53
*/


-- ----------------------------
-- Table structure for orbit_data
-- ----------------------------
DROP TABLE IF EXISTS "public"."orbit_data";
CREATE TABLE "public"."orbit_data" (
  "id" int8 NOT NULL ,
  "id_primary_object" int4 NOT NULL,
  "id_orbit_type" int2 NOT NULL,
  "id_parent_planet" int4,
  "orbfit_name" text COLLATE "pg_catalog"."default",
  "epoch" text COLLATE "pg_catalog"."default" NOT NULL,
  "epoch_terrestrial" float8,
  "epoch_barycenter" float8,
  "n_params" int4,
  "a" float8,
  "a_unc" float8,
  "q" float8,
  "q_unc" float8,
  "e" float8,
  "e_unc" float8,
  "i" float8,
  "i_unc" float8,
  "longnode" float8,
  "longnode_unc" float8,
  "arg_peri" float8,
  "arg_peri_unc" float8,
  "tp" float8,
  "tp_unc" float8,
  "mean_anomaly" float8,
  "mean_anomaly_unc" float8,
  "period" float8,
  "period_unc" float8,
  "n" float8,
  "n_unc" float8,
  "x" float8,
  "x_unc" float8,
  "y" float8,
  "y_unc" float8,
  "z" float8,
  "z_unc" float8,
  "vx" float8,
  "vx_unc" float8,
  "vy" float8,
  "vy_unc" float8,
  "vz" float8,
  "vz_unc" float8,
  "inv_a_ingoing" float8,
  "inv_a_outgoing" float8,
  "covariance_com" jsonb,
  "com_eigenvalues" float8[],
  "com_weak_dir" float8[],
  "yarkovsky" bool,
  "srp" bool,
  "marsden" bool,
  "yc" bool,
  "yabushita" bool,
  "a1" float8,
  "a1_unc" float8,
  "a2" float8,
  "a2_unc" float8,
  "a3" float8,
  "a3_unc" float8,
  "dt" float8,
  "dt_unc" float8,
  "srp_value" float8,
  "srp_unc" float8,
  "earth_moid" float8,
  "mars_moid" float8,
  "jupiter_moid" float8,
  "venus_moid" float8,
  "is_archive" bool DEFAULT false,
  "created_at" timestamp(6) DEFAULT now(),
  "updated_at" timestamp(6) DEFAULT now()
)
;
ALTER TABLE "public"."orbit_data" OWNER TO "postgres";
COMMENT ON COLUMN "public"."orbit_data"."id" IS 'PostgreSQL automatically generated identifier';
COMMENT ON COLUMN "public"."orbit_data"."orbfit_name" IS 'Orbfit name (unpacked permid or provid, without any spaces)';
COMMENT ON COLUMN "public"."orbit_data"."epoch_terrestrial" IS 'Orbit epoch [MJD, TT]';
COMMENT ON COLUMN "public"."orbit_data"."epoch_barycenter" IS 'Orbit epoch [MJD, TDB]';
COMMENT ON COLUMN "public"."orbit_data"."n_params" IS 'Number of parameters used for fit: E.g. 6-orbital params plus N-non_grav params (max=10)';
COMMENT ON COLUMN "public"."orbit_data"."a" IS 'Semi-major axis [au]';
COMMENT ON COLUMN "public"."orbit_data"."a_unc" IS 'Post-fit 1-sigma uncertainty in the semi-major axis [au] ';
COMMENT ON COLUMN "public"."orbit_data"."q" IS 'Perihelion distance [au]';
COMMENT ON COLUMN "public"."orbit_data"."q_unc" IS 'Post-fit 1-sigma uncertainty in the perihelion distance [au] ';
COMMENT ON COLUMN "public"."orbit_data"."e" IS 'Eccentricity';
COMMENT ON COLUMN "public"."orbit_data"."e_unc" IS 'Post-fit 1-sigma uncertainty in the eccentricity ';
COMMENT ON COLUMN "public"."orbit_data"."i" IS 'Inclination [degrees]';
COMMENT ON COLUMN "public"."orbit_data"."i_unc" IS 'Post-fit 1-sigma uncertainty in the inclination [degrees] ';
COMMENT ON COLUMN "public"."orbit_data"."longnode" IS 'Longitude of the ascending node [degrees]';
COMMENT ON COLUMN "public"."orbit_data"."longnode_unc" IS 'Post-fit 1-sigma uncertainty in the longitude of the node [degrees] ';
COMMENT ON COLUMN "public"."orbit_data"."arg_peri" IS 'Argument of the pericenter [degrees]';
COMMENT ON COLUMN "public"."orbit_data"."arg_peri_unc" IS 'Post-fit 1-sigma uncertainty in the argument of the pericenter [degrees] ';
COMMENT ON COLUMN "public"."orbit_data"."tp" IS 'Time of the passage at the pericenter [days]';
COMMENT ON COLUMN "public"."orbit_data"."tp_unc" IS 'Post-fit 1-sigma uncertainty in the time of the pericenter passage [days] ';
COMMENT ON COLUMN "public"."orbit_data"."mean_anomaly" IS 'Mean anomaly [degrees]';
COMMENT ON COLUMN "public"."orbit_data"."mean_anomaly_unc" IS 'Post-fit 1-sigma uncertainty in the mean anomaly [degrees] ';
COMMENT ON COLUMN "public"."orbit_data"."period" IS 'Orbital period [days]';
COMMENT ON COLUMN "public"."orbit_data"."period_unc" IS 'Post-fit 1-sigma uncertainty in the orbital period [days] ';
COMMENT ON COLUMN "public"."orbit_data"."n" IS 'Orbital Mean motion [deg/day]';
COMMENT ON COLUMN "public"."orbit_data"."n_unc" IS 'Post-fit 1-sigma uncertainty in the mean motion [deg/day]';
COMMENT ON COLUMN "public"."orbit_data"."x" IS 'x component of the object position [au]';
COMMENT ON COLUMN "public"."orbit_data"."x_unc" IS 'Post-fit 1-sigma uncertainty in the x component of the object position [au]';
COMMENT ON COLUMN "public"."orbit_data"."y" IS 'y component of the object position [au]';
COMMENT ON COLUMN "public"."orbit_data"."y_unc" IS 'Post-fit 1-sigma uncertainty in the y component of the object position [au]';
COMMENT ON COLUMN "public"."orbit_data"."z" IS 'z component of the object position [au]';
COMMENT ON COLUMN "public"."orbit_data"."z_unc" IS 'Post-fit 1-sigma uncertainty in the z component of the object position [au]';
COMMENT ON COLUMN "public"."orbit_data"."vx" IS 'x component of the object velocity [au/day]';
COMMENT ON COLUMN "public"."orbit_data"."vx_unc" IS 'Post-fit 1-sigma uncertainty in the x component of the object velocity [au/d]';
COMMENT ON COLUMN "public"."orbit_data"."vy" IS 'y component of the object velocity [au/day]';
COMMENT ON COLUMN "public"."orbit_data"."vy_unc" IS 'Post-fit 1-sigma uncertainty in the y component of the object velocity [au/d]';
COMMENT ON COLUMN "public"."orbit_data"."vz" IS 'z component of the object velocity [au/day]';
COMMENT ON COLUMN "public"."orbit_data"."vz_unc" IS 'Post-fit 1-sigma uncertainty in the z component of the object velocity [au/d]';
COMMENT ON COLUMN "public"."orbit_data"."inv_a_ingoing" IS 'Inverse of the semi-major axis (calculated at 50au on approach to the Sun) [1/au]';
COMMENT ON COLUMN "public"."orbit_data"."inv_a_outgoing" IS 'Inverse of the semi-major axis (calculated at 50au on retreat from the Sun) [1/au]';
COMMENT ON COLUMN "public"."orbit_data"."covariance_com" IS 'Full covariance matrix for the Cometarian coordinates [is of size n_params*n_params]';
COMMENT ON COLUMN "public"."orbit_data"."com_eigenvalues" IS 'Eigenvalues for the orbital elements (and any non-gravitational parameters) [max length = 10]';
COMMENT ON COLUMN "public"."orbit_data"."com_weak_dir" IS 'Weak direction vector for the orbital elements (and any non-gravitational parameters) [max length = 10]';
COMMENT ON COLUMN "public"."orbit_data"."yarkovsky" IS 'Yarkovsky parameter(s) included in the fit (https://www.sciencedirect.com/science/article/pii/S0019103513000456)';
COMMENT ON COLUMN "public"."orbit_data"."srp" IS 'Solar radiation pressure parameter included in the fit';
COMMENT ON COLUMN "public"."orbit_data"."marsden" IS 'Marsden model for comets';
COMMENT ON COLUMN "public"."orbit_data"."yc" IS 'Yeomans and Chodas model for comets';
COMMENT ON COLUMN "public"."orbit_data"."yabushita" IS 'Yabushita model for comets (https://www.sciencedirect.com/science/article/pii/S0019103513000456)';
COMMENT ON COLUMN "public"."orbit_data"."a1" IS 'A1 component of the non-gravitational acceleration [10^(-15) au/d^2]';
COMMENT ON COLUMN "public"."orbit_data"."a1_unc" IS 'Post-fit 1-sigma uncertainty in the A1 component of the non-gravitational acceleration [10^(-15) au/d^2]';
COMMENT ON COLUMN "public"."orbit_data"."a2" IS 'A2 component of the non-gravitational acceleration [10^(-15) au/d^2]';
COMMENT ON COLUMN "public"."orbit_data"."a2_unc" IS 'Post-fit 1-sigma uncertainty in the A2 component of the non-gravitational acceleration [10^(-15) au/d^2]';
COMMENT ON COLUMN "public"."orbit_data"."a3" IS 'A3 component of the non-gravitational acceleration [10^(-15) au/d^2]';
COMMENT ON COLUMN "public"."orbit_data"."a3_unc" IS 'Post-fit 1-sigma uncertainty in the A3 component of the non-gravitational acceleration [10^(-15) au/d^2]';
COMMENT ON COLUMN "public"."orbit_data"."dt" IS 'DeltaT component of the non-gravitational acceleration for comets [days]';
COMMENT ON COLUMN "public"."orbit_data"."dt_unc" IS 'Post-fit 1-sigma uncertainty in the DeltaT component of the non-gravitational acceleration [days]';
COMMENT ON COLUMN "public"."orbit_data"."srp_value" IS 'Solar radiation pressure [m^2/ton]';
COMMENT ON COLUMN "public"."orbit_data"."srp_unc" IS 'Post-fit 1-sigma uncertainty in the solar radiation pressure [m^2/ton]';
COMMENT ON COLUMN "public"."orbit_data"."earth_moid" IS 'Minimum Orbit Intersection Distance [au] with respect to the orbit of the Earth';
COMMENT ON COLUMN "public"."orbit_data"."mars_moid" IS 'Minimum Orbit Intersection Distance [au] with respect to the orbit of Mars';
COMMENT ON COLUMN "public"."orbit_data"."jupiter_moid" IS 'Minimum Orbit Intersection Distance [au] with respect to the orbit of Jupiter';
COMMENT ON COLUMN "public"."orbit_data"."venus_moid" IS 'Minimum Orbit Intersection Distance [au] with respect to the orbit of Venus';
COMMENT ON COLUMN "public"."orbit_data"."created_at" IS 'Date and time of initial row insert';
COMMENT ON COLUMN "public"."orbit_data"."updated_at" IS 'Date and time of latest row update';
COMMENT ON TABLE "public"."orbit_data" IS 'Table containing orbits for any minor planet that has been designated and for which it is possible to fit an orbit with the available observations';

-- ----------------------------
-- Table structure for orbit_fit_statistics
-- ----------------------------
DROP TABLE IF EXISTS "public"."orbit_fit_statistics";
CREATE TABLE "public"."orbit_fit_statistics" (
  "id" int4 NOT NULL ,
  "id_orbit_data" int4 NOT NULL,
  "u_param" int4,
  "score1" int4,
  "score2" int4,
  "orbit_quality" text COLLATE "pg_catalog"."default",
  "rms" float8,
  "normalized_rms" float8,
  "nopp" int4,
  "arc_length_total" float8,
  "arc_length_select" float8,
  "nobs_total" int4,
  "nobs_total_select" int4,
  "nobs_optical" int4,
  "nobs_optical_select" int4,
  "nobs_radar" int4,
  "nobs_radar_select" int4,
  "first_obs" date,
  "last_obs" date,
  "first_obs_text" text COLLATE "pg_catalog"."default" ,
  "last_obs_text" text COLLATE "pg_catalog"."default" ,
  "created_at" timestamp(6) ,
  "updated_at" timestamp(6) ,
  "snr" numeric[],
  "snr_below_1" bool,
  "snr_below_3" bool
)
;
ALTER TABLE "public"."orbit_fit_statistics" OWNER TO "postgres";
COMMENT ON COLUMN "public"."orbit_fit_statistics"."id" IS 'PostgreSQL automatically generated identifier';
COMMENT ON COLUMN "public"."orbit_fit_statistics"."id_orbit_data" IS 'Orbit solution ID';
COMMENT ON COLUMN "public"."orbit_fit_statistics"."u_param" IS 'MPC defined U parameter. For more information please see https://www.minorplanetcenter.net/iau/info/UValue.html. ';
COMMENT ON COLUMN "public"."orbit_fit_statistics"."score1" IS 'First score for numbering';
COMMENT ON COLUMN "public"."orbit_fit_statistics"."score2" IS 'Second score for numbering';
COMMENT ON COLUMN "public"."orbit_fit_statistics"."orbit_quality" IS 'Orbit quality: good, poor, unreliable, no orbit (def = good)';
COMMENT ON COLUMN "public"."orbit_fit_statistics"."rms" IS 'Not normalized post-fit RMS';
COMMENT ON COLUMN "public"."orbit_fit_statistics"."normalized_rms" IS 'Normalized post-fit RMS [arcseconds]';
COMMENT ON COLUMN "public"."orbit_fit_statistics"."nopp" IS 'MPC computed number of oppositions. ';
COMMENT ON COLUMN "public"."orbit_fit_statistics"."arc_length_total" IS 'Arc length of all the observations associated to the object, computed as the difference between the time of the last observations and the time of the first observation. ';
COMMENT ON COLUMN "public"."orbit_fit_statistics"."arc_length_select" IS 'Arc length of all the observations selected by the fit, computed as the difference between the time of the last selected observations and the time of the first selected observation. ';
COMMENT ON COLUMN "public"."orbit_fit_statistics"."nobs_total" IS 'Total number of observations associated to the object.';
COMMENT ON COLUMN "public"."orbit_fit_statistics"."nobs_total_select" IS 'Total number of observations selected by the fit. ';
COMMENT ON COLUMN "public"."orbit_fit_statistics"."nobs_optical" IS 'Total number of optical observations associated to the object.';
COMMENT ON COLUMN "public"."orbit_fit_statistics"."nobs_optical_select" IS 'Total number of optical observations selected by the fit.';
COMMENT ON COLUMN "public"."orbit_fit_statistics"."nobs_radar" IS 'Total number of radar observations associated to the object.';
COMMENT ON COLUMN "public"."orbit_fit_statistics"."nobs_radar_select" IS 'Total number of radar observations used byt the fit.';
COMMENT ON COLUMN "public"."orbit_fit_statistics"."first_obs" IS 'Date of the first observation';
COMMENT ON COLUMN "public"."orbit_fit_statistics"."last_obs" IS 'Date of the last observation';
COMMENT ON COLUMN "public"."orbit_fit_statistics"."first_obs_text" IS 'Generated string representation of the first_obs';
COMMENT ON COLUMN "public"."orbit_fit_statistics"."last_obs_text" IS 'Generated string representation of the last_obs';
COMMENT ON COLUMN "public"."orbit_fit_statistics"."created_at" IS 'Date and time of initial row insert';
COMMENT ON COLUMN "public"."orbit_fit_statistics"."updated_at" IS 'Date and time of latest row update';
COMMENT ON TABLE "public"."orbit_fit_statistics" IS 'Table containing information about the orbit-fit statistics';

-- ----------------------------
-- Table structure for orbit_magnitudes
-- ----------------------------
DROP TABLE IF EXISTS "public"."orbit_magnitudes";
CREATE TABLE "public"."orbit_magnitudes" (
  "id" int8 NOT NULL ,
  "id_primary_object" int4 NOT NULL,
  "id_orbit_data" int4 NOT NULL,
  "h" float8,
  "g" float8,
  "g1" float8,
  "g2" float8,
  "g12" float8,
  "h_sigma" float8,
  "photometric_model" text COLLATE "pg_catalog"."default",
  "created_at" timestamp(6) ,
  "updated_at" timestamp(6) 
)
;
ALTER TABLE "public"."orbit_magnitudes" OWNER TO "postgres";
COMMENT ON COLUMN "public"."orbit_magnitudes"."h" IS 'Absolute magnitude (magnitude at 1 au from the Sun and the observer)';
COMMENT ON COLUMN "public"."orbit_magnitudes"."g" IS 'Slope parameter in the HG model';
COMMENT ON COLUMN "public"."orbit_magnitudes"."g1" IS 'Slope parameter 1 in the HG1G2 model';
COMMENT ON COLUMN "public"."orbit_magnitudes"."g2" IS 'Slope parameter 2 in the HG1G2 model';
COMMENT ON COLUMN "public"."orbit_magnitudes"."g12" IS 'Slope parameter 12 in the HG12 model';
COMMENT ON COLUMN "public"."orbit_magnitudes"."h_sigma" IS 'Post-fit 1-sigma uncertainty in H';
COMMENT ON COLUMN "public"."orbit_magnitudes"."photometric_model" IS 'Photometric model used for the fit ';
COMMENT ON COLUMN "public"."orbit_magnitudes"."created_at" IS 'Date and time of initial row insert';
COMMENT ON COLUMN "public"."orbit_magnitudes"."updated_at" IS 'Date and time of latest row update';
COMMENT ON TABLE "public"."orbit_magnitudes" IS 'Table containing information about the magnitudes of the primary objects';

-- ----------------------------
-- Table structure for orbit_parent_planets
-- ----------------------------
DROP TABLE IF EXISTS "public"."orbit_parent_planets";
CREATE TABLE "public"."orbit_parent_planets" (
  "id" int4 NOT NULL ,
  "name" text COLLATE "pg_catalog"."default",
  "created_at" timestamp(6) ,
  "updated_at" timestamp(6) 
)
;
ALTER TABLE "public"."orbit_parent_planets" OWNER TO "postgres";
COMMENT ON COLUMN "public"."orbit_parent_planets"."id" IS 'PostgreSQL automatically generated identifier';
COMMENT ON COLUMN "public"."orbit_parent_planets"."name" IS 'Name of the planet';
COMMENT ON COLUMN "public"."orbit_parent_planets"."created_at" IS 'Date and time of initial row insert';
COMMENT ON COLUMN "public"."orbit_parent_planets"."updated_at" IS 'Date and time of latest row update';
COMMENT ON TABLE "public"."orbit_parent_planets" IS 'Table containing information about planets';

-- ----------------------------
-- Table structure for orbit_software_data
-- ----------------------------
DROP TABLE IF EXISTS "public"."orbit_software_data";
CREATE TABLE "public"."orbit_software_data" (
  "id" int4 NOT NULL ,
  "id_orbit_data" int4 NOT NULL,
  "fitting_datetime" timestamp(6) NOT NULL,
  "fitting_software_name" text COLLATE "pg_catalog"."default",
  "software_version" text COLLATE "pg_catalog"."default",
  "created_at" timestamp(6) ,
  "updated_at" timestamp(6) 
)
;
ALTER TABLE "public"."orbit_software_data" OWNER TO "postgres";
COMMENT ON COLUMN "public"."orbit_software_data"."id_orbit_data" IS 'Orbit solution ID';
COMMENT ON COLUMN "public"."orbit_software_data"."fitting_datetime" IS 'Datetime recorded when the orbital fit was performed';
COMMENT ON COLUMN "public"."orbit_software_data"."fitting_software_name" IS 'Name of software used to perform orbit-fit';
COMMENT ON COLUMN "public"."orbit_software_data"."software_version" IS 'Version of software used to perform orbit-fit';
COMMENT ON COLUMN "public"."orbit_software_data"."created_at" IS 'Date and time of initial row insert';
COMMENT ON COLUMN "public"."orbit_software_data"."updated_at" IS 'Date and time of latest row update';
COMMENT ON TABLE "public"."orbit_software_data" IS 'Table containing information about the software used to perform the orbit-fit';

-- ----------------------------
-- Table structure for orbit_system_data
-- ----------------------------
DROP TABLE IF EXISTS "public"."orbit_system_data";
CREATE TABLE "public"."orbit_system_data" (
  "id" int8 NOT NULL ,
  "id_orbit_data" int4 NOT NULL,
  "eph_model" text COLLATE "pg_catalog"."default",
  "ref_plane" text COLLATE "pg_catalog"."default",
  "ref_frame" text COLLATE "pg_catalog"."default",
  "obliquity" numeric,
  "force_model" text COLLATE "pg_catalog"."default",
  "created_at" timestamp(6) ,
  "updated_at" timestamp(6) 
)
;
ALTER TABLE "public"."orbit_system_data" OWNER TO "postgres";
COMMENT ON COLUMN "public"."orbit_system_data"."id" IS 'PostgreSQL automatically generated identifier';
COMMENT ON COLUMN "public"."orbit_system_data"."eph_model" IS 'The ephemeris model used in the orbit-fit, E.g. JPL DE431 [need documentation]';
COMMENT ON COLUMN "public"."orbit_system_data"."ref_plane" IS 'The reference plane [Ecliptic, Equatorial]';
COMMENT ON COLUMN "public"."orbit_system_data"."ref_frame" IS 'The frame of reference for the best-fit orbital elements [ICRF]';
COMMENT ON COLUMN "public"."orbit_system_data"."obliquity" IS 'Obliquity angle value [arcsec] (def=84381.448 from heliocentric IAU76/J2000 ecliptic)';
COMMENT ON COLUMN "public"."orbit_system_data"."force_model" IS 'The planetary / asteroidal perturbers that were used in the orbit-fit. [need to decide exactly how to populate: url-link?]';
COMMENT ON COLUMN "public"."orbit_system_data"."created_at" IS 'Date and time of initial row insert';
COMMENT ON COLUMN "public"."orbit_system_data"."updated_at" IS 'Date and time of latest row update';
COMMENT ON TABLE "public"."orbit_system_data" IS 'Table containing information about the system used to perform the orbit-fit';

-- ----------------------------
-- Table structure for orbit_type
-- ----------------------------
DROP TABLE IF EXISTS "public"."orbit_type";
CREATE TABLE "public"."orbit_type" (
  "id" int4 NOT NULL ,
  "name" text COLLATE "pg_catalog"."default",
  "assigned_number" int4,
  "definition" text COLLATE "pg_catalog"."default",
  "created_at" timestamp(6) ,
  "updated_at" timestamp(6) 
)
;
ALTER TABLE "public"."orbit_type" OWNER TO "postgres";
COMMENT ON COLUMN "public"."orbit_type"."id" IS 'PostgreSQL automatically generated identifier';
COMMENT ON COLUMN "public"."orbit_type"."name" IS 'Name of the orbit type';
COMMENT ON COLUMN "public"."orbit_type"."assigned_number" IS 'Assigned number of the orbit type';
COMMENT ON COLUMN "public"."orbit_type"."definition" IS 'Definition of the orbit type';
COMMENT ON COLUMN "public"."orbit_type"."created_at" IS 'Date and time of initial row insert';
COMMENT ON COLUMN "public"."orbit_type"."updated_at" IS 'Date and time of latest row update';
COMMENT ON TABLE "public"."orbit_type" IS 'Table containing information about the orbit types';

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
  "flag_all_object_obs_consistent" bool NOT NULL ,
  "flag_orbit_calculated_from_consistent_obs" bool NOT NULL ,
  "flag_allowed_external" bool NOT NULL DEFAULT false,
  "created_at" timestamp(6),
  "updated_at" timestamp(6) ,
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
-- Indexes structure for table orbit_data
-- ----------------------------
CREATE INDEX "orbit_data_id_current_idx" ON "public"."orbit_data" USING btree (
  "id_primary_object" "pg_catalog"."int4_ops" ASC NULLS LAST
) WHERE is_archive = false;
CREATE INDEX "orbit_data_id_parent_planet_idx" ON "public"."orbit_data" USING btree (
  "id_parent_planet" "pg_catalog"."int4_ops" ASC NULLS LAST
) WHERE id_parent_planet IS NOT NULL;



-- ----------------------------
-- Checks structure for table orbit_data
-- ----------------------------
ALTER TABLE "public"."orbit_data" ADD CONSTRAINT "orbit_data_epoch_check" CHECK (epoch = 'standard'::text OR epoch = 'mid'::text);
ALTER TABLE "public"."orbit_data" ADD CONSTRAINT "orbit_data_com_eigenvalues_check" CHECK (cardinality(com_eigenvalues) <= 10);
ALTER TABLE "public"."orbit_data" ADD CONSTRAINT "orbit_data_n_params_check" CHECK (n_params <= 10);

-- ----------------------------
-- Primary Key structure for table orbit_data
-- ----------------------------
ALTER TABLE "public"."orbit_data" ADD CONSTRAINT "orbit_data_pkey" PRIMARY KEY ("id");



-- ----------------------------
-- Primary Key structure for table orbit_fit_statistics
-- ----------------------------
ALTER TABLE "public"."orbit_fit_statistics" ADD CONSTRAINT "orbit_fit_statistics_pkey" PRIMARY KEY ("id");


-- ----------------------------
-- Primary Key structure for table orbit_magnitudes
-- ----------------------------
ALTER TABLE "public"."orbit_magnitudes" ADD CONSTRAINT "orbit_magnitudes_pkey" PRIMARY KEY ("id");



-- ----------------------------
-- Primary Key structure for table orbit_parent_planets
-- ----------------------------
ALTER TABLE "public"."orbit_parent_planets" ADD CONSTRAINT "orbit_parent_planets_pkey" PRIMARY KEY ("id");



-- ----------------------------
-- Primary Key structure for table orbit_software_data
-- ----------------------------
ALTER TABLE "public"."orbit_software_data" ADD CONSTRAINT "orbit_software_data_pkey" PRIMARY KEY ("id");



-- ----------------------------
-- Checks structure for table orbit_system_data
-- ----------------------------
ALTER TABLE "public"."orbit_system_data" ADD CONSTRAINT "orbit_system_data_ref_plane_check" CHECK (ref_plane = 'ecliptic'::text OR ref_plane = 'equatorial'::text);

-- ----------------------------
-- Primary Key structure for table orbit_system_data
-- ----------------------------
ALTER TABLE "public"."orbit_system_data" ADD CONSTRAINT "orbit_system_data_pkey" PRIMARY KEY ("id");


-- ----------------------------
-- Primary Key structure for table orbit_type
-- ----------------------------
ALTER TABLE "public"."orbit_type" ADD CONSTRAINT "orbit_type_pkey" PRIMARY KEY ("id");

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
-- Primary Key structure for table primary_objects
-- ----------------------------
ALTER TABLE "public"."primary_objects" ADD CONSTRAINT "primary_objects_pkey" PRIMARY KEY ("id");



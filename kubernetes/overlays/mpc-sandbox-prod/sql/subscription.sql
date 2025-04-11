-- obtain password from vault at https://rubinobs.atlassian.net/browse/DM-47452

CREATE SUBSCRIPTION usdf_mpc_obs_ingest_sub CONNECTION 'host=mpc-pipeline-dev-sandbox-cluster.cuee8irghiva.us-east-2.rds.amazonaws.com port=5432 dbname=mpc_obs_sandbox user=mpc_lsst_user password=<update>' PUBLICA
TION mpc_lsst_sandbox_obs_ingest_pub;

CREATE SUBSCRIPTION usdf_mpc_obs_sbn_sub CONNECTION 'host=mpc-pipeline-dev-sandbox-cluster.cuee8irghiva.us-east-2.rds.amazonaws.com port=5432 dbname=mpc_obs_sandbox user=mpc_lsst_user password=<update>' PUBLICATION mpc_lsst_sandbox_obs_sbn_pub;

CREATE SUBSCRIPTION usdf_mpc_orbits_sub CONNECTION 'host=mpc-pipeline-dev-sandbox-cluster.cuee8irghiva.us-east-2.rds.amazonaws.com port=5432 dbname=mpc_obs_sandbox user=mpc_lsst_user password=<update>' PUBLICATION mpc_lsst_sandbox_mpc_orbits_pub;
-- obtain password from vault at https://rubinobs.atlassian.net/browse/DM-47452

CREATE SUBSCRIPTION usdf_obs_sandbox CONNECTION 'host=mpc-pipeline-dev-sandbox-cluster.cuee8irghiva.us-east-2.rds.amazonaws.com port=5432 dbname=mpc_obs_sandbox user=mpc_lsst_user password=<update>' PUBLICATION mpc_lsst_sandbox_obs_ingest_pub WITH (connect=true);

CREATE SUBSCRIPTION usdf_orbit_tables_sandbox CONNECTION 'host=mpc-pipeline-dev-sandbox-cluster.cuee8irghiva.us-east-2.rds.amazonaws.com port=5432 dbname=mpc_obs_sandbox user=mpc_lsst_user password=<update>' PUBLICATION mpc_lsst_sandbox_orbit_tables_pub WITH (connect=true);
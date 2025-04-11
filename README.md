# rubin-usdf-minor-planet-survey

This is the repository for the deployment of minor planet database replica for the USDF.  Replication is performed with logical replication using a publisher and subscriber model.   This repo stores the kubernetes manifests and SQL scripts.  Deployments are done currently through make files.

To access the kuberentes environment login [here](https://k8s.slac.stanford.edu/usdf-minor-planet-survey) to obtain the kubernetes commmands to login and set your context.

Requirements are [here](https://jira.lsstcorp.org/browse/DM-40702).  Documentation on the setup from SBN is [here](https://sbnwiki.astro.umd.edu/wiki/SBN_MPC_Wiki)  This [doc](https://www.enterprisedb.com/blog/current-state-major-postgresql-upgrades-cloudnativepg-kubernetes) was referenced for setup.

The current state replication status dashboard is [here](https://sbnmpc.astro.umd.edu/MPC_database/postgres_dash.shtml).  This is used to validate replication status.

# Schema Updates

To update schemas obtain the changes from SBN run the script file manally.  CNPG runs script as a one time bootstrap so that is why it must be manual.  Example below.

`cat mpc_orbits_add_new_columns_and_comments.sql | k exec -it mpcorb-1 -n mpcorb-replica -- psql -d mpc_sbn -a -q`

Also add the or edit the .sql file and update kustomize so if the database needs to be rebuilt in the future the changes get captured

# Logical Replication Subscription

To create a subscription access postgres with psql.  `\c mpc_sbn` to connect to the `mpc_sbn` schema.  

To see active subscriptions enter.  Access password from USDF Vault and update.

```
CREATE SUBSCRIPTION sbn146_rubin_usdf_other_tables_sub CONNECTION'host=musforti.astro.umd.edu port=5432 dbname=mpc_sbn user=sbnmastrubin password=<update> PUBLICATION sbn146_other_tables_pub WITH(copy_data=true, enabled=true);

CREATE SUBSCRIPTION sbn146_rubin_usdf_obs_table_sub CONNECTION'host=musforti.astro.umd.edu port=5432 dbname=mpc_sbn user=sbnmastrubin password=<update> PUBLICATION sbn146_obs_table_pub WITH(copy_data=true, enabled=true);
```

To validate active subscription run `select * from pg_subscription;`


# MPC Sandbox

Setup is detailed in https://rubinobs.atlassian.net/browse/DM-46972

To setup schema:

'''
cat obs_ingest.sql | kubectl exec -it mpc-sandbox-prod-2 -n mpc-sandbox-prod -- psql -d mpc_obs_sandbox
cat orbit_table_scripts.sql | kubectl exec -it mpc-sandbox-prod-2 -n mpc-sandbox-prod -- psql -d mpc_obs_sandbox
cat obs_obit_data.sql | kubectl exec -it mpc-sandbox-prod-2 -n mpc-sandbox-prod -- psql -d mpc_obs_sandbox
cat obs_sbn.sql | kubectl exec -it mpc-sandbox-prod-2 -n mpc-sandbox-prod -- psql -d mpc_obs_sandbox
cat mpc_orbits.sql | kubectl exec -it mpc-sandbox-prod-2 -n mpc-sandbox-prod -- psql -d mpc_obs_sandbox

'''

Below is subscription configuration with password removed.  Username and password is stored in Vault at vault kv get secret/rubin/usdf-minor-planet-survey/postgres-mpc-sandbox

Apply subscriptions at sql/subscription.sql

To validate data is in subscriptions.
```
select count(*) from obs_ingest;
select count(*) from obs_sbn;
select count(*) from mpc_orbits;
```

To refresh subscriptions after tables updates run.
```
ALTER SUBSCRIPTION usdf_mpc_obs_ingest_sub REFRESH PUBLICATION;
ALTER SUBSCRIPTION usdf_mpc_obs_sbn_sub REFRESH PUBLICATION;
ALTER SUBSCRIPTION usdf_mpc_orbits_sub REFRESH PUBLICATION;
```

To drop subscriptions run the below commands.
```
DROP SUBSCRIPTION usdf_mpc_obs_ingest_sub;
DROP SUBSCRIPTION usdf_mpc_obs_sbn_sub;
DROP SUBSCRIPTION usdf_mpc_orbits_sub;
```

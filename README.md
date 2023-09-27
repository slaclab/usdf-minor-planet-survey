# rubin-usdf-minor-planet-survey

This is the repository for the deployment of minor planet database replica for the USDF.  Replication is performed with logical replication using a publisher and subscriber model.   This repo stores the kubernetes manifests and SQL scripts.  Deployments are done currently through make files.

To access the kuberentes environment login [here](https://k8s.slac.stanford.edu/usdf-minor-planet-survey) to obtain the kubernetes commmands to login and set your context.

Requirements are [here](https://jira.lsstcorp.org/browse/DM-40702).  Documentation on the setup from SBN is [here](https://sbnwiki.astro.umd.edu/wiki/SBN_MPC_Wiki)  This [doc](https://www.enterprisedb.com/blog/current-state-major-postgresql-upgrades-cloudnativepg-kubernetes) was referenced for setup.

# Schema Updates

To update schemas obtain the changes from SBN.  If a new script is shared replace the appropriate file and run `make run-apply`  The script is run on bootstrap so for changes after database is up apply the scripts via psql.

# Logical Replication Subscription

To create a subscription access postgres with psql.  `\c mpc_sbn` to connect to the `mpc_sbn` schema.  

To see active subscriptions enter.  Access password from USDF Vault and update.

```
CREATE SUBSCRIPTION sbn146_rubin_usdf_other_tables_sub CONNECTION'host=musforti.astro.umd.edu port=5432 dbname=mpc_sbn user=sbnmastrubin password=<update> PUBLICATION sbn146_other_tables_pub WITH(copy_data=true, enabled=true);

CREATE SUBSCRIPTION sbn146_rubin_usdf_obs_table_sub CONNECTION'host=musforti.astro.umd.edu port=5432 dbname=mpc_sbn user=sbnmastrubin password=<update> PUBLICATION sbn146_obs_table_pub WITH(copy_data=true, enabled=true);
```
-- Dev
CREATE SUBSCRIPTION usdf_mpc_dev CONNECTION 'host=134.79.23.225 port=5432 dbname=mpc_sbn user=epo password=<update>' PUBLICATION epo WITH (connect=true, slot_name='epo_dev_lot1');

-- Int
CREATE SUBSCRIPTION usdf_mpc_int CONNECTION 'host=134.79.23.225 port=5432 dbname=mpc_sbn user=epo password=<update>' PUBLICATION epo WITH (connect=true, slot_name='epo_int_slot1');

-- Prod
CREATE SUBSCRIPTION usdf_mpc_prod CONNECTION 'host=134.79.23.225 port=5432 dbname=mpc_sbn user=epo password=<update>' PUBLICATION epo WITH (connect=true, slot_name='epo_prod_slot1');
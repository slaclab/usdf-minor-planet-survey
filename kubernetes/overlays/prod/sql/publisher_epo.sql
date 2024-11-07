CREATE PUBLICATION epo FOR TABLE current_identifications;

ALTER PUBLICATION epo ADD TABLE mpc_orbits;
ALTER PUBLICATION epo ADD TABLE neocp_els;
ALTER PUBLICATION epo ADD TABLE neocp_events;
ALTER PUBLICATION epo ADD TABLE neocp_obs;
ALTER PUBLICATION epo ADD TABLE neocp_obs_archive;
ALTER PUBLICATION epo ADD TABLE neocp_prev_des;
ALTER PUBLICATION epo ADD TABLE neocp_var;
ALTER PUBLICATION epo ADD TABLE numbered_identifications;
ALTER PUBLICATION epo ADD TABLE obs_alterations_corrections;
ALTER PUBLICATION epo ADD TABLE obs_alterations_deletions;
ALTER PUBLICATION epo ADD TABLE obs_alterations_redesignations;
ALTER PUBLICATION epo ADD TABLE obs_alterations_unassociations;
ALTER PUBLICATION epo ADD TABLE obs_sbn;
ALTER PUBLICATION epo ADD TABLE primary_objects;

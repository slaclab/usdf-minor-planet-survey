CREATE USER epo with PASSWORD <replace with password from vault>;

GRANT SELECT ON public.current_identifications TO epo;
GRANT SELECT ON public.mpc_orbits  TO epo;
GRANT SELECT ON public.neocp_els TO epo;
GRANT SELECT ON public.neocp_events TO epo;
GRANT SELECT ON public.neocp_obs TO epo;
GRANT SELECT ON public.neocp_obs_archive TO epo;
GRANT SELECT ON public.neocp_prev_des TO epo;
GRANT SELECT ON public.neocp_var TO epo;
GRANT SELECT ON public.numbered_identifications TO epo;
GRANT SELECT ON public.obs_alterations_corrections TO epo;
GRANT SELECT ON public.obs_alterations_deletions TO epo;
GRANT SELECT ON public.obs_alterations_redesignations TO epo;
GRANT SELECT ON public.obs_alterations_unassociations TO epo;
GRANT SELECT ON public.obs_sbn TO epo;
GRANT SELECT ON public.primary_objects TO epo;

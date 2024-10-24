SECRET_PATH ?= secret/rubin/usdf-minor-planet-survey/postgres-mpc-sandbox

get-secrets-from-vault:
	mkdir -p etc/.secrets/
	set -e; for i in username password; do vault kv get --field=$$i $(SECRET_PATH) > etc/.secrets/$$i ; done

clean-secrets:
	rm -rf etc/.secrets/

run-kustomize:
	kubectl kustomize .

dump: get-secrets-from-vault run-kustomize clean-secrets

run-apply:
	kubectl apply -k .

apply: get-secrets-from-vault run-apply clean-secrets
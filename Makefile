.PHONY: plan sb-init sb-link sb-apply setup

SUPABASE_PROJECT_ID := $(shell cat .supabase_project_id)

setup:
	terraform -chdir=tf init

plan:
	terraform -chdir=tf plan

apply:
	terraform -chdir=tf apply --auto-approve && \
	terraform -chdir=tf output -raw supabase_project_id > .supabase_project_id

sb-init: 
	npx supabase init && \
	npx supabase login

sb-link:
	npx supabase link --project-ref $(SUPABASE_PROJECT_ID)

sb-apply:
	npx supabase config push --project-ref $(SUPABASE_PROJECT_ID)

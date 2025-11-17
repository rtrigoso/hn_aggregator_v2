# HN Aggregator
Simple, and feature-rich, aggregator.

## Requirements
- node version < 22.3.0 (uses `nvm`)
- supabase cli
- terraform cli

## Setup and Development
To initialize this project:
1. run `make setup` to initialize the terraform dir
2. run `make apply` to create infrastructure for project (you can run `make plan` to view the changes to be made)
  - the project reference id will be saved into a local file named `.supabase_resource_id`
3. run `make sb-init` to intialize supabase and authorize local development
4. run `make sb-link` to link local development with the supabase project created on step 2

Devs can use the `make` command to speed up development.
| command | description |
|---|---|
| `make plan` | review changes to your infrastructure |
| `make apply` | apply changes to your infrastructure |
| `make sb-link` | required to link local config to active supabase project |
| `make sb-apply` | apply changes to the supabase project config |

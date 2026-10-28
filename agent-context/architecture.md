# Architecture

- Two independent roots, each with `main.tf` and `providers.tf`: `envs/dev`, `envs/prod`. No backend block, so state is local and git-ignored (`.gitignore`: `*.tfstate`, `.terraform/`).
- Provider: `hashicorp/aws` `>= 5.0`, Terraform `>= 1.6`, region `ap-southeast-2`. Credential, account-id and metadata checks are skipped so plan works offline (`envs/dev/providers.tf`, `envs/prod/providers.tf`).
- Both roots call `modules/bucket` as module `logs` (`envs/dev/main.tf`, `envs/prod/main.tf`).
- Provider versions are pinned by `envs/dev/.terraform.lock.hcl` and `envs/prod/.terraform.lock.hcl`.
- CI: `.github/workflows/plan.yml` runs init, plan and show -json per root, with Terraform 1.15.2.
- External services: none called. AWS is only modelled.
<!-- source: envs/dev/providers.tf · 6c48b22 · by analyst -->

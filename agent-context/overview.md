# Overview

fixture-tf is a Terraform test fixture. It holds planted cloud misconfigurations so a remediation process has something to fix. Nothing is applied: CI plans with placeholder credentials and makes no AWS call (`README.md`, `.github/workflows/plan.yml`).

## Repo

| Repo | Role |
|---|---|
| tf | Only repo. Two root configs (`envs/dev`, `envs/prod`) and one shared module (`modules/bucket`). |

## Main flows

- Pull request opens, then the `plan` job waits for approval in the `plan-approval` environment, then plans each root and uploads `envs/*/plan.json` as artifact `tfplan-json` (`.github/workflows/plan.yml`).
- A fix in `modules/bucket/main.tf` changes both roots.
<!-- source: README.md · 6c48b22 · by analyst -->

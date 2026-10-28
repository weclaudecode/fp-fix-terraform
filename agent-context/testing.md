# Testing

| Step | Command | Result |
|---|---|---|
| Security scan (test) | `trivy config --exit-code 1 .` | Not run: `trivy` is not installed in the sandbox. Expected to fail on the planted flaws. |
| Lint | `terraform validate` (after `terraform -chdir=envs/dev init`) | Not run: `terraform` is not installed in the sandbox. |
| Init and plan one root | `terraform -chdir=envs/dev init -input=false` then `terraform -chdir=envs/dev plan -input=false` | Not run (same reason). CI does this with placeholder AWS keys. |

- No unit tests, fixtures or mocks exist.
- CI: workflow `plan` (`.github/workflows/plan.yml`), on pull requests. It plans both roots and uploads `tfplan-json`. It does not run trivy or validate. The job waits for approval in `plan-approval`.
<!-- source: .github/workflows/plan.yml · 6c48b22 · by analyst -->

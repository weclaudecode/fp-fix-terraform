# Glossary

| Term | Meaning here |
|---|---|
| Root | A directory you run `terraform` in: `envs/dev` or `envs/prod`. |
| Planted | A deliberate misconfiguration, marked with a "Planted" comment in the `.tf` files. |
| plan-approval | GitHub environment that holds the plan job until a person approves (`.github/workflows/plan.yml`). |
| tfplan-json | CI artifact with each root's plan as JSON. |
| Shared module | `modules/bucket`, used by both roots. |
<!-- source: README.md · 6c48b22 · by analyst -->

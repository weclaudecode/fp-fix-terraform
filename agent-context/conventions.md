# Conventions

- Resource names are prefixed `fp-fix-<env>-` (`envs/dev/main.tf`, `envs/prod/main.tf`).
- Each root has `main.tf` for resources and `providers.tf` for provider config. The module is a single `main.tf` with variable, resource and output together.
- Intentional flaws carry a `# Planted:` comment. Remove the comment when fixing the flaw.
- Lint: `terraform validate`. Security scan: `trivy config --exit-code 1 .` (expected to fail while flaws are planted).
- Do not commit `tfplan`, `plan.json`, state or `.terraform/` (`.gitignore`).
- Commit style: one commit so far, a plain sentence ("Fixture: planted misconfigurations and a gated plan job").
<!-- source: .gitignore · 6c48b22 · by analyst -->

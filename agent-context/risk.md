# Risk notes

<!-- measured:start -->
## Measured

Written by our code on 2026-10-28 from the repo and its pull requests. Every refresh replaces this part; write notes below it.

### Files changed most (merged pull requests in 90 days)

No file was changed by more than one pull request.

### Generated or vendored (.gitattributes)

None marked.

### Code owners (CODEOWNERS)

No CODEOWNERS file.

<!-- source: .gitattributes, CODEOWNERS and pull requests · 2026-10-28 · by code -->
<!-- measured:end -->

- `modules/bucket/main.tf` is shared: any change shows in both `envs/dev` and `envs/prod` plans.
- Planted flaws: open SSH and unencrypted volume (`envs/dev/main.tf`); unprotected bucket, SQS SSE off, log group without retention (`envs/prod/main.tf`).
- Changing `bucket` or `name` on a bucket forces replacement. Fixture only, but check the plan.
- No tests; the only CI check is the plan, and it does not run trivy or validate (`.github/workflows/plan.yml`).
- Lock files exist per root; provider constraint is open (`>= 5.0`), so a lock refresh can change plans.
<!-- source: envs/prod/main.tf · 6c48b22 · by analyst -->

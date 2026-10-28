# fp-fix-terraform

A test fixture for the weclaudecode remediation lane. It holds planted misconfigurations, so the lane has something to
fix. Nothing here is ever applied: CI plans with placeholder credentials and makes no AWS call.

| Root | Uses | Planted |
|---|---|---|
| `envs/dev` | `modules/bucket` | SSH open to the internet; an unencrypted EBS volume |
| `envs/prod` | `modules/bucket` | A bucket with no versioning and no public access block; a queue with SSE turned off; a log group with no retention |
| `modules/bucket` | (shared by both roots) | No versioning, no public access block, no access logging |

The shared module is on purpose: a fix there changes both roots.

CI (`.github/workflows/plan.yml`) plans each root on a pull request and uploads `envs/*/plan.json` as the `tfplan-json`
artifact. The job waits in the `plan-approval` environment until a person approves it.


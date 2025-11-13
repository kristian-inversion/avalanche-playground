# Security Policy

This document outlines required security practices for Fischchain’s development, staging, and production environments.

---

## Key Principles
- **No private keys** or mnemonic phrases in Git, CI pipelines, or plaintext.
- **Hardware wallets** (Ledger/Core) must be used for:
  - Controller/Owner of ValidatorManager
  - ProxyAdmin (if applicable)
  - Any deployment to Fuji or mainnet
- All sensitive operations must be peer reviewed.

---

## Genesis Hygiene
- Never include known developer keys (e.g., `ewoq`) in a genesis meant for public deployment.
- Once a genesis is deployed:
  - Treat it as **immutable**
  - Any changes require a new chain deployment (new BlockchainID)
  - Document the change in `decision-log.md`

---

## CI/CD Practices
- Never export keys into CI environment variables.
- CI should only:
  - lint/format JSON configs
  - verify schemas
  - run local subnet smoke tests
- Deployment to Fuji must be manually triggered with hardware wallet confirmation.

---

## Access Control
- Maintain a clear allowlist of:
  - Who can deploy to Fuji
  - Who can operate/upgrade ValidatorManager
  - Who can run production validators
- Store roles in `docs/addresses.md`.

---

## Incident Response
For suspected compromise:
1. Immediately rotate controller/admin following `runbooks/rotate-controller.md`
2. Document the incident in `decision-log.md`
3. Audit recent on-chain changes
4. Restore node health using `runbooks/recover-node.md`

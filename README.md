# Render Node Stack (Template)

This repository is a **template** to run a multi-node stack inside a single Render service/container.
It **starts placeholder scripts** for the following components:

- Mysterium (placeholder script) -- replace with real node binary or Docker image if desired.
- Golem (placeholder script) -- replace with real node setup.
- iExec (placeholder script) -- replace with real worker binary/setup.
- Gensyn worker (lightweight Python placeholder that simulates work).
- Galxe bot (Node.js placeholder that simulates quest automation).
- Layer3 bot (Node.js placeholder that simulates quest automation).

> ⚠️ IMPORTANT
> - Several components here are placeholders. Running real mainnet node software often requires
>   registrations, specific binaries, certificates, wallets, and sometimes KYC. Replace placeholder
>   scripts with the official deployment instructions from each project's docs when you are ready.
> - **Do not commit private keys** into the repo. Use Render environment variables (Dashboard → Environment)
>   to set secrets like `WALLET_PRIVATE_KEY` and `RPC_URL`.
> - Using cloud/data-center IPs may reduce or invalidate rewards for some DePIN/bandwidth projects.
>   Check each project's rules.

## What this template provides
- `Dockerfile` — builds a single container with python/node runtime and the app files.
- `start.sh` — launches all services (backgrounded) and tails logs so Render shows output.
- `scripts/` — placeholder scripts for Mysterium/Golem/iExec (these only simulate startup).
- `gensyn/` — minimal Python worker placeholder.
- `galxe-bot/` and `layer3-bot/` — minimal Node.js bots that simulate automated actions.

## How to use on Render
1. Create a GitHub repo and push this template.
2. On Render dashboard, create a **New Web Service** -> Connect GitHub -> Select this repo.
3. Runtime: **Docker** (Render will build the Dockerfile)
4. Start command: `/app/start.sh`
5. Add required environment variables (Dashboard → Environment):
   - `WALLET_PRIVATE_KEY` (string) — keep secret
   - `RPC_URL` (string) — JSON-RPC endpoint for the chain you target
   - Optional: `GENSYN_INTERVAL`, `GALXE_INTERVAL`, `LAYER3_INTERVAL` to tune behavior
6. Deploy and monitor logs.

## Files to replace for production
- `scripts/mysterium_placeholder.sh` → replace with real mysterium start command or use upstream Docker image.
- `scripts/golem_placeholder.sh` → replace with `yagna` or official Golem worker command.
- `scripts/iexec_placeholder.sh` → replace with `iexec` worker binary or official Docker image.
- `gensyn/run_rl_swarm.py` → replace with official Gensyn worker code or registration flow if available.
- `galxe-bot/index.js`, `layer3-bot/bot.js` → implement actual quest automation per platform rules.

## Legal & Policy
- Respect Render's Terms of Service and each project's Terms.
- Running some DePINs on cloud IPs may be disallowed by those projects.

## Disclaimer
This repository is for educational/testing purposes. It includes simulation/placeholder code.
Use at your own risk.

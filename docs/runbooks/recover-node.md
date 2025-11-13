# Runbook: Node Recovery

This guide covers recovering a malfunctioning node on Fischchain.

---

## Symptoms
- Node not syncing
- Node not producing blocks
- RPC endpoint unresponsive or returning errors
- Peers dropping
- Unexpected crashes (segfault, OOM)

---

## Step 1 — Check Logs
Inspect logs from AvalancheGo and Subnet-EVM:
~/.avalanchego/logs

Look for:
- database corruption warnings
- p2p/network issues
- plugin load errors
- repeated panics

---

## Step 2 — Check Disk & System Resources
- Ensure enough free disk space  
- Check memory usage  
- Restart the process if it was OOM-killed  

---

## Step 3 — Graceful Restart
Stop the node:
systemctl stop avalanchego

or `kill` the process if running manually.

Start it again and observe logs.

---

## Step 4 — Full Resync (if necessary)
If the node cannot catch up:

1. Stop the node  
2. Delete only the Fischchain DB: ~/.avalanchego/chains/<BlockchainID>/*
3. Restart the node  
4. Let it fully resync from peers

---

## Step 5 — Validate Recovery
- `eth_blockNumber` increases
- Peer count stable
- Node visible in Subnet Explorer (if a validator)

---

## Step 6 — Document the Event
Add an entry to `docs/decision-log.md` if:
- a config change was required  
- a validator was impacted  
- you needed to tune node resources
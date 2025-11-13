# Runbook: Adding a Validator (PoA)

**Network:** Fischchain (Fuji)  
**Consensus:** Proof-of-Authority  
**Controller/Owner:** `<controller address>`  
**ValidatorManager Proxy:** `<proxy contract address>`  
**RPC:** `<RPC URL>`

This chain uses a **ValidatorManager contract** (ACP-99 compatible) deployed at chain creation.  
Validator membership is NOT on the P-Chain — it is controlled by this contract inside Fischchain.

---

## Prerequisites
1. You must control the **Controller/Owner** key.
2. The candidate validator must:
   - Run an AvalancheGo node connected to Fuji.
   - Have the correct Subnet VM plugin installed.
   - Be synced and expose its `NodeID`.
3. You must have:
   - The ValidatorManager ABI.
   - RPC access to Fischchain.

---

## High-Level Steps
1. **Read current epoch and validator set**  
   Use Hardhat, Foundry, or ethers.js to call:
   vm.currentEpoch()
   vm.getValidatorSet(epoch)
   
2. **Construct a new epoch** including the new validator’s node ID and weight.

3. **Call the “propose” or “activate” function** depending on the ABI:
- Common pattern:
  ```
  proposeNextEpoch(validators, weights)
  activateEpoch()
  ```

4. **Verify** in Subnet Explorer:
- Validator appears
- Block production continues
- RPC responds normally

---

## Example Script (ethers.js pseudocode)
```js
const vm = new ethers.Contract(VAL_MANAGER, abi, signer);

const epoch = await vm.currentEpoch();
const set = await vm.getValidatorSet(epoch);

// Build the new set with added validator
const validators = [...set.validators, NEW_NODE_ID];
const weights = [...set.weights, "1"];

await vm.proposeNextEpoch(validators, weights);
await vm.activateEpoch();

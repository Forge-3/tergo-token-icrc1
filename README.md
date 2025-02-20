# Tergo Token ICRC-1 Implementation

The Tergo Token is a fungible token implemented on the Internet Computer, adhering to the ICRC-1 standard. This repository provides the necessary components to deploy and interact with the Tergo Token ledger canister.

## Repository Structure

- **local/**: Configuration and deployment files for local development and testing.
- **mainnet/**: Deployment scripts and configurations for deploying the token on the Internet Computer mainnet.
- **template/**: Template files and examples to assist in setting up the token canister.
- **.gitignore**: Specifies files and directories to be ignored by Git.
- **README.md**: This documentation file.
- **canister_ids.json**: Records the canister IDs for deployed canisters.
- **dfx.json**: Configuration file for the DFINITY SDK (dfx).

## Audit

This token utilizes the "ICP Ledger Suite Release 2025-01-21" from the [Forge-3 fork of IC](https://github.com/Forge-3/ic/releases/tag/ledger-suite-icrc-2025-01-21) ([Original release](https://github.com/dfinity/ic/releases/tag/ledger-suite-icrc-2025-01-21)).

This release was made at commit hash `83c1bbf752b879cc5669bc6e66f0c1b529c234e2`.

The ledger canister used in this deployment is the [ICRC-1 ledger canister](https://github.com/Forge-3/ic/tree/ledger-suite-icrc-2025-01-21/rs/ledger_suite/icrc1/ledger), which utilizes a `u64` supply size. 

## Prerequisites

Before deploying the Tergo Token, ensure you have the following installed:

- DFINITY SDK (dfx): [Installation Guide](https://internetcomputer.org/docs/current/developer-docs/build/install)
- Node.js and npm: [Download and Install](https://nodejs.org/)

## Deployment

### Local Deployment

To deploy the Tergo Token locally for development and testing:

1. **Start the local Internet Computer replica:**

   ```bash
   dfx start --background
   ```


2. **Deploy the ICRC-1 ledger canister with the Tergo Token initialization:**

   ```bash
   ./local/deploy.sh 
   ```


   Ensure that the `local/tergo_ledger_canister-init.did` file contains the correct initialization arguments as per the ICRC-1 standard.

### Mainnet Deployment

To deploy the Tergo Token on the Internet Computer mainnet:

1. **Authenticate with the Internet Computer network:**

   ```bash
   dfx identity use <your-identity>
   ```


2. **Deploy the ICRC-1 ledger canister:**

   ```bash
   ./mainnet/deploy.sh 
   ```


   Replace `<your-identity>` with your dfx identity, and ensure the `mainnet/tergo_ledger_canister-init.did` file is properly configured for mainnet deployment.

## Interacting with the Tergo Token

After deployment, you can interact with the Tergo Token ledger canister using the following methods:

### Using `dfx` Commands

DFX provides a straightforward way to call canister methods. For example, to check the token's symbol:


```bash
dfx canister call tergo_ledger_canister icrc1_symbol
```


Replace `tergo_ledger_canister` with the actual canister name or ID if different.

## Additional Resources

- **ICRC-1 Standard Documentation**: Detailed specifications of the ICRC-1 token standard. [Read More](https://internetcomputer.org/docs/current/references/icrc1-standard)
- **Creating a Token on the Internet Computer**: Guide to creating and deploying custom tokens. [Read More](https://internetcomputer.org/docs/current/developer-docs/defi/tokens/create)
- **ICRC-1 Ledger Setup**: Instructions for setting up an ICRC-1 ledger locally. [Read More](https://internetcomputer.org/docs/current/developer-docs/defi/tokens/ledger/setup/icrc1_ledger_setup)
- **Add to wallet**: Instructions how to add TERGO token to wallet. [Read More](https://docs.google.com/document/d/1NMP3ynEVAaMOT_WvMvWJpuZnic3CWf-9/edit?usp=sharing&ouid=110372384517032020511&rtpof=true&sd=true)

For further assistance, refer to the official Internet Computer documentation or seek support from the developer community. 
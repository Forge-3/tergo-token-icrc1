#!/bin/bash

ENV=mainnet

# Create the canister and capture the output
dfx canister create tergo_ledger_canister --network ic
dfx canister create tergo_indexer_canister --network ic

# Print the raw output for debugging

tergo_ledger_canister_id=$(jq -r '.tergo_ledger_canister.ic' canister_ids.json)
tergo_indexer_canister_id=$(jq -r '.tergo_indexer_canister.ic' canister_ids.json)

# Ledger
cp template/tergo_ledger_canister-init.did mainnet/tergo_ledger_canister-init.did
echo $(sed -i "s/MINTING_PRINCIPAL/$tergo_ledger_canister_id/g" $ENV/tergo_ledger_canister-init.did)
# dfx deploy tergo_ledger_canister --argument-file $ENV/tergo_ledger_canister-init.did

# Indexer
cp template/tergo_indexer_canister-init.did mainnet/tergo_indexer_canister-init.did
echo $(sed -i "s/LEDGER_PRINCIPAL/$tergo_ledger_canister_id/g" $ENV/tergo_indexer_canister-init.did)
# dfx deploy tergo_indexer_canister --argument-file $ENV/tergo_indexer_canister-init.did
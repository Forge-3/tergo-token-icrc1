#!/bin/bash

ENV=local

# Create the canister and capture the output
dfx canister create tergo_ledger_canister
dfx canister create tergo_indexer_canister

# Print the raw output for debugging

tergo_ledger_canister_id=$(jq -r '.tergo_ledger_canister.local' .dfx/local/canister_ids.json)
tergo_indexer_canister_id=$(jq -r '.tergo_indexer_canister.local' .dfx/local/canister_ids.json)

# Ledger
cp template/tergo_ledger_canister-init.did local/tergo_ledger_canister-init.did
echo $(sed -i "s/MINTING_PRINCIPAL/$tergo_ledger_canister_id/g" $ENV/tergo_ledger_canister-init.did)
dfx deploy tergo_ledger_canister --argument-file $ENV/tergo_ledger_canister-init.did

# Indexer
cp template/tergo_indexer_canister-init.did local/tergo_indexer_canister-init.did
echo $(sed -i "s/LEDGER_PRINCIPAL/$tergo_ledger_canister_id/g" $ENV/tergo_indexer_canister-init.did)
dfx deploy tergo_indexer_canister --argument-file $ENV/tergo_indexer_canister-init.did
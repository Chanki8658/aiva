#!/bin/bash

# copy keys file if not already exist
AIVA_DIR=`pwd`
BIN_DIR="$AIVA_DIR/bin"

env_count=$(find $AIVA_DIR -name ".env*" -maxdepth 1 -type f | wc -l)
example_env_count=$(find $AIVA_DIR -name ".env-example" -maxdepth 1 -type f | wc -l)
if [[ $env_count -eq 1 && $example_env_count -eq 1 ]]; then (
  cp $AIVA_DIR/.env-example $AIVA_DIR/.env
  echo "Created .env"
  );
  else (
  echo "Not creating .env since it already exists"
  )
fi

keys_count=$(find $BIN_DIR -name ".keys-*" -maxdepth 1 -type f | wc -l)
example_keys_count=$(find $BIN_DIR -name ".keys-example" -maxdepth 1 -type f | wc -l)
if [[ $keys_count -eq 1 && $example_keys_count -eq 1 ]]; then (
  cp $BIN_DIR/.keys-example $BIN_DIR/.keys-aiva
  cp $BIN_DIR/.keys-example $BIN_DIR/.keys-aivadev
  echo "Created bin/.keys-aiva, bin/.keys-aivadev"
  );
  else (
  echo "Not creating bin/.keys-aiva, bin/.keys-aivadev since keys already exist"
  )
fi

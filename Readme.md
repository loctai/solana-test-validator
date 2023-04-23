## fetch
```shell
git clone https://github.com/solana-labs/solana.git
```

git checkout v1.9.4.
cargo build --release --bin solana-test-validator
cd validator
./solana-test-validator

## OR

## build
```shell
cd solana/validator
```
in ```solana/validator```

```shell
echo '#!/usr/bin/env bash

here="$(dirname "$0")"
set -x
exec cargo build --release --manifest-path="$here"/Cargo.toml --bin solana-test-validator -- "$@"' > solana-test-validator
./solana-test-validator

```

## test
```shell
cd ../target/release
```
in ```solana/target/release```

```shell
./solana-test-validator
```

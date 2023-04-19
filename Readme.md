## fetch
```
git clone https://github.com/solana-labs/solana.git
```

## build
```shell
cd solana/validator
```
in ```solana/validator```

```
echo '#!/usr/bin/env bash

here="$(dirname "$0")"
set -x
exec cargo build --release --manifest-path="$here"/Cargo.toml --bin solana-test-validator -- "$@"' > solana-test-validator
./solana-test-validator

```

## test
```
cd ../target/release
```
in ```solana/target/release```

```
./solana-test-validator
```

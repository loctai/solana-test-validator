## Install Rust

```shell
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

```shell
export PATH="$HOME/.cargo/bin:$PATH"
```

```shell
rustup --version
rustc --version
cargo --version
```

## Install Solana

```shell
sh -c "$(curl -sSfL https://release.solana.com/v1.9.4/install)"
```

```shell
export PATH="$HOME/.local/share/solana/install/active_release/bin:$PATH"
```

```
# Check the Solana binary is available.
solana --version

# Check you can run a local validator (Run Ctrl+C to exit).
# We’ll see what this does in this article.
# Note this creates a "test-ledger" folder in your current directory.
solana-test-validator

```

## Use Solana locally

```shell
solana config set --url localhost
```

### Generate your local key pair
```shell
solana address
solana-keygen new
```

## Install Anchor

```shell
cargo install --git https://github.com/project-serum/anchor anchor-cli --locked
```

```shell
anchor --version
```

## Install yarn

```shell
# Using npm global dependencies.
npm install -g yarn

# Using homebrew on Mac.
brew install yarn

# Using apt on Linux
apt install yarn
```

## Create a new Anchor project

```shell
# Go to your dev folder (for me it’s “~/Code”).
cd ~/Code

# Create a new Anchor project.
anchor init solana-twitter

# Cd into the newly created project.
cd solana-twitter
```

## Build and deploy

```shell
# Compiles your program.
anchor build
```
```shell
# Deploys your compiled program.
anchor deploy

```

## Run a local ledger

```shell
solana-test-validator
```

```shell
# Runs a new empty local ledger.
solana-test-validator --reset
```

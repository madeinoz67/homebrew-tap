# Homebrew Tap

This is a [Homebrew](https://brew.sh/) tap for CLI tools and a macOS app by [@madeinoz67](https://github.com/madeinoz67).

## Installation

```bash
brew tap madeinoz67/tap
```

## Available Formulae

| Formula | Description |
|---------|-------------|
| [benchweave-sdk](https://github.com/madeinoz67/benchweave-sdk) | Offline authoring and conformance tooling for BenchWeave OTDP device plugins |
| [go-rag](https://github.com/madeinoz67/go-rag) | Single-binary local RAG database — bundled pure-Go embeddings, no Ollama required |
| [lldap-cli](https://github.com/madeinoz67/lldap-cli) | Command-line interface for LLDAP server management |
| [voice-server](https://github.com/madeinoz67/madeinoz-voice-server) | Local-first TTS voice server using MLX-audio with Kokoro-82M model |

## Available Casks

| Cask | Description |
|------|-------------|
| [diskguardian](https://github.com/madeinoz67/diskguardian) | Sunburst view of what is actually filling your disk, and a guarded way to get the space back (macOS) |

## Usage

```bash
# Install benchweave-sdk
brew install madeinoz67/tap/benchweave-sdk

# Install go-rag
brew install madeinoz67/tap/go-rag
go-rag init && go-rag add ./my-docs && go-rag query "how does X work?"

# Install lldap-cli
brew install madeinoz67/tap/lldap-cli

# Install voice-server
brew install madeinoz67/tap/voice-server

# Install DiskGuardian (macOS app — the --cask flag is required)
brew install --cask madeinoz67/tap/diskguardian

# Or after tapping
brew tap madeinoz67/tap
brew install go-rag

# Start voice-server as a service
brew services start madeinoz67/tap/voice-server
```

The DiskGuardian cask is regenerated on every release tag from the dmg that release
published, so its checksum cannot drift from the file you download. The app is unsigned,
so macOS quarantines it; if Gatekeeper refuses the first launch, right-click the app and
choose Open, or run:

```bash
xattr -dr com.apple.quarantine "/Applications/DiskGuardian.app"
```

## Updating

```bash
brew update
brew upgrade madeinoz67/tap/go-rag
brew upgrade --cask madeinoz67/tap/diskguardian
```

## Issues

If you have issues with a formula or cask, please report them to the respective project repository.

For tap-specific issues, [open an issue here](https://github.com/madeinoz67/homebrew-tap/issues).

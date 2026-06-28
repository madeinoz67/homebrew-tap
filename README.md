# Homebrew Tap

This is a [Homebrew](https://brew.sh/) tap for CLI tools by [@madeinoz67](https://github.com/madeinoz67).

## Installation

```bash
brew tap madeinoz67/tap
```

## Available Formulae

| Formula | Description |
|---------|-------------|
| [go-rag](https://github.com/madeinoz67/go-rag) | Single-binary local RAG database — bundled pure-Go embeddings, no Ollama required |
| [lldap-cli](https://github.com/madeinoz67/lldap-cli) | Command-line interface for LLDAP server management |
| [voice-server](https://github.com/madeinoz67/madeinoz-voice-server) | Local-first TTS voice server using MLX-audio with Kokoro-82M model |

## Usage

```bash
# Install go-rag
brew install madeinoz67/tap/go-rag
go-rag init && go-rag add ./my-docs && go-rag query "how does X work?"

# Install lldap-cli
brew install madeinoz67/tap/lldap-cli

# Install voice-server
brew install madeinoz67/tap/voice-server

# Or after tapping
brew tap madeinoz67/tap
brew install go-rag

# Start voice-server as a service
brew services start madeinoz67/tap/voice-server
```

## Updating

```bash
brew update
brew upgrade madeinoz67/tap/go-rag
```

## Issues

If you have issues with a formula, please report them to the respective project repository.

For tap-specific issues, [open an issue here](https://github.com/madeinoz67/homebrew-tap/issues).

# Homebrew Tap

This is a [Homebrew](https://brew.sh/) tap for CLI tools by [@madeinoz67](https://github.com/madeinoz67).

## Installation

```bash
brew tap madeinoz67/tap
```

## Available Formulae

| Formula | Description |
|---------|-------------|
| [lldap-cli](https://github.com/madeinoz67/lldap-cli) | Command-line interface for LLDAP server management |
| [madeinoz-voice-server](https://github.com/madeinoz67/madeinoz-voice-server) | Local-first TTS voice server using Kokoro-82M and Qwen TTS models |

## Usage

```bash
# Install lldap-cli
brew install madeinoz67/tap/lldap-cli

# Install madeinoz-voice-server
brew install madeinoz67/tap/madeinoz-voice-server

# Or after tapping
brew tap madeinoz67/tap
brew install madeinoz-voice-server

# Start as a service
brew services start madeinoz67/tap/madeinoz-voice-server
```

## Updating

```bash
brew update
brew upgrade madeinoz67/tap/madeinoz-voice-server
```

## Issues

If you have issues with a formula, please report them to the respective project repository.

For tap-specific issues, [open an issue here](https://github.com/madeinoz67/homebrew-tap/issues).

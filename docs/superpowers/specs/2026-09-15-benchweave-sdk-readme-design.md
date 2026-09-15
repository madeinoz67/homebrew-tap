# BenchWeave SDK README Update

## Goal

Make the existing `benchweave-sdk` formula discoverable from the tap README and show users the direct installation command.

## Design

- Add `benchweave-sdk` to the Available Formulae table, linking to the SDK repository.
- Describe it as “Offline authoring and conformance tooling for BenchWeave OTDP device plugins”.
- Add `brew install madeinoz67/tap/benchweave-sdk` to the Usage example alongside the existing product-specific commands.
- Leave the generic post-tap example, service instructions, and upgrade example unchanged.

## Verification

- Confirm the table remains valid Markdown.
- Confirm the formula name and installation command match `Formula/benchweave-sdk.rb`.
- Review the final diff for unrelated changes.

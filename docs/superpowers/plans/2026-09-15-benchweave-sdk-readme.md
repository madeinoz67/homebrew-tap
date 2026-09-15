# BenchWeave SDK README Update Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Make the existing `benchweave-sdk` formula discoverable in the tap README and provide its direct installation command.

**Architecture:** Modify only the repository-level `README.md`. Follow the existing formula-table and product-specific Usage patterns without changing unrelated examples.

**Tech Stack:** Markdown, Homebrew CLI documentation

## Global Constraints

- Use the exact description: “Offline authoring and conformance tooling for BenchWeave OTDP device plugins”.
- Use the exact install command: `brew install madeinoz67/tap/benchweave-sdk`.
- Link the formula name to `https://github.com/madeinoz67/benchweave-sdk`.
- Do not change the generic post-tap, service, or upgrade examples.

---

### Task 1: Document the BenchWeave SDK formula

**Files:**
- Modify: `README.md`
- Verify: `Formula/benchweave-sdk.rb`

**Interfaces:**
- Consumes: the formula name `benchweave-sdk` already defined by `Formula/benchweave-sdk.rb`
- Produces: a README table entry and copyable direct-install command

- [ ] **Step 1: Verify the formula identity**

Run:

```bash
test -f Formula/benchweave-sdk.rb
```

Expected: exit status 0.

- [ ] **Step 2: Add the formula table entry**

Add this row after the table header and before `go-rag`:

```markdown
| [benchweave-sdk](https://github.com/madeinoz67/benchweave-sdk) | Offline authoring and conformance tooling for BenchWeave OTDP device plugins |
```

- [ ] **Step 3: Add the direct installation example**

Add this block at the start of the existing Usage code fence:

```bash
# Install benchweave-sdk
brew install madeinoz67/tap/benchweave-sdk

```

- [ ] **Step 4: Validate the documentation change**

Run:

```bash
git diff --check
git diff -- README.md
```

Expected: `git diff --check` exits 0; the README diff contains exactly one formula row and one two-line install example.

- [ ] **Step 5: Commit the update**

```bash
git add README.md
git commit -m "docs: add benchweave-sdk to tap README"
```

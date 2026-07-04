---
name: pr
description: Open a draft PR for the current branch.
disable-model-invocation: true
---

Open a draft pull request for the current branch against the repo's default branch, deriving the title and body from the branch's real commits and diff. Run the steps in order; each ends on a checkable condition.

## Steps

1. **Establish base and head.** Head is `git branch --show-current`. Base is the repo default branch: `gh repo view --json defaultBranchRef -q .defaultBranchRef.name` (fall back to the name in `git symbolic-ref refs/remotes/origin/HEAD`). If head equals base, stop and tell the user — a PR cannot be opened from the default branch. _Done when both names are known and head ≠ base._

2. **Check for an existing PR.** Run `gh pr list --head <head> --state open`. If a PR already exists, report its URL and stop — never open a duplicate. _Done when the list is empty, or you have stopped._

3. **Push the branch.** If the branch has no upstream (`git rev-parse --abbrev-ref @{u}` fails), `git push -u origin <head>`; otherwise `git push`. _Done when the remote head matches local HEAD._

4. **Compose title and body.** Read `git log <base>..HEAD --oneline` and `git diff <base>...HEAD --stat` — base the content on what changed, never on guesses. Follow the [body format](#body-format). _Done when title and body reflect every commit in the range._

5. **Create the draft.** `gh pr create --draft --base <base> --head <head> --title "<title>" --body "<body>"`. Report the returned URL. _Done when the URL is printed._

## Body format

- **Summary** — 1–3 sentences: what changed and why.
- **## Changes** — a bullet per meaningful change, grouped from the commits and diff (not one bullet per commit).
- **Ticket** — if the branch name contains an issue key (e.g. `DS-146`, `ABC-1234`), add a line referencing it.
- **## Test plan** — how the change was or should be verified; omit only if there is nothing to verify.

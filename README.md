# skills

My custom [Claude Code](https://code.claude.com) skills. Each top-level folder
is one skill (a `SKILL.md` plus any supporting files).

## Setup on a new machine

```bash
git clone <this-repo> ~/Documents/ep/repos/skills
cd ~/Documents/ep/repos/skills
./install.sh
```

`install.sh` symlinks each skill folder into `~/.claude/skills/`. It does **not**
copy — the files live only here, so editing a skill in `~/.claude/skills/<name>/`
edits the file in this repo. Commit from here as usual.

Re-run `./install.sh` after adding a new skill folder to link it.

## Adding a skill

1. Create `<skill-name>/SKILL.md` in this repo.
2. Run `./install.sh` to link it into `~/.claude/skills/`.
3. Commit.

Only skills you author belong here. Skills installed by other tools (AIX CLIs,
third-party bundles) are managed by their own installers — leave them in
`~/.claude/skills/` untracked.

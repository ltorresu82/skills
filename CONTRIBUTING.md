# Contributing

Thanks for improving `decision-memory`.

This repository contains an agent skill, so changes should keep the skill portable,
concise, and useful across multiple coding agents.

## Contribution Guidelines

- Keep `decision-memory/SKILL.md` agent-agnostic. Do not assume one specific product
  unless the guidance is optional.
- Keep the skill focused on durable repository memory for technical decisions.
- Prefer examples that are generic and safe for public repositories.
- Do not add private company names, internal service names, secrets, or proprietary
  workflows.
- Keep accepted-decision guidance strict: unvalidated ideas should remain candidates or
  proposed ADRs.
- Avoid adding scripts unless they remove repeated manual work or improve deterministic
  validation.

## Validation

Before opening a pull request, run:

```bash
python <path-to-skill-creator>/scripts/quick_validate.py decision-memory
git diff --check
```

If you change SVG assets, verify they are valid XML.

## Pull Request Checklist

- [ ] The skill still validates.
- [ ] The README still explains install and usage clearly.
- [ ] The change is agent-agnostic.
- [ ] Public examples contain no private or organization-specific details.

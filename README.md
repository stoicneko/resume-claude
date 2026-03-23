# resume-claude

AI-driven resume management powered by [Claude Code](https://docs.anthropic.com/en/docs/claude-code) + [Typst](https://typst.app/) + [brilliant-cv](https://github.com/mintyfrankie/brilliant-cv).

**One source of truth in Markdown, N tailored resumes in PDF.**

[中文版](README_zh.md)

## How It Works

```
experiences/*.md        (Markdown — single source of truth)
       ↓  /generate-resume [job description]
modules_en/*.typ        (AI-generated Typst modules)
modules_zh/*.typ
       ↓  typst compile
output/*.pdf            (ready-to-send resumes)
```

1. Maintain your experiences in plain Markdown under `experiences/`.
2. Paste a job description and run `/generate-resume` — Claude Code reads your experience library, selects the most relevant entries, and generates bilingual Typst modules tailored to the role.
3. Typst compiles the modules into polished PDFs using the brilliant-cv template.

## Quick Start

### Prerequisites

- [Typst CLI](https://github.com/typst/typst) >= 0.14.0
- [Claude Code](https://docs.anthropic.com/en/docs/claude-code) (for AI-powered resume generation)
- Fonts: Source Sans 3, Roboto (Latin); Noto Sans CJK SC (Chinese)

### Build

```bash
make en          # Build English PDF  → output/resume-en.pdf
make zh          # Build Chinese PDF  → output/resume-zh.pdf
make all         # Build both (cleans first)
make watch-en    # Watch mode — auto-rebuild on change
make watch-zh
```

### Claude Code Slash Commands

Run these inside a Claude Code session:

| Command | Description |
|---------|-------------|
| `/init [text]` | Initialize the experience library (import from existing resume or LinkedIn) |
| `/generate-resume [job]` | Generate tailored Typst modules for a target job description |
| `/add-experience [desc]` | Add a new experience entry to the library |

## Directory Structure

```
.
├── experiences/          # Source of truth (Markdown)
│   ├── profile.md        #   Personal info + education
│   ├── work/             #   Work experience (one file per company)
│   ├── projects.md       #   Personal / open-source projects
│   ├── skills.md         #   Full skill inventory
│   └── honors.md         #   Awards, certifications, metrics
├── modules_en/           # AI-generated Typst modules (English)
├── modules_zh/           # AI-generated Typst modules (Chinese)
├── jobs/                 # Target job descriptions
├── assets/logos/         # Company logos (optional)
├── cv.typ                # Main Typst entry point
├── metadata.toml         # brilliant-cv configuration
├── Makefile              # Build commands
└── output/               # Generated PDFs (git-ignored)
```

## Customization

### `metadata.toml`

- **Personal info** — name, email, phone, GitHub, LinkedIn, etc.
- **Layout** — color theme, fonts, header alignment, page size
- **ATS keywords** — set `inject_keywords = true` and fill `injected_keywords_list`
- **Language** — default `"en"`, override with `--input language=zh`

### Module Order

Edit the `import-modules(...)` call in `cv.typ`:

```typst
#import-modules(("professional", "skills", "projects", "education", "certificates"))
```

## Key Design Decisions

- **Markdown-first**: All experience data lives in `experiences/*.md`. Typst modules are generated artifacts — never edit them by hand.
- **Bilingual**: Chinese (1 page max) and English (1-2 pages) are generated from the same source.
- **Tailored per job**: Each `/generate-resume` run selects and emphasizes different experiences based on the target role.
- **ATS-friendly**: Hidden keyword injection for applicant tracking systems.

## Dependencies

| Dependency | Version | Purpose |
|------------|---------|---------|
| [Typst](https://typst.app/) | >= 0.14.0 | Document compilation |
| [brilliant-cv](https://github.com/mintyfrankie/brilliant-cv) | 3.2.0 | CV template (auto-downloaded) |
| [Claude Code](https://docs.anthropic.com/en/docs/claude-code) | latest | AI resume generation |

## License

MIT

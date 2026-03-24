# Claude Resume — Typst Multi-Template

AI-driven resume management system. One source of truth in Markdown, N tailored resumes in PDF via Typst.

## Templates

| Template | Style | Entry Point |
|----------|-------|-------------|
| `brilliant-cv` (default) | Modern, colored, tagged entries | `cv.typ` |
| `billryan` | Classic, clean lines, compact | `cv-billryan.typ` |

Set default in `metadata.toml`: `template = "brilliant-cv"` or `"billryan"`

## Quick Start

```bash
# brilliant-cv template
make en          # Build English PDF → output/resume-en.pdf
make zh          # Build Chinese PDF → output/resume-zh.pdf
make all         # Build both (cleans first)
make watch-en    # Watch mode for English
make watch-zh    # Watch mode for Chinese

# billryan template
make billryan-en    # Build English PDF → output/resume-billryan-en.pdf
make billryan-zh    # Build Chinese PDF → output/resume-billryan-zh.pdf
make billryan       # Build both (cleans first)
make watch-billryan-en
make watch-billryan-zh
```

## Slash Commands

| Command | Purpose |
|---------|---------|
| `/init [text]` | Initialize or import experience library |
| `/generate-resume [--template billryan] [job]` | Generate tailored resume for a target job |
| `/add-experience [desc]` | Add new experience entry |

## Data Flow

```
experiences/ (Markdown, single source of truth)
    ↓  /generate-resume [--template <name>] [job]
modules_en/*.typ / modules_billryan_en/*.typ  (AI-generated Typst)
modules_zh/*.typ / modules_billryan_zh/*.typ
    ↓  typst compile cv.typ | cv-billryan.typ
output/*.pdf
```

## Directory Structure

- `experiences/` — Source material (Markdown). **Never edit modules directly; edit here.**
  - `profile.md` — Personal info + education
  - `work/<company>.md` — Work experience per company
  - `projects.md` — Personal/open-source projects
  - `skills.md` — Full skill inventory
  - `honors.md` — Honors + quantified metrics
- `modules_en/`, `modules_zh/` — brilliant-cv Typst modules (overwritten by `/generate-resume`)
- `modules_billryan_en/`, `modules_billryan_zh/` — billryan Typst modules
- `templates/billryan/` — billryan template + SVG icon assets
- `jobs/` — Target job descriptions
- `cv.typ` — brilliant-cv entry point
- `cv-billryan.typ` — billryan entry point
- `metadata.toml` — shared configuration (personal info, template selection)
- `output/` — Generated PDFs

## brilliant-cv API Quick Reference

```typst
#import "@preview/brilliant-cv:3.2.0": cv-section, cv-entry, cv-entry-start, cv-entry-continued, cv-skill, cv-honor, h-bar

#cv-section("Title")                          // Section heading

#cv-entry(                                    // Standard entry
  title: [Role], society: [*Company*],
  date: [YYYY/MM - YYYY/MM], location: [City],
  description: list([Point 1], [Point 2]),
  tags: ("Tag1", "Tag2"),
)

#cv-entry-start(society: [*Company*], location: [City])  // Multi-role header
#cv-entry-continued(                                      // Role under header
  title: [Role], date: [YYYY/MM - YYYY/MM],
  description: list([...]), tags: ("Tag",),
)

#cv-skill(type: [Category], info: [A #h-bar() B #h-bar() C])  // Skill row
#cv-honor(date: [YYYY], title: [Title], issuer: [Org], url: "", location: [])  // Honor
```

## Key Conventions

- **Page limits**: Chinese = 1 page max, English = 1-2 pages
- **Dates in Markdown**: `YYYY/MM - YYYY/MM` (single dash)
- **Dates in Typst**: `[YYYY/MM - YYYY/MM]` (content blocks)
- **Dates in YAML frontmatter**: `YYYY/MM -- YYYY/MM` (double dash)
- **Logo paths in Typst**: `image("../assets/logos/company.png")` (note `../` prefix from module dirs)
- **Multi-role mode**: Requires `display_entry_society_first = true` in `metadata.toml`
- **ATS keywords**: Set `inject_keywords = true` and fill `injected_keywords_list` in `metadata.toml` `[inject]`
- **Module order**: Controlled by `import-modules(...)` array in `cv.typ` / `cv-billryan.typ`
- **Template selection**: `metadata.toml` `template` field, or `--template` flag in `/generate-resume`

## billryan Template API Quick Reference

```typst
#import "../templates/billryan/template.typ": icon, term, date

== #icon("users.svg") SECTION TITLE               // Section heading with icon + rule

/ *Company* #h(4pt) Role: #h(1fr) #date("YYYY/MM - YYYY/MM") #h(1em) #icon("location.svg") City
- Bullet point with result                         // Experience entry

/ *University*: Degree #term("YYYY/MM - YYYY/MM", "City")  // Education entry

- *Category*: Skill1, Skill2, Skill3               // Skill row
- *Title* — Issuer (Year)                          // Honor/certification
```

Icons: `users.svg` (experience), `graduation-cap.svg` (education), `info.svg` (skills), `github.svg` (projects), `award.svg` (honors), `calendar.svg` (date), `location.svg` (location)

## Dependencies

- Typst CLI >= 0.14.0
- brilliant-cv 3.2.0 (auto-downloaded on first compile)
- Fonts: Source Sans 3, Roboto (Latin); IBM Plex Serif (billryan Latin); Noto Sans CJK SC (Chinese)

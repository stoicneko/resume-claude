# /generate-resume — Generate Tailored Resume

You are a resume optimization expert. Generate tailored Typst modules from `experiences/` source material for a specific job.

## Input

Argument: job title, job description text, or path to a file in `jobs/`.

If no argument provided, ask: "请提供目标岗位名称或 JD 文件路径。"

## Process

### Step 1: Read All Source Material

Read every file in `experiences/` and `metadata.toml`:
- `experiences/profile.md` — personal info + education
- `experiences/work/*.md` — all work experiences
- `experiences/projects.md` — personal projects
- `experiences/skills.md` — skill inventory
- `experiences/honors.md` — honors and metrics

### Step 2: Analyze Job Requirements

From the JD, identify:
- **Core technical skills** required
- **Experience priority** — which work/project experiences are most relevant
- **Presentation angle** — what framing makes the candidate strongest
- **Keywords for ATS** — terms the ATS will scan for

### Step 3: Present Strategy to User

Before generating, show the user:

```
## 定制化策略

**目标定位**: [how to position the candidate]
**内容取舍**:
  - 重点展示: [experiences to highlight]
  - 简要提及: [experiences to include briefly]
  - 省略: [experiences to skip]
**差异化点**: [unique selling points]
**模块顺序**: [recommended section order]
**ATS 关键词**: [keywords to inject]
```

Wait for user confirmation before proceeding.

### Step 4: Backup Current Modules

```bash
timestamp=$(date +%Y%m%d_%H%M%S)
mkdir -p .history/modules_${timestamp}
cp -r modules_en/ .history/modules_${timestamp}/modules_en/ 2>/dev/null || true
cp -r modules_zh/ .history/modules_${timestamp}/modules_zh/ 2>/dev/null || true
```

### Step 5: Generate Typst Modules

Generate ALL of these files for BOTH `modules_en/` and `modules_zh/`:

1. **professional.typ** — Work experience
   - Use `cv-entry-start` + `cv-entry-continued` for multi-role companies
   - Use `cv-entry` for single-role companies
   - Each bullet point should be action-verb + quantified result
   - Include `tags` with relevant technologies
   - English: concise, metrics-driven
   - Chinese: 1 page limit, even more concise

2. **education.typ** — Education
   - Use `cv-entry` for each degree
   - Include relevant coursework/research only if relevant to target job

3. **projects.typ** — Projects
   - Only include projects relevant to the target job
   - Use `cv-entry` with `tags`

4. **skills.typ** — Skills
   - Use `cv-skill` with `h-bar()` separators
   - Order categories by relevance to target job
   - Put strongest/most relevant skills first in each category

5. **certificates.typ** — Honors & Certifications
   - Use `cv-honor` for each item
   - Only include relevant certifications

#### brilliant-cv API Quick Reference

```typst
// Imports
#import "@preview/brilliant-cv:3.2.0": cv-section, cv-entry, cv-entry-start, cv-entry-continued, cv-skill, cv-honor, h-bar

// Section header
#cv-section("Section Title")

// Standard entry (single role at a company)
#cv-entry(
  title: [Role],
  society: [*Company*],
  date: [YYYY/MM - YYYY/MM],
  location: [City],
  description: list(
    [Bullet point 1],
    [Bullet point 2],
  ),
  tags: ("Tag1", "Tag2"),
)

// Multi-role at same company (requires display_entry_society_first = true)
#cv-entry-start(
  society: [*Company*],
  location: [City],
)
#cv-entry-continued(
  title: [Role 2],
  date: [YYYY/MM - YYYY/MM],
  description: list([...]),
  tags: ("Tag1",),
)

// Skill row
#cv-skill(
  type: [Category],
  info: [Skill1 #h-bar() Skill2 #h-bar() Skill3],
)

// Honor/certification
#cv-honor(
  date: [YYYY],
  title: [Title],
  issuer: [Issuer],
  url: "",
  location: [],
)
```

#### Important Typst Syntax Rules

- Content strings use `[square brackets]`, not `"quotes"`
- Tags arrays use `("parentheses",)` — note trailing comma for single-element tuples
- `description` uses `list(...)` not array syntax
- Logo paths from module files need `../` prefix: `image("../assets/logos/company.png")`
- Bold text: `[*bold text*]`

### Step 6: Update cv.typ Module Order

Based on the strategy, update the `import-modules` call in `cv.typ` to reflect the recommended section order. For example, a senior SRE role might use:
```typst
#import-modules(("professional", "skills", "projects", "education", "certificates"))
```

### Step 7: Update metadata.toml

- Set `[inject].inject_keywords = true` and update `[inject].injected_keywords_list` with ATS keywords
- Update `[lang.en].header_quote` and `[lang.zh].header_quote` to match target role

### Step 8: Compile PDFs

```bash
make en && make zh
```

If compilation fails, read the error message and fix the offending module. Common issues:
- Missing closing brackets/parentheses
- Wrong parameter types (string vs content)
- Undefined variables

### Step 9: Output

Copy to named files:
```bash
# Extract name from metadata.toml
name=$(grep 'first_name' metadata.toml | head -1 | sed 's/.*= *"//;s/".*//')$(grep 'last_name' metadata.toml | head -1 | sed 's/.*= *"//;s/".*//')
job="JobTitle"  # sanitized from input
cp output/resume-en.pdf "output/${name}-${job}-en.pdf"
cp output/resume-zh.pdf "output/${name}-${job}-zh.pdf"
```

Report: "简历已生成！文件位于 `output/` 目录。"

## Page Limits

- **Chinese version**: MUST fit in 1 page. Be ruthless about cutting.
- **English version**: 1-2 pages acceptable.

If content overflows, reduce bullet points, remove less relevant entries, or shrink descriptions. Never sacrifice readability.

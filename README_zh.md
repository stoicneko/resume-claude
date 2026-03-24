# resume-claude

基于 [Claude Code](https://docs.anthropic.com/en/docs/claude-code) + [Typst](https://typst.app/) 的 AI 驱动简历管理系统，支持多模板切换。

**Markdown 为唯一数据源，AI 生成 N 份定制简历。**

[English](README.md)

## 模板

| 模板 | 风格 | 构建命令 |
|------|------|----------|
| [brilliant-cv](https://github.com/mintyfrankie/brilliant-cv)（默认） | 现代、彩色侧栏、标签化条目 | `make en` |
| [billryan](https://github.com/billryan/resume) | 经典、简洁线条、紧凑排版 | `make billryan-en` |

## 工作原理

```
experiences/*.md            (Markdown — 唯一数据源)
       ↓  /generate-resume [--template billryan] [职位描述]
modules_en/*.typ            (brilliant-cv Typst 模块)
modules_billryan_en/*.typ   (billryan Typst 模块)
       ↓  typst compile
output/*.pdf                (可直接投递的简历)
```

1. 在 `experiences/` 目录下用 Markdown 维护你的所有经历。
2. 粘贴目标职位描述，运行 `/generate-resume` — Claude Code 会读取经历库，筛选最相关的内容，生成针对该职位的中英文 Typst 模块。
3. 选择模板风格：使用 `--template billryan` 获得经典排版，或省略使用默认的 brilliant-cv。
4. Typst 将模块编译为精美的 PDF。

## 快速开始

### 前置依赖

- [Typst CLI](https://github.com/typst/typst) >= 0.14.0
- [Claude Code](https://docs.anthropic.com/en/docs/claude-code)（用于 AI 简历生成）
- 字体：Source Sans 3、Roboto（brilliant-cv）；IBM Plex Serif（billryan）；Noto Sans CJK SC（中文）

### 构建

```bash
# brilliant-cv 模板（默认）
make en          # 英文 PDF  → output/resume-en.pdf
make zh          # 中文 PDF  → output/resume-zh.pdf
make all         # 全部（先清理）

# billryan 模板
make billryan-en    # 英文 PDF  → output/resume-billryan-en.pdf
make billryan-zh    # 中文 PDF  → output/resume-billryan-zh.pdf
make billryan       # 全部（先清理）

# 监听模式（文件变更时自动重新构建）
make watch-en / make watch-billryan-en
make watch-zh / make watch-billryan-zh
```

### Claude Code 斜杠命令

在 Claude Code 会话中运行：

| 命令 | 说明 |
|------|------|
| `/init [文本]` | 初始化经历库（可从现有简历或 LinkedIn 导入） |
| `/generate-resume [--template billryan] [职位]` | 根据目标职位描述生成定制化 Typst 模块 |
| `/add-experience [描述]` | 向经历库添加新条目 |

## 目录结构

```
.
├── experiences/              # 数据源（Markdown）
│   ├── profile.md            #   个人信息 + 教育背景
│   ├── work/                 #   工作经历（每家公司一个文件）
│   ├── projects.md           #   个人/开源项目
│   ├── skills.md             #   完整技能清单
│   └── honors.md             #   荣誉、证书、量化指标
├── modules_en/               # brilliant-cv 模块（英文）
├── modules_zh/               # brilliant-cv 模块（中文）
├── modules_billryan_en/      # billryan 模块（英文）
├── modules_billryan_zh/      # billryan 模块（中文）
├── templates/billryan/       # billryan 模板 + SVG 图标
├── jobs/                     # 目标职位描述
├── cv.typ                    # brilliant-cv 入口
├── cv-billryan.typ           # billryan 入口
├── metadata.toml             # 共享配置
├── Makefile                  # 构建命令
└── output/                   # 生成的 PDF（已 git-ignore）
```

## 自定义

### `metadata.toml`

- **模板** — `template = "brilliant-cv"` 或 `"billryan"`（`/generate-resume` 的默认值）
- **个人信息** — 姓名、邮箱、电话、GitHub、LinkedIn 等
- **布局** — 主题色、字体、页眉对齐、纸张大小（brilliant-cv）
- **ATS 关键词** — 设置 `inject_keywords = true` 并填写 `injected_keywords_list`
- **语言** — 默认 `"en"`，通过 `--input language=zh` 覆盖

### 模块顺序

编辑入口文件（`cv.typ` 或 `cv-billryan.typ`）中的 `import-modules(...)` 调用：

```typst
#import-modules(("professional", "skills", "projects", "education", "certificates"))
```

## 核心设计理念

- **Markdown 优先**：所有经历数据存放在 `experiences/*.md`。Typst 模块是生成产物，不要手动编辑。
- **多模板支持**：同一份数据源，可选现代（brilliant-cv）或经典（billryan）风格。
- **中英双语**：中文（最多 1 页）和英文（1-2 页）从同一数据源生成。
- **按职位定制**：每次 `/generate-resume` 会根据目标岗位筛选和突出不同的经历。
- **ATS 友好**：支持隐藏关键词注入，通过 ATS 筛选。

## 依赖

| 依赖 | 版本 | 用途 |
|------|------|------|
| [Typst](https://typst.app/) | >= 0.14.0 | 文档编译 |
| [brilliant-cv](https://github.com/mintyfrankie/brilliant-cv) | 3.2.0 | 现代简历模板（首次编译自动下载） |
| [Claude Code](https://docs.anthropic.com/en/docs/claude-code) | 最新版 | AI 简历生成 |

## 许可证

MIT

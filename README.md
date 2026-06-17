# skill-master

> Claude Code 精选 Skill 合集 — 整合实用自定义技能与开源工具，覆盖文档生成、科研计算、学术写作、视频渲染等场景。

---

## 项目简介

skill-master 是一个 Claude Code 技能仓库，汇集高质量的自定义 Skill，为开发者和研究人员提供开箱即用的 AI 辅助工作流。每个 Skill 遵循 Agent Skills Open Standard，支持跨平台安装和使用。

---

## 技能总览

| 技能名称 | 版本 | 作者 | 许可证 | 简介 |
|---------|------|------|-------|------|
| [agent-skill-creator](#agent-skill-creator) | v6.0.0 | Francy Lisboa Charuto | MIT | 从工作流描述创建跨平台 Agent 技能 |
| [github-readme-writer-skill](#github-readme-writer-skill) | v1.0.0 | guyue356 | MIT | 中文 GitHub README 智能生成器 |
| [repo-manager-skill](#repo-manager-skill) | v1.0.0 | guyue356 | MIT | 仓库技能管理与README自动更新 |
| [research-writing-skill](#research-writing-skill) | v1.1.0 | guyue356 | MIT | 中文科研论文写作与润色 |

---

## 技能详情

### agent-skill-creator

**调用方式**：`/agent-skill-creator`

从工作流描述自动创建跨平台 Agent 技能。支持单技能、多 Agent 套件、模板创建、交互式配置、跨平台导出和规范验证。兼容 17 个平台。

**核心能力**：
- 从自然语言描述、文件、URL、截图生成完整技能
- 支持 Claude Code、GitHub Copilot、Cursor、Windsurf 等 17 个平台
- 自动安全扫描和规范验证
- 团队技能注册表管理

**触发词**：create agent for, automate workflow, create skill for, 需要自动化

---

### github-readme-writer-skill

**调用方式**：`/github-readme-writer`

深度分析项目仓库，生成高质量中文 GitHub README.md。自动分析源代码、配置、API、数据库、Agent 代码等，生成包含 Mermaid 架构图、技术栈表格、AI 工作流分析等 20+ 章节的完整文档。

**核心能力**：
- 自动识别项目类型（Web/CLI/库/AI Agent/微服务）
- 生成 Mermaid 系统架构图和流程图
- AI 项目专用分析（Agent 架构、Prompt Pipeline、RAG 流程）
- 技术栈表格、项目结构目录树

**触发词**：README生成, 写README, 生成项目文档, github readme

---

### research-writing-skill

**调用方式**：自然语言触发

中文科研论文写作、修改、润色、段落起草、审稿回复和手稿论证规划。默认使用中文学术表达，保留英文标题、公式、变量、方法名和引用。

**核心能力**：
- 论文各章节撰写（摘要、引言、方法、结果、讨论）
- 论文润色与修改
- 审稿意见回复（Rebuttal）
- LaTeX/Overleaf 文本处理

**触发词**：写论文, 润色论文, 审稿回复, 论文修改

---

### repo-manager-skill

**调用方式**：`/repo-manager`

管理和更新 skill-master 仓库中的技能集合。支持添加新技能、同步已安装技能、自动更新 README.md、管理工具与资源列表。

**核心能力**：
- 从 ~/.claude/skills/ 添加技能到仓库
- 双向同步已安装技能与仓库版本
- 自动更新 README.md（总览表格、详情、项目结构）
- 添加非标准开源项目到"工具与资源"板块

**触发词**：添加技能, 同步技能, 更新README, 管理技能

---

## 工具与资源

收录与 Claude Code / AI Agent 生态相关的开源项目，非标准 Skill，但值得参考和集成。

| 项目 | Stars | 语言 | 许可证 | 简介 |
|------|-------|------|-------|------|
| [Hyperframes](#hyperframes) | 28k+ | TypeScript | Apache 2.0 | Write HTML. Render video. Built for agents. |

### Hyperframes

**仓库**：[heygen-com/hyperframes](https://github.com/heygen-com/hyperframes)

HeyGen 开源的视频渲染框架。用 HTML 编写内容，渲染为视频，专为 AI Agent 设计。基于 TypeScript，集成 FFmpeg、Puppeteer、GSAP 等技术，支持 MCP 协议。

**核心能力**：
- 用 HTML/CSS 编写视频内容
- 自动渲染为视频文件
- 为 AI Agent 提供可编程接口
- 支持动画和复杂布局

**适用场景**：AI Agent 自动生成视频、产品介绍视频、数据可视化动画

---

## 安装

### Claude Code

```bash
git clone <repo-url> ~/.claude/skills/skill-master
```

### GitHub Copilot CLI

```bash
git clone <repo-url> ~/.copilot/skills/skill-master
```

### Cursor（项目级）

```bash
git clone <repo-url> .cursor/skills/skill-master
```

### 其他平台

```bash
# Codex CLI / Gemini CLI
git clone <repo-url> ~/.agents/skills/skill-master

# Cline
git clone <repo-url> ~/.cline/skills/skill-master

# Windsurf
git clone <repo-url> ~/.codeium/windsurf/skills/skill-master
```

---

## 快速开始

安装完成后，打开新的 Claude Code 会话：

```
/github-readme-writer                    # 生成项目 README
/agent-skill-creator 每周我都要...        # 创建自动化技能
/repo-manager 添加新技能                  # 管理仓库技能
帮我写一篇论文的摘要                       # 激活论文写作
```

---

## 项目结构

```text
skill-master/
├── agent-skill-creator/          # Agent 技能创建器
│   └── SKILL.md
├── github-readme-writer-skill/   # 中文 README 生成器
│   ├── SKILL.md
│   ├── AGENTS.md
│   ├── references/
│   ├── assets/
│   ├── install.sh
│   └── README.md
├── repo-manager-skill/           # 仓库技能管理器
│   ├── SKILL.md
│   ├── AGENTS.md
│   ├── references/
│   ├── install.sh
│   └── README.md
├── research-writing-skill/       # 科研论文写作
│   ├── SKILL.md
│   ├── AGENTS.md
│   ├── references/
│   ├── install.sh
│   └── README.md
├── LICENSE                       # MIT 许可证
└── README.md                     # 本文件
```

---

## 贡献指南

欢迎贡献新的 Skill！

1. Fork 本仓库
2. 创建你的 Skill 目录（遵循 `-skill` 命名规范）
3. 编写 `SKILL.md`（参考 Agent Skills Open Standard）
4. 提交 Pull Request

**Skill 规范要求**：
- 目录名以 `-skill` 结尾
- 包含 `SKILL.md` 文件，以 `# /skill-name` 开头
- Frontmatter 包含 `name`、`description` 字段
- SKILL.md 不超过 500 行

---

## License

MIT License - 详见 [LICENSE](LICENSE)

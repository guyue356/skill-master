# README.md 完整结构规范

## 文件位置

`d:\hsj\Github\skill-master\README.md`

## 结构大纲

```markdown
# skill-master

> 一句话描述仓库定位

---

## 项目简介

2-3句话说明仓库用途和目标用户。

---

## 技能总览

| 技能名称 | 版本 | 作者 | 许可证 | 简介 |
|---------|------|------|-------|------|
| [name](#name) | vX.Y.Z | author | MIT | 一句话简介 |

---

## 技能详情

### skill-name

**调用方式**：`/skill-name`

一句话描述。

**核心能力**：
- 能力1
- 能力2
- 能力3

**触发词**：词1, 词2, 词3

---

## 工具与资源

收录与 Claude Code / AI Agent 生态相关的开源项目，非标准 Skill，但值得参考和集成。

| 项目 | Stars | 语言 | 许可证 | 简介 |
|------|-------|------|-------|------|
| [Name](#name) | Xk+ | Lang | License | 简介 |

### tool-name

**仓库**：[owner/repo](https://github.com/owner/repo)

一句话描述。

**核心能力**：
- 能力1

**适用场景**：场景描述

---

## 安装

### Claude Code
\`\`\`bash
git clone <repo-url> ~/.claude/skills/skill-master
\`\`\`

### GitHub Copilot CLI
\`\`\`bash
git clone <repo-url> ~/.copilot/skills/skill-master
\`\`\`

### Cursor（项目级）
\`\`\`bash
git clone <repo-url> .cursor/skills/skill-master
\`\`\`

### 其他平台
\`\`\`bash
# Codex CLI / Gemini CLI
git clone <repo-url> ~/.agents/skills/skill-master
# Cline
git clone <repo-url> ~/.cline/skills/skill-master
# Windsurf
git clone <repo-url> ~/.codeium/windsurf/skills/skill-master
\`\`\`

---

## 快速开始

安装完成后，打开新的 Claude Code 会话：

\`\`\`
/skill-name                    # 使用说明
\`\`\`

---

## 项目结构

\`\`\`text
skill-master/
├── skill-name/               # 技能说明
│   ├── SKILL.md
│   ├── AGENTS.md
│   ├── references/
│   ├── install.sh
│   └── README.md
├── LICENSE
└── README.md
\`\`\`

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
```

## 更新规则

### 技能总览表格

- 按技能名称字母排序
- 版本号从 SKILL.md frontmatter 的 `metadata.version` 提取
- 作者从 `metadata.author` 提取
- 许可证从 `license` 字段提取
- 简介从 `description` 字段截取第一句

### 技能详情

- 每个技能一个三级标题
- 包含：调用方式、核心能力（3-5条）、触发词
- 调用方式使用行内代码格式

### 工具与资源

- 独立于技能表格
- 包含 GitHub 链接、Stars、语言、许可证
- 每个工具有详情章节

### 项目结构

- 使用 text 代码块
- 每个目录附一句说明
- 按字母排序

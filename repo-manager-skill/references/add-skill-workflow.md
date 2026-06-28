# 添加技能详细流程

## 从已安装目录添加

### 第一步：扫描差异

自动扫描两个目录，找出差异：

```bash
# 列出已安装技能
ls ~/.claude/skills/

# 列出仓库技能
ls d:\hsj\Github\skill-master\
```

对比后得到未入库列表（已安装 - 仓库）。

### 第二步：让用户选择

如果未入库技能数量 ≥ 2，使用 **AskUserQuestion** 工具：

```json
{
  "questions": [{
    "question": "检测到 N 个已安装但未入库的技能，选择要添加哪一个？",
    "header": "选择技能",
    "options": [
      { "label": "skill-name-1", "description": "从 SKILL.md 提取的一句话简介" },
      { "label": "skill-name-2", "description": "从 SKILL.md 提取的一句话简介" },
      { "label": "skill-name-3", "description": "从 SKILL.md 提取的一句话简介" }
    ],
    "multiSelect": true
  }]
}
```

**规则**：
- 每个选项的 `label` 是技能目录名
- 每个选项的 `description` 从该技能 SKILL.md 的 `description` 字段提取
- `multiSelect: true` 允许用户一次添加多个
- 如果只有一个未入库技能，跳过选择直接添加

### 第三步：前置检查

1. 确认源目录存在：`~/.claude/skills/<skill-name>/`
2. 确认目标不存在：`d:\hsj\Github\skill-master\<skill-name>/`
3. 确认源目录包含 `SKILL.md`

### 第四步：复制内容

```bash
cp -R ~/.claude/skills/<skill-name> d:\hsj\Github\skill-master\<skill-name>
```

### 第五步：验证清单

- [ ] SKILL.md 存在且以 `# /skill-name` 开头
- [ ] frontmatter 包含 `name` 和 `description`
- [ ] 目录名与 SKILL.md 中的 `name` 一致
- [ ] 无硬编码密钥或敏感信息

### 第六步：更新 README.md

1. 提取 SKILL.md 的 frontmatter 信息（name、version、author、license、description）
2. 添加到技能总览表格
3. 添加技能详情章节
4. 更新项目结构目录树

## 从零创建新技能

### 目录结构

```
<skill-name>/
├── SKILL.md          # 必需
├── AGENTS.md         # 推荐
├── install.sh        # 推荐
├── README.md         # 推荐
└── references/       # 可选
```

### SKILL.md 模板

```yaml
---
name: <skill-name>
description: >-
  一句话描述...
license: MIT
metadata:
  author: <author>
  version: 1.0.0
  created: YYYY-MM-DD
  last_reviewed: YYYY-MM-DD
  review_interval_days: 90
---

# /<skill-name> — 简短描述

你是...你的任务是...

## Trigger

用户通过以下方式激活：

\`\`\`
/<skill-name>
\`\`\`

## 核心能力

...

## 工作流程

...
```

### install.sh 模板

参见 `github-readme-writer-skill/install.sh`，只需修改 `SKILL_NAME` 变量。

### AGENTS.md 模板

简短版本的 SKILL.md，包含：
- 技能用途
- 激活条件
- 核心工作
- 关键规则
- 指向 SKILL.md 的引用

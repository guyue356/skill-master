---
name: repo-manager-skill
description: >-
  管理和更新 skill-master 仓库中的技能集合。支持添加新技能、同步已安装技能、更新README.md、
  管理工具与资源列表、更新技能元数据。激活词: 更新仓库, 添加技能, 同步技能, 更新README,
  manage repo, add skill, sync skills, update readme, 管理技能.
license: MIT
metadata:
  author: guyue356
  version: 1.0.0
  created: 2026-06-17
  last_reviewed: 2026-06-17
  review_interval_days: 90
---

# /repo-manager — skill-master 仓库管理器

你是一名仓库管理助手，负责维护 skill-master 技能集合的完整性。

你的任务是帮助用户管理仓库中的技能：添加、更新、同步、删除，以及自动维护 README.md。

## Trigger

用户通过以下方式激活：

```
/repo-manager
/repo-manager 添加新技能
/repo-manager 同步所有技能
/repo-manager 更新README
添加技能到仓库
同步已安装的技能
更新仓库README
管理技能
```

## 核心能力

### 1. 添加技能

从 `~/.claude/skills/` 复制技能到仓库，或在仓库中创建新技能。

**操作流程**：
1. 确认技能来源（已安装 / 新建）
2. 复制或创建技能目录到 `d:\hsj\Github\skill-master\`
3. 验证 SKILL.md 存在且格式正确
4. 自动更新 README.md 的技能总览表格和技能详情
5. 自动更新 README.md 的项目结构

**触发词**：添加技能, add skill, 导入技能

### 2. 同步技能

将已安装的技能版本同步到仓库，或反向同步。

**操作流程**：
1. 比较 `~/.claude/skills/<name>` 与 `d:\hsj\Github\skill-master\<name>` 的差异
2. 显示差异摘要（文件变更、版本号）
3. 用户确认方向（仓库→已安装 / 已安装→仓库）
4. 执行同步
5. 如有变更，提示更新 README.md

**触发词**：同步技能, sync skills, 更新技能

### 3. 更新 README.md

扫描仓库中所有技能目录，自动更新 README.md：

- 技能总览表格（名称、版本、作者、许可证、简介）
- 技能详情章节（调用方式、核心能力、触发词）
- 项目结构目录树
- 工具与资源表格

**触发词**：更新README, update readme, 刷新文档

### 4. 管理工具与资源

添加或更新非标准 Skill 的开源项目到"工具与资源"板块。

**操作流程**：
1. 获取项目信息（GitHub API / 用户提供）
2. 添加到 README.md 的"工具与资源"表格
3. 创建详情章节

**触发词**：添加工具, 添加资源, add tool

### 5. 查看状态

列出仓库中所有技能的状态摘要。

**输出**：
- 技能名称、版本、作者
- 文件完整性检查（SKILL.md、AGENTS.md、install.sh、README.md）
- 与已安装版本的差异

**触发词**：查看状态, list skills, 技能列表

## 工作目录

- **仓库路径**：`d:\hsj\Github\skill-master\`
- **已安装路径**：`$HOME/.claude/skills/`

## README.md 更新规则

更新 README.md 时遵循以下结构：

```markdown
# skill-master
> 一句话描述

## 项目简介
## 技能总览          ← 表格：名称、版本、作者、许可证、简介
## 技能详情          ← 每个技能的详细说明
## 工具与资源        ← 非标准Skill的开源项目
## 安装
## 快速开始
## 项目结构          ← 目录树
## 贡献指南
## License
```

### 技能总览表格格式

```markdown
| 技能名称 | 版本 | 作者 | 许可证 | 简介 |
|---------|------|------|-------|------|
| [name](#name) | vX.Y.Z | author | MIT | 一句话简介 |
```

### 技能详情格式

```markdown
### skill-name

**调用方式**：`/skill-name`

一句话描述。

**核心能力**：
- 能力1
- 能力2

**触发词**：词1, 词2, 词3
```

### 工具与资源表格格式

```markdown
| 项目 | Stars | 语言 | 许可证 | 简介 |
|------|-------|------|-------|------|
| [Name](#name) | Xk+ | Lang | License | 简介 |
```

## 参考文档

- `references/add-skill-workflow.md` — 添加技能的详细流程
- `references/readme-structure.md` — README.md 的完整结构规范

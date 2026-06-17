# /repo-manager — skill-master 仓库管理器

你是一名仓库管理助手，负责维护 skill-master 技能集合的完整性。

## 激活条件

当用户请求以下内容时激活此技能：
- 添加技能到仓库 / add skill
- 同步已安装的技能 / sync skills
- 更新仓库README / update readme
- 管理技能 / 管理仓库
- 添加工具/资源

## 核心工作

1. **添加技能** — 从 ~/.claude/skills/ 复制到仓库，或新建
2. **同步技能** — 比较差异，双向同步
3. **更新README** — 扫描技能目录，自动更新总览表格、详情、项目结构
4. **管理工具** — 添加非标准开源项目到"工具与资源"板块
5. **查看状态** — 列出所有技能的状态和完整性

## 关键路径

- 仓库路径：`d:\hsj\Github\skill-master\`
- 已安装路径：`$HOME/.claude/skills/`

## 关键规则

- 添加技能后必须同步更新 README.md
- README.md 保持统一的格式和结构
- 技能目录名遵循 `-skill` 命名规范
- 验证 SKILL.md 的 frontmatter 格式

完整规范见 SKILL.md。

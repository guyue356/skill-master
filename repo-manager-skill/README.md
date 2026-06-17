# repo-manager-skill

管理和更新 skill-master 仓库中的技能集合。

## 功能

- 添加新技能到仓库（从已安装目录或新建）
- 同步已安装技能与仓库版本
- 自动更新 README.md（总览表格、详情、项目结构）
- 管理"工具与资源"列表
- 查看所有技能状态

## 安装

### Claude Code

```bash
git clone <repo-url> ~/.claude/skills/repo-manager-skill
```

### 自动安装

```bash
cd repo-manager-skill
chmod +x install.sh
./install.sh
```

## 使用

```
/repo-manager 添加新技能                    # 从 ~/.claude/skills/ 添加
/repo-manager 同步所有技能                   # 双向同步
/repo-manager 更新README                    # 刷新 README.md
/repo-manager 添加工具 https://github.com/...  # 添加开源项目
/repo-manager 查看状态                      # 列出所有技能
```

## License

MIT

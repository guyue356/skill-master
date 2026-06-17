# research-writing-skill

中文科研论文写作、修改、润色、段落起草、审稿回复和手稿论证规划。

## 功能

- 论文各章节撰写（摘要、引言、方法、结果、讨论、结论）
- 论文润色与修改
- 审稿意见回复（Rebuttal）
- LaTeX/Overleaf 文本处理
- 保留英文标题、公式、变量名和引用

## 安装

### Claude Code

```bash
git clone <repo-url> ~/.claude/skills/research-writing-skill
```

### GitHub Copilot CLI

```bash
git clone <repo-url> ~/.copilot/skills/research-writing-skill
```

### Cursor（项目级）

```bash
git clone <repo-url> .cursor/skills/research-writing-skill
```

### 自动安装

```bash
cd research-writing-skill
chmod +x install.sh
./install.sh
```

## 使用

```
/research-writing 帮我写论文的引言部分
/research-writing 润色这段方法描述
写论文
润色论文
审稿回复
```

## 章节策略

| 章节 | 重点 |
|------|------|
| 研究背景/引言 | 现实背景与研究意义 |
| 文献综述 | 研究进展与现有不足 |
| 数据来源 | 获取渠道、时间范围、样本构成、可靠性 |
| 研究方法 | 模型构建、变量设计、研究流程 |
| 实证分析 | 结果解释与逻辑推导 |
| 结论与建议 | 总结发现并提出建议 |

## 输出规则

- 完整段落写作，不使用要点列表
- 中英文之间不留无意义空格
- 不用冒号、破折号作为句子连接词
- 不加粗，避免AI痕迹

## License

MIT

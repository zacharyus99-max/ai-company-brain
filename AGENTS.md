# AGENTS.md · 所有 Agent 通用规则

> Universal rules for every AI agent using this vault.  
> 语言：中文为主。示例公司「示例科技 AI Studio」与 Agent-1/2/3、项目A/B 均为**虚构占位**。

---

## 开工必做（每次会话开始）

1. 先读 [[INDEX]]（导航地图）  
2. 再读本文件（规则）  
3. 若你是某个具体 Agent：打开 `01_Agent花名册/` 下你的那一页，确认角色与边界  
4. 需要背景时再读 `00_公司总览/`

## 写记忆必做

| 规则 | 说明 |
|---|---|
| **一事一笔记** | 一个事实 / 一个决策 / 一条教训 = 一个 `.md` 文件 |
| **放对文件夹** | 事实→`02_共享记忆/facts/`；决策→`decisions/`；教训→`lessons/`；项目过程→`03_项目/<项目名>/`；当天流水→`04_日志/` |
| **用模板** | 从 `05_模板/` 复制，保留 frontmatter |
| **写日记** | 当天有实质工作，就在 `04_日志/YYYY-MM-DD.md` 追加一节（没有则新建） |
| **更新索引** | 新增重要笔记后，如 INDEX 需要入口，顺手补一行链接 |

## Frontmatter 最低要求

```yaml
---
title: "简短标题"
type: fact          # fact | decision | lesson | agent | project | journal | overview
status: active      # draft | active | archived
owner: Agent-1      # 谁写下的 / 谁负责
created: 2026-10-27
updated: 2026-10-27
tags: [示例]
---
```

## 严禁写入（Never store secrets）

- 密码、API Key、Token、Cookie、私钥、`.env` 全文  
- 银行卡号、身份证、真实客户隐私  
- 任何可用于登录或支付的凭证  

需要记录「某处有凭证」时，只写**存放位置的别名**（例如「见本机密码管理器条目：项目A-API」），不写具体值。

## 提交约定（Commit）

```
feat(memory): 新增事实「……」
fix(memory): 更正决策「……」
docs: 更新 INDEX / README
chore(journal): 2026-10-27 Agent-1 日志
```

- 小步提交；推送前先 `git pull --rebase`（或依赖 Obsidian Git 的 pull-before-push）  
- **禁止** `git push --force` 到 `main`

## 冲突时

1. 不要覆盖别人的笔记正文  
2. 保留双方内容，用「争议」小节标出，并在日记里记一笔  
3. 细节见 [[SYNC]]

## 角色边界（示例）

| Agent | 角色（占位） | 默认可写 |
|---|---|---|
| Agent-1 | 研究员 | `02_共享记忆/facts/`、`03_项目/项目A/`、日记 |
| Agent-2 | 运营 | `02_共享记忆/decisions/`、`03_项目/项目B/`、日记 |
| Agent-3 | 客服 | `02_共享记忆/lessons/`、相关项目 FAQ、日记 |

真实分工请改 `01_Agent花名册/`。


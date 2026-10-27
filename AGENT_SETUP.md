# AGENT_SETUP · 把知识库挂到任意 Agent

> 适用于 Grok Bot / Codex / Claude / Cursor 等任意能读写本地文件或 Git 仓库的 Agent。

---

## 1. 准备路径

```bash
# 示例路径，请改成你的实际目录
git clone <你的仓库地址> ~/Obsidian/ai-company-brain
```

把该绝对路径记下来，写进 Agent 的工作区或系统提示。

## 2. 每次会话协议

1. **开始**：读取 `INDEX.md` + `AGENTS.md`（必读）  
2. **按需**：读取相关项目 README、共享记忆、花名册中自己的那一页  
3. **执行任务**：过程中的稳定结论写入正确文件夹（一事一笔记，用 `05_模板/`）  
4. **结束**：更新 `04_日志/YYYY-MM-DD.md` → commit → push（或依赖 Obsidian Git）

## 3. 复制粘贴：系统提示词片段（System Prompt Snippet）

把下面整段贴进 Agent 的系统提示 / 自定义指令 / AGENTS 附加规则：

```text
你是接入「AI 公司知识库」的协作 Agent。仓库是一个 Obsidian Vault（Markdown + Git）。

【必做】
1. 每次会话开始先读：INDEX.md、AGENTS.md。
2. 若花名册里有你的页面，再读 01_Agent花名册/ 下对应笔记，遵守角色与范围。
3. 长期事实写 02_共享记忆/facts/；决策写 decisions/；教训写 lessons/；
   项目过程写 03_项目/<项目名>/；当天流水追加 04_日志/YYYY-MM-DD.md。
4. 一事一笔记；新建时复制 05_模板/ 对应模板，保留 YAML frontmatter。
5. 严禁写入密码、Token、Cookie、私钥、.env 内容或任何可登录凭证。
6. 任务结束：更新当日日志 → git add → git commit（用约定前缀）→ git push。
   推送前先 git pull --rebase（或 pull --rebase --autostash）。禁止 force push。

【风格】
- 中文为主，简洁。
- 示例公司「示例科技 AI Studio」、项目A/B、Agent-1/2/3 是虚构占位；真实业务请用用户给定名称，不要编造。
- 不确定放哪就先问，或写入日记并标注「待归档」。
```

## 4. 各产品怎么挂（示意）

| 产品 | 建议做法 |
|---|---|
| **Cursor** | 把仓库加入工作区；根目录已有 `AGENTS.md`，可再把上面片段放进 User Rules |
| **Claude / Codex** | 把片段放进自定义指令；用工具读仓库路径下的文件 |
| **Grok Bot** | 把克隆路径告诉 Bot；要求开场读 INDEX + AGENTS；需要时用本机 Shell/`gh` 同步 |

## 5. 验收清单

- [ ] Agent 能读到 `INDEX.md`  
- [ ] 试写一条带「示例_」前缀的事实笔记并 push 成功  
- [ ] Obsidian 刷新后能看到该笔记  
- [ ] 日记里有对应记录  


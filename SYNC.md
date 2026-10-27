# SYNC · 本地 ↔ GitHub 双向同步

> 目标：人类用 Obsidian 改、Agent 用 Git 改，最终都汇合到同一个远程仓库。  
> **永不 force push。**

---

## 方案 A（推荐 · 最简单）：Obsidian Git 插件

1. Obsidian → 设置 → 第三方插件 → 关闭受限模式  
2. 浏览 → 搜索 **Obsidian Git** → 安装并启用  
3. 打开插件设置，建议：

| 设置项 | 推荐值 |
|---|---|
| Pull on startup | ✅ 开 |
| Auto commit-and-sync interval | `5`（分钟） |
| Pull changes before push | ✅ 开 |
| Commit message | 可用默认，或 `vault backup: {{date}}` |

4. 本机需已配置好 Git 账号与对该私有库的访问权限（HTTPS + token，或 SSH key）

适合：日常人类编辑。Agent 仍可用命令行 push；插件会在下次启动/定时时拉下来。

---

## 方案 B：跨平台脚本

仓库自带：

- `scripts/sync.sh` — macOS / Linux  
- `scripts/sync.ps1` — Windows PowerShell  

行为（安全）：

1. `git pull --rebase --autostash`  
2. 若有变更：`git add -A` → `git commit`（有改动才提交）  
3. `git push`  
4. **没有** `--force`

### 手动跑

```bash
# macOS / Linux
chmod +x scripts/sync.sh
./scripts/sync.sh

# Windows PowerShell
.\scripts\sync.ps1
```

### 定时（可选）

**cron（每 5 分钟）示例：**

```cron
*/5 * * * * cd /path/to/ai-company-brain && ./scripts/sync.sh >> /tmp/ai-brain-sync.log 2>&1
```

**Windows 任务计划程序：**  
操作 → 启动程序 → `powershell.exe`  
参数：`-ExecutionPolicy Bypass -File "D:\path\to\ai-company-brain\scripts\sync.ps1"`  
触发器：每 5 分钟。

---

## 冲突怎么处理

1. 脚本/`pull --rebase` 失败时：**停手**，不要 force push  
2. 打开冲突文件，保留双方有用段落；可加小节：

```markdown
## ⚠ 待合并争议
- 来源 A：……
- 来源 B：……
- 建议：由人类选定后删除本小节
```

3. 解决后：

```bash
git add .
git rebase --continue   # 若在 rebase 中
# 或 git commit
git push
```

4. 在 `04_日志/` 记一笔「今日发生同步冲突，已人工合并」

---

## 多 Agent / 多设备建议

- 每人/每 Agent **小步提交、勤推送**，降低冲突面  
- 长期事实尽量「追加新笔记」而不是多人同时改同一大文件  
- `INDEX.md`、花名册改动前先 pull  


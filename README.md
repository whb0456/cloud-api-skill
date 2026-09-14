# DJI Cloud API Skill

离线版 DJI Cloud API 知识库，面向 Codex 及其他支持 `SKILL.md` 的 coding agent。
仓库根目录就是可分发的 skill 包：`SKILL.md` 提供查询协议，`references/` 保存文档快照。

> 数据快照：DJI Cloud API v1.16.1（2026-09），来源为 [DJI Developer 文档](https://developer.dji.com/)。
> 本项目与 DJI 官方没有隶属或背书关系。

## 功能覆盖

- Dock 1、Dock 2、Dock 3 与 DJI Pilot 2 上云集成
- MQTT Topic、物模型、OSD 属性、状态/事件/服务消息
- HTTP、WebSocket、JSBridge 接口参考
- DJI WPML 航线文件格式与动作定义
- DRC、直播、媒体、航线、固件、远程调试、HMS、日志和飞行安全
- 官方示例中的请求/响应结构、字段枚举、错误码和版本变更

知识库共包含 145 页官方文档，入口索引为 [`references/INDEX.md`](references/INDEX.md)。

## 安装到 Codex

### 一键安装

克隆仓库后，在仓库根目录运行对应平台的安装脚本：

```bash
./install.sh
```

Windows PowerShell：

```powershell
.\install.ps1
```

默认安装到用户级 `~/.agents/skills/dji-cloud-api/`（Windows 为 `%USERPROFILE%\\.agents\\skills\\dji-cloud-api\\`）。也可以通过 `CODEX_SKILL_DIR` 或 PowerShell 的 `-Destination` 指定其他目录。

### 方式一：项目级安装

将仓库根目录的两个内容复制到项目的 `.agents/skills/dji-cloud-api/`：

```bash
mkdir -p .agents/skills/dji-cloud-api
cp SKILL.md .agents/skills/dji-cloud-api/
cp -R references .agents/skills/dji-cloud-api/
```

Windows PowerShell：

```powershell
$dest = Join-Path (Get-Location) ".agents\skills\dji-cloud-api"
New-Item -ItemType Directory -Force $dest | Out-Null
Copy-Item -LiteralPath ".\SKILL.md" -Destination $dest -Force
Copy-Item -LiteralPath ".\references" -Destination $dest -Recurse -Force
```

### 方式二：用户级安装

```bash
git clone https://github.com/whb0456/cloud-api-skill.git
mkdir -p ~/.agents/skills/dji-cloud-api
cp cloud-api-skill/SKILL.md ~/.agents/skills/dji-cloud-api/
cp -R cloud-api-skill/references ~/.agents/skills/dji-cloud-api/
```

Windows PowerShell：

```powershell
git clone https://github.com/whb0456/cloud-api-skill.git
$dest = Join-Path $env:USERPROFILE ".agents\skills\dji-cloud-api"
$repo = Join-Path (Get-Location) "cloud-api-skill"
New-Item -ItemType Directory -Force $dest | Out-Null
Copy-Item -LiteralPath (Join-Path $repo "SKILL.md") -Destination $dest -Force
Copy-Item -LiteralPath (Join-Path $repo "references") -Destination $dest -Recurse -Force
```

安装完成后，重新打开 Codex 项目或新建会话，使 skill 被重新发现。`SKILL.md` 与 `references/` 必须位于同一目录，不能只复制 `SKILL.md`。

### 方式三：目录或 ZIP 导入

如果使用支持目录上传或 ZIP 导入的 Skills workflow，选择本仓库根目录，或将根目录打包为 ZIP。不要选择 `.agents/skills/dji-cloud-api/` 的父目录，也不要把 `work/` 加入发布包。

## 使用示例

安装后可以直接提问：

```text
查找 Dock 3 执行航线任务的 MQTT Topic、请求参数和响应示例。
```

```text
比较 M30、M3D 和 M4D 的 OSD 属性差异，并给出对应参考文件路径。
```

```text
根据 DJI WPML 文档检查这份航线中的动作和坐标系设置。
```

skill 会先读取 `references/INDEX.md` 定位主题，再读取最相关的 1~3 个文档，并在回答中给出参考文件路径。

## 目录结构

```text
.
├── SKILL.md                 # skill 元数据、查询协议和路由规则
├── references/
│   ├── INDEX.md             # 总索引
│   ├── overview/            # 概念、架构和产品支持
│   ├── api-reference/       # MQTT、HTTP、WebSocket、WPML、JSBridge
│   ├── feature-set/         # Pilot/Dock 功能流程
│   ├── quick-start/         # 官方 Demo 部署说明
│   ├── debug/               # 调试和日志
│   ├── error-code.md        # 错误码
│   └── faq.md               # FAQ
└── work/                    # 本地抓取/转换工作区，不属于发布包
```

## 数据来源与使用边界

这是面向 agent 查询的离线文档快照，不是 DJI SDK，也不替代 DJI 的最新在线文档或生产环境验证。文档中的 URL、设备编号、密码、Token 和网络地址均应视为示例或待替换值；请勿把示例凭据用于生产系统。

当官方文档版本更新时，应重新生成 `references/` 并同步更新 `SKILL.md` 中的版本说明和 `references/INDEX.md`。

## 许可与致谢

本项目只整理和索引 DJI Developer 公开文档，原始文档的版权及使用条款归其各自权利人所有。使用本项目时请遵守 DJI Developer 文档的许可、商标和服务条款。

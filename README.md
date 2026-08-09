# Beginner English Doodle Cards

用于制作 9:16 初级英语词汇卡片和配套场景插图的 Agent Skill。

## Install with skills CLI

Install it globally for all detected Agent runtimes:

```bash
npx -y skills add moshengAI/beginner-english-doodle-cards -g --all
```

只安装到当前使用的 Codex：

```bash
npx -y skills add moshengAI/beginner-english-doodle-cards -g --agent codex
```

安装后新建一次对话，然后可以使用 `$beginner-english-doodle-cards`。

## Install from an archive

如果不使用 `skills` CLI，也可以使用仓库中的安装脚本：

```bash
bash scripts/install.sh --all --archive /path/to/beginner-english-doodle-cards.skill.zip
```

脚本支持本地压缩包和 HTTP(S) 地址，并支持 `codex`、`claude`、`agents`、`grok` 或 `all` 目标。

## Contents

- `SKILL.md`：Skill 的行为、视觉规范和生成流程
- `agents/openai.yaml`：Agent 元数据
- `scripts/install.sh`：从目录或压缩包安装的辅助脚本
# Beginner English Doodle Cards

用于制作 9:16 初级英语词汇卡片和配套场景插图的 Agent Skill。

## Install with skills CLI

After this repository is published on GitHub, install it globally for all detected Agent runtimes:

```bash
npx -y skills add <your-github-username>/beginner-english-doodle-cards -g --all
```

只安装到当前使用的 Codex：

```bash
npx -y skills add <your-github-username>/beginner-english-doodle-cards -g --agent codex
```

安装后新建一次对话，然后可以使用 `$beginner-english-doodle-cards`。

## Install from an archive

如果不使用 `skills` CLI，也可以使用仓库中的安装脚本：

```bash
bash scripts/install.sh --all --archive /path/to/beginner-english-doodle-cards.skill.zip
```

脚本支持本地压缩包和 HTTP(S) 地址，并支持 `codex`、`claude`、`agents`、`grok` 或 `all` 目标。

## Contents

- `SKILL.md`：Skill 的行为、视觉规范和生成流程
- `agents/openai.yaml`：Agent 元数据
- `scripts/install.sh`：从目录或压缩包安装的辅助脚本

# BVSHOP × Elfsight 嵌入碼解析

## 給線上 Codex / Codex Web 延用方式

最穩做法是把規則放進專案 repo，不要只靠聊天貼文字。

適合放規則的機制：

1. `AGENTS.md`：專案共用規則，Codex 開始工作前會讀取。
2. `.agents/skills/`：可重複使用的技能資料夾。技能資料夾內放 `SKILL.md`。

建議結構：

```text
你的專案 repo/
├─ AGENTS.md
├─ docs/
│  └─ bvshop-elfsight-v1/
│     ├─ README.md
│     ├─ PROMPT_TEMPLATE.md
│     └─ BVSHOP_ELFSIGHT_CHECKLIST.md
└─ .agents/
   └─ skills/
      └─ bvshop-elfsight-v1/
         └─ SKILL.md
```

## AGENTS.md 核心規則

```md
# Project Instructions

## BVSHOP × Elfsight integration

When working on BVSHOP HTML blocks, Elfsight widgets, homepage sections, FAQ widgets, YouTube widgets, popup widgets, floating chat, or embedded third-party widgets, always follow the BVSHOP × Elfsight V1 rules.

Skill location:

- `.agents/skills/bvshop-elfsight-v1/SKILL.md`

Reference documents:

- `docs/bvshop-elfsight-v1/README.md`
- `docs/bvshop-elfsight-v1/PROMPT_TEMPLATE.md`
- `docs/bvshop-elfsight-v1/BVSHOP_ELFSIGHT_CHECKLIST.md`

Core rules:

- BVSHOP controls the outer container, spacing, layout, background, border radius, and inline CSS.
- Elfsight controls the widget body.
- Do not modify Elfsight script src.
- Do not modify the elfsight-app ID.
- Do not remove data-elfsight-app-lazy.
- Do not rewrite widget internals unless the user explicitly asks and accepts the risk.
- BVSHOP does not reliably support style tags, so output inline CSS only.
- Use iframe fallback only for static widgets when script embedding fails.
- Do not wrap floating widgets like chat, popup, announcement bar, or floating button inside a normal homepage section.
- Always output complete paste-ready HTML.
```

## 給線上 Codex 的任務提示詞

```text
請使用 repo 內的 BVSHOP × Elfsight V1 規格處理這次任務。

請先讀取：
1. AGENTS.md
2. .agents/skills/bvshop-elfsight-v1/SKILL.md
3. docs/bvshop-elfsight-v1/BVSHOP_ELFSIGHT_CHECKLIST.md

任務：
幫我把以下 Elfsight 安裝碼包成 BVSHOP 可貼上的 HTML 區塊。

要求：
- 不要修改 Elfsight script src
- 不要修改 elfsight-app ID
- 不要刪 data-elfsight-app-lazy
- 外層使用話佛牌色系
- 全部 CSS 寫成 inline style
- 輸出完整可貼上的 HTML
- 最後用 checklist 自檢一次

用途：
首頁 FAQ / YouTube Gallery / Popup / LINE Chat / 其他

程式碼如下：
[貼上 Elfsight 原始碼]
```

## 最穩工作流程

```text
1. 把這個 skill project 放進 GitHub repo
2. 確認根目錄有 AGENTS.md
3. 確認 .agents/skills/bvshop-elfsight-v1/SKILL.md 存在
4. 打開 Codex Web，選這個 repo
5. 任務提示詞要求它讀取 AGENTS.md + skill
6. 讓 Codex 修改或產出 BVSHOP HTML
7. 要它用 checklist 自檢
```

重點：給線上 Codex 用，不是貼一次就算；要把規則變成 repo 的一部分。

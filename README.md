# WAFO BVSHOP × Elfsight Codex Project

這個 repo 是給線上 Codex / Codex Web 使用的專案模板，用來處理「話佛牌 BVSHOP × Elfsight 外掛嵌入」任務。

核心原則：

> BVSHOP 管外層版面，Elfsight 管 widget 本體。外掛不要亂拆，外層好好包。

## 專案結構

```text
.
├─ AGENTS.md
├─ .agents/
│  └─ skills/
│     └─ bvshop-elfsight-v1/
│        └─ SKILL.md
├─ docs/
│  └─ bvshop-elfsight-v1/
│     ├─ README.md
│     ├─ PROMPT_TEMPLATE.md
│     ├─ BVSHOP_ELFSIGHT_CHECKLIST.md
│     └─ BVSHOP_Elfsight_嵌入碼解析.md
├─ examples/
│  ├─ static-widget-wrapper.html
│  ├─ floating-widget-template.html
│  └─ iframe-fallback-template.html
├─ codex-prompts/
│  └─ bvshop-elfsight-task.md
└─ scripts/
   └─ install-to-existing-repo.sh
```

## 給 Codex 的使用方式

在 Codex Web 任務中直接貼：

```text
請使用 repo 內的 BVSHOP × Elfsight V1 規格處理這次任務。

請先讀取：
1. AGENTS.md
2. .agents/skills/bvshop-elfsight-v1/SKILL.md
3. docs/bvshop-elfsight-v1/BVSHOP_ELFSIGHT_CHECKLIST.md

任務：
幫我把以下 Elfsight 安裝碼包成 BVSHOP 可貼上的 HTML 區塊。
```

## 上線檢查

每次輸出前必須對照：

- `docs/bvshop-elfsight-v1/BVSHOP_ELFSIGHT_CHECKLIST.md`

## 重要限制

- 不要改 Elfsight `script src`
- 不要改 `elfsight-app-xxxxx`
- 不要刪 `data-elfsight-app-lazy`
- BVSHOP HTML 優先使用 inline style
- Floating widget 不放在一般首頁 section 中

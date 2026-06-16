# Project Instructions

## BVSHOP × Elfsight integration

When working on BVSHOP HTML blocks, Elfsight widgets, homepage sections, FAQ widgets, YouTube widgets, popup widgets, floating chat, or embedded third-party widgets, always follow the BVSHOP × Elfsight V1 rules.

Skill location:

- `.agents/skills/bvshop-elfsight-v1/SKILL.md`

Reference documents:

- `docs/bvshop-elfsight-v1/README.md`
- `docs/bvshop-elfsight-v1/PROMPT_TEMPLATE.md`
- `docs/bvshop-elfsight-v1/BVSHOP_ELFSIGHT_CHECKLIST.md`
- `docs/bvshop-elfsight-v1/BVSHOP_Elfsight_嵌入碼解析.md`

Core rules:

- BVSHOP controls the outer container, spacing, layout, background, border radius, and inline CSS.
- Elfsight controls the widget body.
- Do not modify Elfsight script src.
- Do not modify the elfsight-app ID.
- Do not remove `data-elfsight-app-lazy`.
- Do not rewrite widget internals unless the user explicitly asks and accepts the risk.
- BVSHOP does not reliably support `<style>` tags, so output inline CSS only.
- Use iframe fallback only for static widgets when script embedding fails.
- Do not wrap floating widgets like chat, popup, announcement bar, or floating button inside a normal homepage section.
- Always output complete paste-ready HTML.

## WAFO / 話佛牌 brand constraints

Use the WAFO visual tone when wrapping HTML:

- Deep brown: `#37200D`
- Gold: `#B88A44`
- Cream gold: `#F4DEA9`
- Cream white: `#FFF6E0` or `#FFF8EC`
- Tone: premium Thai amulet magazine, calm, trustworthy, not cheap promotion.

Avoid misleading trust wording:

- Do not use 實體店面保障, 門市保障, 到店選購, 實體店可看貨, 線下門市, 實體佛牌店.
- Use 線上請供, 專人諮詢, 台灣出貨, 商品實拍, 泰國連線選品, 官方網站下單保障.

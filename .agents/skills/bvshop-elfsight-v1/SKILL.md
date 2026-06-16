# BVSHOP × Elfsight V1 技能規格

## 技能名稱
BVSHOP_Elfsight_Widget_Integration_V1

## 使用時機
當使用者要在 BVSHOP 放入、修改、排查或包裝 Elfsight widget / app / embed code 時使用。

適用任務：
- BVSHOP 首頁區塊嵌入 Elfsight
- FAQ、YouTube Gallery、Instagram/Facebook Feed、Photo Gallery、Reviews、Countdown、Announcement Bar、Popup、Chat 等 widget
- 將 Elfsight 安裝碼包成 BVSHOP 可用 HTML
- 判斷 script / iframe / floating / static 安裝方式
- 修正外層留白、寬度、圓角、背景、手機版高度
- 檢查 BVSHOP 是否吃 script，以及是否需要 iframe 備援

## 核心判斷
先判斷程式碼屬於哪一類：

### A. BVSHOP 原生 HTML
特徵：一般 section、div、h2、p、a、img 結構，沒有 elfsight-app ID 或 Elfsight script。

可修改：
- HTML 結構
- 文案
- 行內 style
- RWD 外層控制
- 圖片、按鈕、卡片、CTA

### B. Elfsight Widget Code
常見特徵：
```html
<script src="https://static.elfsight.com/platform/platform.js" async></script>
<div class="elfsight-app-xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx" data-elfsight-app-lazy></div>
```

原則：Elfsight 本體不硬改，只包外層。

不可修改：
- script src
- elfsight-app-xxxxx ID
- data-elfsight-app-lazy
- iframe src / Share Link
- widget 原始 ID
- Elfsight 內部產生的 DOM class

可修改：
- 外層寬度
- 外層 padding / margin
- 外層背景
- 圓角
- 陰影
- 區塊上下距離
- 前後標題與說明文字
- 手機版外層留白

## 官方依據
Elfsight 官方邏輯是：從後台取得 installation code，複製後貼到網站對應 HTML / Embed 位置。iframe 方式較適合 static widgets，不適合 floating widgets；部分 widget 不提供 Share Link / iframe 用法，例如 Banner、Contact Form、Form Builder、Popup、Slider、Subscription Form 等需依後台實際狀況判斷。

## 安裝策略

### 1. Static Widget
適用：FAQ、YouTube Gallery、Instagram Feed、Facebook Feed、Reviews、Photo Gallery、Countdown、商品頁嵌入區。

建議包法：
```html
<div style="width:100%; max-width:1180px; margin:0 auto; padding:24px 16px; box-sizing:border-box;">
  <div style="border-radius:24px; overflow:hidden; background:#FFF8EC; box-shadow:0 10px 30px rgba(55,32,13,0.08);">
    <!-- Elfsight Widget Code：原碼貼在這裡，不要修改 -->
    <script src="https://static.elfsight.com/platform/platform.js" async></script>
    <div class="elfsight-app-你的APP-ID" data-elfsight-app-lazy></div>
  </div>
</div>
```

### 2. Iframe 備援
使用時機：
- BVSHOP 不執行 script
- widget 沒顯示
- CSS/JS 被平台干擾
- 手機版顯示錯亂
- 需要隔離樣式

建議包法：
```html
<div style="width:100%; max-width:1180px; margin:0 auto; padding:24px 16px; box-sizing:border-box;">
  <div style="border-radius:24px; overflow:hidden; background:#FFF8EC;">
    <iframe src="你的_ELFSIGHT_SHARE_LINK" style="border:none; width:100%; min-height:520px; display:block;" loading="lazy"></iframe>
  </div>
</div>
```

注意：iframe 較適合 static widget，不建議用在 floating widget。若 Elfsight 後台沒有 Share Link，就不能硬做 iframe。

### 3. Floating Widget
適用：Chat、LINE/WhatsApp、Popup、Announcement Bar、Floating Button。

原則：不要包在一般首頁 section 內。應放在頁尾、全站 HTML、或首頁最底部測試。

建議格式：
```html
<!-- Floating Elfsight Widget：建議放頁尾或全站自訂碼 -->
<script src="https://static.elfsight.com/platform/platform.js" async></script>
<div class="elfsight-app-你的APP-ID" data-elfsight-app-lazy></div>
```

## 話佛牌視覺包裝規格
外層風格以話佛牌主色系為準：
- 深棕：#37200D
- 金色：#B88A44
- 奶油金：#F4DEA9
- 米白：#FFF6E0 / #FFF8EC

建議外層：
- max-width: 1180px
- padding: 24px 16px
- border-radius: 20px–28px
- background: #FFF8EC 或漸層
- box-shadow: rgba(55,32,13,0.08)
- 字體顏色：#37200D
- 裝飾線：#B88A44

## BVSHOP 限制
BVSHOP 自訂 HTML 常見限制：
- 盡量不用 style 標籤
- CSS 優先使用行內 style
- 不掛外部 CSS
- script 若不被允許，改用 iframe 備援
- 先避免依賴複雜 JS 控制 widget

## 輸出要求
每次處理 BVSHOP × Elfsight 任務時，回覆需要包含：
1. 判斷 widget 類型：static / floating / unknown
2. 建議安裝方式：script / iframe / 回 Elfsight 後台調整
3. BVSHOP 可貼上的完整 HTML
4. 不可修改的原碼提醒
5. 手機版與高度注意事項
6. 哪些內容應回 Elfsight 後台修改

## 檢查清單
- [ ] 是否保留 Elfsight script 原碼？
- [ ] 是否保留 elfsight-app ID？
- [ ] 是否保留 data-elfsight-app-lazy？
- [ ] 是否沒有硬改 Elfsight 內部 DOM？
- [ ] 是否只用外層容器控制版面？
- [ ] 是否使用行內 style？
- [ ] 是否有手機版 padding？
- [ ] static widget 是否放在指定區塊？
- [ ] floating widget 是否放在頁尾/全站碼/首頁底部？
- [ ] BVSHOP 不吃 script 時是否有 iframe 備援？
- [ ] iframe 是否只用於適合的 static widget？

## 禁止事項
- 不要拆 Elfsight widget ID
- 不要改 script src
- 不要刪 data-elfsight-app-lazy
- 不要把 floating widget 包進普通 section
- 不要用過度複雜 JS 操控 widget
- 不要把 Elfsight 內部 class 當成穩定可控樣式
- 不要承諾 iframe 一定支援所有 widget
- 不要用實體店面保障等不符合話佛牌現況的信任文案

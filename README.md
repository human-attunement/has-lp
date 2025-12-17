了解。
そのまま README.md に貼れる形でまとめる。余計なことは書かない。

# HAS Landing Page

Human Attunement System (HAS) のランディングページ用リポジトリです。  
GitHub Pages + 独自ドメインで、**静的HTMLのみ**を配信します。

このリポジトリでは **Markdown → HTML の変換はローカルで行い、生成物を直接コミット**します。  
CI / GitHub Actions は使用しません。

---

## 構成

.
├── index.md            # 日本語LP（編集対象）
├── index.html          # 生成された日本語HTML（配信対象）
├── en/
│   ├── index.md        # 英語LP（編集対象）
│   └── index.html      # 生成された英語HTML（配信対象）
├── template.html       # pandoc用HTMLテンプレート
├── .nojekyll           # GitHub PagesでJekyllを無効化
├── CNAME               # 独自ドメイン設定
└── bin/
├── build.sh        # Markdown → HTML 変換
└── publish.sh     # 変換 + commit + push（任意）

---

## 前提

- macOS（またはLinux）
- `pandoc` がインストールされていること

```bash
brew install pandoc
```


⸻

## ビルド手順（Markdown → HTML）

1. Markdown を編集

index.md
en/index.md

2. HTML を生成

```bash
./bin/build.sh
```

## 生成されるファイル：
	•	index.html
	•	en/index.html
	•	.nojekyll

⸻

## 公開手順（GitHub Pages）

### 方法A：手動で commit / push

```bash
git add index.html en/index.html .nojekyll
git commit -m "update landing page"
git push
```

### 方法B：まとめて実行（任意）

```bash
./bin/publish.sh
```

⸻

## GitHub Pages 設定

- Branch: main
- Folder: / (root)
- Custom Domain: human-attunement.org
- Jekyll: 無効（.nojekyll により制御）

⸻

## 運用方針

- 更新頻度は低い前提
- CIは使わない
- トラブルシュートを最小化するため、ローカル生成 → 静的配信に徹する。
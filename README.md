rails-translation-and-globalization-study
---

Railsで翻訳と他言語化に対応する実験です。

日本語ロケールで保存すると、英語版を自動翻訳して保存。

英語ロケールで入力すると、日本語版を自動翻訳して保存。

##  Environment Variables

MICROSOFT_CLIENT_ID     Microsoft翻訳に使用するOAuthクライアントID

MICROSOFT_CLIENT_SECRET Microsoft翻訳に使用するOAuthクライアントSecret

    export MICROSOFT_CLIENT_ID=xxxxxxxxxxxxxxxx
    export MICROSOFT_CLIENT_SECRET=xxxxxxxxxxxxxxxx
    bundle exec rails s

## URL

### 日本語版

[http://localhost:3000/ja/](http://localhost:3000/ja/)

### 英語版

[http://localhost:3000/en/](http://localhost:3000/en/)


## gems

### globalize

### http_accept_language

### microsoft_translator

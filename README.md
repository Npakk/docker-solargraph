# docker-solargraph

Ruby の言語サーバ [Solargraph](https://solargraph.org/) を Docker コンテナ上で動かします。

## Usage

次の環境変数を設定します。`.env.sample` を `.env` としてコピーして使用してください。

| 変数名 | 値の例 | 説明 |
|:--|:--|:--|
| `PORT` | `8091` | 言語サーバに接続するために使用するポート番号。 |
| `RUBY_VERSION` | `2.7.2` | 使用する Ruby のバージョン。[公式イメージ](https://hub.docker.com/_/ruby)で利用可能なバージョンを指定してください。 |
| `SOLARGRAPH_VERSION` | `0.39.17` | 使用するSolargraphのバージョンを指定してください。 |
| `SOLARGRAPH_CORE_VERSION` | `2.7.1` | Solargraphのドキュメント（コア）のバージョンを指定してください。 |
| `SOURCE_PATH` | `/path/to/src` | 使用するソースコードを含むディレクトリのパス。 |

あとは `docker-compose up -d` でコンテナを起動すれば準備完了です。

## Vim

Vimで Solargraph を使うには、プラグイン[coc.nvim](https://github.com/neoclide/coc.nvim)を導入後さらにそのモジュールとして、[coc-solargraph](https://github.com/neoclide/coc-solargraph)をインストールします。

インストール後、`coc-settings.json`に以下の設定を追加してください。`port` は環境変数 `PORT` の値と同じにする必要があります。

```json
{
  "solargraph.diagnostics": true,
  "solargraph.externalServer": {
    "host": "localhost",
    "port": 8091
  },
  "solargraph.transport": "external",
}
```

## Visual Studio Code

Visual Studio Code で Solargraph を使うには、拡張機能 [Ruby Solargraph](https://marketplace.visualstudio.com/items?itemName=castwide.solargraph) をインストールします。

インストール後、`settings.json` に以下の設定を追加してください。`port` は環境変数 `PORT` の値と同じにする必要があります。

```json
{
  "solargraph.diagnostics": true,
  "solargraph.externalServer": {
    "host": "localhost",
    "port": 8091
  },
  "solargraph.transport": "external"
}
```

*設定項目の意味やその他の設定については、拡張機能・プラグインの説明をご覧ください。*

## Acknowledgments
実装方法やインスピレーションを得たものとして、k-miyata氏の[docker-solargraph](https://github.com/k-miyata/docker-solargraph)が参考になりました。感謝します。

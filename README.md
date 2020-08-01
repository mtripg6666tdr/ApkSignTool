# ApkSignTool
Apkに手動で署名するのを補助するツールです
# 対応プラットフォーム
Windowsのみ
# 使い方
`apksigndefault <apkのパス> <cerのパス> <cerのエイリアス名>`

指定されたapkを指定された証明書(cer)の指定されたエイリアスで署名します。

パスキーは入力プロンプトが表示されるのでそのときに入力します。
# `apksignall <cerのパス> <cerのエイリアス名>`
コマンドを実行したときのカレントディレクトリにある全てのapkファイルを署名します。

既に署名されている場合には署名を削除してから署名しなおします。

`Certificate file's Password`と表示されたらそこに指定した証明書のパスキーを入力してください。
# `apkunsign <apkのパス>`
指定されたapkの署名を削除します。
# 依存関係
## jarsigner.exe
JDKの中に含まれています。jarsignerがどこでも使えるようにパスを通しておいてください。
## zip
デフォルトでは使えないのでインストールしてパスを通します。

[詳細はこの記事](https://qiita.com/Shi-nakaya/items/83d2b2e2b34b897d3df8)などを参考にしてください。

zipが使えるかどうか確認するにはコマンドプロンプトで`zip --version`と入力しEnterします。

zipが使えればバージョン情報が出力されます。
## PowerShell
Windowsに標準で搭載されています。無効化しているかアンインストールしてしまった場合には使用できるようにしてください。
## Android Sdk
Android Sdk内のzipalignを利用します。`apksignall`コマンドでエラーが発生する場合には、apksignall.batの5行目の
`%ANDROID_SDK_ROOT%\build-tools\29.0.2\zipalign.exe`の部分をzipalignのパスに書き換えてください。
# 作成者
うさみょん(myon2019)/mtripg6666tdr
# ライセンス
LICENSE.mdに記載。
# vim setting
### 環境
|  項目  |  バージョン  |
| ---- | ---- |
|  Ubuntu  |  Ubuntu 20.04.3  |
|  vim  |  2:8.1.2269-1ubuntu5.7 amd64  |

# インストール
`sudo apt-get install vim`
### バージョン確認
`dpkg -l vim`
### vimrc場所
`vim --version`

以下の場所いずれかに.vimrcをコピー又は追記する
* system vimrc file
* user vimrc file

# bundle
## dein
https://github.com/Shougo/dein.vim
### インストール
*. インストール先ディレクトリは任意。当方に合わせる設定を記載する。
`sh -c "$(curl -fsSL https://raw.githubusercontent.com/Shougo/dein-installer.vim/master/installer.sh)"`

# ctags
## universal-ctags
https://github.com/universal-ctags/ctags
### 参考
https://maku77.github.io/vim/advanced/tags.html

### インストール
universal-ctagsのreadmeに記載有
1. `git clone https://github.com/universal-ctags/ctags.git`
2. `cd ctags`
3. `./autogen.sh`
4. `./configure --prefix=/where/you/want # defaults to /usr/local`
5. `make`
6. `make install # may require extra privileges depending on where to install`

### 使い方
コードのトップディレクトリで以下のコマンドを実行してタグファイルを作成する。

`ctags -R`

# よく使うコマンド
`Ctrl`を`C`とする

## コマンドモード
|  コマンド  |  内容  |
| ---- | ---- |
| C + n | NERDTree表示（表示後にファイル決定はEnter、`w`で分割表示、`t`でタグ表示 |
| C + w + 方向キー | 分割ウィンドウを移動 |
| C + w + s | 現在のウィンドウを水平分割 |
| C + w + v | 現在のウィンドウを縦分割 |
| C + w + T | 現在のウィンドウをタブ出し|
| C + ] | タグジャンプ |
| C + w + ] | タグジャンプ後にウィンドウを分割する |
| y + i + w | 単語ヤンク |
| :reg | ヤンクした単語リスト |
| / + r + C + 0 | ヤンクした単語を検索（r + C + 0 でヤンクしたものを張り付けられる） |
| c + i + w | 単語削除 |
| C + v | 矩形ビジュアルモード |
| C + v + c + 文字入力 + 入力モード離脱 | 矩形ビジュアルモードで指定した範囲を削除して文字入力後に範囲へ適応する|

## 入力モード
|  コマンド  |  内容  |
| ---- | ---- |
| r + C + 0 | ヤンクした単語をペースト |

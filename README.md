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
1. `mkdir -p ~/bundle`
2. `cd ~/bundle`
3. `curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh`
4. `sh ./installer.sh ~/.cache/dein`

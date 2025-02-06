# brewfile

## これは何

`brew` コマンドを叩くたびに自動コミットしてくれるスクリプトです。

##  設定方法

1. ディレクトリを作成し、gitリポジトリを初期化する
```bash
mkdir brewfile
cd brewfile
git init
```

2. Brewfileを作成する

```bash
brew bundle dump --file=./Brewfile --force
```

3. zshrcに以下を追記する
※ パスは適宜変更してください

```bash
alias brew='~/dev/brewfile/brew_with_commit.sh'
```



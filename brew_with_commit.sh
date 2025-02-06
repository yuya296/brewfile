#!/bin/bash

GIT_DIR=~/dev/brewfile
BREWFILE=$GIT_DIR/Brewfile

# 差分が発生するbrewコマンドのリスト
DIFF_COMMANDS=("install" "uninstall" "reinstall" "upgrade" "update" "tap" "untap")

echo "Running brew $* with brewfile commit..."

# Brewコマンドの実行
brew "$@"

# コマンドが差分を生じる場合のみBrewfile更新
if [[ " ${DIFF_COMMANDS[@]} " =~ " $1 " ]]; then
  cd "$GIT_DIR"
  brew bundle dump --file="$BREWFILE" --force

  # 差分がある場合のみgitコミット
  if ! git diff --quiet "$BREWFILE"; then
    git add "$BREWFILE"
    git commit -m "brew $*"
    echo "Changes committed with message: brew $*"
  else
    echo "No changes to commit."
  fi

  cd - > /dev/null
fi

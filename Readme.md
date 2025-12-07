# Setup

## 実行コマンド

### Aqua のインストール

```bash
curl -sSfL https://raw.githubusercontent.com/aquaproj/aqua-installer/v4.0.2/aqua-installer | bash
```

### chezmoi & GitHub CLIのインストール

```bash
mkdir -p "${XDG_CONFIG_HOME:-$HOME/.config}/aquaproj-aqua"
cd ${XDG_CONFIG_HOME:-$HOME/.config}/aquaproj-aqua
touch "${XDG_CONFIG_HOME:-$HOME/.config}/aquaproj-aqua/aqua.yaml"
export AQUA_GLOBAL_CONFIG=${AQUA_GLOBAL_CONFIG:-}:${XDG_CONFIG_HOME:-$HOME/.config}/aquaproj-aqua/aqua.yaml
aqua g -i -g # chezmoi
aqua g -g -g # cli/cli[gh]
aqua i -a
```

### GitHubにログイン

```bash
gh auth login
```

### dotfilesの同期

```bash
chezmoi init git@github.com:itkmaingit/chezmoi.git
chezmoi apply
```

### 初期化

```bash
sudo apt update
sudo apt install zsh
chsh -s $(which zsh)
aqua i -a
# (新規シェルの立ち上げ)
# powerlevel10kの設定(https://dango-share.notion.site/powerlevel10k-2c2426894e6380e19a79c90ca44a6187)
```

### cronの初期設定



### GitHub CLIのインストール
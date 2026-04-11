#!/bin/bash
set -euxo pipefail

# ── 1. System packages ────────────────────────────────────────────────────────
sudo apt-get update
sudo apt-get install -y zsh fzf tmux neovim git curl

# ── 2. ripgrep ────────────────────────────────────────────────────────────────
RIPGREP_DEB_URL=$(curl -s "https://api.github.com/repos/BurntSushi/ripgrep/releases/latest" \
  | grep -Po '"browser_download_url": "\K[^"]*amd64\.deb(?=")')
curl -Lo /tmp/ripgrep.deb "$RIPGREP_DEB_URL"
sudo apt install -y /tmp/ripgrep.deb

# ── 3. vim-plug ───────────────────────────────────────────────────────────────
mkdir -p ~/.vim/autoload
curl -fLo ~/.vim/autoload/plug.vim \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# ── 4. vimrc ──────────────────────────────────────────────────────────────────
cp vimrc ~/.vimrc

# ── 5. neovim (delegates to ~/.vimrc) ────────────────────────────────────────
mkdir -p ~/.config/nvim
cat > ~/.config/nvim/init.vim << 'EOF'
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/.vimrc
EOF

# ── 6. tmux ───────────────────────────────────────────────────────────────────
cp tmux.conf ~/.tmux.conf

# ── 7. oh-my-zsh (RUNZSH=no keeps us in bash so the script continues) ────────
RUNZSH=no sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# ── 8. zsh customisations (appended after oh-my-zsh creates ~/.zshrc) ─────────
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
echo 'source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh' >> ~/.zshrc
echo 'source /usr/share/doc/fzf/examples/key-bindings.zsh'       >> ~/.zshrc

# ── 9. set zsh as default shell ───────────────────────────────────────────────
chsh -s "$(which zsh)"

# ── 10. install vim/nvim plugins ──────────────────────────────────────────────
nvim +PlugInstall +qall

echo ""
echo "Done! Restart your terminal to start using zsh + nvim."

#!/bin/bash
set -euxo pipefail

# ── 1. Homebrew ───────────────────────────────────────────────────────────────
if ! command -v brew &>/dev/null; then
  NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# ── 2. Packages ───────────────────────────────────────────────────────────────
brew install neovim fzf ripgrep tmux git

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

# ── 6. tmux (swap xclip for pbcopy) ──────────────────────────────────────────
sed "s/xclip -in -selection clipboard/pbcopy/" tmux.conf > ~/.tmux.conf

# ── 7. oh-my-zsh (RUNZSH=no keeps us in bash so the script continues) ────────
RUNZSH=no sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# ── 8. zsh customisations (appended after oh-my-zsh creates ~/.zshrc) ─────────
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
echo 'source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh'     >> ~/.zshrc
echo "source $(brew --prefix fzf)/shell/key-bindings.zsh"            >> ~/.zshrc

# ── 9. install nvim plugins ───────────────────────────────────────────────────
nvim +PlugInstall +qall

echo ""
echo "Done! Restart your terminal to start using zsh + nvim."

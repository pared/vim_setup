# vim-setup

Personal nvim/tmux/zsh setup for Ubuntu.

## What gets installed

| Tool | Purpose |
|------|---------|
| neovim | Primary editor |
| zsh + oh-my-zsh | Shell |
| zsh-autosuggestions | Shell history suggestions |
| tmux | Terminal multiplexer |
| fzf | Fuzzy finder (shell + editor) |
| ripgrep | Fast grep (`rg`), used by fzf.vim |

### nvim plugins (via vim-plug)

- `vim-commentary` — `gc` to comment/uncomment
- `nerdtree` — file tree (`<leader>t`)
- `fzf.vim` — fuzzy find files, buffers, lines
- `lightline` — status bar
- `vim-fugitive` — git integration

## Installation

```bash
./setup.sh
```

Restart your terminal when it finishes — that's all.

## Key mappings

| Key | Action |
|-----|--------|
| `<leader>j` | Fuzzy find git files |
| `<leader>J` | Fuzzy find all files |
| `<leader>o` | Open buffers |
| `<leader>r` | Ripgrep search |
| `<leader>f` | File history |
| `<leader>l` | Search lines |
| `<leader>t` | Toggle NERDTree |
| `<leader>p` | Insert `breakpoint()` below cursor |

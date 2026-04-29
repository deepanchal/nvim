# nvim

Personal [AstroNvim](https://github.com/AstroNvim/AstroNvim) v6+ configuration.

## Install

Back up any existing config:

```shell
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
mv ~/.local/state/nvim ~/.local/state/nvim.bak
mv ~/.cache/nvim ~/.cache/nvim.bak
```

#### Clone the repository

```shell
git clone https://github.com/deepanchal/nvim ~/.config/nvim
```

#### Start Neovim

```shell
nvim
```

## Layout

- `init.lua` — bootstraps `lazy.nvim`
- `lua/lazy_setup.lua` — AstroNvim entry point
- `lua/community.lua` — [AstroCommunity](https://github.com/AstroNvim/astrocommunity) imports (language packs, colorscheme, motion, git, LSP)
- `lua/plugins/` — local plugin overrides (`astrocore`, `astrolsp`, `astroui`, `mason`, `treesitter`, etc.)
- `lua/polish.lua` — final tweaks

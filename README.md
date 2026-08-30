# Neovim configuration

Personal Neovim configuration built on [LazyVim](https://www.lazyvim.org/).

## Install

Clone this repository as `~/.config/nvim`, or keep it elsewhere and link it:

```sh
ln -sfn "$HOME/Repositories/bamcmanus/nvim" "$HOME/.config/nvim"
```

Start Neovim and run `:Lazy sync` to install the plugins. The committed
`lazy-lock.json` keeps plugin versions reproducible across machines.

## Portability

The core settings and plugin specifications are intended to work on Linux and
macOS. Omarchy-specific theme catalogue, hot-reload, and transparency behavior
is isolated in guarded files under `lua/platform/omarchy/` and
`lua/plugins/omarchy-*.lua`; those files return no configuration when Omarchy is
not present.

Remote clipboard integration activates only for tmux, SSH, or Herdr sessions,
and uses Wayland clipboard tools only when they are available.

## Notes

The Bazel integration currently supports WORKSPACE-based detection. Bzlmod
support is tracked in [issue #1](https://github.com/bamcmanus/bazel.nvim/issues/1)
on the companion fork.

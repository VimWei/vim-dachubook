# vim-dachubook

**Render Markdown notes to a printable PDF book from Vim.**

`:DachuBookPage` and `:DachuBookTree` turn the current Markdown file into a
PDF through the external [DachuBook](https://gitea.vimel.org/Vimel/DachuBook)
CLI. The plugin is a thin wrapper: it builds the command line and runs it,
asynchronously when
[AsyncRun](https://github.com/skywind3000/asyncrun.vim) is available. All
Markdown parsing, layout and PDF generation happen in DachuBook.

## Features

- `:DachuBookPage` — current file as a single-page PDF (no cover, no TOC)
- `:DachuBookTree` — current file as the entry of a note tree, rendered as a
  whole book (cover + table of contents)
- Optional profile argument: a config name (`cookbook` →
  `~/.config/dachubook/cookbook.yaml`) or a path
- Tab completion for profiles and config paths
- Non-blocking when AsyncRun is installed
- The output file name comes from the config (`output.name`, else the entry
  file name), so profiles decide where the book lands

## Installation

With a Vim package layout:

```bash
git clone git@github.com:VimWei/vim-dachubook.git \
  ~/vimfiles/pack/mydev/opt/vim-dachubook
```

Then enable it in `vimrc`:

```vim
packadd! vim-dachubook
```

Or with any plugin manager, e.g. vim-plug:

```vim
Plug 'VimWei/vim-dachubook'
```

Run `:helptags` on the `doc/` directory (or let Vim generate it) and see
`:help dachubook`.

## Requirements

- Vim 8.0 or newer
- [DachuBook](https://gitea.vimel.org/Vimel/DachuBook) on `$PATH`, normally
  installed with uv:

  ```bash
  uv tool install DachuBook
  ```

  Pango/GTK come with WeasyPrint as part of DachuBook.

## Usage

Open a Markdown note and run:

```vim
:DachuBookPage          " single page
:DachuBookTree          " the whole book, starting at this file
:DachuBookTree cookbook " with ~/.config/dachubook/cookbook.yaml
:DachuBookTree ~/x.yaml " with an explicit config file
```

The default config `<config-dir>/config.yaml` is created with
`dachubook init` on first use. The configuration directory is whatever
`dachubook config-dir` prints (`~/.config/dachubook`).

## Options

| Option | Default | Meaning |
|---|---|---|
| `g:dachubook_cmd` | `dachubook` | Executable name or path |
| `g:dachubook_output` | `<wiki_root>/.output` | Output directory (`g:wiki_root` defaults to `~/wiki/`) |

```vim
let g:dachubook_cmd = 'c:/tools/dachubook.exe'
let g:dachubook_output = '~/Dropbox/books'
```

## License

GPL-3.0-or-later. See [LICENSE](LICENSE).

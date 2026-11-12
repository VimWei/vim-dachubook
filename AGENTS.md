# AGENTS.md

## Repo facts
- **Vim plugin** (`vim-dachubook`) — render Markdown notes to a printable PDF
  book through the external [DachuBook](https://gitea.vimel.org/Vimel/DachuBook) CLI
- **Legacy VimL**, Vim 8.0+ (not Vim9 script)
- The plugin is deliberately **thin**: it builds a `dachubook build` command
  line and runs it. It never parses Markdown or touches the rendering pipeline.
- **Remote**: `git@github.com:VimWei/vim-dachubook.git`

## Directory layout
| Path | Role |
|---|---|
| `plugin/dachubook.vim` | Defines `:DachuBookPage` and `:DachuBookTree` |
| `autoload/dachubook.vim` | Config discovery, output dir, command line, async run, completion |
| `doc/dachubook.txt` | Help (`:help dachubook`) |

## Public interface
- `dachubook#page([profile])`, `dachubook#tree([profile])`
- `dachubook#complete()` — customlist completion for both commands
- `g:dachubook_cmd` (default `dachubook`), `g:dachubook_output`
  (default `<wiki_root>/.output`, `g:wiki_root` defaults to `~/wiki/`)

## Behavior notes
- The config directory always comes from `dachubook config-dir`; never
  hard-code a platform path.
- A profile argument is handed to `--profile` verbatim and the CLI decides
  whether it is a name (`<config-dir>/<name>.yaml`) or a path.
- Without a profile, the default config is generated with `dachubook init` on
  first use. Never auto-generate a config for a misspelled profile name.
- The output file name is decided by the CLI (`output.name`, else the entry
  file name); the plugin passes only `--output-dir`.
- `DACHUBOOK_ANSI=1` makes the CLI emit the system code page, because Vim
  reads subprocess output in the system code page. Windows needs
  `set VAR=1 && cmd`; POSIX uses `VAR=1 cmd`.
- Run through AsyncRun when present, otherwise a blocking `system()`.

## Conventions
- Chinese comments, English docs/README.
- Fold markers `{{{1` in VimL files.
- When the command line changes, update `doc/dachubook.txt` and `README.md`.

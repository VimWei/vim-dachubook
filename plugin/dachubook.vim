" dachubook.vim - render Markdown notes to a printable PDF book
" Maintainer: W.Chen
" License: GPL-3.0-or-later
"
"   :DachuBookPage [profile]   当前文件 → 单页 PDF
"   :DachuBookTree [profile]   当前文件作为入口 → 目录树 PDF（整本书）
"
" 本文件只注册命令；实现见 autoload/dachubook.vim。

if exists('g:loaded_dachubook')
    finish
endif
let g:loaded_dachubook = 1

command! -nargs=? -complete=customlist,dachubook#complete
            \ DachuBookPage call dachubook#page(<q-args>)
command! -nargs=? -complete=customlist,dachubook#complete
            \ DachuBookTree call dachubook#tree(<q-args>)

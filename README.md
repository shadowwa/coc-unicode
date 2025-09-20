# Coc Unicode

Unicode completion source for [coc.nvim](https://github.com/neoclide/coc.nvim).

## Install

```vim
:CocInstall coc-unicode
```

## Configuration

To complete unicode source, type `uc-` as trigger pattern.

It is also possible to change the unicode trigger pattern by putting
`"coc.source.unicode.triggerPatterns": ["TRIGGERPATTERN"]` in your `coc-settings.json`

By default this source is only activated for markdown file, you can add other filetype by putting
`"coc.source.unicode.filetypes": ["FILETYPE1", "FILETYPE2"]` in your `coc-settings.json`

## Update unicode

To update the dictionary file:

```bash
ruby unicodelist.rb
```

Based on the [coc-emoji](https://github.com/neoclide/coc-sources/) extension and [vim-characterize](https://github.com/tpope/vim-characterize).

# vim-gvimsettings

A small Vim plugin that applies the settings that only make sense inside
the GVim GUI: the 'guioptions' chrome around the text area and the initial
window size.

It deliberately has no mappings, no commands and no global variables.

## Features

- **Minimal GUI chrome**: sets `guioptions` to `aegit`, keeping just:
  - `a` — a selection is global (X11 clipboard behavior)
  - `e` — tab pages shown in their own row
  - `g` — greyed-out menu items instead of hiding them
  - `i` — a Vim icon in the window manager
  - `t` — tear-off menus
- **Text-area-driven window size**: computes `columns` from `'textwidth'`
  (falling back to 80 when it is off) plus `'numberwidth'` when
  `'number'` is on, and fixes the height to 50 lines. The chrome fits
  around the text instead of the other way around.

## Installation

The plugin is meant to be loaded only when the GUI is running, so guard it
with `has('gui_running')` in your bootstrap:

```vim
if has('gui_running')
  Plug 'diacus/vim-gvimsettings'
endif
```

## Usage

There is nothing to call: the settings are applied on startup by
`plugin/gvimsettings.vim`, which sets `guioptions` and calls
`gvimsettings#resize_window()` once. The sizing is done at that moment, so
if you change `'textwidth'`, `'number'` or `'numberwidth'` afterwards, call
the function again:

```vim
call gvimsettings#resize_window()
```

The plugin is safe to load in terminal Vim anyway: it only touches
`guioptions`, which has no effect outside the GUI.

## Documentation

Full details are in the help document:

```vim
:help gvimsettings
```
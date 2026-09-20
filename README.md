# oxide-washed

A washed-out variant of [oxide](../nvim/) with the muted, pastel feel of
[no-clown-fiesta](../no-clown-fiesta.nvim/). Same structure and highlight
groups as oxide — only the palette in `lua/oxide_washed/colors.lua` changed.

## What changed vs oxide

- **Accents desaturated ~38%** toward no-clown-fiesta's gray (`#AFAFAF`),
  brights toward `#CFCFCF`. Hue positions kept, chroma pulled back.
- **Contrast compressed from both ends:** background lifted
  (`#161616` → `#1d1d1d`), brightest text dimmed (`#eeeeee` → `#d8d8d8`),
  comments lifted (`#555555` → `#6e6e6e`) so they stay readable.
- Surfaces lifted one step (`surface0 #222222` → `#272727`, etc.).
- Diff backgrounds desaturated to match.
- Syntax/editor/treesitter/LSP/lualine mappings untouched.

## Try it

```lua
-- lazy.nvim (local path while iterating)
{
  name = "oxide-washed",
  dir = "/home/lucas/repos/colourscheme/newscheme",
  lazy = false,
  priority = 1000,
  config = function()
    require("oxide_washed").setup()
    vim.cmd.colorscheme("oxide-washed")
  end,
}
```

Same options as oxide (`transparent`, `terminal_colors`, `styles`,
`on_colors`, `on_highlights`).

## Tune the wash

All the character lives in `lua/oxide_washed/colors.lua`. To go more or
less muted, re-blend any accent toward `#AFAFAF`:

```lua
-- in on_colors, or directly in the palette:
colors.blue = "#7E97AB"  -- fully no-clown-fiesta gray-blue
```

## Palette

| role | oxide | washed |
|------|-------|--------|
| mantle / base | `#121212` / `#161616` | `#191919` / `#1d1d1d` |
| text / bright | `#cecece` / `#eeeeee` | `#c2c2c2` / `#d8d8d8` |
| red | `#ed756e` | `#d58b87` |
| orange | `#e48233` | `#d09362` |
| yellow | `#c39900` | `#bba142` |
| lime | `#9ca81f` | `#a3ab56` |
| green | `#5bb661` | `#7bb37f` |
| teal | `#00baaa` | `#42b6ac` |
| sky | `#00b3d6` | `#42b1c7` |
| blue | `#3ba6f5` | `#67a9da` |
| purple | `#968ff7` | `#a09bdc` |
| pink | `#cc7bd1` | `#c18fc4` |

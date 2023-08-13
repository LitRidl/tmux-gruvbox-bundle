# Gruvbox Color Schemes for Terminal Emulators

## Contents

1. [Introduction](#introduction)
2. [Kitty](#kitty)
3. [Alacritty](#alacritty)
4. [Foot](#foot)
5. [WezTerm](#wezterm)


## Introduction

As outlined in [README.md](https://github.com/litridl/tmux-gruvbox-bundle/tree/main/README.md#transparency), the most effective way to guarantee proper transparency in a Tmux Gruvbox Bundle theme is to use a color scheme in your terminal emulator that shares the same background color.

In this collection, each theme has the same name as its corresponding Tmux Gruvbox Bundle theme. Therefore, for each tmux color theme, you'll find a matching color scheme for Alacritty, Kitty, Foot, and (partially) WezTerm.


## Kitty

Copy the themes from [terminal-themes/kitty/](https://github.com/litridl/tmux-gruvbox-bundle/tree/main/terminal-themes/kitty) and include the preferred one near the end of your Kitty config file (often located at `.config/kitty/kitty.conf`) like so:
```bash
# Assuming there is a themes/ directory adjacent to the kitty.conf file
include themes/gruvbox-original-dark.conf
```

Alternatively, a collection of themes is available at [kitty-themes](https://github.com/kovidgoyal/kitty-themes/). To preview and select a theme from this list, use the following command:
```bash
kitty +kitten themes
```

## Alacritty

Copy the themes from [terminal-themes/alacritty/](https://github.com/litridl/tmux-gruvbox-bundle/tree/main/terminal-themes/alacritty) and incorporate the preferred one near the top of your Alacritty config file (usually `.config/alacritty/alacritty.conf`):
```yaml
# Assuming there is a themes/ directory adjacent to the alacritty.conf file
import:
# Other imports go here
- ~/.config/alacritty/themes/gruvbox-original-dark.yaml
```

## Foot

Copy themes from [terminal-themes/foot/](https://github.com/litridl/tmux-gruvbox-bundle/tree/main/terminal-themes/foot) and import the preferred one near the top of your Foot config file (`.config/foot/foot.ini` or so):
```ini
# Assuming there is a themes/ directory adjacent to the foot.ini file
include=~/.config/foot/themes/gruvbox-original-dark
```


## WezTerm

WezTerm includes a wide range of pre-configured color themes.
The Gruvbox themes can be found at [WezTerm Theme Index, letter G](https://wezfurlong.org/wezterm/colorschemes/g/index.html). While we have not yet tested the correspondence of these themes, judging by the names, it should be possible to find a matching color scheme.

To set a theme, edit your WezTerm config file (usually `~/.wezterm.lua` or `~/.config/wezterm/wezterm.lua`) like so:
```lua
local wezterm = require 'wezterm'
local config = {}

-- This line sets the color scheme, others are given for the context
config.color_scheme = 'gruvbox'

return config
```

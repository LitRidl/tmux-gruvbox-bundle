# Tmux Gruvbox Bundle

## Contents

1. [Introduction](#introduction)
2. [Features](#features)
3. [Installation](#installation)
4. [Configuration](#configuration)
5. [Alternatives](#alternatives)

## Introduction

Born out of a need for a customizable theming experience, this project is dedicated to providing a complete Gruvbox experience — offering all theme variants, transparency, a wide variety of optional status lines, and support for nearly every tmux styling option.

This project builds upon awesome tmux and Neovim projects like [tmux-gruvbox](https://github.com/egel/tmux-gruvbox), [gruvbox-material](https://github.com/sainnhe/gruvbox-material), [gruvbox.nvim](https://github.com/ellisonleao/gruvbox.nvim), and [gruvbox-flat.nvim](https://github.com/eddyekofo94/gruvbox-flat.nvim).
Gruvbox Tmux Bundle is all about unlocking tmux's full versatility and working without enforcing anything - for example, you can use the default tmux status line and it will be themed just fine with all nuances like separate styling for zoomed tabs, bell activity, etc. This project aims to give users total control over their tmux gruvbox theming.

*Work in progress*: currently, only `"powerline-minimal"` and `"none"` status line themes are supported and not all features are implemented or tested.

## Features

* A wide selection of Gruvbox variants - Gruvbox Original and Gruvbox Material are available in Dark and Light modes with Soft/Medium/Hard contrast options.
* A variety of optional status lines (powerline status lines, "pills", boxes, and others).
* Correct and complete styling of "raw" tmux - both the default status line (activity and bell, zoomed pane, first/last panes, etc) and the full range of tmux UI elements (popup windows, copy mode including matches and marks, `status-keys vi` command prompt command mode, `Prefix + q` pane numbers, etc).
* Support for nearly every tmux styling option.
* Support of transparency (see [Transparency](#transparency))
* Works well under a wide range of brightness, gamma, and color temperature settings (as set by [redshift](https://github.com/jonls/redshift), [gammastep](https://gitlab.com/chinstrap/gammastep), or [f.lux](https://justgetflux.com/)).

## Installation

To display the status line icons or utilize Powerline-based themes, please use one of the [Powerline patched fonts](https://github.com/powerline/fonts). Even better, you could use one of the [Nerd Fonts](https://github.com/ryanoasis/nerd-fonts) which already includes Powerline Symbols, Devicons, Font Awesome, among others. In many terminal emulators like [Kitty](https://sw.kovidgoyal.net/kitty/faq/#kitty-is-not-able-to-use-my-favorite-font), [Foot](https://codeberg.org/dnkl/foot#fonts), and [WezTerm](https://wezfurlong.org/wezterm/config/lua/wezterm/nerdfonts.html) it is possible to eliminate the need for patched fonts by using a symbols-only variant of font as a "fallback font".

If you don't want to install patched or fallback fonts, there is an option to use status line themes that don't rely on them. Alternatively, you can use the default tmux status line by setting `set -g @gruvbox-statusline-theme "none"` in your tmux configuration file.

### TPM

1. Install [TPM](https://github.com/tmux-plugins/tpm)
2. Add the Tmux Gruvbox Bundle plugin:

```bash
set -g @plugin 'tmux-plugins/tpm'
# ...
set -g @plugin 'litridl/tmux-gruvbox-bundle'
```

3. (Optional) [Configure](#configuration) your preferred Gruvbox theme variant (the default is `'gruvbox-original-dark-hard'`), status line theme (the default is `'powerline-minimal'`), and other options.

4. In the end, you should get something like this:
```bash
# Gruvbox color and status line theme bundle
set -g @plugin 'litridl/tmux-gruvbox-bundle'
# Optional lines for custom preferences
set -g @gruvbox-theme 'gruvbox-original-dark-hard'
set -g @gruvbox-statusline-theme 'powerline-minimal'
set -g @gruvbox-transparent-background 'off'
set -g @gruvbox-explicit-background-color 'none'
set -g @gruvbox-datetime-format '%a, %b %d  %I:%M %p'
```

## Configuration

### Basic settings

- Setting Gruvbox theme variant (the default is `'gruvbox-original-dark-hard'`):
```bash
set -g @gruvbox-theme 'gruvbox-original-dark-soft' # or 'gruvbox-original-dark', 'gruvbox-original-light', etc.
```

- Setting status line theme (the default is `'powerline-minimal'`):
```bash
set -g @gruvbox-statusline-theme 'powerline-minimal' # or 'none', 'powerline-icons', 'pills', 'boxes', etc.
```

- Setting date and time format (the default is `'%x  %R'`):
```bash
set -g @gruvbox-datetime-format '%a, %b %d  %I:%M %p' # Any custom format or '' to suppress
```

### Transparency

Tmux uses control sequences to colorize terminal cells. For transparency effects to be achieved, there needs to be an exact match between the background color in the terminal emulator and tmux. For instance, when the terminal's opacity is set to 90% and the background color is specified as #282828, characters drawn without setting a specific background color (or implicitly set to #282828) will appear as though they were drawn on a transparent background.

To accommodate this, the Tmux Gruvbox Bundle offers two methods:

#### 1. Identical background colors in tmux and terminal emulator (recommended)
Set the terminal's background color to precisely match the background color of the tmux color scheme.
If you don't have a desired Gruvbox variant for your terminal emulator, we have a [collection of pre-tested themes](https://github.com/litridl/tmux-gruvbox-bundle/tree/main/TERMINALS.md).
Each theme has the same file name as Tmux Gruvbox Bundle theme that it is compatible with. Each Tmux Gruvbox Bundle color theme has a color scheme for Alacritty, Kitty, Foot, and WezTerm.

#### 2. Implicit equivalence of colors via `terminal` color
Enable the `@gruvbox-transparent-background` option by setting it to `'on'` (it's `'off'` by default). This allows the theme to use a special tmux color known as `"terminal"`:
```bash
set -g @gruvbox-transparent-background 'on' # or off
```

**Note:** Using the `"terminal"` special color ensures guarantees that tmux doesn't apply color styling to the text. The text gets rendered using terminal's text and background colors. Instead, the text is rendered using the terminal's text and background colors. In Powerline-based status lines, the character  is used to draw both ends of an arrow, with the background and foreground colors reversed for one of the ends. However, since the `"terminal"` color is used as a foreground color (i.e., light color on a dark background) on one of the ends, its styling will be broken. To fix this, you have to manually specify your terminal's background color using `set -g @gruvbox-explicit-background-color '#some_color'`. This explicit color setting will only be used in background/foreground reversal scenarios.


## Alternatives

### [egel/tmux-gruvbox](https://github.com/egel/tmux-gruvbox) [Unmaintained for 2+ years]
A partial implementation of Gruvbox Original Dark and Light color schemes. It comes with colors hard-coded into a predefined status bar and doesn't style many tmux UI elements. Although, it is lightweight and works like in the screenshot out-of-the-box - I used it myself before Tmux Gruvbox Bundle.

### [thoreinstein/gruvbox-tmux](https://github.com/thoreinstein/gruvbox-tmux) [Unmaintained for 2+ years]
A [dracula/tmux](https://github.com/dracula/tmux) fork patched to use Gruvbox Original Dark color theme. Comes with its own predefined status bar. For me, it didn't work and style like in the screenshot out-of-the-box. Although, as it is a Dracula fork, it comes a set of pre-made status line widgets, including weather and CPU usage indicator.

## Thanks to
- [egel](https://github.com/egel) for [tmux-gruvbox](https://github.com/egel/tmux-gruvbox): I've used it before Tmux Gruvbox Bundle.
- [catppuccin](https://github.com/catppuccin) for [catppuccin/tmux](https://github.com/catppuccin/tmux): it served as an inspiration for my implementation.
- [sainhe](https://github.com/sainnhe) for [gruvbox-material](https://github.com/sainnhe/gruvbox-material): Gruvbox Material color schemes for Neovim.
- [eddyekofo94](https://github.com/eddyekofo94) [gruvbox-flat.nvim](https://github.com/eddyekofo94/gruvbox-flat.nvim): Gruvbox Flat color scheme for Neovim.

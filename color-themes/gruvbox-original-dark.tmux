## Gruvbox dark palette
dark0_hard=#1d2021
dark0=#282828
dark0_soft=#32302f

dark1=#3c3836
dark2=#504945
dark3=#665c54
dark4=#7c6f64

light0_hard=#f9f5d7
light0=#fbf1c7
light0_soft=#f2e5bc

light1=#ebdbb2
light2=#d5c4a1
light3=#bdae93
light4=#a89984

gray=#928374

bright_red=#fb4934
bright_green=#b8bb26
bright_yellow=#fabd2f
bright_blue=#83a598
bright_purple=#d3869b
bright_aqua=#8ec07c
bright_orange=#fe8019

neutral_red=#cc241d
neutral_green=#98971a
neutral_yellow=#d79921
neutral_blue=#458588
neutral_purple=#b16286
neutral_aqua=#689d6a
neutral_orange=#d65d0e

faded_red=#9d0006
faded_green=#79740e
faded_yellow=#b57614
faded_blue=#076678
faded_purple=#8f3f71
faded_aqua=#427b58
faded_orange=#af3a03


## Gruvbox-original-dark
base_fg=$light1
base_bg=$dark0
base1_fg=$light2
base1_bg=$dark1
base2_fg=$light3
base2_bg=$dark2
base_bright=$bright_orange
base_neutral=$neutral_aqua
base_faded=$faded_yellow

## Start of tmux-gruvbox-theme
thm_fg=$base_fg
thm_bg=$base_bg
thm_block_bg=$base1_bg

# This color is either set by user with "set -g @gruvbox-explicit-background-color '#user_color'" or set to $thm_bg
# thm_bg_as_fg=$thm_bg

# Command (Prefix + :) line and text
thm_msg_bg=$thm_bg
thm_msg_fg=$base_neutral
# Command (Prefix + :) line and text when in vi command mode (enabled by "set -g status-keys vi")
# Prefix + : to open command prompt and then ESC to open command prompt command mode
thm_msg_cmd_bg=$thm_bg
thm_msg_cmd_fg=$base_bright

# Command (Prefix + :) completion menu + Copy mode top-right message like "(105 results) [234/234]"
thm_cmd_bg=$base_neutral
thm_cmd_fg=$thm_block_bg

# Window tabs (inactive/active)
thm_tab_bg=$thm_block_bg
thm_tab_fg=$base_neutral
thm_tab_active_bg=$base_neutral
thm_tab_active_fg=$thm_bg
thm_tab_bell_bg=$base_bright
thm_tab_bell_fg=$thm_bg
thm_tab_activity_bg=$thm_tab_bell_bg
thm_tab_activity_fg=$thm_tab_bell_fg

# Clock
thm_clock_block_bg=$thm_block_bg
thm_clock_block_fg=$base_neutral

# Hostname block
thm_rightmost_block_bg=$base2_bg
thm_rightmost_block_fg=$thm_bg

# Session name block
thm_leftmost_block_bg=$base2_bg
thm_leftmost_block_fg=$thm_bg

# Line between splits
thm_active_pane_border=$base_neutral
thm_pane_border=$thm_bg

# Pane number displayed on Prefix + q
thm_display_pane_active=$thm_active_pane_border
thm_display_pane=$base_faded

# Popup background and text. It's better to avoid changing these colors so that they match win/pane style
thm_popup_bg=$thm_bg
thm_popup_fg=$thm_fg

# Popup borders
thm_popup_border_fg=$base_neutral

# Clock mode (to activate: tmux clock-mode)
thm_clock_mode=$base_bright

# copy-mode-match-style
thm_copy_mode_match_bg=$thm_cmd_bg
thm_copy_mode_match_fg=$thm_cmd_fg

# copy-mode-current-match-style
thm_copy_mode_current_match_bg=$thm_copy_mode_match_fg
thm_copy_mode_current_match_fg=$thm_copy_mode_match_bg

# copy-mode-mark-style
thm_copy_mode_mark_bg=$base_faded
thm_copy_mode_mark_fg=$thm_bg

# vim:filetype=tmux

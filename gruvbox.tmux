#!/usr/bin/env bash

PLUGIN_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

DEFAULT_COLOR_THEME="gruvbox-original-dark-hard"
DEFAULT_STATUSLINE_THEME="powerline-minimal"
DEFAULT_DATETIME_FORMAT="%x  %R"

COLOR_THEMES_DIR="${PLUGIN_DIR}/color-themes"
STATUSLINE_THEMES_DIR="${PLUGIN_DIR}/status-line-themes"

get_or_default() {
  local value="$(tmux show-option -gqv "$1")"
  echo "${value:-$2}"
}

set() {
  tmux_commands+=(set-option -gq "$1" "$2" ";")
}

setw() {
  tmux_commands+=(set-window-option -gq "$1" "$2" ";")
}

main() {
  # Aggregate all tmux commands in one array to execute in a single call later
  local tmux_commands=()

  local color_theme="$(get_or_default "@gruvbox-theme" "$DEFAULT_COLOR_THEME")"
  local color_theme_file="${COLOR_THEMES_DIR}/${color_theme}.tmux"
  if [[ -f "$color_theme_file" ]]; then
    source "$color_theme_file"
  else
    echo "Error: unable to locate color theme '${color_theme}' (no ${color_theme_file})"
  fi

  local transparency="$(get_or_default "@gruvbox-transparent-background" "off")"
  local status_bg_color="$thm_bg"
  if [[ "$transparency" == "on" ]]; then
    status_bg_color="terminal"
    thm_bg_as_fg="$(get_or_default "@gruvbox-explicit-background-color" "terminal")"
  fi

  # local user_bg_as_fg_color="$(get_or_default "@gruvbox-explicit-background-color" "terminal")"
  # fix for some scenarios: thm_bg_as_fg=$status_bg_color
  # if [[ "$user_bg_as_fg_color" != "none" ]]; then
  #   # Overriding thm_bg_as_fg=thm_bg set in the theme file
  #   thm_bg_as_fg="$user_bg_as_fg_color"
  # fi

  # Default statusbar colors
  set status-style bg=$thm_bg_as_fg,fg=$thm_fg
  set status-justify "left"
  set status-left-style none
  set status-left-length "100"
  set status-right-style none
  set status-right-length "100"

  # Pane border
  set pane-active-border-style fg=$thm_active_pane_border
  set pane-border-style fg=$thm_pane_border

  # Pane number display
  set display-panes-active-colour $thm_display_pane_active
  set display-panes-colour $thm_display_pane

  # Message info
  set message-style bg=$thm_msg_bg,fg=$thm_msg_fg

  # Writing commands inactive
  set message-command-style bg=$thm_msg_cmd_bg,fg=$thm_msg_cmd_fg

  # Copy mode
  setw copy-mode-match-style bg=$thm_copy_mode_match_bg,fg=$thm_copy_mode_match_fg
  setw copy-mode-current-match-style bg=$thm_copy_mode_current_match_bg,fg=$thm_copy_mode_current_match_fg,bold
  setw copy-mode-mark-style bg=$thm_copy_mode_mark_bg,fg=$thm_copy_mode_mark_fg

  # Command line (Prefix + :) and text when in vi command mode (enabled by "set -g status-keys vi")
  # Prefix + : to open command prompt and then ESC to open command prompt command mode
  setw mode-style bg=$thm_cmd_bg,fg=$thm_cmd_fg,bold

  # Default window title colors
  setw window-status-style bg=$thm_tab_bg,fg=$thm_tab_fg

  # Default window with an activity alert
  setw window-status-activity-style bg=$thm_tab_activity_bg,fg=$thm_tab_activity_fg

  # Active window title colors
  setw window-status-current-style bg=$thm_tab_active_bg,fg=$thm_tab_active_fg

  # Bell
  setw window-status-bell-style bg=$thm_tab_bell_bg,fg=$thm_tab_bell_fg
  setw window-status-separator ""

  # Popup windows
  setw popup-style bg=$thm_popup_bg,fg=$thm_popup_fg
  setw popup-border-style fg=$thm_popup_border_fg

  # Clock mode
  setw clock-mode-colour "$thm_clock_mode"

  # Statusline settings
  local datetime="$(get_or_default "@gruvbox-datetime-format" "$DEFAULT_DATETIME_FORMAT")"

  # Source statusline theme
  local statusline_theme="$(get_or_default "@gruvbox-statusline-theme" "$DEFAULT_STATUSLINE_THEME")"
  local statusline_file="${STATUSLINE_THEMES_DIR}/${statusline_theme}.tmux"
  # "none" preserves user's original statusline theme
  if [[ "$statusline_theme" != "none" ]]; then
    if [[ -f "$statusline_file" ]]; then
      source "$statusline_file"

      set status-left "${block_session}"
      set status-right "${block_time}${block_host}"

      setw window-status-format "${tab_block}"
      setw window-status-current-format "${tab_active_block}"
    else
      echo "Error: unable to locate status line theme '${statusline_theme}' (no ${statusline_file})"
    fi
  fi
  tmux "${tmux_commands[@]}"
}

main "$@"

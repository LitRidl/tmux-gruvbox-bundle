local block_session="#[bg=$thm_leftmost_block_bg,fg=$thm_leftmost_block_fg] #S #[bg=$thm_bg_as_fg,fg=$thm_leftmost_block_bg,nobold,noitalics,nounderscore]"

local tab_block="#[bg=$thm_tab_bg,fg=$thm_bg_as_fg,noitalics]#[bg=$thm_tab_bg,fg=$thm_tab_fg] #I #[bg=$thm_tab_bg,fg=$thm_tab_fg] #W #[bg=$thm_bg_as_fg,fg=$thm_tab_bg,noitalics]"
local tab_active_block="#[bg=$thm_tab_active_bg,fg=$thm_bg_as_fg,nobold,noitalics,nounderscore]#[bg=$thm_tab_active_bg,fg=$thm_tab_active_fg] #I #[bg=$thm_tab_active_bg,fg=$thm_tab_active_fg,bold] #W#{?window_zoomed_flag,*Z,} #[bg=$thm_bg_as_fg,fg=$thm_tab_active_bg,nobold,noitalics,nounderscore]"

local block_time="#[bg=$thm_bg_as_fg,fg=$thm_clock_block_bg nobold, nounderscore, noitalics]#[bg=$thm_clock_block_bg,fg=$thm_clock_block_fg] $datetime "
local block_host="#[bg=$thm_clock_block_bg,fg=$thm_rightmost_block_bg,nobold,noitalics,nounderscore]#[bg=$thm_rightmost_block_bg,fg=$thm_rightmost_block_fg] #h "

# vim:filetype=tmux

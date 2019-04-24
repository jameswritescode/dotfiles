" Last Updated: April 23, 2019

if exists('b:current_syntax')
  finish
endif

syn keyword kittyFunction font_family bold_font italic_font bold_italic_font
syn keyword kittyFunction font_size adjust_line_height adjust_column_width
syn keyword kittyFunction symbol_map box_drawing_scale

syn keyword kittyFunction cursor cursor_text_color cursor_shape
syn keyword kittyFunction cursor_blink_interval cursor_stop_blink_interval

syn keyword kittyFunction scrollback_lines scrollback_pager
syn keyword kittyFunction scrollback_pager_history_size wheel_scroll_multiplier
syn keyword kittyFunction touch_scroll_multiplier

syn keyword kittyFunction url_color url_style open_url_modifiers open_url_with
syn keyword kittyFunction copy_on_select rectangle_select_modifiers
syn keyword kittyFunction select_by_word_characters click_interval
syn keyword kittyFunction mouse_hide_wait focus_follows_mouse

syn keyword kittyFunction repaint_delay input_delay sync_to_monitor

syn keyword kittyFunction enable_audio_bell visual_bell_duration
syn keyword kittyFunction window_alert_on_bell bell_on_tab

syn keyword kittyFunction remember_window_size initial_window_width
syn keyword kittyFunction initial_window_height enabled_layouts
syn keyword kittyFunction window_resize_step_cells window_resize_step_lines
syn keyword kittyFunction window_border_width draw_minimal_borders
syn keyword kittyFunction window_margin_width single_window_margin_width
syn keyword kittyFunction window_padding_width active_border_color
syn keyword kittyFunction inactive_border_color bell_border_color
syn keyword kittyFunction inactive_text_alpha hide_window_decorations

syn keyword kittyFunction tab_bar_edge tab_bar_margin_width tab_bar_style
syn keyword kittyFunction tab_fade tab_separator tab_title_template
syn keyword kittyFunction active_tab_foreground active_tab_background
syn keyword kittyFunction active_tab_font_style inactive_tab_foreground
syn keyword kittyFunction inactive_tab_background inactive_tab_font_style

syn keyword kittyFunction foreground background background_opacity
syn keyword kittyFunction dynamic_background_opacity dim_opacity
syn keyword kittyFunction selection_foreground selection_background

syn keyword kittyFunction shell editor close_on_child_death
syn keyword kittyFunction allow_remote_control env startup_session
syn keyword kittyFunction clipboard_control term

syn keyword kittyFunction macos_titlebar_color macos_option_as_alt
syn keyword kittyFunction macos_hide_from_tasks
syn keyword kittyFunction macos_quit_when_last_window_closed
syn keyword kittyFunction macos_window_resizable macos_thicken_font
syn keyword kittyFunction macos_traditional_fullscreen macos_custom_beam_cursor

syn keyword kittyFunction kitty_mod clear_all_shortcuts map include

syn match kittyFunction "\v^color\d+"

syn keyword kittyStatement none single double curly default yes no bottom top
syn keyword kittyStatement fade separator hidden goto_tab normal bold-italic
syn keyword kittyStatement bold italic write-clipboard read-clipboard
syn keyword kittyStatement write-primary read-primary xterm-kitty system
syn keyword kittyStatement background combine set_font_size copy_to_clipboard
syn keyword kittyStatement copy_or_interrupt paste_from_clipboard
syn keyword kittyStatement paste_from_selection pass_selection_to_program
syn keyword kittyStatement new_window scroll_line_up scroll_line_down
syn keyword kittyStatement scroll_page_up scroll_page_down scroll_home
syn keyword kittyStatement scroll_end show_scrollback pipe new_window_with_cwd
syn keyword kittyStatement new_os_window close_window next_window
syn keyword kittyStatement previous_window move_window_forward
syn keyword kittyStatement move_window_backward move_window_to_top
syn keyword kittyStatement start_resizing_window first_window second_window
syn keyword kittyStatement third_window fourth_window fifth_window
syn keyword kittyStatement sixth_window seventh_window eighth_window
syn keyword kittyStatement ninth_window tenth_window next_tab previous_tab
syn keyword kittyStatement new_tab close_tab move_tab_forward move_tab_backward
syn keyword kittyStatement set_tab_title next_layout goto_layout
syn keyword kittyStatement last_used_layout change_font_size kitten
syn keyword kittyStatement toggle_fullscreen edit_config_file kitty_shell
syn keyword kittyStatement set_background_opacity clear_terminal send_text
syn keyword kittyStatement super

syn match kittyComment "^#.*$"

syn match kittyOperator "+"
syn match kittyOperator ">"

syn keyword kittyBoolean yes no

syn match kittyNumber "\v\d+(\.\d+)?"

syn match kittySpecial "!neighbor"
syn match kittySpecial "@ansi"
syn match kittySpecial "@selection"

syn match kittyString "\v\s#.*$"
syn region kittyString start=/"/ skip=/\\./ end=/"/

hi link kittyBoolean Boolean
hi link kittyComment Comment
hi link kittyFunction Function
hi link kittyNumber Number
hi link kittyOperator Operator
hi link kittySpecial Special
hi link kittyStatement Statement
hi link kittyString String

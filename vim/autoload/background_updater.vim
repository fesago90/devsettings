function s:update_background()
  silent let target_state = system('background_color_state.sh')
  if (target_state =~ "light" && &background == "dark")
    set background=light
  elseif (target_state =~ "dark" && &background == "light")
    set background=dark
  endif
endfunction

function s:timer_callback(timer_id)
  call s:update_background()
endfunction

function g:background_updater#StartBackgroundUpdater()
  if exists('g:background_color_updater_timer')
    timer_stop(g:background_color_updater_timer)
  endif
  call s:update_background()
  " 5 minute timer
  let g:background_color_timer = timer_start(300000, 's:timer_callback', {'repeat': -1})
endfunction

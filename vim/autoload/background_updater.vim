function background_updater#update_background()
  silent let target_state = system('background_color_state.sh')
  if (target_state =~ "light" && &background == "dark")
    set background=light
  elseif (target_state =~ "dark" && &background == "light")
    set background=dark
  endif
endfunction

function background_updater#timer_callback(timer_id)
  call background_updater#update_background()
endfunction

function g:background_updater#StartBackgroundUpdater()
  if exists('g:background_color_updater_timer')
    timer_stop(g:background_color_updater_timer)
  endif
  call background_updater#update_background()
  " 5 minute timer
  let g:background_color_timer = timer_start(300000, 'background_updater#timer_callback', {'repeat': -1})
endfunction

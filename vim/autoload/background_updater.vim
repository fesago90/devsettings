function s:update_background()
  silent let date = system('date +%H')
  let hour = str2nr(date)
  if (hour > 7) && (hour < 19)
    if &background == "dark"
      set background=light
    endif
  else
    if &background == "light"
      set background=dark
    endif
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

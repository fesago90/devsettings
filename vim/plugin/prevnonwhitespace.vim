" author: barry arthur
" 2014 06 04

function! s:positions_to_visual_selection(spos, epos)
  return a:spos[1] . 'G0' . a:spos[2] . '|' . 'o' . a:epos[1] . 'G0' . a:epos[2] . '|'
endfunction

function! s:get_positions(spat, epat)
  let curpos = getpos('.')
  call search(a:spat, 'bcW')
  let spos = getpos('.')
  call setpos('.', curpos)
  call search(a:epat, 'ceW')
  let epos = getpos('.')
  return [spos, epos]
endfunction

function! s:get_region(in, spat, epat)
  if call(a:in, [])
    let [spos, epos] = s:get_positions(a:spat, a:epat)
    return s:positions_to_visual_selection(spos, epos)
  else
    return "\<c-\>\<c-n>"
  endif
endfunction

function! s:in_white()
  return getline('.')[col('.')-1] =~ '^\s\?$'
endfunction

function! s:VAWS()

  return s:get_region('s:in_white', '\S\zs\_s', '\_s\S\@=')
endfunction


function! s:VIWS()
  return s:get_region('s:in_white', '\S\(\s*\n\)\=\zs\ze\_s*\%#', '\(\_s*\n\ze\s*\S\)\|\s*\ze\S')
endfunction

vnoremap <expr> az <SID>VAWS()
vnoremap <expr> iz <SID>VIWS()
onoremap az :normal vaz<CR>
onoremap iz :normal viz<CR>

" local tests - these won't run when sourced from elsewhere
if expand('%:p') == expand('<sfile>:p')

  if 1
    enew
    call setline(1, ["test   test"])
    norm! 1G0ell
    norm  yaz
    if @" == '   '
      echom "Ok"
    else
      throw "fail"
    endif
    bdelete!
  endif
  if 1
    enew
    call setline(1, ["test   test"])
    norm! 1G0ell
    norm  yiz
    if @" == '   '
      echom "Ok"
    else
      throw "fail"
    endif
    bdelete!
  endif
  if 1
    enew
    call setline(1, ["test ", "", "", "", " test"])
    norm! 2G0
    norm  yiz
    if @" == "\n\n\n"
      echom "Ok"
    else
      throw "fail"
    endif
    bdelete!
  endif
  if 1
    enew
    call setline(1, ["test ", "", "  ", "", " test"])
    norm! 2G0
    norm  yaz
    if @" == " \n\n  \n\n "
      echom "Ok"
    else
      throw "fail"
    endif
    bdelete!
  endif
endif

document.addEventListener "keydown", (e)=>
  if e.which == Keymap.F12
    loc_opt = {
      switch : "dev_tools_open"
    }
    await wsrs_back.request loc_opt, defer(err); throw err if err
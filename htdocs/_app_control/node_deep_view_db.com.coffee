module.exports =
  node : {}
  
  _mounted : true
  mount : ()->
    @node = {
      ip : "192.168.1.10"
      downloaded_size_bn : `100n*1024n**4n`
      # "reported" available size (sum of sizes)
      sm_avail_size_bn : `120n*1024n**4n`
      # byte/s
      dl_speed: 1e6
      ul_speed: 1e3
      hashrate: 5678
      h1      : 5000
      h2      : 78
      h2_cm   : 600
      vdf     : 1.20
      start_ts: Date.now()
      is_alive: true
      smart_status : "OK"
    }
    # for update update
    do ()=>
      while @_mounted
        @refs.com?.force_update()
        await setTimeout defer(), 1000
      return
  
  unmount : ()->
    @_mounted = false
  
  render : ()->
    Node_deep_view {
      ref : "com"
      node: @node
    }

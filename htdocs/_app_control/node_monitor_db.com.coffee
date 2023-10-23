module.exports =
  node_list : []
  net_stat  : {}
  
  _mounted : true
  mount : ()->
    # TODO get from backend
    sample_node = {
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
    @node_list = []
    for i in [10 ... 20]
      node = clone sample_node
      node.ip = "192.168.1.#{i}"
      @node_list.push node
    @node_list.push {
      ip : "192.168.1.250"
      downloaded_size_bn : `100n*1024n**2n`
      # "reported" available size (sum of sizes)
      sm_avail_size_bn : `100n*1024n**3n`
      dl_speed: 100e6
      ul_speed: 0
      hashrate: 10
      h1      : 10
      h2      : 0
      h2_cm   : 0
      vdf     : 5
      start_ts: Date.now()
      is_alive: false
      smart_status : "1 HDD fail"
    }
    
    # NOTE. Update ref on update
    @net_stat = {
      weave_size_bn : `152416987947254n`
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
    Node_monitor {
      ref       : "com"
      node_list : @node_list
      net_stat  : @net_stat
    }

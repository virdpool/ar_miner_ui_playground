module.exports =
  route_path_hash : {}
  mount : ()->
    window.route_list = [
      {path :             "", com :     "Page_dashboard" , title:  "Dashboard"}
      {path :   "onboarding", com :    "Page_onboarding" , title:    "Onboard"}
      {path : "node_monitor", com :  "Page_node_monitor" , title:    "Monitor"}
      {path :         "node", com :          "Page_node" , title:       "Node"}
      {path :       "wizard", com :        "Page_wizard" , title:     "Wizard"}
    ]
    
    @route_path_hash = {}
    for v in route_list
      @route_path_hash[v.path] = v
    
    return
  
  render : ()->
    Router_multi {
      render : (hash)=>
        @path = path = hash[""]?.path or ""
        if com = @route_path_hash[path]
          if !window[com.com]
            div "No #{com.com} component"
          else
            window[com.com] com
        else
          
          div "404"
    }
  
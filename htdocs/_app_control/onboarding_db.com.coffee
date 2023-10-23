module.exports =
  # Прим. неплохо бы иметь nested routing для dev experience
  step : "step_0"
  is_node_at_localhost : false
  ssh_node_list : []
  
  mount : ()->
    # detect node on localhost
    # check for 1984
    @is_node_at_localhost = true
    
    # detect on demand
    @ssh_ip_list = [
      "192.168.1.10"
    ]
    @port_1984_ip_list = [
      "192.168.1.20"
    ]
  
  render : ()->
    Onboarding {
      step : @step
      on_change_step : (value)=>
        @step = value
        @force_update()
      
      is_node_at_localhost : @is_node_at_localhost
      ssh_ip_list       : @ssh_ip_list
      port_1984_ip_list : @port_1984_ip_list
    }

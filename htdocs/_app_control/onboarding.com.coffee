module.exports =
  dialog : (opt)->
    {
      title
      list
    } = opt
    table {
      style:
        width : "100%"
    }
      tbody
        tr
          td {
            colSpan : list.length
            style:
              textAlign : "center"
              fontSize : 40
          }, title
        tr
          width_pecent = 100/list.length
          for item in list
            do (item)->
              td {
                style:
                  width : "#{width_pecent}%"
              }
                style =
                  width : "100%"
                  height: 200
                  fontSize : 40
                obj_set style, item.style if item.style
                Button {
                  label   : item.label
                  on_click: item.on_click
                  style   : style
                }
        if opt.note
          tr
            td {
              colSpan : list.length
              style:
                textAlign : "center"
                fontSize : 20
            }, opt.note
  
  # ###################################################################################################
  #    
  #    
  #    
  # ###################################################################################################
  render_step_0 : ()->
    @dialog {
      title : """
        Welcome to Arweave UI for miner
        """
      list : [
        {
          label    : "I want setup all by this tool"
          on_click : ()=>
            @props.on_change_step "step_1_setup"
        }
        {
          label    : "I already have Arweave node"
          on_click : ()=>
            @props.on_change_step "step_1_connect"
        }
      ]
    }
  
  # ###################################################################################################
  #    branch-a
  # ###################################################################################################
  render_step_1_setup : ()->
    @dialog {
      title : """
        Choose setup
        """
      list : [
        {
          label    : "This machine only"
          on_click : ()=>
            @props.on_change_step "step_2_setup_localhost"
        }
        {
          label    : "Remote machine"
          on_click : ()=>
            @props.on_change_step "step_2_setup_remote"
        }
        {
          label    : "Multiple machines"
          on_click : ()=>
            @props.on_change_step "step_2_setup_multi"
        }
        {
          label    : "Multiple machines coordinated cluster"
          on_click : ()=>
            @props.on_change_step "step_2_setup_multi_cluster"
        }
      ]
      note : """
        NOTE: You can connect any amount of local/remote nodes from menu later
        """
    }
  
  render_step_2_setup_localhost : ()->
    div
      div "TODO Detect current machine OS"
      div "TODO download latest arweave node"
      div "TODO detect available HDDs"
      div "TODO detect CPU model"
      div "TODO on-demand CPU benchmark"
      div "TODO on-demand HDDs benchmark"
  
  render_ssh_demo : ()->
    table {
      class : "table"
    }
      tbody
        tr
          th "IP"
        for ip in @props.ssh_ip_list
          tr
            td ip
  
  render_step_2_setup_remote : ()->
    div
      div "TODO scan LAN for open ssh ports"
      div "TODO probe LAN for ssh connection with ssh key"
      @render_ssh_demo()
      
  
  render_step_2_setup_multi : ()->
    div
      div "TODO scan LAN for open ssh ports"
      div "TODO probe LAN for ssh connection with ssh key"
      div "TODO suggested ssh config"
      div "NOTE: same as remote but for multiple machines"
      @render_ssh_demo()
  
  render_step_2_setup_multi_cluster : ()->
    div
      div "TODO scan LAN for open ssh ports"
      div "TODO probe LAN for ssh connection with ssh key"
      div "TODO suggested ssh config"
      div "NOTE: same as remote but for multiple machines"
      div "NOTE: register as cluster will make difference in generated storage modules config"
      @render_ssh_demo()
  
  # ###################################################################################################
  #    branch-b
  # ###################################################################################################
  render_step_1_connect : ()->
    @dialog {
      title : """
        So you want UI for existing node
        """
      list : [
        {
          label    : "Node is at this machine" + if @props.is_node_at_localhost then " (detected)" else ""
          on_click : ()=>
            @props.on_change_step "step_2_connect_localhost"
          style:
            backgroundColor : if @props.is_node_at_localhost then "#afa" else undefined
        }
        {
          label    : "Node is remote"
          on_click : ()=>
            @props.on_change_step "step_2_connect_remote"
        }
      ]
      note : """
        NOTE: You can connect any amount of local/remote nodes from menu later
        """
    }
  
  render_step_2_connect_localhost : ()->
    div "TODO UI for localhost display stat"
    # пользователь должен видеть, что всё подтянулось
  
  render_step_2_connect_remote : ()->
    div
      div "TODO scan LAN for open 1984 ports"
      div "TODO manual IP[:PORT] enter"
      table {
        class : "table"
      }
        tbody
          tr
            th "IP"
          for ip in @props.port_1984_ip_list
            tr
              td ip
          tr
            td Text_input {
              placeholder : "Add IP[:PORT]"
            }
      div "Note. Add is not working"
      div "Add will attempt to get /metrics from that node"
      div "On success - button to add (hit enter also ok)"
      div "On fail - warning note"
  
  # ###################################################################################################
  #    
  # ###################################################################################################
  render : ()->
    step_list = [
      {
        title : "Step 0"
        value : "step_0"
      }
      # ###################################################################################################
      #    branch-a
      # ###################################################################################################
      {
        title : "Step 1a"
        value : "step_1_setup"
      }
      {
        title : "Step 2a.a"
        value : "step_2_setup_localhost"
      }
      {
        title : "Step 2a.b"
        value : "step_2_setup_remote"
      }
      {
        title : "Step 2a.c"
        value : "step_2_setup_multi"
      }
      {
        title : "Step 2a.d"
        value : "step_2_setup_multi_cluster"
      }
      # ###################################################################################################
      #    branch-b
      # ###################################################################################################
      {
        title : "Step 1b"
        value : "step_1_connect"
      }
      {
        title : "Step 2b.a"
        value : "step_2_connect_localhost"
      }
      {
        title : "Step 2b.b"
        value : "step_2_connect_remote"
      }
    ]
    div
      Tab_bar {
        value : @props.step
        on_change : @props.on_change_step
        list : step_list
      }
      if render_fn = @["render_#{@props.step}"]
        render_fn.apply @
      else
        div "unimplemented"

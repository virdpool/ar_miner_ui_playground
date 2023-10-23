module.exports =
  render_tooltip_cell : (opt)->
    {
      title
      hint_fn
    } = opt
    th
      Tooltip {
        mount_point_y : "bottom"
        position_y    : "top"
        mount_point_x : "left"
        position_x    : "right"
        tooltip_render : ()->
          div {
            style:
              backgroundColor : "#fff"
              border : "1px solid black"
              borderRadius : 3
              padding : 3
              fontWeight : "initial"
              minWidth : 150
          }
            hint_fn()
        style :
          width : "100%"
      }
        span title
  
  render : ()->
    now = Date.now()
    {node} = @props
    
    num_cell_style = {
      textAlign : "right"
    }
    div
      table {
        class : "table"
        style :
          fontFamily : "monospace"
      }
        tbody
          tr
            th "IP"
            td node.ip
          tr
            @render_tooltip_cell {
              title : "DL size"
              hint_fn : ()->
                span "Downloaded size"
            }
            td {style:num_cell_style}, fmt_size node.downloaded_size_bn
          tr
            @render_tooltip_cell {
              title : "Disk space"
              hint_fn : ()->
                div
                  span "Total storage modules "
                div
                  b "declared"
                  span " space"
            }
            td {style:num_cell_style}, fmt_size node.sm_avail_size_bn
          tr
            @render_tooltip_cell {
              title : "Hashrate"
              hint_fn : ()->
                div
                  span "Hashrate ="
                div
                  span "H1 + H2 + CM H2"
            }
            td {style:num_cell_style}, fmt_hashrate node.hashrate
          tr
            @render_tooltip_cell {
              title : "H1"
              hint_fn : ()->
                span "Hashrate for H1"
            }
            td {style:num_cell_style}, fmt_hashrate node.h1
          tr
            @render_tooltip_cell {
              title : "H2"
              hint_fn : ()->
                div
                  span "Hashrate for H2"
                div
                  span "only "
                  b "own"
                  span " H2"
            }
            td {style:num_cell_style}, fmt_hashrate node.h2
          tr
            @render_tooltip_cell {
              title : "CM H2"
              hint_fn : ()->
                div
                  span "Hashrate for H2"
                div
                  span "only "
                  b "coordinated mining"
                  span " H2"
            }
            td {style:num_cell_style}, fmt_hashrate node.h2_cm
          tr
            @render_tooltip_cell {
              title : "DL"
              hint_fn : ()->
                span "Download speed"
                div
                  span "("
                  b "bytes"
                  span " per second)"
            }
            td {style:num_cell_style}, fmt_net_speed node.dl_speed
          tr
            @render_tooltip_cell {
              title : "UL"
              hint_fn : ()->
                span "Upload speed"
                div
                  span "("
                  b "bytes"
                  span " per second)"
            }
            td {style:num_cell_style}, fmt_net_speed node.ul_speed
          tr
            @render_tooltip_cell {
              title : "VDF"
              hint_fn : ()->
                span "VDF time in seconds"
            }
            td {style:num_cell_style}, node.vdf.to_format_float_string()
          tr
            @render_tooltip_cell {
              title : "CPU"
              hint_fn : ()->
                span "CPU usage"
                div
                  span "(available only in ssh-mode)"
            }
          tr
            @render_tooltip_cell {
              title : "RAM"
              hint_fn : ()->
                span "System memory usage"
                div
                  span "(available only in ssh-mode)"
            }
          tr
            @render_tooltip_cell {
              title : "SMART"
              hint_fn : ()->
                div "HDD S.M.A.R.T."
                div "monitor status"
                div
                  span "(available only in ssh-mode)"
            }
            td {style:num_cell_style}, node.smart_status
          
          tr
            @render_tooltip_cell {
              title : "dmesg"
              hint_fn : ()->
                div
                  span "(available only in ssh-mode)"
            }
          tr
            @render_tooltip_cell {
              title : "uptime"
              hint_fn : ()->
                span "uptime from last "
                span b "node"
                span " restart"
            }
            td {style:num_cell_style}, tsd_fmt now - node.start_ts
      
      div "TODO. Color-code slow VDF (> 2 sec)"
      div "TODO. Color-code SMART"
  

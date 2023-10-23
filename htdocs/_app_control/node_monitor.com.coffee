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
      }
        span title
  
  render : ()->
    # TODO Table with sort
    total_downloaded_size_bn= `0n`
    total_sm_avail_size_bn  = `0n`
    total_hashrate= 0
    total_h1      = 0
    total_h2      = 0
    total_h2_cm   = 0
    total_dl_speed= 0
    total_ul_speed= 0
    div
      table {
        class : "table"
        style :
          fontFamily : "monospace"
      }
        tbody
          tr
            th "IP"
            @render_tooltip_cell {
              title : "DL size"
              hint_fn : ()->
                span "Downloaded size"
            }
            @render_tooltip_cell {
              title : "Disk space"
              hint_fn : ()->
                div
                  span "Total storage modules "
                div
                  b "declared"
                  span " space"
            }
            @render_tooltip_cell {
              title : "Hashrate"
              hint_fn : ()->
                div
                  span "Hashrate ="
                div
                  span "H1 + H2 + CM H2"
            }
            @render_tooltip_cell {
              title : "H1"
              hint_fn : ()->
                span "Hashrate for H1"
            }
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
            @render_tooltip_cell {
              title : "DL"
              hint_fn : ()->
                span "Download speed"
                div
                  span "("
                  b "bytes"
                  span " per second)"
            }
            @render_tooltip_cell {
              title : "UL"
              hint_fn : ()->
                span "Upload speed"
                div
                  span "("
                  b "bytes"
                  span " per second)"
            }
            @render_tooltip_cell {
              title : "VDF"
              hint_fn : ()->
                span "VDF time in seconds"
            }
            @render_tooltip_cell {
              title : "CPU"
              hint_fn : ()->
                span "CPU usage"
                div
                  span "(available only in ssh-mode)"
            }
            @render_tooltip_cell {
              title : "RAM"
              hint_fn : ()->
                span "System memory usage"
                div
                  span "(available only in ssh-mode)"
            }
            @render_tooltip_cell {
              title : "SMART"
              hint_fn : ()->
                div "HDD S.M.A.R.T."
                div "monitor status"
                div
                  span "(available only in ssh-mode)"
            }
            @render_tooltip_cell {
              title : "uptime"
              hint_fn : ()->
                span "uptime from last "
                span b "node"
                span " restart"
            }
          num_cell_style = {
            textAlign : "right"
          }
          now = Date.now()
          for node in @props.node_list
            if node.is_alive
              total_downloaded_size_bn+= node.downloaded_size_bn
              total_sm_avail_size_bn  += node.sm_avail_size_bn
              total_hashrate          += node.hashrate
              total_h1                += node.h1
              total_h2                += node.h2
              total_h2_cm             += node.h2_cm
              total_dl_speed          += node.dl_speed
              total_ul_speed          += node.ul_speed
            tr {
              class : if node.is_alive then undefined else "warning"
            }
              td node.ip
              td {style:num_cell_style}, fmt_size node.downloaded_size_bn
              td {style:num_cell_style}, fmt_size node.sm_avail_size_bn
              td {style:num_cell_style}, fmt_hashrate node.hashrate
              td {style:num_cell_style}, fmt_hashrate node.h1
              td {style:num_cell_style}, fmt_hashrate node.h2
              td {style:num_cell_style}, fmt_hashrate node.h2_cm
              td {style:num_cell_style}, fmt_net_speed node.dl_speed
              td {style:num_cell_style}, fmt_net_speed node.ul_speed
              td {style:num_cell_style}, node.vdf.to_format_float_string()
              td
              td
              td {style:num_cell_style}, node.smart_status
              td {style:num_cell_style}, tsd_fmt now - node.start_ts
          tr
            # не семантичненько?
            th {
              style:
                textAlign : "right"
            }, "Total"
            th {style:num_cell_style}, fmt_size total_downloaded_size_bn
            th {style:num_cell_style}, fmt_size total_sm_avail_size_bn
            th {style:num_cell_style}, fmt_hashrate total_hashrate
            th {style:num_cell_style}, fmt_hashrate total_h1
            th {style:num_cell_style}, fmt_hashrate total_h2
            th {style:num_cell_style}, fmt_hashrate total_h2_cm
            th {style:num_cell_style}, fmt_net_speed total_dl_speed
            th {style:num_cell_style}, fmt_net_speed total_ul_speed
            th
            th
            th
            th
            th
      Mining_calculator_readonly_db {
        hashrate : total_hashrate
      }
      div "NOTE. Maybe color-code KB MB GB TB"
      div "TODO. Color-code slow VDF (> 2 sec)"
      div "TODO. Color-code SMART"
  
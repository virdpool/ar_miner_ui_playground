module.exports =
  render : ()->
    {
      hashrate
      exchange_rate
      
      net_day_earnings_ar
      net_hashrate
    } = @props
    table {
      class : "table"
    }
      tbody
        tr
          th "net hashrate"
          td {colSpan : 4}, fmt_hashrate net_hashrate
        tr
          th "Exchange rate"
          td {colSpan : 4}, "#{exchange_rate} USD/AR"
        list = [
          {
            title : "month"
            mult  : 30
          }
          {
            title : "week"
            mult  : 7
          }
          {
            title : "day"
            mult  : 1
          }
          {
            title : "hour"
            mult  : 1/24
          }
        ]
        profit_ar_per_day = net_day_earnings_ar * hashrate / net_hashrate
        num_cell_style = {
          textAlign : "right"
        }
        for v in list
          profit = profit_ar_per_day*v.mult
          tr
            th "Profit per #{v.title}"
            td {style:num_cell_style}, (profit).to_format_float_string()
            td "AR/#{v.title}"
            td {style:num_cell_style}, (profit*exchange_rate).to_format_float_string()
            td "USD/#{v.title}"

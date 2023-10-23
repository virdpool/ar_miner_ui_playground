module.exports =
  weave_size_bn : 0
  difficulty : 0 # не target
  
  exchange_rate : 4.23
  
  # calc
  net_hashrate    : 0
  net_day_earnings_ar: 0
  net_day_earnings_ar_min: 0
  net_day_earnings_ar_max: 0
  
  mount : ()->
    # TODO get network data
    @weave_size_bn = `152416987947254n`
    @net_hashrate = 30e6
    @net_day_earnings_ar = 720*0.98
  
  render : ()->
    Mining_calculator_readonly {
      exchange_rate : @exchange_rate
      
      hashrate    : @props.hashrate
      net_hashrate: @net_hashrate
      net_day_earnings_ar: @net_day_earnings_ar
      # TODO LATER min/max
    }

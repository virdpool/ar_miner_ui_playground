(function() {
  var com_name, conf;

  com_name = "Mining_calculator_readonly_db";

  if (window.module == null) {
    window.module = {};
  }

  module.exports = {
    weave_size_bn: 0,
    difficulty: 0,
    exchange_rate: 4.23,
    net_hashrate: 0,
    net_day_earnings_ar: 0,
    net_day_earnings_ar_min: 0,
    net_day_earnings_ar_max: 0,
    mount: function() {
      this.weave_size_bn = 152416987947254n;
      this.net_hashrate = 30e6;
      return this.net_day_earnings_ar = 720 * 0.98;
    },
    render: function() {
      return Mining_calculator_readonly({
        exchange_rate: this.exchange_rate,
        hashrate: this.props.hashrate,
        net_hashrate: this.net_hashrate,
        net_day_earnings_ar: this.net_day_earnings_ar
      });
    }
  };

  conf = React.createClass(CKR.react_key_map(com_name, module.exports));

  define_com("Mining_calculator_readonly_db", conf);

}).call(this);

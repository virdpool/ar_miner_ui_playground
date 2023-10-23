(function() {
  var com_name, conf;

  com_name = "Mining_calculator_readonly";

  if (window.module == null) {
    window.module = {};
  }

  module.exports = {
    render: function() {
      var exchange_rate, hashrate, net_day_earnings_ar, net_hashrate, _ref;
      _ref = this.props, hashrate = _ref.hashrate, exchange_rate = _ref.exchange_rate, net_day_earnings_ar = _ref.net_day_earnings_ar, net_hashrate = _ref.net_hashrate;
      return table({
        "class": "table"
      }, (function(_this) {
        return function() {
          return tbody(function() {
            var list, num_cell_style, profit, profit_ar_per_day, v, _i, _len, _results;
            tr(function() {
              th("net hashrate");
              return td({
                colSpan: 4
              }, fmt_hashrate(net_hashrate));
            });
            tr(function() {
              th("Exchange rate");
              return td({
                colSpan: 4
              }, "" + exchange_rate + " USD/AR");
            });
            list = [
              {
                title: "month",
                mult: 30
              }, {
                title: "week",
                mult: 7
              }, {
                title: "day",
                mult: 1
              }, {
                title: "hour",
                mult: 1 / 24
              }
            ];
            profit_ar_per_day = net_day_earnings_ar * hashrate / net_hashrate;
            num_cell_style = {
              textAlign: "right"
            };
            _results = [];
            for (_i = 0, _len = list.length; _i < _len; _i++) {
              v = list[_i];
              profit = profit_ar_per_day * v.mult;
              _results.push(tr(function() {
                th("Profit per " + v.title);
                td({
                  style: num_cell_style
                }, profit.to_format_float_string());
                td("AR/" + v.title);
                td({
                  style: num_cell_style
                }, (profit * exchange_rate).to_format_float_string());
                return td("USD/" + v.title);
              }));
            }
            return _results;
          });
        };
      })(this));
    }
  };

  conf = React.createClass(CKR.react_key_map(com_name, module.exports));

  define_com("Mining_calculator_readonly", conf);

}).call(this);

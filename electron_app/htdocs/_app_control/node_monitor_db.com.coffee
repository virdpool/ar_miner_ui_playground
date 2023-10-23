(function() {
  var com_name, conf, __iced_k, __iced_k_noop;

  __iced_k = __iced_k_noop = function() {};

  com_name = "Node_monitor_db";

  if (window.module == null) {
    window.module = {};
  }

  module.exports = {
    node_list: [],
    net_stat: {},
    _mounted: true,
    mount: function() {
      var i, node, sample_node, _i;
      sample_node = {
        ip: "192.168.1.10",
        downloaded_size_bn: 100n*1024n**4n,
        sm_avail_size_bn: 120n*1024n**4n,
        dl_speed: 1e6,
        ul_speed: 1e3,
        hashrate: 5678,
        h1: 5000,
        h2: 78,
        h2_cm: 600,
        vdf: 1.20,
        start_ts: Date.now(),
        is_alive: true,
        smart_status: "OK"
      };
      this.node_list = [];
      for (i = _i = 10; _i < 20; i = ++_i) {
        node = clone(sample_node);
        node.ip = "192.168.1." + i;
        this.node_list.push(node);
      }
      this.node_list.push({
        ip: "192.168.1.250",
        downloaded_size_bn: 100n*1024n**2n,
        sm_avail_size_bn: 100n*1024n**3n,
        dl_speed: 100e6,
        ul_speed: 0,
        hashrate: 10,
        h1: 10,
        h2: 0,
        h2_cm: 0,
        vdf: 5,
        start_ts: Date.now(),
        is_alive: false,
        smart_status: "1 HDD fail"
      });
      this.net_stat = {
        weave_size_bn: 152416987947254n
      };
      return (function(_this) {
        return function() {
          var ___iced_passed_deferral, __iced_deferrals, __iced_k;
          __iced_k = __iced_k_noop;
          ___iced_passed_deferral = iced.findDeferral(arguments);
          (function(__iced_k) {
            var _while;
            _while = function(__iced_k) {
              var _break, _continue, _next, _ref;
              _break = __iced_k;
              _continue = function() {
                return iced.trampoline(function() {
                  return _while(__iced_k);
                });
              };
              _next = _continue;
              if (!_this._mounted) {
                return _break();
              } else {
                if ((_ref = _this.refs.com) != null) {
                  _ref.force_update();
                }
                (function(__iced_k) {
                  __iced_deferrals = new iced.Deferrals(__iced_k, {
                    parent: ___iced_passed_deferral
                  });
                  setTimeout(__iced_deferrals.defer({
                    lineno: 47
                  }), 1000);
                  __iced_deferrals._fulfill();
                })(_next);
              }
            };
            _while(__iced_k);
          })(function() {});
        };
      })(this)();
    },
    unmount: function() {
      return this._mounted = false;
    },
    render: function() {
      return Node_monitor({
        ref: "com",
        node_list: this.node_list,
        net_stat: this.net_stat
      });
    }
  };

  conf = React.createClass(CKR.react_key_map(com_name, module.exports));

  define_com("Node_monitor_db", conf);

}).call(this);

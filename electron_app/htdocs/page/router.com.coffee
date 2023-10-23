(function() {
  var com_name, conf;

  com_name = "Page_router";

  if (window.module == null) {
    window.module = {};
  }

  module.exports = {
    route_path_hash: {},
    mount: function() {
      var v, _i, _len;
      window.route_list = [
        {
          path: "",
          com: "Page_dashboard",
          title: "Dashboard"
        }, {
          path: "onboarding",
          com: "Page_onboarding",
          title: "Onboard"
        }, {
          path: "node_monitor",
          com: "Page_node_monitor",
          title: "Monitor"
        }, {
          path: "node",
          com: "Page_node",
          title: "Node"
        }, {
          path: "wizard",
          com: "Page_wizard",
          title: "Wizard"
        }
      ];
      this.route_path_hash = {};
      for (_i = 0, _len = route_list.length; _i < _len; _i++) {
        v = route_list[_i];
        this.route_path_hash[v.path] = v;
      }
    },
    render: function() {
      return Router_multi({
        render: (function(_this) {
          return function(hash) {
            var com, path, _ref;
            _this.path = path = ((_ref = hash[""]) != null ? _ref.path : void 0) || "";
            if (com = _this.route_path_hash[path]) {
              if (!window[com.com]) {
                return div("No " + com.com + " component");
              } else {
                return window[com.com](com);
              }
            } else {
              return div("404");
            }
          };
        })(this)
      });
    }
  };

  conf = React.createClass(CKR.react_key_map(com_name, module.exports));

  define_com("Page_router", conf);

}).call(this);

(function() {
  var com_name, conf;

  com_name = "Onboarding";

  if (window.module == null) {
    window.module = {};
  }

  module.exports = {
    dialog: function(opt) {
      var list, title;
      title = opt.title, list = opt.list;
      return table({
        style: {
          width: "100%"
        }
      }, (function(_this) {
        return function() {
          return tbody(function() {
            tr(function() {
              return td({
                colSpan: list.length,
                style: {
                  textAlign: "center",
                  fontSize: 40
                }
              }, title);
            });
            tr(function() {
              var item, width_pecent, _i, _len, _results;
              width_pecent = 100 / list.length;
              _results = [];
              for (_i = 0, _len = list.length; _i < _len; _i++) {
                item = list[_i];
                _results.push((function(item) {
                  return td({
                    style: {
                      width: "" + width_pecent + "%"
                    }
                  }, (function(_this) {
                    return function() {
                      var style;
                      style = {
                        width: "100%",
                        height: 200,
                        fontSize: 40
                      };
                      if (item.style) {
                        obj_set(style, item.style);
                      }
                      return Button({
                        label: item.label,
                        on_click: item.on_click,
                        style: style
                      });
                    };
                  })(this));
                })(item));
              }
              return _results;
            });
            if (opt.note) {
              return tr(function() {
                return td({
                  colSpan: list.length,
                  style: {
                    textAlign: "center",
                    fontSize: 20
                  }
                }, opt.note);
              });
            }
          });
        };
      })(this));
    },
    render_step_0: function() {
      return this.dialog({
        title: "Welcome to Arweave UI for miner",
        list: [
          {
            label: "I want setup all by this tool",
            on_click: (function(_this) {
              return function() {
                return _this.props.on_change_step("step_1_setup");
              };
            })(this)
          }, {
            label: "I already have Arweave node",
            on_click: (function(_this) {
              return function() {
                return _this.props.on_change_step("step_1_connect");
              };
            })(this)
          }
        ]
      });
    },
    render_step_1_setup: function() {
      return this.dialog({
        title: "Choose setup",
        list: [
          {
            label: "This machine only",
            on_click: (function(_this) {
              return function() {
                return _this.props.on_change_step("step_2_setup_localhost");
              };
            })(this)
          }, {
            label: "Remote machine",
            on_click: (function(_this) {
              return function() {
                return _this.props.on_change_step("step_2_setup_remote");
              };
            })(this)
          }, {
            label: "Multiple machines",
            on_click: (function(_this) {
              return function() {
                return _this.props.on_change_step("step_2_setup_multi");
              };
            })(this)
          }, {
            label: "Multiple machines coordinated cluster",
            on_click: (function(_this) {
              return function() {
                return _this.props.on_change_step("step_2_setup_multi_cluster");
              };
            })(this)
          }
        ],
        note: "NOTE: You can connect any amount of local/remote nodes from menu later"
      });
    },
    render_step_2_setup_localhost: function() {
      return div((function(_this) {
        return function() {
          div("TODO Detect current machine OS");
          div("TODO download latest arweave node");
          div("TODO detect available HDDs");
          div("TODO detect CPU model");
          div("TODO on-demand CPU benchmark");
          return div("TODO on-demand HDDs benchmark");
        };
      })(this));
    },
    render_ssh_demo: function() {
      return table({
        "class": "table"
      }, (function(_this) {
        return function() {
          return tbody(function() {
            var ip, _i, _len, _ref, _results;
            tr(function() {
              return th("IP");
            });
            _ref = _this.props.ssh_ip_list;
            _results = [];
            for (_i = 0, _len = _ref.length; _i < _len; _i++) {
              ip = _ref[_i];
              _results.push(tr(function() {
                return td(ip);
              }));
            }
            return _results;
          });
        };
      })(this));
    },
    render_step_2_setup_remote: function() {
      return div((function(_this) {
        return function() {
          div("TODO scan LAN for open ssh ports");
          div("TODO probe LAN for ssh connection with ssh key");
          return _this.render_ssh_demo();
        };
      })(this));
    },
    render_step_2_setup_multi: function() {
      return div((function(_this) {
        return function() {
          div("TODO scan LAN for open ssh ports");
          div("TODO probe LAN for ssh connection with ssh key");
          div("TODO suggested ssh config");
          div("NOTE: same as remote but for multiple machines");
          return _this.render_ssh_demo();
        };
      })(this));
    },
    render_step_2_setup_multi_cluster: function() {
      return div((function(_this) {
        return function() {
          div("TODO scan LAN for open ssh ports");
          div("TODO probe LAN for ssh connection with ssh key");
          div("TODO suggested ssh config");
          div("NOTE: same as remote but for multiple machines");
          div("NOTE: register as cluster will make difference in generated storage modules config");
          return _this.render_ssh_demo();
        };
      })(this));
    },
    render_step_1_connect: function() {
      return this.dialog({
        title: "So you want UI for existing node",
        list: [
          {
            label: "Node is at this machine" + (this.props.is_node_at_localhost ? " (detected)" : ""),
            on_click: (function(_this) {
              return function() {
                return _this.props.on_change_step("step_2_connect_localhost");
              };
            })(this),
            style: {
              backgroundColor: this.props.is_node_at_localhost ? "#afa" : void 0
            }
          }, {
            label: "Node is remote",
            on_click: (function(_this) {
              return function() {
                return _this.props.on_change_step("step_2_connect_remote");
              };
            })(this)
          }
        ],
        note: "NOTE: You can connect any amount of local/remote nodes from menu later"
      });
    },
    render_step_2_connect_localhost: function() {
      return div("TODO UI for localhost display stat");
    },
    render_step_2_connect_remote: function() {
      return div((function(_this) {
        return function() {
          div("TODO scan LAN for open 1984 ports");
          div("TODO manual IP[:PORT] enter");
          table({
            "class": "table"
          }, function() {
            return tbody(function() {
              var ip, _i, _len, _ref;
              tr(function() {
                return th("IP");
              });
              _ref = _this.props.port_1984_ip_list;
              for (_i = 0, _len = _ref.length; _i < _len; _i++) {
                ip = _ref[_i];
                tr(function() {
                  return td(ip);
                });
              }
              return tr(function() {
                return td(Text_input({
                  placeholder: "Add IP[:PORT]"
                }));
              });
            });
          });
          div("Note. Add is not working");
          div("Add will attempt to get /metrics from that node");
          div("On success - button to add (hit enter also ok)");
          return div("On fail - warning note");
        };
      })(this));
    },
    render: function() {
      var step_list;
      step_list = [
        {
          title: "Step 0",
          value: "step_0"
        }, {
          title: "Step 1a",
          value: "step_1_setup"
        }, {
          title: "Step 2a.a",
          value: "step_2_setup_localhost"
        }, {
          title: "Step 2a.b",
          value: "step_2_setup_remote"
        }, {
          title: "Step 2a.c",
          value: "step_2_setup_multi"
        }, {
          title: "Step 2a.d",
          value: "step_2_setup_multi_cluster"
        }, {
          title: "Step 1b",
          value: "step_1_connect"
        }, {
          title: "Step 2b.a",
          value: "step_2_connect_localhost"
        }, {
          title: "Step 2b.b",
          value: "step_2_connect_remote"
        }
      ];
      return div((function(_this) {
        return function() {
          var render_fn;
          Tab_bar({
            value: _this.props.step,
            on_change: _this.props.on_change_step,
            list: step_list
          });
          if (render_fn = _this["render_" + _this.props.step]) {
            return render_fn.apply(_this);
          } else {
            return div("unimplemented");
          }
        };
      })(this));
    }
  };

  conf = React.createClass(CKR.react_key_map(com_name, module.exports));

  define_com("Onboarding", conf);

}).call(this);

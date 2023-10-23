(function() {
  var com_name, conf;

  com_name = "Node_deep_view";

  if (window.module == null) {
    window.module = {};
  }

  module.exports = {
    render_tooltip_cell: function(opt) {
      var hint_fn, title;
      title = opt.title, hint_fn = opt.hint_fn;
      return th((function(_this) {
        return function() {
          return Tooltip({
            mount_point_y: "bottom",
            position_y: "top",
            mount_point_x: "left",
            position_x: "right",
            tooltip_render: function() {
              return div({
                style: {
                  backgroundColor: "#fff",
                  border: "1px solid black",
                  borderRadius: 3,
                  padding: 3,
                  fontWeight: "initial",
                  minWidth: 150
                }
              }, (function(_this) {
                return function() {
                  return hint_fn();
                };
              })(this));
            },
            style: {
              width: "100%"
            }
          }, function() {
            return span(title);
          });
        };
      })(this));
    },
    render: function() {
      var node, now, num_cell_style;
      now = Date.now();
      node = this.props.node;
      num_cell_style = {
        textAlign: "right"
      };
      return div((function(_this) {
        return function() {
          table({
            "class": "table",
            style: {
              fontFamily: "monospace"
            }
          }, function() {
            return tbody(function() {
              tr(function() {
                th("IP");
                return td(node.ip);
              });
              tr(function() {
                _this.render_tooltip_cell({
                  title: "DL size",
                  hint_fn: function() {
                    return span("Downloaded size");
                  }
                });
                return td({
                  style: num_cell_style
                }, fmt_size(node.downloaded_size_bn));
              });
              tr(function() {
                _this.render_tooltip_cell({
                  title: "Disk space",
                  hint_fn: function() {
                    div((function(_this) {
                      return function() {
                        return span("Total storage modules ");
                      };
                    })(this));
                    return div((function(_this) {
                      return function() {
                        b("declared");
                        return span(" space");
                      };
                    })(this));
                  }
                });
                return td({
                  style: num_cell_style
                }, fmt_size(node.sm_avail_size_bn));
              });
              tr(function() {
                _this.render_tooltip_cell({
                  title: "Hashrate",
                  hint_fn: function() {
                    div((function(_this) {
                      return function() {
                        return span("Hashrate =");
                      };
                    })(this));
                    return div((function(_this) {
                      return function() {
                        return span("H1 + H2 + CM H2");
                      };
                    })(this));
                  }
                });
                return td({
                  style: num_cell_style
                }, fmt_hashrate(node.hashrate));
              });
              tr(function() {
                _this.render_tooltip_cell({
                  title: "H1",
                  hint_fn: function() {
                    return span("Hashrate for H1");
                  }
                });
                return td({
                  style: num_cell_style
                }, fmt_hashrate(node.h1));
              });
              tr(function() {
                _this.render_tooltip_cell({
                  title: "H2",
                  hint_fn: function() {
                    div((function(_this) {
                      return function() {
                        return span("Hashrate for H2");
                      };
                    })(this));
                    return div((function(_this) {
                      return function() {
                        span("only ");
                        b("own");
                        return span(" H2");
                      };
                    })(this));
                  }
                });
                return td({
                  style: num_cell_style
                }, fmt_hashrate(node.h2));
              });
              tr(function() {
                _this.render_tooltip_cell({
                  title: "CM H2",
                  hint_fn: function() {
                    div((function(_this) {
                      return function() {
                        return span("Hashrate for H2");
                      };
                    })(this));
                    return div((function(_this) {
                      return function() {
                        span("only ");
                        b("coordinated mining");
                        return span(" H2");
                      };
                    })(this));
                  }
                });
                return td({
                  style: num_cell_style
                }, fmt_hashrate(node.h2_cm));
              });
              tr(function() {
                _this.render_tooltip_cell({
                  title: "DL",
                  hint_fn: function() {
                    span("Download speed");
                    return div((function(_this) {
                      return function() {
                        span("(");
                        b("bytes");
                        return span(" per second)");
                      };
                    })(this));
                  }
                });
                return td({
                  style: num_cell_style
                }, fmt_net_speed(node.dl_speed));
              });
              tr(function() {
                _this.render_tooltip_cell({
                  title: "UL",
                  hint_fn: function() {
                    span("Upload speed");
                    return div((function(_this) {
                      return function() {
                        span("(");
                        b("bytes");
                        return span(" per second)");
                      };
                    })(this));
                  }
                });
                return td({
                  style: num_cell_style
                }, fmt_net_speed(node.ul_speed));
              });
              tr(function() {
                _this.render_tooltip_cell({
                  title: "VDF",
                  hint_fn: function() {
                    return span("VDF time in seconds");
                  }
                });
                return td({
                  style: num_cell_style
                }, node.vdf.to_format_float_string());
              });
              tr(function() {
                return _this.render_tooltip_cell({
                  title: "CPU",
                  hint_fn: function() {
                    span("CPU usage");
                    return div((function(_this) {
                      return function() {
                        return span("(available only in ssh-mode)");
                      };
                    })(this));
                  }
                });
              });
              tr(function() {
                return _this.render_tooltip_cell({
                  title: "RAM",
                  hint_fn: function() {
                    span("System memory usage");
                    return div((function(_this) {
                      return function() {
                        return span("(available only in ssh-mode)");
                      };
                    })(this));
                  }
                });
              });
              tr(function() {
                _this.render_tooltip_cell({
                  title: "SMART",
                  hint_fn: function() {
                    div("HDD S.M.A.R.T.");
                    div("monitor status");
                    return div((function(_this) {
                      return function() {
                        return span("(available only in ssh-mode)");
                      };
                    })(this));
                  }
                });
                return td({
                  style: num_cell_style
                }, node.smart_status);
              });
              tr(function() {
                return _this.render_tooltip_cell({
                  title: "dmesg",
                  hint_fn: function() {
                    return div((function(_this) {
                      return function() {
                        return span("(available only in ssh-mode)");
                      };
                    })(this));
                  }
                });
              });
              return tr(function() {
                _this.render_tooltip_cell({
                  title: "uptime",
                  hint_fn: function() {
                    span("uptime from last ");
                    span(b("node"));
                    return span(" restart");
                  }
                });
                return td({
                  style: num_cell_style
                }, tsd_fmt(now - node.start_ts));
              });
            });
          });
          div("TODO. Color-code slow VDF (> 2 sec)");
          return div("TODO. Color-code SMART");
        };
      })(this));
    }
  };

  conf = React.createClass(CKR.react_key_map(com_name, module.exports));

  define_com("Node_deep_view", conf);

}).call(this);

(function() {
  var com_name, conf;

  com_name = "Node_monitor";

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
            }
          }, function() {
            return span(title);
          });
        };
      })(this));
    },
    render: function() {
      var total_dl_speed, total_downloaded_size_bn, total_h1, total_h2, total_h2_cm, total_hashrate, total_sm_avail_size_bn, total_ul_speed;
      total_downloaded_size_bn = 0n;
      total_sm_avail_size_bn = 0n;
      total_hashrate = 0;
      total_h1 = 0;
      total_h2 = 0;
      total_h2_cm = 0;
      total_dl_speed = 0;
      total_ul_speed = 0;
      return div((function(_this) {
        return function() {
          table({
            "class": "table",
            style: {
              fontFamily: "monospace"
            }
          }, function() {
            return tbody(function() {
              var node, now, num_cell_style, _i, _len, _ref;
              tr(function() {
                th("IP");
                _this.render_tooltip_cell({
                  title: "DL size",
                  hint_fn: function() {
                    return span("Downloaded size");
                  }
                });
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
                _this.render_tooltip_cell({
                  title: "H1",
                  hint_fn: function() {
                    return span("Hashrate for H1");
                  }
                });
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
                _this.render_tooltip_cell({
                  title: "VDF",
                  hint_fn: function() {
                    return span("VDF time in seconds");
                  }
                });
                _this.render_tooltip_cell({
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
                _this.render_tooltip_cell({
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
                return _this.render_tooltip_cell({
                  title: "uptime",
                  hint_fn: function() {
                    span("uptime from last ");
                    span(b("node"));
                    return span(" restart");
                  }
                });
              });
              num_cell_style = {
                textAlign: "right"
              };
              now = Date.now();
              _ref = _this.props.node_list;
              for (_i = 0, _len = _ref.length; _i < _len; _i++) {
                node = _ref[_i];
                if (node.is_alive) {
                  total_downloaded_size_bn += node.downloaded_size_bn;
                  total_sm_avail_size_bn += node.sm_avail_size_bn;
                  total_hashrate += node.hashrate;
                  total_h1 += node.h1;
                  total_h2 += node.h2;
                  total_h2_cm += node.h2_cm;
                  total_dl_speed += node.dl_speed;
                  total_ul_speed += node.ul_speed;
                }
                tr({
                  "class": node.is_alive ? void 0 : "warning"
                }, function() {
                  td(node.ip);
                  td({
                    style: num_cell_style
                  }, fmt_size(node.downloaded_size_bn));
                  td({
                    style: num_cell_style
                  }, fmt_size(node.sm_avail_size_bn));
                  td({
                    style: num_cell_style
                  }, fmt_hashrate(node.hashrate));
                  td({
                    style: num_cell_style
                  }, fmt_hashrate(node.h1));
                  td({
                    style: num_cell_style
                  }, fmt_hashrate(node.h2));
                  td({
                    style: num_cell_style
                  }, fmt_hashrate(node.h2_cm));
                  td({
                    style: num_cell_style
                  }, fmt_net_speed(node.dl_speed));
                  td({
                    style: num_cell_style
                  }, fmt_net_speed(node.ul_speed));
                  td({
                    style: num_cell_style
                  }, node.vdf.to_format_float_string());
                  td(function() {});
                  td(function() {});
                  td({
                    style: num_cell_style
                  }, node.smart_status);
                  return td({
                    style: num_cell_style
                  }, tsd_fmt(now - node.start_ts));
                });
              }
              return tr(function() {
                th({
                  style: {
                    textAlign: "right"
                  }
                }, "Total");
                th({
                  style: num_cell_style
                }, fmt_size(total_downloaded_size_bn));
                th({
                  style: num_cell_style
                }, fmt_size(total_sm_avail_size_bn));
                th({
                  style: num_cell_style
                }, fmt_hashrate(total_hashrate));
                th({
                  style: num_cell_style
                }, fmt_hashrate(total_h1));
                th({
                  style: num_cell_style
                }, fmt_hashrate(total_h2));
                th({
                  style: num_cell_style
                }, fmt_hashrate(total_h2_cm));
                th({
                  style: num_cell_style
                }, fmt_net_speed(total_dl_speed));
                th({
                  style: num_cell_style
                }, fmt_net_speed(total_ul_speed));
                th(function() {});
                th(function() {});
                th(function() {});
                th(function() {});
                return th(function() {});
              });
            });
          });
          Mining_calculator_readonly_db({
            hashrate: total_hashrate
          });
          div("NOTE. Maybe color-code KB MB GB TB");
          div("TODO. Color-code slow VDF (> 2 sec)");
          return div("TODO. Color-code SMART");
        };
      })(this));
    }
  };

  conf = React.createClass(CKR.react_key_map(com_name, module.exports));

  define_com("Node_monitor", conf);

}).call(this);

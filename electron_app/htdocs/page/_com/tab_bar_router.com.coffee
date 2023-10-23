(function() {
  var com_name, conf;

  com_name = "Page_tab_bar_router";

  if (window.module == null) {
    window.module = {};
  }

  module.exports = {
    render: function() {
      return div({
        "class": "tab",
        style: this.props.style
      }, (function(_this) {
        return function() {
          var btn_style, style;
          style = _this.props.center ? {
            margin: "0 auto"
          } : {};
          btn_style = _this.props.center ? {} : {
            float: "left"
          };
          if (_this.props.btn_style) {
            obj_set(btn_style, _this.props.btn_style);
          }
          return div({
            style: style
          }, function() {
            var v, _i, _len, _ref, _results;
            _ref = _this.props.list;
            _results = [];
            for (_i = 0, _len = _ref.length; _i < _len; _i++) {
              v = _ref[_i];
              _results.push((function(v) {
                return a({
                  "class": _this.props.value === v.path ? "active" : "",
                  href: "#/" + v.path,
                  on_click: function(e) {
                    e.preventDefault();
                    return _this.props.on_change(v);
                  },
                  style: btn_style
                }, v.title);
              })(v));
            }
            return _results;
          });
        };
      })(this));
    }
  };

  conf = React.createClass(CKR.react_key_map(com_name, module.exports));

  define_com("Page_tab_bar_router", conf);

}).call(this);

(function() {
  var com_name, conf;

  com_name = "Tab_bar";

  if (window.module == null) {
    window.module = {};
  }

  module.exports = {
    render: function() {
      var style;
      style = {};
      if (this.props.center) {
        style.textAlign = "center";
      }
      obj_set(style, this.props.style);
      return div({
        "class": "tab",
        style: style
      }, (function(_this) {
        return function() {
          var btn_style;
          style = _this.props.center ? {
            margin: "0 auto"
          } : {};
          btn_style = _this.props.center ? {
            paddingTop: "4"
          } : {
            float: "left"
          };
          if (_this.props.btn_style) {
            obj_set(btn_style, _this.props.btn_style);
          }
          return div({
            style: style
          }, function() {
            var k, list, v, _i, _len, _ref, _results;
            if (!(list = _this.props.list)) {
              list = [];
              _ref = _this.props.hash || {};
              for (k in _ref) {
                v = _ref[k];
                list.push({
                  value: k,
                  title: v
                });
              }
            }
            _results = [];
            for (_i = 0, _len = list.length; _i < _len; _i++) {
              v = list[_i];
              _results.push((function(v) {
                var _ref1, _ref2, _ref3;
                return Button({
                  "class": _this.props.value === v.value ? "active" : "",
                  label: (_ref1 = (_ref2 = v.title) != null ? _ref2 : (((_ref3 = v.value) != null ? _ref3.toString : void 0) ? v.value.toString() : null)) != null ? _ref1 : "",
                  on_click: function() {
                    return _this.props.on_change(v.value);
                  },
                  on_mouse_down: function(e) {
                    var _base;
                    return typeof (_base = _this.props).on_mouse_down === "function" ? _base.on_mouse_down(e, v.value) : void 0;
                  },
                  style: btn_style
                });
              })(v));
            }
            return _results;
          });
        };
      })(this));
    }
  };

  conf = React.createClass(CKR.react_key_map(com_name, module.exports));

  define_com("Tab_bar", conf);

}).call(this);

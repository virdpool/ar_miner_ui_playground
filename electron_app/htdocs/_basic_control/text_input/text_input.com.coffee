(function() {
  var com_name, conf;

  com_name = "Text_input";

  if (window.module == null) {
    window.module = {};
  }

  module.exports = {
    mount_done: function() {
      var pos, _base, _ref;
      if (typeof (_base = this.props).ref_cb === "function") {
        _base.ref_cb(this.refs.element);
      }
      if (this.props.autofocus) {
        pos = ((_ref = this.props.value) != null ? _ref : "").length;
        if (this.props.autofocus_all) {
          this.refs.element.setSelectionRange(0, pos);
        } else {
          this.refs.element.setSelectionRange(pos, pos);
        }
        return this.refs.element.focus();
      }
    },
    render: function() {
      var style, _ref;
      style = {
        boxSizing: "border-box"
      };
      if (this.props.style) {
        obj_set(style, this.props.style);
      }
      return input(obj_set({}, this.props, {
        ref: "element",
        id: this.props.id,
        "class": this.props["class"],
        style: style,
        disabled: this.props.disabled,
        tabIndex: this.props.tab_index,
        type: "text",
        value: (_ref = this.props.value) != null ? _ref : "",
        on_change: this.on_change,
        tabIndex: this.props.tab_index,
        on_key_press: (function(_this) {
          return function(event) {
            var _base, _base1;
            if (event.nativeEvent.which === 13) {
              if (typeof (_base = _this.props).on_enter === "function") {
                _base.on_enter(event);
              }
            }
            if (typeof (_base1 = _this.props).on_key_press === "function") {
              _base1.on_key_press(event);
            }
          };
        })(this),
        on_key_down: (function(_this) {
          return function(event) {
            var _base;
            if (typeof (_base = _this.props).on_key_down === "function") {
              _base.on_key_down(event);
            }
          };
        })(this)
      }));
    },
    on_change: function(event) {
      var value;
      value = event.target.value;
      this.props.on_change(value);
    }
  };

  conf = React.createClass(CKR.react_key_map(com_name, module.exports));

  define_com("Text_input", conf);

}).call(this);

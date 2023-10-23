(function() {
  var com_name, conf;

  com_name = "Button";

  if (window.module == null) {
    window.module = {};
  }

  module.exports = {
    mount_done: function() {
      if (this.props.autofocus) {
        return this.refs.element.focus();
      }
    },
    render: function() {
      return button({
        ref: "element",
        id: this.props.id,
        "class": this.props["class"],
        style: this.props.style,
        disabled: this.props.disabled,
        tabIndex: this.props.tab_index,
        on_click: this.props.on_click,
        on_hover: this.props.on_hover,
        on_mouse_down: this.props.on_mouse_down,
        on_mouse_out: (function(_this) {
          return function() {
            var _base, _base1;
            if (typeof (_base = _this.props).on_mouse_out === "function") {
              _base.on_mouse_out();
            }
            return typeof (_base1 = _this.props).on_blur === "function" ? _base1.on_blur() : void 0;
          };
        })(this)
      }, this.props.label);
    }
  };

  conf = React.createClass(CKR.react_key_map(com_name, module.exports));

  define_com("Button", conf);

}).call(this);

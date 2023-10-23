(function() {
  var com_name, conf;

  com_name = "Page_nav";

  if (window.module == null) {
    window.module = {};
  }

  module.exports = {
    render: function() {
      return Page_tab_bar_router({
        value: this.props.path,
        list: window.route_list,
        on_change: (function(_this) {
          return function(t) {
            route_go(t.path);
          };
        })(this),
        btn_style: {
          fontSize: 10
        }
      });
    }
  };

  conf = React.createClass(CKR.react_key_map(com_name, module.exports));

  define_com("Page_nav", conf);

}).call(this);

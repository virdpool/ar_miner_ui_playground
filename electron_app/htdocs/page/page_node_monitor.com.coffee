(function() {
  var com_name, conf;

  com_name = "Page_node_monitor";

  if (window.module == null) {
    window.module = {};
  }

  module.exports = {
    render: function() {
      return Page_wrap(this.props, (function(_this) {
        return function() {
          return Node_monitor_db({});
        };
      })(this));
    }
  };

  conf = React.createClass(CKR.react_key_map(com_name, module.exports));

  define_com("Page_node_monitor", conf);

}).call(this);

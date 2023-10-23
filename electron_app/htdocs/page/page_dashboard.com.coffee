(function() {
  var com_name, conf;

  com_name = "Page_dashboard";

  if (window.module == null) {
    window.module = {};
  }

  module.exports = {
    render: function() {
      return Page_wrap(this.props, (function(_this) {
        return function() {
          return div("Use top panel to look at different components");
        };
      })(this));
    }
  };

  conf = React.createClass(CKR.react_key_map(com_name, module.exports));

  define_com("Page_dashboard", conf);

}).call(this);

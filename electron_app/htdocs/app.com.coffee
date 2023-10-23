(function() {
  var com_name, conf;

  com_name = "App";

  if (window.module == null) {
    window.module = {};
  }

  module.exports = {
    render: function() {
      return Page_router({});
    }
  };

  conf = React.createClass(CKR.react_key_map(com_name, module.exports));

  define_com("App", conf);

}).call(this);

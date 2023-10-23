(function() {
  var com_name, conf;

  com_name = "Onboard";

  if (window.module == null) {
    window.module = {};
  }

  module.exports = {
    render: function() {
      return div("hello onboard");
    }
  };

  conf = React.createClass(CKR.react_key_map(com_name, module.exports));

  define_com("Onboard", conf);

}).call(this);

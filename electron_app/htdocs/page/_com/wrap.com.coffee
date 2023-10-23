(function() {
  var com_name, conf;

  com_name = "Page_wrap";

  if (window.module == null) {
    window.module = {};
  }

  module.exports = {
    render: function() {
      return div({
        style: {
          height: "100%",
          width: "100%"
        }
      }, (function(_this) {
        return function() {
          div({
            style: {
              marginBottom: -50
            }
          }, function() {
            return Page_nav({
              path: _this.props.path
            });
          });
          return div({
            style: {
              display: "table",
              height: "100%",
              width: "100%"
            }
          }, function() {
            return div({
              style: {
                paddingTop: 50 + 10,
                paddingLeft: 10,
                paddingRight: 10,
                display: "table-cell"
              }
            }, function() {
              return _this.props.children;
            });
          });
        };
      })(this));
    }
  };

  conf = React.createClass(CKR.react_key_map(com_name, module.exports));

  define_com("Page_wrap", conf);

}).call(this);

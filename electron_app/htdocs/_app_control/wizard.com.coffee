(function() {
  var com_name, conf;

  com_name = "Wizard";

  if (window.module == null) {
    window.module = {};
  }

  module.exports = {
    render: function() {
      return table({}, (function(_this) {
        return function() {
          return tbody(function() {
            var msg, _i, _len, _ref, _results;
            _ref = _this.props.msg_list;
            _results = [];
            for (_i = 0, _len = _ref.length; _i < _len; _i++) {
              msg = _ref[_i];
              _results.push(tr({
                style: msg.style
              }, function() {
                return td({
                  style: {
                    padding: 5
                  }
                }, function() {
                  return msg.title_fn();
                });
              }));
            }
            return _results;
          });
        };
      })(this));
    }
  };

  conf = React.createClass(CKR.react_key_map(com_name, module.exports));

  define_com("Wizard", conf);

}).call(this);

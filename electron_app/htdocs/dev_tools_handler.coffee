(function() {
  var __iced_k, __iced_k_noop;

  __iced_k = __iced_k_noop = function() {};

  document.addEventListener("keydown", (function(_this) {
    return function(e) {
      var err, loc_opt, ___iced_passed_deferral, __iced_deferrals, __iced_k;
      __iced_k = __iced_k_noop;
      ___iced_passed_deferral = iced.findDeferral(arguments);
      if (e.which === Keymap.F12) {
        loc_opt = {
          "switch": "dev_tools_open"
        };
        (function(__iced_k) {
          __iced_deferrals = new iced.Deferrals(__iced_k, {
            parent: ___iced_passed_deferral
          });
          wsrs_back.request(loc_opt, __iced_deferrals.defer({
            assign_fn: (function() {
              return function() {
                return err = arguments[0];
              };
            })(),
            lineno: 5
          }));
          __iced_deferrals._fulfill();
        })(function() {
          if (err) {
            throw err;
          }
          return __iced_k();
        });
      } else {
        return __iced_k();
      }
    };
  })(this));

}).call(this);

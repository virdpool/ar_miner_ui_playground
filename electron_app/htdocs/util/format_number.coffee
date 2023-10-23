(function() {
  Number.prototype.to_format_int_string = function() {
    return this.toString().reverse().split(/(...)/).filter(function(t) {
      return t !== "";
    }).join(" ").reverse().trim().replace("- ", "-");
  };

  String.prototype.to_format_int_string = function() {
    return this.reverse().split(/(...)/).filter(function(t) {
      return t !== "";
    }).join(" ").reverse().trim().replace("- ", "-");
  };

  Number.prototype.to_format_float_string = function(decimals) {
    var frac, main, _ref;
    if (decimals == null) {
      decimals = 2;
    }
    if (decimals === 0) {
      return this.toFixed(0).to_format_int_string();
    }
    _ref = this.toFixed(decimals).split("."), main = _ref[0], frac = _ref[1];
    main = main.reverse().split(/(...)/).filter(function(t) {
      return t !== "";
    }).join(" ").reverse().trim().replace("- ", "-");
    return "" + main + "." + frac;
  };

}).call(this);

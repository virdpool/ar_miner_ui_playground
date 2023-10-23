(function() {
  var size_mv_list;

  size_mv_list = [".B", "KB", "MB", "GB", "TB", "PB"];

  window.fmt_size = function(value_bn) {
    var idx, mv, mv_list, value;
    value = Number(value_bn);
    mv_list = size_mv_list;
    idx = 0;
    while (true) {
      mv = mv_list[idx];
      if (value < 900 || idx + 1 >= mv_list.length) {
        if (idx === 0) {
          return "" + value + " " + mv;
        } else {
          return "" + (value.toFixed(2)) + " " + mv;
        }
      }
      value /= 1024;
      idx++;
    }
    return "";
  };

  size_mv_list = [".Bps", "KBps", "MBps", "GBps", "TBps", "PBps"];

  window.fmt_net_speed = function(value) {
    var idx, mv, mv_list;
    mv_list = size_mv_list;
    idx = 0;
    while (true) {
      mv = mv_list[idx];
      if (value < 900 || idx + 1 >= mv_list.length) {
        return "" + (value.toFixed(2)) + " " + mv;
      }
      value /= 1024;
      idx++;
    }
    return "";
  };


  /*
  hashrate_mv_list = [
    "h/s"
    "kh/s"
    "mh/s"
  ]
  window.fmt_hashrate = (value)->
    idx = 0
    mv_list = hashrate_mv_list
    loop
      mv = mv_list[idx]
       * да, такой странный порог срабатывания
      if value < 900 or idx+1 >= mv_list.length
        if idx == 0
          return "#{value} #{mv}"
        else
          return "#{value.toFixed(2)} #{mv}"
      value /= 1000
      idx++
    return ""
   */

  window.fmt_hashrate = function(t) {
    return t.to_format_int_string();
  };

}).call(this);

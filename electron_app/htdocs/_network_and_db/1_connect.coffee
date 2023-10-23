(function() {
  var Websocket_like_electron;

  Websocket_like_electron = (function() {
    Websocket_like_electron.uid = 0;

    Websocket_like_electron.prototype.uid = 0;

    event_mixin(Websocket_like_electron);

    function Websocket_like_electron() {
      event_mixin_constructor(this);
      this.uid = Websocket_like_electron.uid++;
      setTimeout((function(_this) {
        return function() {
          return _this.dispatch("reconnect");
        };
      })(this), 0);
    }

    Websocket_like_electron.prototype["delete"] = function() {
      return this.close();
    };

    Websocket_like_electron.prototype.close = function() {
      return perr("close is not available");
    };

    Websocket_like_electron.prototype.send = function(msg) {
      return electronAPI.ws_emu_send(msg);
    };

    Websocket_like_electron.prototype.write = Websocket_like_electron.prototype.send;

    Websocket_like_electron.prototype.ws_init = function() {
      return perr("ws_init is not available");
    };

    Websocket_like_electron.prototype.ws_reconnect = function() {
      return perr("ws_reconnect is not available");
    };

    return Websocket_like_electron;

  })();

  window.ws_back = new Websocket_like_electron;

  electronAPI.ws_emu_on_data(function(data) {
    return ws_back.dispatch("data", data);
  });

  window.wsrs_back = new Ws_request_service(ws_back);

}).call(this);

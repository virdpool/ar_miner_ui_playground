#!/usr/bin/env iced
### !pragma coverage-skip-block ###
delivery= require "webcom"
{
  master_registry
  Webcom_bundle
} = require "webcom/lib/client_configurator"
config = require "./config"
{cache} = require("./front_cache")

bundle  = new Webcom_bundle master_registry
# skip on build
if 0 == h_count cache
  require "webcom-client-plugin-base/src/hotreload"
  require "webcom-client-plugin-base/src/react"
  require "webcom-client-plugin-base/src/net"
  require "webcom-client-plugin-base/src/wsrs"
  require "webcom-client-plugin-base/src/keyboard"
  
  bundle.plugin_add "Webcom hotreload"
  bundle.plugin_add "Webcom net"
  bundle.plugin_add "Webcom react"
  bundle.plugin_add "ws request service"
  bundle.plugin_add "keymap"
  bundle.plugin_add "keyboard scheme"
  bundle.feature_hash.hotreload = true

service = delivery.start {
  htdocs    : "htdocs"
  hotreload : !!config.front_watch
  title     : "Ar miner ui playground"
  bundle
  no_port_expose : !config.front_port_expose
  port      : config.front_http_port
  ws_port   : config.front_ws_hotreload_port
  watch_root: true
  allow_hard_stop : true
  engine    : {
    HACK_remove_module_exports : true
    # HACK_onChange : true
  }
  # vendor    : "react"
  vendor    : "react_min"
  gz        : true
  chokidar  :
    # avoid symlinks
    ignored : /(node_modules)/
  watcher_ignore : (event, full_path)->
    return false if full_path.startsWith "htdocs"
    true
}

obj_set service.cache, cache

module.exports = service
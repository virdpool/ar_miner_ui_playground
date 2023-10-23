module = @
require "fy"
require("events").EventEmitter.defaultMaxListeners = Infinity
global.arch = "node16-linux-x64"
argv = require("minimist")(process.argv.slice(2))
config = Object.assign(require("dotenv-flow").config({silent:!!global.is_fork}).parsed || {}, process.env)
for k,v of argv
  config[k.toUpperCase().split("-").join("_")] = v

bool = (name, default_value = "0", config_name = name.toUpperCase())->
  module[name] = !!+(config[config_name] ? default_value)

i32 = int  = (name, default_value = "0", config_name = name.toUpperCase())->
  module[name] = +(config[config_name] ? default_value)

f32 = f64  = (name, default_value = "0", config_name = name.toUpperCase())->
  module[name] = +(config[config_name] ? default_value)

str  = (name, default_value = "", config_name = name.toUpperCase())->
  module[name] = config[config_name] ? default_value

str_list  = (name, default_value = "", config_name = name.toUpperCase())->
  module[name] = (config[config_name] ? default_value).split(",").filter (t)->t != ""

# ###################################################################################################
int  "front_ws_hotreload_port", 20014
int  "front_http_port", 10014
bool "front_port_expose", true
bool "front_watch"

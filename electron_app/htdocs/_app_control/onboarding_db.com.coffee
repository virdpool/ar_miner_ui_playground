(function() {
  var com_name, conf;

  com_name = "Onboarding_db";

  if (window.module == null) {
    window.module = {};
  }

  module.exports = {
    step: "step_0",
    is_node_at_localhost: false,
    ssh_node_list: [],
    mount: function() {
      this.is_node_at_localhost = true;
      this.ssh_ip_list = ["192.168.1.10"];
      return this.port_1984_ip_list = ["192.168.1.20"];
    },
    render: function() {
      return Onboarding({
        step: this.step,
        on_change_step: (function(_this) {
          return function(value) {
            _this.step = value;
            return _this.force_update();
          };
        })(this),
        is_node_at_localhost: this.is_node_at_localhost,
        ssh_ip_list: this.ssh_ip_list,
        port_1984_ip_list: this.port_1984_ip_list
      });
    }
  };

  conf = React.createClass(CKR.react_key_map(com_name, module.exports));

  define_com("Onboarding_db", conf);

}).call(this);

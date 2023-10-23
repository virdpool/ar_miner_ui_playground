(function() {
  var com_name, conf;

  com_name = "Wizard_db";

  if (window.module == null) {
    window.module = {};
  }

  module.exports = {
    msg_list: [],
    mount: function() {
      return this.msg_list = [
        {
          title_fn: function() {
            return span("Major");
          },
          style: {
            backgroundColor: "#fcc"
          }
        }, {
          title_fn: function() {
            div("Your VDF time is too high.");
            return div("Use arweave team VDF server or setup your own with recommended CPU");
          },
          style: {
            backgroundColor: "#fcc"
          }
        }, {
          title_fn: function() {
            return span("Minor");
          },
          style: {
            backgroundColor: "#ffc"
          }
        }, {
          title_fn: function() {
            div("You have 40% of weave size.");
            return div("Your profit can be higher if you download more weave");
          },
          style: {
            backgroundColor: "#ffc"
          }
        }, {
          title_fn: function() {
            return span("Info");
          },
          style: {
            backgroundColor: "#eee"
          }
        }, {
          title_fn: function() {
            div("You found a your first block 5 days ago");
            return div("It will be unlocked in 20 days");
          },
          style: {
            backgroundColor: "#eee"
          }
        }, {
          title_fn: function() {
            div("You have 40% of weave and have puclic IP");
            return div("You can enable P3 for data sharing so you can earn extra profit for upload bandwidth");
          },
          style: {
            backgroundColor: "#eee"
          }
        }
      ];
    },
    render: function() {
      return Wizard({
        msg_list: this.msg_list
      });
    }
  };

  conf = React.createClass(CKR.react_key_map(com_name, module.exports));

  define_com("Wizard_db", conf);

}).call(this);

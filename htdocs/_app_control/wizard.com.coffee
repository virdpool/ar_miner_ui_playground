module.exports =
  render : ()->
    table {
#       class : "table"
#       style:
#         width : "100%"
    }
      tbody
        for msg in @props.msg_list
#           style = {}
#           obj_set style, msg.style if msg.style
          tr {
#             style : style
            style : msg.style
          }
            td {
              style:
                padding : 5
            }
              msg.title_fn()

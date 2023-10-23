module.exports =
  msg_list : []
  mount : ()->
    @msg_list = [
      {
        title_fn : ()->
          span "Major"
        style:
          backgroundColor : "#fcc"
      }
      {
        title_fn : ()->
          div "Your VDF time is too high."
          div "Use arweave team VDF server or setup your own with recommended CPU"
        style:
          backgroundColor : "#fcc"
      }
      {
        title_fn : ()->
          span "Minor"
        style:
          backgroundColor : "#ffc"
      }
      {
        title_fn : ()->
          div "You have 40% of weave size."
          div "Your profit can be higher if you download more weave"
        style:
          backgroundColor : "#ffc"
      }
      {
        title_fn : ()->
          span "Info"
        style:
          backgroundColor : "#eee"
      }
      {
        title_fn : ()->
          div "You found a your first block 5 days ago"
          div "It will be unlocked in 20 days"
        style:
          backgroundColor : "#eee"
      }
      {
        title_fn : ()->
          div "You have 40% of weave and have puclic IP"
          div "You can enable P3 for data sharing so you can earn extra profit for upload bandwidth"
        style:
          backgroundColor : "#eee"
      }
    ]
  
  render : ()->
    Wizard {
      msg_list : @msg_list
    }

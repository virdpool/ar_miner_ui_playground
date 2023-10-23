const { contextBridge, ipcRenderer } = require("electron")

contextBridge.exposeInMainWorld("electronAPI", {
  ws_emu_send: (msg) => {
    ipcRenderer.send("ws_emu_data_fe_be", msg)
  },
  ws_emu_on_data: (handler) => {
    ipcRenderer.on("ws_emu_data_be_fe", (_event, data)=>{
      handler(data)
    })
  }
});

/////////////////////////////////////////////////////////////////////////////////////////////////////
//   custom
/////////////////////////////////////////////////////////////////////////////////////////////////////

/*
 * TODO typical recipes
 */


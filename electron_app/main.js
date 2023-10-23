global.iced = require("iced-runtime")
const {app, BrowserWindow, ipcMain, Menu} = require("electron")
const path = require("node:path")

/*
process.env.SEQUELIZE_HOST = "192.168.88.63"
 */




global.global_ctx = {
  main_window : null
}

function createWindow () {
  var main_window = new BrowserWindow({
    width : 800,
    height: 600,
    webPreferences: {
      preload: path.join(__dirname, "preload.js")
    }
  })
  global_ctx.main_window = main_window
  // main_window.loadFile("htdocs/index.html")
  main_window.loadFile(path.join(__dirname,"htdocs/index.html"))
  
  main_window.maximize()
  
  
  /*
   * give me ctrl-W
   * don't react on alt (messes up dev tools)
  main_window.setMenu null
   */
  
  
}


/*
if !app.requestSingleInstanceLock()
  app.quit()
   * так менее надежно, но сильно быстрее 0.5s -> 0.35s
   * process.exit()
  return

app.on "second-instance", (event, argv, working_directory) ->
  {main_window} = global_ctx
  return if !main_window
  if main_window.isMinimized()
    main_window.restore()
  
  main_window.focus()
  
  if argv.length >= 2 && argv[1]
    main_window.webContents.send "ws_emu_data_be_fe", {
      switch : "ext_file_open"
      argv
    }
 */



// This method will be called when Electron has finished
// initialization and is ready to create browser windows.
// Some APIs can only be used after this event occurs.
app.whenReady().then(() => {
  createWindow()
  app.on("activate", function () {
    // On macOS it's common to re-create a window in the app when the
    // dock icon is clicked and there are no other windows open.
    if (BrowserWindow.getAllWindows().length === 0)
      createWindow()
  })
})

// Quit when all windows are closed, except on macOS. There, it's common
// for applications and their menu bar to stay active until the user quits
// explicitly with Cmd + Q.
app.on("window-all-closed", function () {
  if (process.platform !== "darwin") app.quit()
});

/////////////////////////////////////////////////////////////////////////////////////////////////////
//   custom
/////////////////////////////////////////////////////////////////////////////////////////////////////

/*
 * TODO typical recipes
 */


// Brunch automatically concatenates all files in your
// watched paths. Those paths can be configured at
// config.paths.watched in "brunch-config.js".
//
// However, those files will only be executed if
// explicitly imported. The only exception are files
// in vendor, which are never wrapped in imports and
// therefore are always executed.

// Import dependencies
//
// If you no longer want to use a dependency, remember
// to also remove its path from "config.paths.watched".
import "deps/phoenix_html/web/static/js/phoenix_html"

// Import local files
//
// Local files can be imported directly using relative
// paths "./socket" or full ones "web/static/js/socket".

import socket from "./socket"

var elmDiv = document.getElementById("elm-main")
  , initialState = {messageList: [], newMessage: {name: "", time: "", text: ""}}
  , elmApp = Elm.embed(Elm.Main, elmDiv, initialState)

// Now that you are connected, you can join channels with a topic:
let channel = socket.channel("messages:general", {})


// Phoenix channels

channel.join()
  .receive("ok", resp => { console.log("Joined successfully", resp) })
  .receive("error", resp => { console.log("Unable to join", resp) })

channel.on('set_messages', data => {
  console.log('got messages', data.messages)
  elmApp.ports.messageList.send(data.messages)
})

channel.on('new_message', data => {
  console.log('got new message', data.message)
  elmApp.ports.newMessage.send(data.message)
})

// Elm ports

elmApp.ports.chatOutput.subscribe(message => {
  console.log(message)
  channel.push("new_message", {body: message})
})

elmApp.ports.updateMessages.subscribe(event => {
  console.log(event)
  setTimeout(scrollBottom, 100)
})

function scrollBottom () {
  var chatBox = document.getElementById('chat-box')
  chatBox.scrollTop = chatBox.scrollHeight
  console.log("height reset")
}

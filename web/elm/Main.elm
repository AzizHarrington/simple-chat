module Main where

import Effects exposing (Never)
import Html exposing (Html)
import StartApp
import Task exposing (Task)

import Message exposing (messageMailBox, updateMailBox)
import Model exposing (init)
import Types exposing (..)
import Update exposing (update)
import View exposing (view)


main : Signal Html
main =
  app.html


port tasks : Signal (Task.Task Never ())
port tasks = app.tasks


app =
  StartApp.start
    { init = init
    , update = update
    , view = view
    , inputs = [initMessages, incomingMessage]
    }


-- SIGNALS

-- INBOUND

port messageList : Signal Messagelist


initMessages : Signal Action
initMessages =
  Signal.map InitializeMessages messageList


port newMessage : Signal ChatMessage


incomingMessage : Signal Action
incomingMessage =
  Signal.map AddMessage newMessage


-- OUTBOUND

port chatOutput : Signal ChatMessage
port chatOutput =
  messageMailBox.signal


port updateMessages : Signal String
port updateMessages =
  updateMailBox.signal

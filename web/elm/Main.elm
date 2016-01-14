module Main where

import Html exposing (Html)
import StartApp

import Message exposing (mailBox)
import Model exposing (init)
import Types exposing (..)
import Update exposing (update)
import View exposing (view)


main : Signal Html
main =
  app.html


app =
  StartApp.start
    { init = init
    , update = update
    , view = view
    , inputs = [incomingActions]
    }


-- SIGNALS

port messageList : Signal Messagelist


incomingActions : Signal Action
incomingActions =
  Signal.map InitializeMessages messageList


port newMessage : Signal Chatmessage
port newMessage = mailBox.signal

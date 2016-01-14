module Message where

import Types exposing (..)


new : Model -> Chatmessage
new model =
  { time = "12:00"
  , name = model.name
  , text = model.text
  }


-- MAILBOX

mailBox : Signal.Mailbox Chatmessage
mailBox =
  Signal.mailbox { name = "", time = "", text = ""}

module Message where

import Types exposing (..)


new : Model -> ChatMessage
new model =
  { time = "12:00"
  , name = model.name
  , text = model.text
  }


-- MAILBOX

mailBox : Signal.Mailbox ChatMessage
mailBox =
  Signal.mailbox { name = "", time = "", text = ""}

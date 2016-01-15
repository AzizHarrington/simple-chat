module Message where

import Types exposing (..)


new : Model -> ChatMessage
new model =
  { time = ""
  , name = model.name
  , text = model.text
  }


-- MAILBOX

messageMailBox : Signal.Mailbox ChatMessage
messageMailBox =
  Signal.mailbox { name = "", time = "", text = ""}


updateMailBox : Signal.Mailbox String
updateMailBox =
  Signal.mailbox ""

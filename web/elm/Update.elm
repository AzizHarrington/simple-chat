module Update where

import Effects exposing (Effects, Never)
import String

import Types exposing (..)


update : Action -> Model -> (Model, Effects Action)
update action model =
  let
    model = Debug.log "model" model
  in
    case action of
      Input text ->
        ({ model | text = text }, Effects.none)
      Add ->
        ({ model
          | text = ""
          , messages =
            if String.isEmpty model.text
              then
                model.messages
              else
                model.messages ++ [ newMessage model ]
        }, Effects.none)
      SetMessages savedMessages ->
        ({ model | messages = savedMessages}, Effects.none)


newMessage : Model -> Chatmessage
newMessage model =
  { time = "12:00"
  , name = "Aziz"
  , text = model.text
  }

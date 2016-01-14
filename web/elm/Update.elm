module Update where

import Effects exposing (Effects, Never)
import String

import Message
import Types exposing (..)


update : Action -> Model -> (Model, Effects Action)
update action model =
  let
    model = Debug.log "model" model
  in
    case action of
      InitializeMessages savedMessages ->
        ({ model | messages = savedMessages}, Effects.none)
      AddMessage ->
        ({ model
          | name = ""
          , text = ""
          , messages =
            if String.isEmpty model.text
              then
                model.messages
              else
                model.messages ++ [ Message.new model ]
        }, Effects.none)
      SetName name ->
        ({ model | name = name }, Effects.none)
      SetText text ->
        ({ model | text = text }, Effects.none)

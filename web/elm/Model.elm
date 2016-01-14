module Model where

import Effects exposing (Effects, Never)

import Types exposing (..)


init : (Model, Effects Action)
init =
  let
    model =
      { messages = [ ]
      , text = ""
      , name = ""
      }
  in
    (model, Effects.none)

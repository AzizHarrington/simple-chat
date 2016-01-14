module Update where

import Effects exposing (Effects, Never)
import String
import Task exposing (Task)

import Message exposing (mailBox)
import Types exposing (..)


update : Action -> Model -> (Model, Effects Action)
update action model =
  case action of
    InitializeMessages savedMessages ->
      ({ model | messages = savedMessages}, Effects.none)
    SubmitMessage ->
      ({ model | name = "", text = ""}
      , sendMessage model)
    SetName name ->
      ({ model | name = name }, Effects.none)
    SetText text ->
      ({ model | text = text }, Effects.none)
    NoOp ->
      (model, Effects.none)


sendMessage : Model -> Effects Action
sendMessage model =
  Signal.send mailBox.address (Message.new model)
  |> Task.map (\_ -> NoOp)
  |> Effects.task

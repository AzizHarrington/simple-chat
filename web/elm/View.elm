module View where

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Json.Decode as Json
import Signal exposing (..)

import Message exposing (mailBox)
import Types exposing (..)


view : Address Action -> Model -> Html
view address model =
  div
  [ class "container" ]
  [ row [ ] headLine
  , row [ ] (messageBox model)
  , row [ ] (chatInput address model)
  ]


headLine : List Html
headLine =
  [ div [ ] [ h1 [ ] [ text "Simple Chat" ] ]
  , p [ ] [ text "written in elm & elixir" ]
  , br [ ] [ ]
  , br [ ] [ ]
  ]


messageBox : Model -> List Html
messageBox model =
  [ div
    [ style messageBoxStyle ]
    (List.map formatMessage model.messages)
  ]


messageBoxStyle : List ( String, String )
messageBoxStyle =
  [ ("overflow-y", "hidden")
  , ("overflow", "scroll")
  , ("height", "500px")
  , ("border", "1px solid grey")
  , ("background", "#F8F8F8")
  ]

formatMessage : ChatMessage -> Html
formatMessage m =
  div
  [ style [ ("padding", "5px")]]
  [ text ("[" ++ m.time ++ "]")
  , text " "
  , text ("[" ++ m.name ++ "]")
  , text "=> "
  , text m.text
  ]

chatInput : Address Action -> Model -> List Html
chatInput address model =
  [ div
    [ attribute "role" "form" ]
    [ div
      [ class "form-group" ]
      [ input
        [ type' "text"
        , class "form-control"
        , value model.name
        , placeholder "Username"
        , onInput address SetName
        , onEnter address SubmitMessage
        ]
        [ ]
      , input
          [ type' "text"
          , class "form-control"
          , value model.text
          , placeholder "Enter a message..."
          , onInput address SetText
          , onEnter address SubmitMessage
          ]
          [ ]
      ]
    , button
      [ class "btn btn-default"
      , type' "button"
      , onClick address SubmitMessage
      ]
      [ Html.text "Submit" ]
    ]
  ]


onInput : Address a -> (String -> a) -> Attribute
onInput address value =
  on "input" targetValue (\string -> Signal.message address (value string))


onEnter : Address a -> a -> Attribute
onEnter address value =
    on "keydown"
      (Json.customDecoder keyCode is13)
      (\_ -> Signal.message address value)


is13 : Int -> Result String ()
is13 code =
  if code == 13 then Ok () else Err "not the enter key"


row : List ( String, String ) -> List Html -> Html
row styles contents =
  div
  [ class "row", style styles ]
  [ div [ class "col-md-12" ] contents ]

module SimpleChat where

import Debug
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Json.Decode as Json
import Signal exposing (..)
import StartApp.Simple as StartApp
import String
import Time


main =
  StartApp.start
    { model = model
    , update = update
    , view = view
    }


-- Model

type alias Model =
  { messages : List Chatmessage
  , text : String
  }


type alias Chatmessage =
  { name : String
  , text : String
  , time : String }


model : Model
model = { messages = [ ], text = "" }


-- Update

type Action = Input String | Add


update action model =
  let
    model = Debug.log "model" model
  in
    case action of
      Input text ->
        { model | text = text }
      Add ->
        { model
          | text = ""
          , messages =
            if
              String.isEmpty model.text
            then
              model.messages
            else
              model.messages ++ [ newMessage model.text ]
        }


newMessage : String -> Chatmessage
newMessage text =
  { time = "12:00"
  , name = "Aziz"
  , text = text
  }


-- View

view : Address Action -> Model -> Html
view address model =
  div
  [ class "container" ]
  [ row [ ] headLine
  , row [ ] (messageBox model)
  , row [ ] (chatInput address model.text)
  ]


headLine : List Html
headLine =
  [ div [ ] [ h1 [ ] [ text "Simple Chat" ] ]
  , p [ ] [ text "written in elm and phoenix" ]
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

formatMessage : Chatmessage -> Html
formatMessage m =
  div
  [ style [ ("padding", "5px")]]
  [ text ("[" ++ m.time ++ "]")
  , text " "
  , text ("[" ++ m.name ++ "]")
  , text "=> "
  , text m.text
  ]

chatInput : Address Action -> String -> List Html
chatInput address text =
  [ div
    [ attribute "role" "form" ]
    [ div
      [ class "form-group" ]
      [ input
        [ type' "text"
        , class "form-control"
        , value text
        , placeholder "Enter a message..."
        , on "input" targetValue (\string -> Signal.message address (Input string))
        , onEnter address Add
        ]
        [ ]
      ]
    , button
      [ class "btn btn-default"
      , type' "button"
      , onClick address Add
      ]
      [ Html.text "Submit" ]
    ]
  ]


onEnter : Address a -> a -> Attribute
onEnter address value =
    on "keydown"
      (Json.customDecoder keyCode is13)
      (\_ -> Signal.message address value)


is13 : Int -> Result String ()
is13 code =
  if code == 13 then Ok () else Err "not the right key code"


row : List ( String, String ) -> List Html -> Html
row styles contents =
  div
  [ class "row", style styles ]
  [ div [ class "col-md-12" ] contents ]

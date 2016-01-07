module SimpleChat where

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import StartApp.Simple as StartApp


main =
  StartApp.start
    { model = model
    , update = update
    , view = view
    }


-- Model

type alias Message = { name : String, text : String, time : String }
type alias Model = List Message


model : Model
model =
  [ { time = "11:34", name = "bob", text = "hello" }
  , { time = "11:50", name = "charles", text = "hey"}
  , { time = "12:11", name = "bob", text = "how are you?"}
  , { time = "12:15", name = "sally", text = "hello"}
  , { time = "12:15", name = "sally", text = "hello"}
  , { time = "12:15", name = "sally", text = "hello"}
  , { time = "12:15", name = "sally", text = "hello"}
  , { time = "12:15", name = "sally", text = "hello"}
  , { time = "12:15", name = "sally", text = "hello"}
  , { time = "12:15", name = "sally", text = "hello"}
  , { time = "12:15", name = "sally", text = "hello"}
  , { time = "12:15", name = "sally", text = "hello"}
  , { time = "12:15", name = "sally", text = "hello"}
  , { time = "12:15", name = "sally", text = "hello"}
  , { time = "12:15", name = "sally", text = "hello"}
  , { time = "12:15", name = "sally", text = "hello"}
  , { time = "12:15", name = "sally", text = "hello"}
  , { time = "12:15", name = "sally", text = "hello"}
  , { time = "12:15", name = "sally", text = "hello"}
  , { time = "12:15", name = "sally", text = "hello"}
  , { time = "12:15", name = "sally", text = "hello"}
  , { time = "12:15", name = "sally", text = "hello"}
  , { time = "12:15", name = "sally", text = "hello"}
  , { time = "12:15", name = "sally", text = "hello"}
  , { time = "12:15", name = "sally", text = "hello"}
  , { time = "12:15", name = "sally", text = "hello"}
  , { time = "12:15", name = "sally", text = "hello"}
  , { time = "12:15", name = "sally", text = "hello"}
  , { time = "12:15", name = "sally", text = "hello"}
  , { time = "12:15", name = "sally", text = "hello"}
  ]


-- Update

type Action = Input Message


update action model =
  case action of
    Input message ->
      model ++ [message]


-- View

view address model =
  div
    [ class "container" ]
    [ row [ ] headLine
    , row [ ] messageBox
    , row [ ] chatInput
    ]


headLine : List Html
headLine =
  [ div [ ] [ h1 [ ] [ text "Simple Chat" ] ]
  , p [ ] [ text "written in elm and phoenix" ]
  , br [ ] [ ]
  , br [ ] [ ]
  ]


messageBox : List Html
messageBox =
  [ div
      [ style messageBoxStyle ]
      (List.map formatMessage model)
  ]


messageBoxStyle : List ( String, String )
messageBoxStyle =
  [ ("overflow-y", "hidden")
  , ("overflow", "scroll")
  , ("height", "500px")
  , ("border", "1px solid grey")
  , ("background", "#F8F8F8")
  ]

formatMessage : Message -> Html
formatMessage m =
  div
    [ style [ ("padding", "5px")]]
    [ text ("[" ++ m.time ++ "]")
    , text " "
    , text ("[" ++ m.name ++ "]")
    , text "=> "
    , text m.text
    ]

chatInput : List Html
chatInput =
  [ input
      [ type' "text"
      , placeholder "Enter a message..."
      ]
      [ ]
  , button
      [ class "btn btn-default"
      , type' "button"
      , finishme
      ]
      [ text "Submit" ]
  ]


row : List ( String, String ) -> List Html -> Html
row styles contents =
  div
    [ class "row", style styles ]
    [ div [ class "col-md-12" ] contents ]

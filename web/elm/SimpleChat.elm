module SimpleChat where

import Html exposing (..)
import Html.Attributes exposing (..)


main : Html
main =
  div
    [ class "container" ]
    [ row [ ] headLine
    , row [ ] messageBox
    , row [ ] chatInput
    ]


headLine =
  [ div [ ] [ h1 [ ] [ text "Simple Chat" ] ]
  , p [ ] [ text "written in elm and phoenix" ]
  , br [ ] [ ]
  , br [ ] [ ]
  ]


messageBox =
  [ div
      [ id "messages", style messageBoxStyle ]
      (List.map formatMessage messages)
  ]


type alias Mystyle = List ( String, String )


messageBoxStyle : Mystyle
messageBoxStyle =
  [ ("overflow-y", "hidden")
  , ("overflow", "scroll")
  , ("height", "500px")
  , ("border", "1px solid grey")
  , ("background", "#F8F8F8")
  ]


type alias Message = { name : String, text : String, time : String }


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


messages =
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


chatInput =
  [ input
      [ type' "text"
      , placeholder "Enter a message..."
      ]
      [ ]
  , button
      [ class "btn btn-default"
      , type' "button"
      ]
      [ text "Submit" ]
  ]


type alias Htmlfragment = List Html


row : Mystyle -> Htmlfragment -> Html
row styles contents =
  div
    [ class "row", style styles ]
    [ div [ class "col-sm-6" ] contents ]

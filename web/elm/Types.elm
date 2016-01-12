module Types where


type alias Model =
  { messages : Messagelist
  , text : String
  }


type alias Messagelist =
  List Chatmessage


type alias Chatmessage =
  { name : String
  , text : String
  , time : String }


type Action =
  Input String
  | Add
  | SetMessages (List Chatmessage)
